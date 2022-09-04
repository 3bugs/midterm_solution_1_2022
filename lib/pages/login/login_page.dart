import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _input = '';

  Widget _buildIndicator(bool on) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFF00CC33),
              width: 1.0,
            ),
            color: on ? Color(0xFF00CC33) : Colors.transparent),
      ),
    );
  }

  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _input = _input + num.toString();
          });
        },
        customBorder: CircleBorder(),
        child: Container(
          width: 60.0,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFFCCCCCC),
              width: 1.0,
            ),
          ),
          child: Text(
            num.toString(),
            style: GoogleFonts.firaCode(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/kplus_logo.png', width: 120.0),
          Text('Please Enter Your PIN'),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIndicator(_input.length >= 1 ? true : false),
              _buildIndicator(_input.length >= 2 ? true : false),
              _buildIndicator(false),
              _buildIndicator(false),
              _buildIndicator(false),
              _buildIndicator(false),
            ],
          ),
          SizedBox(height: 30.0),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(1),
                  _buildNumberButton(2),
                  _buildNumberButton(3),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(4),
                  _buildNumberButton(5),
                  _buildNumberButton(6),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNumberButton(7),
                  _buildNumberButton(8),
                  _buildNumberButton(9),
                ],
              ),
            ],
          ),
          Text(_input),
        ],
      ),
    );
  }
}
