import 'package:baby_names_bestmom/models/query_cond.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class NameLengthSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final qdata = context.watch<QueryCond>();
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      child: Column(children: [
        Container(
          child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kyellowAvatarBg,
                      inactiveTrackColor: kyellowAvatarBg,
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 4.0,
                      // thumbColor: Colors.redAccent,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayColor: Colors.red.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                    ),
                    child: Slider(
                      value: qdata.charLength,
                      min: 2,
                      max: 7,
                      activeColor: kPrimaryColor,
                      divisions: 5,
                      label: qdata.charLength.toInt().toString(),
                      onChanged: (double value) {
                        qdata.updateCharLength(value);
                      },
                    ),
                  ),
                ),
              ]),
              Text(
                'Name Character Length',
                style: TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
