import 'package:equatable/equatable.dart';

/// Base class for view toggle events
abstract class ViewToggleEvent extends Equatable {
  const ViewToggleEvent();

  @override
  List<Object?> get props => [];
}

/// Event to switch to Sheet view
class ToggleToSheetView extends ViewToggleEvent {
  const ToggleToSheetView();
}

/// Event to switch to Application view
class ToggleToApplicationView extends ViewToggleEvent {
  const ToggleToApplicationView();
}
