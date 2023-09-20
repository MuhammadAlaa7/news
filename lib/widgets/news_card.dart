import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

import '../views/web_view.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.articleModel,
  });

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WebViewScreen(
            
            url:articleModel.url! 
            
          ); 
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  articleModel.image ??
                      'https://imgs.search.brave.com/P8NYy6KG933BTjfmf4NfzU9WafjXREYbYte4eDuc8_w/rs:fit:860:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA0Lzc0LzM2LzM5/LzM2MF9GXzQ3NDM2/Mzk0Nl9sMXc3cGhM/blIxdmF3cDhnblNP/WjR0TldXOXQ3UlZm/Ti5qcGc',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 12,
            ),
            Text(
              articleModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articleModel.subTitle ?? 'The SubTitle Is Empty...',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
