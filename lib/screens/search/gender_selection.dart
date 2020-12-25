import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'gender_card.dart';

class GenderSelection extends StatelessWidget {
  GenderSelection({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final qdata = context.watch<QueryCond>();
    return Column(
      children: [
        // Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(left: kDefaultPadding),
        //       child: Text(
        //         "Gender",
        //         style: TextStyle(
        //             fontSize: 20,
        //             fontWeight: FontWeight.bold,
        //             color: kPrimaryColor),
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          children: [
            GenderCard(
                image: "images/images/baby_boy_icon.png",
                gender: "BOY",
                selected: qdata.gender == 'boy',
                genderSelect: () {
                  print('gender selected');
                  print(qdata.getQueryCond);
                  qdata.updateGender('boy');
                }),
            GenderCard(
                image: "images/images/baby_boy_icon.png",
                gender: "GIRL",
                selected: qdata.gender == 'girl',
                genderSelect: () {
                  qdata.updateGender('girl');
                }),
            GenderCard(
                image: "images/images/baby_boy_icon.png",
                gender: "UNISEX",
                selected: qdata.gender == null,
                genderSelect: () {
                  qdata.updateGender(null);
                }),
          ],
        ),
      ],
    );
  }
}
