import 'package:get_it/get_it.dart';
import 'package:memar_degla/core/services/image_picker_services.dart';
import 'package:memar_degla/features/profile/data/data_source/user_profile_local_data_source.dart';
import 'package:memar_degla/features/profile/data/profile_local_data_source.dart';
import 'package:memar_degla/features/profile/data/repos/profile_repo_impl.dart';
import 'package:memar_degla/features/profile/data/repos/user_repo_impelmentation.dart';
import 'package:memar_degla/features/profile/domain/repo/profile_repo.dart';
import 'package:memar_degla/features/profile/domain/repo/user_repo.dart';
import 'package:memar_degla/features/profile/domain/useCases/clear_saved_picture_use_case.dart';
import 'package:memar_degla/features/profile/domain/useCases/get_saved_profile_picture_use_case.dart';
import 'package:memar_degla/features/profile/domain/useCases/save_profile_picture_use_case.dart';
import 'package:memar_degla/features/profile/presentation/manger/cubit/profile_picture_cubit.dart';
import 'package:memar_degla/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:memar_degla/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:memar_degla/features/settings/data/services/notification_permission_service_impl.dart';
import 'package:memar_degla/features/settings/domain/repositories/notification_permission_service.dart';
import 'package:memar_degla/features/settings/domain/repositories/settings_repository.dart';

import 'package:memar_degla/features/settings/domain/usecases/get_notification_preferences.dart';
import 'package:memar_degla/features/settings/domain/usecases/get_theme_mode.dart';
import 'package:memar_degla/features/settings/domain/usecases/select_theme_mode.dart';
import 'package:memar_degla/features/settings/domain/usecases/set_notification_channel_enabled.dart';
import 'package:memar_degla/features/settings/presentation/manger/cubit/theme_cubit.dart';

import 'package:memar_degla/features/settings/presentation/manger/notifications/notifications_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global service locator instance. Import this `sl` wherever a
/// dependency needs resolving — widgets should never construct
/// repositories, data sources, or use cases directly.
final GetIt sl = GetIt.instance;

Future<void> initServiceLocator() async {
  await _registerExternal();
  _registerCoreServices();
  _registerProfilePictureFeature();
  _regiterUserProfileFeature();
  _registerSettingsFeature();
}

/// Third-party dependencies that need async setup or are shared across
/// multiple features. Kept separate from feature registration so it's
/// obvious what's "platform plumbing" vs. "our code."
Future<void> _registerExternal() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

void _registerCoreServices() {
  sl.registerLazySingleton<ImagePickerService>(() => ImagePickerService());
}

void _regiterUserProfileFeature() {
  // Data layer
  sl.registerLazySingleton<UserProfileLocalDataSource>(
    () => UserProfileLocalDataSourceImpl(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<UserRepo>(
    () => UserRepoImpelmentation(
      userLocalDataSource: sl<UserProfileLocalDataSource>(),
    ),
  );
}

void _registerProfilePictureFeature() {
  // Data layer
  sl.registerLazySingleton<ProfilePictureLocalDataSource>(
    () => ProfilePictureLocalDataSourceImpl(sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<ProfilePictureRepository>(
    () => ProfilePictureRepositoryImpl(sl<ProfilePictureLocalDataSource>()),
  );

  // Domain layer — use cases are cheap and stateless, but registered as
  // lazy singletons rather than factories since there's no reason to
  // rebuild a new instance per resolve; they hold no per-call state.
  sl.registerLazySingleton<SaveProfilePictureUseCase>(
    () => SaveProfilePictureUseCase(sl<ProfilePictureRepository>()),
  );
  sl.registerLazySingleton<GetSavedProfilePictureUseCase>(
    () => GetSavedProfilePictureUseCase(sl<ProfilePictureRepository>()),
  );
  sl.registerLazySingleton<ClearProfilePictureUseCase>(
    () => ClearProfilePictureUseCase(sl<ProfilePictureRepository>()),
  );

  // Presentation layer — registered as a factory, not a singleton.
  // get_it constructs a fresh Cubit each time sl<ProfilePictureCubit>()
  // is called; lifecycle (when it's created/disposed) is then owned by
  // BlocProvider, the way flutter_bloc expects. Making this a singleton
  // instead would let it outlive the widget tree that created it and
  // fight with BlocProvider's own disposal.
  sl.registerFactory<ProfilePictureCubit>(
    () => ProfilePictureCubit(
      saveProfilePicture: sl<SaveProfilePictureUseCase>(),
      getSavedProfilePicture: sl<GetSavedProfilePictureUseCase>(),
      clearProfilePicture: sl<ClearProfilePictureUseCase>(),
    ),
  );
}

void _registerSettingsFeature() {
  // Data layer
  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSource(sl<SharedPreferences>()),
  );
  sl.registerLazySingleton<NotificationPermissionService>(
    () => const NotificationPermissionServiceImpl(),
  );
  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(sl<SettingsLocalDataSource>()),
  );

  // Domain layer

  sl.registerLazySingleton<GetThemeMode>(
    () => GetThemeMode(sl<SettingsRepository>()),
  );
  sl.registerLazySingleton<SelectThemeMode>(
    () => SelectThemeMode(sl<SettingsRepository>()),
  );
  sl.registerLazySingleton<GetNotificationPreferences>(
    () => GetNotificationPreferences(sl<SettingsRepository>()),
  );
  sl.registerLazySingleton<SetNotificationChannelEnabled>(
    () => SetNotificationChannelEnabled(
      sl<SettingsRepository>(),
      sl<NotificationPermissionService>(),
    ),
  );

  // Presentation layer — registered as lazy singletons, not factories,
  // unlike ProfilePictureCubit above. ThemeCubit and LocaleCubit back
  // MaterialApp's themeMode/locale at the app root, so they need to
  // outlive the settings screen; NotificationsCubit is kept alongside
  // them for consistency and so its state survives revisits to the
  // settings screen without a reload.

  sl.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(sl<GetThemeMode>(), sl<SelectThemeMode>()),
  );
  sl.registerLazySingleton<NotificationsCubit>(
    () => NotificationsCubit(
      sl<GetNotificationPreferences>(),
      sl<SetNotificationChannelEnabled>(),
    ),
  );
}
