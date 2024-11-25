

// ignore_for_file: file_names

import 'package:festiveapp_studio/service/pref_services.dart';
import 'package:festiveapp_studio/utils/pref_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:xml/xml.dart' as xml;
class CustomColorMappedSvg extends StatefulWidget {
  final String assetName;
  final String website;
  final String description;
  final Color secondaryColor;
  final Color primaryColor;
  final Color dateColor;
  final Color webColor;
  final Color desColor;
  final String date;

  const CustomColorMappedSvg({super.key, required this.assetName,
    required this.website, required this.description,required this.date,
  required this.secondaryColor,required this.primaryColor,required this.webColor,required this.desColor, required this.dateColor
  });

  @override
  State<CustomColorMappedSvg> createState() => _CustomColorMappedSvgState();
}

class _CustomColorMappedSvgState extends State<CustomColorMappedSvg> {
Map<Color,Color> colorsMap ={};
@override
  void initState() {

init();
    super.initState();
  }
init(){
  RegExp colorRegex = RegExp(r'#(?:[0-9a-fA-F]{3}){1,2}');


  Iterable<RegExpMatch> matches = colorRegex.allMatches(widget.assetName);


  List<String> colors = matches.map((match) => match.group(0)!).toList();

  if(colors.length>2)
  {
    colorsMap ={
       const Color(0xff383838):widget.primaryColor,
       const Color(0xff6d4d26) :widget.secondaryColor,

    };
    setState(() {

    });
  }
}
  @override
  Widget build(BuildContext context) {
  init();
    return Container(
      height: 500,
      width: 500,
      child: Stack(
        children: [
          FutureBuilder<String>(
            future: _loadAndMapColors(widget.assetName, colorsMap,context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                //return SvgPicture.string(snapshot.data!, height: 500,width: 500,fit: BoxFit.fill,);
                return Container(
                    height: 500,width: 500,
                    child: HtmlWidget(snapshot.data!,
                    ));
              } else if (snapshot.hasError) {
                return const Text('Error loading SVG');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          FutureBuilder<String>(
              future: _lodImage(widget.assetName, colorsMap,context),
              builder: (context,s) {
      if (s.connectionState == ConnectionState.done && s.hasData) {
                return HtmlWidget(s.data!, customWidgetBuilder: (element) {

                }

                );
              }else if (s.hasError) {
      return const SizedBox();
      } else {
      return const CircularProgressIndicator();
      }

              }
          ),
        ],
      ),
    );
  }
double height =0;
double width =0;
  Future<String> _loadAndMapColors(String svgString, Map<Color, Color> colorMap,context) async {
    // String svgString = await DefaultAssetBundle.of(context).loadString(
    //     "assets/frames/1.svg");

    RegExp regex = RegExp(r'viewBox="\d+ \d+ (\d+) (\d+)"');

    // Match the regex pattern
    RegExpMatch? match = regex.firstMatch(svgString);

    if (match != null) {
      // Extract width and height values
       width = double.parse(match.group(1)!.toString());
       height = double.parse(match.group(2)!.toString());
    } else {
      print("No match found");
    }

    svgString.replaceAllMapped(

        RegExp(r'(x|y)="(\d+)%"'),
            (match) {
          String attribute = match.group(1)!;
          String percentage = match.group(2)!;
          double absoluteValue;

          if (attribute == 'x') {

            double screenWidth = width;
            absoluteValue = ((double.parse(percentage) / 100) * screenWidth);
          } else {

            double screenHeight = height;
            absoluteValue = (double.parse(percentage) / 100) * screenHeight;
          }

          return '$attribute="$absoluteValue"';
        }
    );



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

    if(widget.description.length ==0){
      svgString = svgString.replaceAll(
          'Dear friend, ever since you came into my life, you have ﬁlled',
          ' ');
    }
    else
      {
        svgString = svgString.replaceAll(
            // 'Dear friend, ever since you came into my life, you have ﬁlled',
          "Dear friend, ever since you came into my life, you have ï¬lled",
            widget.description.length < 62?widget.description:widget.description.substring(0, 62));
      }



    if(widget.description.length > 62)
  {
    svgString = svgString.replaceAll('my life with utter joy and happiness! Happy Friendship Day to you!', widget.description.substring(63, widget.description.length));

  }
    else
      {
        svgString =  svgString.replaceAll('my life with utter joy and happiness! Happy Friendship Day to you!',' ');
      }

    ///================================= web =====================================
    final regExpTspan = RegExp(
      r'(<tspan[^>]*?)(fill="[^"]*")?([^>]*?>' + RegExp.escape(widget.website) + r'</tspan>)',
      caseSensitive: false,
      dotAll: true,
    );

    svgString =   svgString.replaceAllMapped(regExpTspan, (match) {
      final beforeFill = match.group(1) ?? '';
      final fillAttribute = 'fill="#${widget.webColor.value.toRadixString(16)
          .substring(2)
          .toUpperCase()}"';
      final afterTspan = match.group(3) ?? '';

      final result = match.group(2) != null
          ? '$beforeFill$fillAttribute$afterTspan'
          : '$beforeFill $fillAttribute$afterTspan';

String old =colorToHex(widget.primaryColor).replaceFirst(RegExp(r'FF'), "#",).toLowerCase();
String n =colorToHex(widget.webColor).replaceFirst(RegExp(r'FF'), "#",).toLowerCase();

      return result.replaceAll('fill="$old"',
          'fill="$n"');
    });
    ///================================= date =====================================
    final regExpTspanDate = RegExp(
      r'(<tspan[^>]*?)(fill="[^"]*")?([^>]*?>' + RegExp.escape(widget.date) + r'</tspan>)',
      caseSensitive: false,
      dotAll: true,
    );

    svgString =   svgString.replaceAllMapped(regExpTspanDate, (match) {
      final beforeFill = match.group(1) ?? '';
      final fillAttribute = 'fill="#${widget.dateColor.value.toRadixString(16)
          .substring(2)
          .toUpperCase()}"';
      final afterTspan = match.group(3) ?? '';


      final result = match.group(2) != null
          ? '$beforeFill$fillAttribute$afterTspan'
          : '$beforeFill $fillAttribute$afterTspan';


      String old =colorToHex(widget.primaryColor).replaceFirst(RegExp(r'FF'), "#",).toLowerCase();
      String n =colorToHex(widget.dateColor).replaceFirst(RegExp(r'FF'), "#",).toLowerCase();
      return result.replaceAll('fill="$old"',  'fill="$n"');
    });

///================================= des =====================================


      final regExpTspanDes = RegExp(
        r'(<tspan[^>]*?)(fill="[^"]*")?([^>]*?>' + RegExp.escape(
            widget.description.length < 62 ? widget.description : widget
                .description.substring(0, 62)) + r'</tspan>)',
        caseSensitive: false,
        dotAll: true, // Allows dot to match newlines
      );

      svgString = svgString.replaceAllMapped(regExpTspanDes, (match) {
        final beforeFill = match.group(1) ?? '';
        final fillAttribute = 'fill="${widget.desColor.value.toRadixString(16)
            .substring(2)
            .toUpperCase()}"';
        final afterTspan = match.group(3) ?? '';


        final result = match.group(2) != null
            ? '$beforeFill$fillAttribute$afterTspan'
            : '$beforeFill $fillAttribute$afterTspan';

        String old =colorToHex(widget.primaryColor).replaceFirst(RegExp(r'FF'), "#",).toLowerCase();
        String n =colorToHex(widget.desColor).replaceFirst(RegExp(r'FF'), "#",).toLowerCase();
        return result.replaceAll(
            'fill="$old"', 'fill="$n"');
      });


