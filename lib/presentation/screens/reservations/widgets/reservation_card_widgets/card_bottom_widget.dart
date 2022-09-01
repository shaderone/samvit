import 'package:flutter/material.dart';

class CardBottom extends StatelessWidget {
  const CardBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 2),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    //reshedule
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Cancel & Reshedule"),
                      SizedBox(width: 10),
                      Icon(Icons.event_repeat),
                    ],
                  ),
                ),
              ),
            ),
            //const SizedBox(width: 10),
            //Expanded(
            //  child: SizedBox(
            //    height: 60,
            //    child: ElevatedButton(
            //      style: ButtonStyle(
            //        backgroundColor: MaterialStateProperty.all(primaryDark),
            //        padding: MaterialStateProperty.all(
            //          const EdgeInsets.symmetric(horizontal: 10),
            //        ),
            //        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //          RoundedRectangleBorder(
            //            borderRadius: BorderRadius.circular(5),
            //            side: const BorderSide(
            //              color: extraRed,
            //              width: 2,
            //            ),
            //          ),
            //        ),
            //      ),
            //      onPressed: () {},
            //      child: Row(
            //        mainAxisAlignment: MainAxisAlignment.center,
            //        children: const [
            //          Text(
            //            "Cancel",
            //            style: TextStyle(fontWeight: FontWeight.bold),
            //          ),
            //          SizedBox(width: 10),
            //          Icon(
            //            Icons.delete_forever,
            //            color: extraRed,
            //          ),
            //        ],
            //      ),
            //    ),
            //  ),
            //),
          ],
        ),
      ],
    );
  }
}

//class CardBottomWrappedRow extends StatelessWidget {
//  const CardBottomWrappedRow({
//    Key? key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: [
//        ReservationChip(
//          chipCrossAxisAlignment: CrossAxisAlignment.center,
//          chipTitle: "Exhibition Status",
//          chipText: "TBA / NIL",
//          chipWidth: 120,
//          chipBgColor: extraYellow.withOpacity(0.1),
//          chipStrokeColor: extraYellow,
//        ),
//
//        //platform specific button here
//        SizedBox(
//          height: 50,
//          child: ElevatedButton(
//            style: ButtonStyle(
//              padding: MaterialStateProperty.all(
//                const EdgeInsets.symmetric(horizontal: 10),
//              ),
//              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(50),
//                ),
//              ),
//            ),
//            onPressed: () {
//              //reshedule
//            },
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: const [
//                Text("Reshedule"),
//                SizedBox(width: 10),
//                Icon(Icons.event_repeat),
//              ],
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//}
