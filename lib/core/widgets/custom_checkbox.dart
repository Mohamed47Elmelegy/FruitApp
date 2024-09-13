// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:frutes_app/core/theme/colors_theme.dart';

// import '../utils/app_images.dart';

// class CustomCheckbox extends StatefulWidget {
//   const CustomCheckbox({super.key});

//   @override
//   CustomCheckboxState createState() => CustomCheckboxState();
// }

// class CustomCheckboxState extends State<CustomCheckbox> {
//   bool _isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isChecked = !_isChecked;
//         });
//       },
//       child: AnimatedContainer(
//         duration: const Duration(seconds: 3), // Reduced duration
//         width: 24.0,
//         height: 24.0,
//         decoration: BoxDecoration(
//           color: _isChecked ? AppColors.green1_500 : Colors.white,
//           border: Border.all(
//             color: _isChecked ? Colors.transparent : AppColors.grayscale200,
//             width: 1.0,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         alignment: Alignment.center,
//         child: _isChecked
//             ? Padding(
//                 padding: const EdgeInsets.all(4.0), // Directly using Padding
//                 child: SvgPicture.asset(
//                   Assets.imagesCheck,
//                   width: 16.0,
//                   height: 16.0,
//                 ),
//               )
//             : null,
//       ),
//     );
//   }
// }