    if( widget.description.length > 62){

///================================= des2 =====================================

final regExpTspanDes2 = RegExp(
r'(<tspan[^>]*?)(fill="[^"]*")?([^>]*?>' + RegExp.escape(widget.description.substring(63, widget.description.length)) + r'</tspan>)',
caseSensitive: false,
dotAll: true, // Allows dot to match newlines
);

svgString = svgString.replaceAllMapped(regExpTspanDes2, (match) {
final beforeFill = match.group(1) ?? ''; // Part before the fill attribute
final fillAttribute = 'fill="${widget.desColor.value.toRadixString(16)
    .substring(2)
    .toUpperCase()}"'; // New fill attribute
final afterTspan = match.group(3) ?? ''; // Part after the fill attribute

// Check if fill attribute was present and replace or add new
final result = match.group(2) != null
? '$beforeFill$fillAttribute$afterTspan' // Replace existing fill
    : '$beforeFill $fillAttribute$afterTspan'; // Add new fill

  String old =colorToHex(widget.primaryColor).replaceFirst(RegExp(r'FF'), "#",).toLowerCase();
  String n =colorToHex(widget.desColor).replaceFirst(RegExp(r'FF'), "#",).toLowerCase();
return result.replaceAll('fill="$old"', 'fill="$n"');
});
}

    return '''
    <html>
      <body>
        $svgString
      </body>
    </html>
    ''';
  }
  Future<String> _lodImage(String svgString, Map<Color, Color> colorMap,context) async {


    final startIndex = svgString.indexOf('<image');
    final endIndex = svgString.indexOf('>', startIndex);

    if (startIndex != -1 && endIndex != -1) {
      final imageTag = svgString.substring(startIndex, endIndex + 1);

      final width = (double.parse(_extractAttributeValue(imageTag, 'width'))).toString() ;
      final height = _extractAttributeValue(imageTag, 'height');
      final x = _extractAttributeValue(imageTag, 'x');
      final y = _extractAttributeValue(imageTag, 'y');
      final href = _extractAttributeValue(imageTag, 'href');


      return '''
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
 <table width="500px" height="500px">
    <tr>
        <td  style="padding-left: ${
          double.parse(x.split("%")[0]) <50?
          double.parse(x.split("%")[0]) <=20 &&  double.parse(x.split("%")[0]) <=30?
          ((((
              (500 * double.parse(x.split("%")[0])) /100)) - double.parse(width)/2) +10)
          :
          ((((
          (500 * double.parse(x.split("%")[0])) /100)) - double.parse(width)/2) -2)

      :  (((((500 * double.parse(x.split("%")[0])) /100)) - double.parse(width)/2) -80)
      }px;padding-top: ${
          (double.parse(y.split("%")[0]) > 50)?
      ((500 * double.parse(y.split("%")[0]) /100) -60):
          ( (500 * double.parse(y.split("%")[0]) /100)-10)
              }px;">
      <img src="${PrefService.getString(PrefKeys.logo)}" alt="Image" width="${16}">
      </td> 
    </tr>
  </table>
</body>
</html>
    ''';


    }
    else
      {
        return "";
      }
  }


String _extractAttributeValue(String tag, String attributeName) {
  final attributePattern = '$attributeName="';
  final startIndex = tag.indexOf(attributePattern);
  if (startIndex == -1) return 'N/A';

  final valueStartIndex = startIndex + attributePattern.length;
  final endIndex = tag.indexOf('"', valueStartIndex);
  if (endIndex == -1) return 'N/A';

  return tag.substring(valueStartIndex, endIndex);
}

}