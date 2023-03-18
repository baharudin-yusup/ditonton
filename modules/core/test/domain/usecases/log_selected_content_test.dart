import 'package:core/domain/repositories/analytic_repository.dart';
import 'package:core/domain/usecases/log_selected_content.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'log_selected_content_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AnalyticRepository>()])
void main() {
  late MockAnalyticRepository mockRepository;
  late LogSelectedContent usecase;

  setUp(() {
    mockRepository = MockAnalyticRepository();
    usecase = LogSelectedContent(mockRepository);
  });

  test('should return unit (a.k.a void) when all process is successful',
      () async {
    // Arrange
    const contentType = 'movie';
    const contentId = '123';

    when(mockRepository.logSelectedContent(contentType, contentId))
        .thenAnswer((_) async => const Right(unit));

    // Act
    final result = await usecase(
      contentType: contentType,
      contentId: contentId,
    );

    // Assert
    expect(result, const Right(unit));
  });
}
