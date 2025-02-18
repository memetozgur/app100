import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl = 'https://grvptobqpvwgnfxprbxi.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdydnB0b2JxcHZ3Z25meHByYnhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0MzIxMDksImV4cCI6MjAzMDAwODEwOX0.VsyuutNEAne-06lfA8KPm4sOhGHw-yRd6i2CvJtEXcM';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
        authOptions:
            FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}
