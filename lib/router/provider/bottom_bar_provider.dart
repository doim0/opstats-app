import 'package:flutter_riverpod/legacy.dart';

final indexBottomNavbarProvider = StateProvider<int>((ref) {
  return 0;
});
final searchActiveProvider = StateProvider<bool>((ref) {
  return false;
});