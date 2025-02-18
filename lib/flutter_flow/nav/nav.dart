import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? StagesWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? StagesWidget() : OnboardingWidget(),
        ),
        FFRoute(
          name: 'signup',
          path: '/signup',
          builder: (context, params) => SignupWidget(),
        ),
        FFRoute(
          name: 'signin',
          path: '/signin',
          builder: (context, params) => SigninWidget(),
        ),
        FFRoute(
          name: 'profile_details',
          path: '/profileDetails',
          builder: (context, params) => ProfileDetailsWidget(),
        ),
        FFRoute(
          name: 'verify_email',
          path: '/verifyEmail',
          builder: (context, params) => VerifyEmailWidget(),
        ),
        FFRoute(
          name: 'emal_vrifided_done',
          path: '/emalVrifidedDone',
          builder: (context, params) => EmalVrifidedDoneWidget(),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: 'dashboard2',
          path: '/dashboard2',
          builder: (context, params) => Dashboard2Widget(
            stageprameter: params.getParam(
              'stageprameter',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['stages'],
            ),
            myorderprameters: params.getParam(
              'myorderprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['my_orders'],
            ),
          ),
        ),
        FFRoute(
          name: 'stages',
          path: '/stages',
          builder: (context, params) => StagesWidget(),
        ),
        FFRoute(
          name: 'lessonlist',
          path: '/lessonlist',
          builder: (context, params) => LessonlistWidget(
            sectioprameters: params.getParam(
              'sectioprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['section'],
            ),
          ),
        ),
        FFRoute(
          name: 'course_details',
          path: '/courseDetails',
          builder: (context, params) => CourseDetailsWidget(
            teacher: params.getParam(
              'teacher',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['teachers'],
            ),
            courseprameters: params.getParam(
              'courseprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['courses'],
            ),
          ),
        ),
        FFRoute(
          name: 'lesson_details',
          path: '/lessonDetails',
          asyncParams: {
            'comment1prameters':
                getDoc(['comment'], CommentRecord.fromSnapshot),
          },
          builder: (context, params) => LessonDetailsWidget(
            lessonprameters: params.getParam(
              'lessonprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['section', 'lesson'],
            ),
            comment1prameters: params.getParam(
              'comment1prameters',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'my_orders',
          path: '/myOrders',
          builder: (context, params) => MyOrdersWidget(
            sectionprameters: params.getParam(
              'sectionprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['section'],
            ),
          ),
        ),
        FFRoute(
          name: 'myorders_section',
          path: '/myordersSection',
          builder: (context, params) => MyordersSectionWidget(
            userprameters: params.getParam(
              'userprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            courseprameters: params.getParam(
              'courseprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['courses'],
            ),
          ),
        ),
        FFRoute(
          name: 'free_course_page',
          path: '/freeCoursePage',
          builder: (context, params) => FreeCoursePageWidget(
            freecourseprameters: params.getParam(
              'freecourseprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['free_course'],
            ),
          ),
        ),
        FFRoute(
          name: 'payment_done',
          path: '/paymentDone',
          builder: (context, params) => PaymentDoneWidget(),
        ),
        FFRoute(
          name: 'subject_teacher',
          path: '/subjectTeacher',
          builder: (context, params) => SubjectTeacherWidget(
            subjectprameters: params.getParam(
              'subjectprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['subject'],
            ),
            usersprameters: params.getParam(
              'usersprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'dashboard_login_off',
          path: '/dashboardLoginOff',
          builder: (context, params) => DashboardLoginOffWidget(
            stageprameter: params.getParam(
              'stageprameter',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['stages'],
            ),
          ),
        ),
        FFRoute(
          name: 'course_logout_page',
          path: '/courseLogoutPage',
          builder: (context, params) => CourseLogoutPageWidget(
            courseprameters: params.getParam(
              'courseprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['courses'],
            ),
            stageprameters: params.getParam(
              'stageprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['stages'],
            ),
          ),
        ),
        FFRoute(
          name: 'subject_techer_logout',
          path: '/subjectTecherLogout',
          builder: (context, params) => SubjectTecherLogoutWidget(
            subjectprameters: params.getParam(
              'subjectprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['subject'],
            ),
            stageprameters: params.getParam(
              'stageprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['stages'],
            ),
          ),
        ),
        FFRoute(
          name: 'stages_logout',
          path: '/stagesLogout',
          builder: (context, params) => StagesLogoutWidget(),
        ),
        FFRoute(
          name: 'favourite',
          path: '/favourite',
          builder: (context, params) => FavouriteWidget(
            coursesprameters: params.getParam(
              'coursesprameters',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['courses'],
            ),
          ),
        ),
        FFRoute(
          name: 'my_profile',
          path: '/myProfile',
          builder: (context, params) => MyProfileWidget(),
        ),
        FFRoute(
          name: 'recharge_wallet',
          path: '/rechargeWallet',
          builder: (context, params) => RechargeWalletWidget(),
        ),
        FFRoute(
          name: 'wallet_charge_done',
          path: '/walletChargeDone',
          builder: (context, params) => WalletChargeDoneWidget(),
        ),
        FFRoute(
          name: 'changestages',
          path: '/changestages',
          builder: (context, params) => ChangestagesWidget(),
        ),
        FFRoute(
          name: 'edit_profile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: 'teacher_profile',
          path: '/teacherProfile',
          builder: (context, params) => TeacherProfileWidget(
            teacherprameter: params.getParam(
              'teacherprameter',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['teachers'],
            ),
          ),
        ),
        FFRoute(
          name: 'query_orders_code',
          path: '/queryOrdersCode',
          builder: (context, params) => QueryOrdersCodeWidget(),
        ),
        FFRoute(
          name: 'query_order_done',
          path: '/queryOrderDone',
          builder: (context, params) => QueryOrderDoneWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  child: Center(
                    child: Image.asset(
                      'assets/images/___.png',
                      width: 250.0,
                      height: 250.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
