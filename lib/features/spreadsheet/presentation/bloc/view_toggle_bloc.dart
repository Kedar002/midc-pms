import 'package:flutter_bloc/flutter_bloc.dart';
import 'view_toggle_event.dart';
import 'view_toggle_state.dart';

/// BLoC for managing view toggle between Sheet and Application views
class ViewToggleBloc extends Bloc<ViewToggleEvent, ViewToggleState> {
  ViewToggleBloc() : super(const ViewToggleState.initial()) {
    on<ToggleToSheetView>(_onToggleToSheetView);
    on<ToggleToApplicationView>(_onToggleToApplicationView);
  }

  /// Switch to Sheet view
  void _onToggleToSheetView(
    ToggleToSheetView event,
    Emitter<ViewToggleState> emit,
  ) {
    emit(const ViewToggleState(ViewMode.sheet));
  }

  /// Switch to Application view
  void _onToggleToApplicationView(
    ToggleToApplicationView event,
    Emitter<ViewToggleState> emit,
  ) {
    emit(const ViewToggleState(ViewMode.application));
  }
}
