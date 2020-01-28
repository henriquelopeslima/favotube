import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favotube/blocs/favorite_bloc.dart';
import 'package:favotube/models/video.dart';
import 'package:favotube/widgets/item_favorite_widget.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<FavoriteBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.black87,
      body: StreamBuilder<Map<String, Video>>(
        stream: bloc.outFav,
        initialData: {},
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data.values.map((v) {
              return ItemFavorite(
                video: v,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
