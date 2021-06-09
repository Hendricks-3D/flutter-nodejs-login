import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 198.0, middle: 0.5),
            Pin(size: 193.0, start: 72.0),
            child:
                // Adobe XD layer: 'clipart1316535' (shape)
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 288.0, end: 57.5),
            Pin(size: 1.0, middle: 0.4524),
            child: SvgPicture.string(
              _svg_yskjc,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 55.0, middle: 0.2466),
            Pin(size: 28.0, middle: 0.4321),
            child: Text(
              'Email',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 288.0, end: 57.5),
            Pin(size: 1.0, middle: 0.5627),
            child: SvgPicture.string(
              _svg_p81rso,
              allowDrawingOutsideViewBox: true,
              fit: BoxFit.fill,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 97.0, middle: 0.2779),
            Pin(size: 28.0, middle: 0.5457),
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(size: 178.0, middle: 0.5),
            Pin(size: 50.0, middle: 0.6689),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xffeb4032),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 53.0, middle: 0.504),
            Pin(size: 28.0, middle: 0.6648),
            child: Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_yskjc =
    '<svg viewBox="82.5 418.5 288.0 1.0" ><path transform="translate(82.5, 418.5)" d="M 0 0 L 288 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p81rso =
    '<svg viewBox="82.5 520.5 288.0 1.0" ><path transform="translate(82.5, 520.5)" d="M 0 0 L 288 0" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
