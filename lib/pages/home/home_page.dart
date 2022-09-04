import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midterm_solution_1_2022/utils/my_converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _labelList = [
    'C to F',
    'C to K',
    'F to C',
    'F to K',
    'K to C',
    'K to F'
  ];
  var _feedbackText = '';
  final _controller = TextEditingController();

  void _handleClickButton(int i) {
    var input = _controller.text;
    if (input == '') {
      setState(() {
        _feedbackText = 'กรุณากรอกตัวเลข';
      });
      return;
    }

    var temp = double.tryParse(input);
    if (temp == null) {
      setState(() {
        _feedbackText = 'กรอกตัวเลขผิดพลาด กรุณาลองใหม่';
      });
      return;
    }

    switch (i) {
      case 0:
        // C to F
        setState(() {
          _feedbackText = '$temp C เท่ากับ ${MyConverter.C2F(temp)} F';
        });
        break;
      case 1:
        // C to K
        setState(() {
          _feedbackText = '$temp C เท่ากับ ${MyConverter.C2K(temp)} K';
        });
        break;
      case 2:
        // F to C
        setState(() {
          _feedbackText = '$temp F เท่ากับ ${MyConverter.F2C(temp)} C';
        });
        break;
      case 3:
        // F to K
        setState(() {
          _feedbackText = '$temp F เท่ากับ ${MyConverter.F2K(temp)} K';
        });
        break;
      case 4:
        // K to C
        setState(() {
          _feedbackText = '$temp K เท่ากับ ${MyConverter.K2C(temp)} C';
        });
        break;
      case 5:
        // K to F
        setState(() {
          _feedbackText = '$temp K เท่ากับ ${MyConverter.K2F(temp)} F';
        });
        break;
    }
  }

  Widget _buildButton(int i) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          _handleClickButton(i);
        },
        child: Text(_labelList[i]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'แปลงหน่วยอุณหภูมิ',
              style: GoogleFonts.kanit(
                fontSize: 30.0,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white, //สีพื้นหลังของ Container
                border: Border.all(
                  width: 5.0,
                  color: Colors.deepPurple.shade200,
                ),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: _controller,
                      style: GoogleFonts.firaCode(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(0),
                      _buildButton(1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(2),
                      _buildButton(3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(4),
                      _buildButton(5),
                    ],
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            Text(
              _feedbackText,
              style: GoogleFonts.sarabun(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
