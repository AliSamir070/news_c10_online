import 'package:flutter/material.dart';
import 'package:news_c10_online/model/news_response/Article.dart';
import 'package:url_launcher/url_launcher.dart';


class ArticalDetailsView extends StatelessWidget {
  static String routeName = "/ArticalDetailsView";
  const ArticalDetailsView({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('News Title'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Image.network(article.urlToImage!),
            Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  left: 15.0,
                  right: 8.0,
                ),
              child: Text(
                article.source!.name ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                article.title!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    bottom: 60.0,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      article.content!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: ()async {

                          try {
                            final String url = article.url!;
                            final Uri uri = Uri.parse(url);

                            if(url.isNotEmpty){
                              await launchUrl(uri);
                            }
                            else {
                              throw 'Could not launch $url';
                            }
                          } catch (e) {
                            print('Error launching URL: $e');
                            // Handle the error gracefully, e.g., show a snackbar or display an error message.
                          }
                        },
                        child: const Text(
                          'View Full Article',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
