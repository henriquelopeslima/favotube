import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favotube/blocs/favorite_bloc.dart';
import 'package:favotube/models/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import '../api.dart';

class ItemFavorite extends StatelessWidget {
  final Video video;

  const ItemFavorite({this.video});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<FavoriteBloc>();

    return Container(
      child: InkWell(
        onTap: () {
          FlutterYoutube.playYoutubeVideoById(
            apiKey: API_KEY,
            videoId: video.id,
          );
        },
        onLongPress: () {
          bloc.toggleFavorite(video);
        },
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 100,
              child: Image.network(video.thumb),
            ),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(color: Colors.white70),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
