import 'package:flutter/material.dart';
import 'package:news_app/data/models/news_model.dart';

class NewsBar extends StatefulWidget {
  final Article article;
  NewsBar({
    required this.article,
    super.key,
  });

  @override
  State<NewsBar> createState() => _NewsBarState();
}

class _NewsBarState extends State<NewsBar> with AutomaticKeepAliveClientMixin {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ListTile(
        leading: SizedBox(
          width: 100,
          child: widget.article.urlToImage != null
              ? Image.network(
                  widget.article.urlToImage!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text("Image not found"),
                )
              : const Text("Image not found"),
        ),
        title: Text(widget.article.title!),
        trailing: IconButton(
          icon: const Icon(Icons.favorite),
          color: isFavourite ? Colors.red : Colors.grey,
          onPressed: () => setState(() {
            isFavourite = !isFavourite;
          }),
        ),
        subtitle: Text(
            "${widget.article.description}\n${widget.article.publishedAt}"),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
