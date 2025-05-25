import 'package:flutter/material.dart';

class SearchDialog extends StatelessWidget {
  SearchDialog({super.key, required this.currentSearch})
    : _controller = TextEditingController(text: currentSearch);
  final String currentSearch;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefix: IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: Icon(Icons.arrow_back),
                ),
                suffix: IconButton(
                  onPressed: _controller.clear,
                  icon: Icon(Icons.close),
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                Navigator.of(context).pop(value);
              },
              autofocus: true,
            ),
          ),
        ),
      ],
    );
  }
}
