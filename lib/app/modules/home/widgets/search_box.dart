import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: const Color(0xff2f3648),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'search movies',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
