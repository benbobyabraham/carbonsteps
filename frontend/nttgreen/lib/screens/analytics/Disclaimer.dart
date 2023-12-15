import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nttgreen/widgets/disclaimerAppBar.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DisclaimerAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Disclaimer.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              BulletPoint(
                  text:
                      'Estimations-The app provides an estimated score of your carbon emissions. This is based on general data available on online resources and any inaccuracies would affect the reliability of the model.'),
              SizedBox(height: 15),
              BulletPoint(
                  text:
                      "Simplified model- The app has a simplified model and doesn't account for all possible factors that could influence carbon emissions. This is a tool for awareness rather than precise measurements."),
              SizedBox(height: 15),
              BulletPoint(
                  text:
                      "Professional help- To obtain your precise carbon emissions', please contact businesses and environmental professionals for assistance."),
              SizedBox(height: 15),
              BulletPoint(
                  text:
                      "No liability- The app and its developers are not liable for any decisions and actions taken based on calculator's results. User must use metrics as general guide and not definitive measure."),
              SizedBox(height: 15),
              BulletPoint(
                  text:
                      'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary'),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.brightness_1, //diffrent bullent point

            size: 10,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
