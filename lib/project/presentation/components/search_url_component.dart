import 'package:flutter/material.dart';

class SearchUrlComponent extends StatefulWidget {
  const SearchUrlComponent({Key? key}) : super(key: key);

  @override
  SearchUrlComponentState createState() => SearchUrlComponentState();
}

class SearchUrlComponentState extends State<SearchUrlComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'url....',
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsetsDirectional.all(16.0),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
