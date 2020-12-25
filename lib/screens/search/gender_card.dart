import 'package:flutter/material.dart';

import '../../constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key key,
    this.image,
    this.gender,
    this.selected,
    this.genderSelect,
  }) : super(key: key);

  final String image, gender;
  final Function genderSelect;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: genderSelect,
      child: Container(
        width: size.width * 0.25,
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding * 2.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top : 8.0),
                    child: Image.asset(image),
                  )),
              Container(
                  padding: EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    color: selected ? kPrimaryColor : Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        gender,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: selected ? Colors.white : kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
