import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<String> _items = [];
  void _removeItem(int i) {
    String removeItem = _items.removeAt(i);

    _key.currentState!.removeItem(i, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          color: Colors.red,
          child: ListTile(
            title: Text(
              "Deleted",
              style: TextStyle(color: Colors.white),
            ),
          ),
          elevation: 2,
        ),
      );
    });
  }

  void _addItem() {
    int i = _items.length > 0 ? _items.length : 0;
    _items.insert(i, "item ${_items.length + 1}");
    _key.currentState!.insertItem(i);
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: Colors.amber,
        elevation: 2,
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            color: Colors.white,
            onPressed: () {
              return _removeItem(index);
            },
          ), // Fixed the typo here as well
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            width: double.infinity,
            height: 120,
            color: Colors.black45,
            child: Container(
              margin: EdgeInsets.only(top: 70),
              child: Center(
                child: Text(
                  "Flutter Mapp",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.blueGrey[900],
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      _addItem();
                    },
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: AnimatedList(
                      key: _key,
                      initialItemCount: _items.length,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (context, index, animation) {
                        return _buildItem(_items[index], animation, index);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
