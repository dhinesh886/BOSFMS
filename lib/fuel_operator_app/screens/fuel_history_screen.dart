import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/theme_data.dart';
import '../models/get_accessible_service_ticket_respose_model.dart';
import '../repository/fuel_operator_repository.dart';
import '../widgets/service_list_widget.dart';
import 'service_screen.dart';

class FuelHistoryScreen extends StatefulWidget {
  final String vehicleNumber;
  final String token;
  final String vehicleCode;
  final String assetId;
  const FuelHistoryScreen(
      {Key? key,
      required this.vehicleNumber,
      required this.token,
      required this.vehicleCode,
      required this.assetId})
      : super(key: key);

  @override
  State<FuelHistoryScreen> createState() => _FuelHistoryScreenState();
}

class _FuelHistoryScreenState extends State<FuelHistoryScreen> {
  late Future myFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFuture = getData();
  }

  FuelOperatorRepository fuelOperatorRepository = FuelOperatorRepository();
  getData() async {
    List<GetAccessibleServiceTicketsResponseModel2> listOfTickets =
        await fuelOperatorRepository.getAccessibleServiceTicket2(
            token: widget.token, vehicleId: widget.vehicleNumber);
    return listOfTickets;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Fuel History'),
        ),
        body: FutureBuilder(
          future: myFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data
                  as List<GetAccessibleServiceTicketsResponseModel2>;
              // Gets the current date and time

              if (data.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.3,
                        width: size.width * 0.5,
                        child: Image.asset('assets/images/no_data_image.png'),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "No Data found",
                        style: headingSmall,
                      ),
                    ],
                  ),
                );
              }
              return SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Vehicle Id: ${widget.vehicleNumber}",
                        style: headingSmall,
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                          // shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            DateTime dateTime = DateTime.parse(
                                data[index].createdDate.toIso8601String());
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(dateTime);

                            return ServiceListWidget(
                              dateTime: formattedDate,
                              id: data[index].id,
                              fuelEconomy: data[index].fuelEconomy.toString(),
                            );
                          }),
                    ),
                    // Container(
                    //   height: 100,
                    //   color: Colors.red,
                    // ),
                    Container(
                      // height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Something isn't right?",
                            style: body1,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ServiceRequestScreen(
                                        token: widget.token,
                                        assetId: widget.assetId,
                                        vehicleCode: widget.vehicleCode,
                                        vehicleId: widget.vehicleNumber,
                                      )));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 14, right: 14, top: 8, bottom: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: customBlueColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                  child: Text(
                                "Raise a service request",
                                style: body2W,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.3,
                      width: size.width * 0.5,
                      child: Image.asset('assets/images/no_data_image.png'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "No Data found",
                      style: headingSmall,
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: customBlueColor),
            );
          },
        ));
  }
}
