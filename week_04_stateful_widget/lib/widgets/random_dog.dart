import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RandomDog extends StatefulWidget {
  const RandomDog({super.key});

  @override
  State<RandomDog> createState() => _RandomDogState();
}

class _RandomDogState extends State<RandomDog> {
  var imgUrl = '';
  var likeCount = 0;
  var dislikeCount = 0;

  Future<String> getDogImage() async {
    var dogApiUrl = 'https://dog.ceo/api/breeds/image/random';
    final res = await http.get(Uri.parse(dogApiUrl));
    final data = jsonDecode(res.body)['message'];
    return data;
  }

  @override
  void initState() {
    getDogImage().then((dogMessage) {
      setState(() {
        imgUrl = dogMessage;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imgUrl != ''
            // OPTION 3: Dismissible
            ? Dismissible(
                key: UniqueKey(),
                child: Image.network(imgUrl),
                onDismissed: (direction) async {
                  var dogMessage = await getDogImage();

                  setState(() {
                    switch (direction) {
                      case DismissDirection.startToEnd:
                        likeCount += 1;
                        break;
                      case DismissDirection.endToStart:
                        dislikeCount += 1;
                        break;
                      default:
                        break;
                    }
                    imgUrl = dogMessage;
                  });
                },
              )
            // OPTION 2: Gestures for like/dislike
            /* GestureDetector(
                child: Image.network(imgUrl),
                onTap: () async {
                  // Get a new image url
                  var dogMessage = await getDogImage();

                  setState(() {
                    likeCount += 1;
                    imgUrl = dogMessage;
                  });
                },
                onLongPress: () async {
                  // Get a new image url
                  var dogMessage = await getDogImage();

                  setState(() {
                    dislikeCount += 1;
                    imgUrl = dogMessage;
                  });
                },
              )*/
            : const Text('Loading image...'),
        // OPTION 1: buttons for like/dislike
        /*
        ElevatedButton(
          onPressed: () async {
            // Get a new image url
            var dogMessage = await getDogImage();

            setState(() {
              likeCount += 1;
              imgUrl = dogMessage;
            });
          },
          child: const Text('Like Image'),
        ),
        ElevatedButton(
          onPressed: () async {
            // Get a new image url
            var dogMessage = await getDogImage();

            setState(() {
              dislikeCount += 1;
              imgUrl = dogMessage;
            });
          },
          child: const Text('Dislike Image'),
        ),
        */
        Text('Likes: $likeCount - Dislikes: $dislikeCount'),
      ],
    );
  }
}
