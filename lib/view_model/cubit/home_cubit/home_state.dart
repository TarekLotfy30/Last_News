part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class BreakingNewsDataLoadingState extends HomeState {}

class BreakingNewsDataSuccessState extends HomeState {}

class BreakingNewsDataErrorState extends HomeState {
  final String error;

  BreakingNewsDataErrorState(this.error);
}

class GetSelectedCategoryLoadingState extends HomeState {}

class GetSelectedCategoryDataSuccessState extends HomeState {}

class GetSelectedCategoryDataErrorState extends HomeState {
  final String error;

  GetSelectedCategoryDataErrorState(this.error);
}

class SearchLoadingState extends HomeState {}

class SearchDataSuccessState extends HomeState {}

class SearchDataErrorState extends HomeState {
  final String error;

  SearchDataErrorState(this.error);
}

class ChangeIndex extends HomeState {}

class ChangeLanguageState extends HomeState {}
