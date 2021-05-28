import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:szakmai_gyakorlat_randomuser/model/person_item.dart';

class ListItem extends StatelessWidget {
  final ItemPerson item;
  final Function() onTap;

  const ListItem(this.item, {required this.onTap, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: InkWell(
            onTap: () => onTap(),
            child: Container(
              height: 70,
              child: Row(children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CachedNetworkImage(
                    imageUrl: item.imageUrls.thumbnail,
                    placeholder: (context, url) => new Center(
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => new Icon(Icons.photo),
                  ),
                ),
                SizedBox(
                  width: 14,
                  height: 70,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(item.name.toString(),
                        style: const TextStyle(fontSize: 20))),
              ]),
            )));
  }
}

/*Row(children: [
AspectRatio(
aspectRatio: 1 / 1,
child: CachedNetworkImage(
imageUrl: item.imageUrls.thumbnail,
placeholder: (context, url) => new Center(
child: SizedBox(
width: 30,
height: 30,
child: CircularProgressIndicator())),
errorWidget: (context, url, error) => new Icon(Icons.photo),
),
),
SizedBox(
width: 14,
height: 70,
),
Align(
alignment: Alignment.centerLeft,
child: Text(
item.name.toString(),
style: const TextStyle(fontSize: 20),*/
