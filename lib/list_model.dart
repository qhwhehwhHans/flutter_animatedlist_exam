import 'package:flutter/cupertino.dart';

import 'card_item.dart';

class ListModel<E> {
  final List<E> _items;
  final GlobalKey<AnimatedListState> listKey;
  
  AnimatedListState get _animatedList =>listKey.currentState;
  
  ListModel({this.listKey,
    @required Iterable<E> initalItems})
  : assert(listKey != null), assert(initalItems != null),
  _items=List<E>.from(initalItems ?? <E>[]);

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  void removeAt(int index) {
   final removedItem = _items.removeAt(index);
   if(removedItem != null ) {
     _animatedList.removeItem(index, (context, animation) {
       return CardItem(removedItem as int, null ,false, animation);
     });
   }
   return;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}