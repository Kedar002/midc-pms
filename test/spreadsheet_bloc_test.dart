import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:midc_pms/features/spreadsheet/presentation/bloc/spreadsheet_bloc.dart';
import 'package:midc_pms/features/spreadsheet/presentation/bloc/spreadsheet_event.dart';
import 'package:midc_pms/features/spreadsheet/presentation/bloc/spreadsheet_state.dart';
import 'package:midc_pms/features/spreadsheet/data/repositories/csv_repository.dart';
import 'package:midc_pms/features/spreadsheet/data/models/grid_model.dart';

// Mock CSV Repository
class MockCsvRepository extends Mock implements CsvRepository {}

void main() {
  late SpreadsheetBloc bloc;
  late MockCsvRepository mockRepository;

  setUp(() {
    mockRepository = MockCsvRepository();
    bloc = SpreadsheetBloc(csvRepository: mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('SpreadsheetBloc', () {
    test('initial state is SpreadsheetInitial', () {
      expect(bloc.state, equals(const SpreadsheetInitial()));
    });

    blocTest<SpreadsheetBloc, SpreadsheetState>(
      'emits [SpreadsheetLoading, SpreadsheetLoaded] when CSV loads successfully',
      build: () {
        when(() => mockRepository.loadCsvFromUrl(any()))
            .thenAnswer((_) async => GridData.empty());
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadCsvData('test-url')),
      expect: () => [
        const SpreadsheetLoading(),
        isA<SpreadsheetLoaded>(),
      ],
    );

    blocTest<SpreadsheetBloc, SpreadsheetState>(
      'emits [SpreadsheetLoading, SpreadsheetError] when CSV loading fails',
      build: () {
        when(() => mockRepository.loadCsvFromUrl(any()))
            .thenThrow(Exception('Network error'));
        return bloc;
      },
      act: (bloc) => bloc.add(const LoadCsvData('test-url')),
      expect: () => [
        const SpreadsheetLoading(),
        isA<SpreadsheetError>(),
      ],
    );
  });
}
