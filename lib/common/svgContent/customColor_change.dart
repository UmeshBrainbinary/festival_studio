

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomColorMappedSvg extends StatefulWidget {
  final String assetName;
  final String website;
  final String description;
  final String date;
  final Map<Color, Color> colorMap;

  const CustomColorMappedSvg({super.key, required this.assetName, required this.colorMap,
    required this.website, required this.description,required this.date,});

  @override
  State<CustomColorMappedSvg> createState() => _CustomColorMappedSvgState();
}

class _CustomColorMappedSvgState extends State<CustomColorMappedSvg> {



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadAndMapColors(widget.assetName, widget.colorMap,context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return SvgPicture.string(snapshot.data!, height: 500,width: 500,fit: BoxFit.fill,);
        } else if (snapshot.hasError) {
          return const Text('Error loading SVG');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Future<String> _loadAndMapColors(String svgString, Map<Color, Color> colorMap,context) async {
    // String svgString = await DefaultAssetBundle.of(context).loadString(
    //     assetName);

    colorMap.forEach((originalColor, newColor) {
      final originalColorHex = '#${originalColor.value.toRadixString(16)
          .substring(2)
          .toUpperCase()}';
      final newColorHex = '#${newColor.value.toRadixString(16)
          .substring(2)
          .toUpperCase()}';
      svgString = svgString.replaceAll(
          originalColorHex.toLowerCase(), newColorHex.toLowerCase());
    });
    svgString =
        svgString.replaceAll('www.luxurybeautyclub.com', widget.website);
    svgString = svgString.replaceAll('06, August 2024', widget.date);

      svgString = svgString.replaceAll(
          'Dear friend, ever since you came into my life, you have ﬁlled',
          widget.description.length < 62?widget.description:widget.description.substring(0, 62));


    if(widget.description.length > 62)
  {
    svgString = svgString.replaceAll('my life with utter joy and happiness! Happy Friendship Day to you!', widget.description.substring(63, widget.description.length));

  }
    else
      {
        svgString =  svgString.replaceAll('my life with utter joy and happiness! Happy Friendship Day to you!',' ');
      }

    return svgString;
  }



}