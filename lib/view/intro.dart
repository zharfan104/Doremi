import 'package:auto_route/auto_route.dart';
import 'package:doremi/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/settings/HexColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kImageDemo =
    "https://cdn4.iconfinder.com/data/icons/onboarding-material-color/128/__14-512.png";

class IntroPage extends StatelessWidget {
  const IntroPage({Key key}) : super(key: key);

  void _onIntroEnd(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Teks.isIntroDone, true);
    print(prefs.getBool(Teks.isIntroDone));
    ExtendedNavigator.of(context).push(Routes.loginPage);
  }

  Widget _buildImage(String a) {
    return Align(
      child: Image.asset(
        'assets/images/$a.png',
      ),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        pages: [
          PageViewModel(
              decoration: PageDecoration(
                  dotsDecorator: DotsDecorator(
                      // shape: ShapeBo
                      ),
                  imageFlex: 1,
                  bodyFlex: 1,
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  pageColor: darkBlack),
              title: "What is Doremi?",
              bodyWidget: Container(
                color: lightBlack,
                child: Text(
                    'One App Solution untuk konser online, mulai dari pembelian tiket hingga streaming.',
                    style: TextStyle(color: Colors.white60, fontSize: 16)),
              ),
              image: Container(
                color: HexColor("FFF2F2"),
                child: _buildImage('welcomepage-1'),
              )),
          PageViewModel(
              decoration: PageDecoration(
                  imageFlex: 1,
                  bodyFlex: 1,
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  bodyTextStyle: TextStyle(color: Colors.grey),
                  pageColor: darkBlack),
              title: "Live Concert Experience",
              bodyWidget: Container(
                color: darkBlack,
                child: Text(
                    'Rasakan sensasi pengalaman konser live secara online. Mulai dari beli merch hingga QnA session dengan idola kamu.',
                    style: TextStyle(color: Colors.white60, fontSize: 16)),
              ),
              image: Container(
                color: HexColor("FFF2F2"),
                child: _buildImage('welcomepage-2'),
              )),
          PageViewModel(
              decoration: PageDecoration(
                  dotsDecorator: DotsDecorator(
                      // shape: ShapeBo
                      ),
                  imageFlex: 1,
                  bodyFlex: 1,
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  pageColor: darkBlack),
              title: "Kemudahan Beli Tiket",
              bodyWidget: Container(
                color: darkBlack,
                child: Text(
                    'Beli tiket konser dari artis yang kamu sukai dengan sekali sentuhan.',
                    style: TextStyle(color: Colors.white60, fontSize: 16)),
              ),
              image: Container(
                color: HexColor("FFF2F2"),
                child: _buildImage('welcomepage-3'),
              )),
          PageViewModel(
              decoration: PageDecoration(
                  dotsDecorator: DotsDecorator(
                      // shape: ShapeBo
                      ),
                  imageFlex: 1,
                  bodyFlex: 1,
                  titleTextStyle: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  pageColor: darkBlack),
              title: "Rewatch your favourite artist live",
              bodyWidget: Container(
                color: darkBlack,
                child: Text(
                    'Ketinggalan live streaming konser? Tenang saja, kamu bisa menonton ulang konsernya!',
                    style: TextStyle(color: Colors.white60, fontSize: 16)),
              ),
              image: Container(
                color: HexColor("FFF2F2"),
                child: _buildImage('welcomepage-4'),
              )),
        ],
        onDone: () async => _onIntroEnd(context),
        onSkip: () async =>
            _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: false,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text(
          'Passer',
          style: TextStyle(color: Colors.white),
        ),
        next: const Icon(
          FontAwesomeIcons.arrowCircleRight,
          color: Colors.white,
          size: 50,
        ),
        done: const Icon(
          FontAwesomeIcons.arrowCircleRight,
          color: Colors.white,
          size: 50,
        ));
  }
}
