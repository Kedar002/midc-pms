import 'package:equatable/equatable.dart';

/// View modes for the application
enum ViewMode { sheet, application }

/// State for view toggle
class ViewToggleState extends Equatable {
  final ViewMode currentView;

  const ViewToggleState(this.currentView);

  /// Initial state (Sheet view)
  const ViewToggleState.initial() : currentView = ViewMode.sheet;

  @override
  List<Object?> get props => [currentView];

  @override
  String toString() => 'ViewToggleState(currentView: $currentView)';
}
