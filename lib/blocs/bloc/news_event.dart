part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class TopHeadlines extends NewsEvent {
  final String sources, q;
  final int pageSize, page;
  final Categories category;
  final Countries country;
  TopHeadlines(
      {this.country,
      this.category,
      this.sources,
      this.q,
      this.page,
      this.pageSize});
  @override
  List<Object> get props => [country, category, sources, q, pageSize];
}

class Everything extends NewsEvent {
  final String q, sources, from, to, sortBy;
  final int pageSize, page;
  final Languages language;
  Everything(
      {this.q,
      this.sources,
      this.language,
      this.from,
      this.to,
      this.sortBy,
      this.page,
      this.pageSize});
  @override
  List<Object> get props =>
      [q, sources, language, from, to, sortBy, page, pageSize];
}

class Sources extends NewsEvent {
  final Countries country;
  final Categories category;
  final Languages language;

  Sources({this.category, this.language, this.country});

  @override
  List<Object> get props => [category, language, country];
}

enum Categories {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology
}
enum Languages { ar, de, en, es, fr, he, it, nl, no, pt, ru, se, ud, zh }
enum Countries {
  ae,
  ar,
  at,
  au,
  be,
  bg,
  br,
  ca,
  ch,
  cn,
  co,
  cu,
  cz,
  de,
  eg,
  fr,
  gb,
  gr,
  hk,
  hu,
  id,
  ie,
  il,
  it,
  jp,
  kr,
  lt,
  lv,
  ma,
  mx,
  my,
  ng,
  nl,
  no,
  nz,
  ph,
  pl,
  pt,
  ro,
  rs,
  ru,
  sa,
  se,
  sg,
  si,
  sk,
  th,
  tr,
  tw,
  ua,
  us,
  ve,
  za
}
