import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/csv_repository.dart';
import '../bloc/spreadsheet_bloc.dart';
import '../bloc/spreadsheet_event.dart';
import '../bloc/spreadsheet_state.dart';
import '../widgets/virtualized_grid/virtualized_grid.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_colors.dart';

/// Main spreadsheet page
///
/// Displays the spreadsheet grid with CSV data loaded from URL.
class SpreadsheetPage extends StatelessWidget {
  const SpreadsheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpreadsheetBloc(
        csvRepository: CsvRepository(),
      )..add(const LoadCsvData(AppStrings.csvUrl)),
      child: const SpreadsheetView(),
    );
  }
}

class SpreadsheetView extends StatelessWidget {
  const SpreadsheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        elevation: 0,
      ),
      body: BlocBuilder<SpreadsheetBloc, SpreadsheetState>(
        builder: (context, state) {
          if (state is SpreadsheetInitial) {
            return const Center(
              child: Text('Initializing...'),
            );
          }

          if (state is SpreadsheetLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    AppStrings.loadingData,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is SpreadsheetError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: const TextStyle(
                      color: AppColors.error,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SpreadsheetBloc>().add(
                            const LoadCsvData(AppStrings.csvUrl),
                          );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is SpreadsheetLoaded) {
            return VirtualizedGrid(
              gridData: state.gridData,
              selection: state.selection,
              editing: state.editing,
              columnWidths: state.columnWidths,
              rowHeights: state.rowHeights,
            );
          }

          return const Center(
            child: Text('Unknown state'),
          );
        },
      ),
    );
  }
}
