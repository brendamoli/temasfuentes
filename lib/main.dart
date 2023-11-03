
import 'package:flutter/material.dart';

void main() => runApp(TextCustomizerApp());

class TextCustomizerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextCustomizerHomePage(),
    );
  }

class TextCustomizerHomePage extends StatefulWidget {
  @override
  _TextCustomizerHomePageState createState() => _TextCustomizerHomePageState();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Customizer App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Estilo de letra'),
            ),
            ListTile(
              title: DropdownButton<String>(
                value: selectedFont,
                items: fontStyles.map((String style) {
                  return DropdownMenuItem<String>(
                    value: style,
                    child: Text(style),
                  );
                }).toList(),
                onChanged: (newFont) {
                  setState(() {
                    selectedFont = newFont!;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            ListTile(
              title: Text('Color de texto'),
            ),
            ListTile(
              title: DropdownButton<Color>(
                value: selectedTextColor,
                items: textColors.map((Color color) {
                  return DropdownMenuItem<Color>(
                    value: color,
                    child: Container(
                      width: 20,
                      height: 20,
                      color: color,
                    ),
                  );
                }).toList(),
                onChanged: (newColor) {
                  setState(() {
                    selectedTextColor = newColor!;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Texto de ejemplo',
          style: TextStyle(
            fontFamily: selectedFont,
            color: selectedTextColor,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
