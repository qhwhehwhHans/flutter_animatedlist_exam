import 'package:flutter/material.dart';
import 'package:flutter_app_animatedlist_exam/card_item.dart';
import 'package:flutter_app_animatedlist_exam/list_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'animatedlist_exam',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: AnimList(),
    );
  }
}

class AnimList extends StatefulWidget {
  @override
  _AnimListState createState() => _AnimListState();
}

class _AnimListState extends State<AnimList> {

  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  ListModel<int> _list;
  int _selectedItem;
  int _nextItem;

  void initState() {
    super.initState();
    _list = ListModel<int>(
      listKey: _listKey,initalItems: <int>[1, 2, 3]
    );
    _nextItem = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList'),
        actions: [
          IconButton(icon: Icon(Icons.add_circle), color: Colors.white, onPressed: _insert,),
          IconButton(icon: Icon(Icons.remove_circle), color: Colors.white, onPressed: _remove,),
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: _buildItem,
      ),
    );
  }

  void _insert() {
    final int index = _selectedItem == null ? _list.length : _list.indexOf(_selectedItem);
    _list.insert(index, _nextItem++);
  }

  void _remove() {
    if(_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  Widget _buildItem(context, index, animation){
        return CardItem(_list[index], (){
          setState(() {
            _selectedItem = _selectedItem == _list[index] ? null : _list[index];
          });
        },_selectedItem == _list[index],animation);
      }
}
