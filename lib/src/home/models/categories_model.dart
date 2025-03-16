import 'dart:convert';

List<Quote> quoteFromJson(String str) =>
    List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

String quoteToJson(List<Quote> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quote {
  final String quote;
  final String author;
  final String imageUrl;

  Quote({required this.quote, required this.author, required this.imageUrl});

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    quote: json["quote"],
    author: json["author"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "quote": quote,
    "author": author,
    "imageUrl": imageUrl,
  };
}
