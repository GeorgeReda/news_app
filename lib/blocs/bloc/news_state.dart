part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  List<Object> get props => [];
}

class NewsMain extends NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsDone extends NewsState {
  final data;

  NewsDone({@required this.data});
  @override
  List<Object> get props => [data];
}

class NewsFailure extends NewsState {
  final String error;

  NewsFailure({@required this.error});
  @override
  List<Object> get props => [error];
}
