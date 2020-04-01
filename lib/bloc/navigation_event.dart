part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
  @override
  List<Object> get props => null;
}

class AppStarted extends NavigationEvent {}

class CatTapped extends NavigationEvent {
  final Category category;

  CatTapped({this.category});

  List<Object> get props => [category];
}

class MealTapped extends NavigationEvent {
  final Meal meal;

  MealTapped({this.meal});

  List<Object> get props => [meal];
}
