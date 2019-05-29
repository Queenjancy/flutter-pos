import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      child: TextField(
        onTap: () {
          Navigator.of(context).pushNamed('/search_product');
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          hintText: 'Cari product disini',
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
