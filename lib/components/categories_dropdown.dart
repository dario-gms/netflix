import 'package:flutter/material.dart';

class CategoriesDropdown extends StatefulWidget {
  const CategoriesDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoriesDropdownState createState() => _CategoriesDropdownState();
}

class _CategoriesDropdownState extends State<CategoriesDropdown> {
  String dropdownValue = 'Categories';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
      dropdownColor: Colors.black,
      underline: Container(),
      style: const TextStyle(color: Colors.white, fontSize: 20),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Categories', 'Action', 'Comedy', 'Drama', 'Horror']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
