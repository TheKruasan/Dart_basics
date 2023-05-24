import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/hotel.dart';
import 'package:flutter_application_1/pages/hotel_page.dart';

// Block of hotel

class HotelBar extends StatelessWidget {
  final Hotel hotel;
  final AboutHotel aboutHotel;
  HotelBar({
    required this.hotel,
    required this.aboutHotel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String img = hotel.poster;

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          height: 330,
          alignment: Alignment.topCenter,
          child: Column(children: [
            Expanded(
              flex: 4,
              child: Container(
                width: double.maxFinite,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: Image.asset(
                    "assets/images/$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        margin: const EdgeInsets.only(left: 30),
                        child: Text(hotel.name)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: FloatingActionButton.extended(
                        heroTag: hotel.uuid,
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return HotelPage(hotel: aboutHotel);
                          }));
                        },
                        label: const Text("Подробнее"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
