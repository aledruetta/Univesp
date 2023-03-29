export class Noticia {

  author: string;
  title: string;
  description: string;
  url: string;
  urlToImage: string;
  publishedAt: string;
  content: string;

  constructor(author: string, title: string, description: string, url: string, urlToImage: string, publishedAt: string, content: string) {
    this.author = author;
    this.title = title;
    this.description = description;
    this.url = url;
    this.urlToImage = urlToImage;
    this.publishedAt = publishedAt;
    this.content = content;
  }

}
