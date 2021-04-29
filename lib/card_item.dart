import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {

  final int _item;
  final VoidCallback onTap;
  final bool selected;
  final Animation<double> animation;

  const CardItem(this._item,this.onTap,this.selected,this.animation,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: Colors.primaries[_item%Colors.primaries.length],
        child: ListTile(
          leading: Icon(Icons.star),
          title: Text("번호: $_item", textScaleFactor: 3,),
          subtitle: Text("subtitle blablalba"),
          trailing: Icon(Icons.favorite),
          selected: selected,
          onTap: onTap,
        ),
      ),
    );
  }
}
