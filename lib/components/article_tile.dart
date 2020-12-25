import 'package:baby_names_bestmom/constants.dart';
import 'package:baby_names_bestmom/models/articles_model.dart';
import 'package:baby_names_bestmom/screens/webview.dart';
import 'package:flutter/material.dart';

class ArticlesTile extends StatelessWidget {
  final ArticleModel article;
  final String baseurl = 'https://bestmom.org';
  ArticlesTile({@required this.article});

  @override
  Widget build(BuildContext context) {
    print(article);
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.black45,
            ),
            title: Text(article.title, style: TextStyle(color: Colors.black87)),
            subtitle: Text(
              article.articleDescription,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6), fontSize: 12.0),
            ),
          ),
          Image.network('$baseurl${article.heroImg}'),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
          //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
          //   ),
          // ),
          FlatButton(
            color: kyellowAvatarBg,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => WebViewWidget(
                            url: '$baseurl/baby-names/${article.titleUrl}',
                          )));
            },
            child: const Text(
              'Read',
              style: TextStyle(color: kblueColor),
            ),
          ),
        ],
      ),
    );
  }
}
