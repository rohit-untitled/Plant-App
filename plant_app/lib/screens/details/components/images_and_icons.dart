import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/components/icon_cards.dart';

import '../../../constants.dart';

class ImagesAndIcons extends StatelessWidget {
  const ImagesAndIcons({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        // icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    IconsCards(icon: "assets/icons/sun.svg"),
                    IconsCards(icon: "assets/icons/icon_2.svg"),
                    IconsCards(icon: "assets/icons/icon_3.svg"),
                    IconsCards(icon: "assets/icons/icon_4.svg"),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: kPrimaryColor.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/img.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
