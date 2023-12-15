// import 'package:flutter/material.dart';
// import 'package:nttgreen/screens/home/onboarding_page.dart';
// import 'package:nttgreen/screens/quiz/widgets/questions.dart';
// import 'package:nttgreen/screens/quiz/questionnaire.dart';
// import 'package:nttgreen/widgets/app_bar.dart';

// import 'package:nttgreen/widgets/bottomnav.dart';
// import 'package:nttgreen/components/button copy.dart';

// class StateSelectionPage extends StatefulWidget {
//   @override
//   _StateSelectionPageState createState() => _StateSelectionPageState();
// }

// class _StateSelectionPageState extends State<StateSelectionPage> {
//   String _selectedCountry = countries[0];
//   String _selectedState = '';

//   List<String> _statesForSelectedCountry = [];

//   List<String> _getStatesForCountry(String country) {
//     switch (country) {
//       case 'Australia':
//         return states_australia;
//       case 'India':
//         return states_india;

//       default:
//         return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     _statesForSelectedCountry = _getStatesForCountry(_selectedCountry);

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 252, 255, 255),
//       appBar: MyAppBar(),
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.8,
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 140),
//               Text(
//                 'Select Your Country:',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20),
//               DropdownButton<String>(
//                 value: _selectedCountry,
//                 isExpanded: true,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedCountry = newValue!;
//                     _statesForSelectedCountry =
//                         _getStatesForCountry(_selectedCountry);
//                     if (_statesForSelectedCountry.isNotEmpty) {
//                       _selectedState = _statesForSelectedCountry[0];
//                     } else {
//                       _selectedState = '';
//                     }
//                   });
//                 },
//                 items: countries.map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               if (_selectedCountry != 'Choose Below' &&
//                   _selectedCountry == 'India') ...[
//                 SizedBox(height: 50),
//                 Text(
//                   'Select Your State:',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 DropdownButton<String>(
//                   value: _selectedState,
//                   isExpanded: true,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedState = newValue!;
//                     });
//                   },
//                   items: _statesForSelectedCountry
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               // ],
//               SizedBox(height: 100),
//               Button2(
//                 buttonText: 'Proceed',
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HomePage(),
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNav(),
//     );
//   }
// }
