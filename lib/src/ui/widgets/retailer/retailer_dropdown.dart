import 'package:flutter/material.dart';
import 'package:pos/src/ui/builder/space_builder.dart';

class RetailerDropdown extends StatefulWidget {
  @override
  _RetailerDropdownState createState() => _RetailerDropdownState();
}

class _RetailerDropdownState extends State<RetailerDropdown> {
  final List<String> items = [
    'Toko Maju (+628912345)',
    'Toko Terang (+628912345)',
    'Toko Kacang (+628912345)',
  ];
  String _selectedValue;

  @override
  void initState() {
    setState(() {
      _selectedValue = items[0];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 50.0,
          child: FlatButton(
            // icon: Icon(Icons.person_add, color: Colors.green,),
            padding: EdgeInsets.all(0.0),
            onPressed: () {},
            child: Icon(Icons.person_add, color: Colors.green),
          ),
        ),
        SpaceBuilder.horizontalSpaceSmall(),
        Expanded(
          child: DropdownButton<String>(
            onChanged: (String newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
            isExpanded: true,
            hint: Text('Pilih user'),
            value: _selectedValue,
            items: items.map((user) {
              return DropdownMenuItem(
                child: Text(user),
                value: user,
              );
            }).toList(),
          ),
        ),
        SpaceBuilder.horizontalSpaceSmall(),
        ClearSelectionButton(onPressed: clearSelectedItem),
      ],
    );
  }

  void clearSelectedItem() {
    setState(() {
      _selectedValue = null;
    });
  }
}

class ClearSelectionButton extends StatelessWidget {
  final Function onPressed;

  ClearSelectionButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        onPressed: onPressed,
        child: Icon(Icons.close, color: Colors.red),
      ),
    );
  }
}
