library core;

import 'package:get_it/get_it.dart';

/// Common data
export 'common/constants.dart';
export 'common/exception.dart';
export 'common/failure.dart';

/// Data layer
export 'data/helpers/helpers.dart';
export 'data/models/models.dart';

/// Domain layer
export 'domain/entities/entities.dart';

/// Presentation layer
export 'presentation/pages/pages.dart';
export 'presentation/utils/utils.dart';
export 'presentation/widgets/widgets.dart';

final locator = GetIt.instance;
