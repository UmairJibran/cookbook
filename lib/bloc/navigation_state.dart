part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  @override
  List<Object> get props => [];
  const NavigationState();
}

class NavigationInitial extends NavigationState {}

class NavigateToAllMeals extends NavigationState {
  final Category category;

  NavigateToAllMeals({
    this.category,
  });
}

class NavigateToSingleMeal extends NavigationState {
  final Meal meal;

  NavigateToSingleMeal({
    this.meal,
  });
}
