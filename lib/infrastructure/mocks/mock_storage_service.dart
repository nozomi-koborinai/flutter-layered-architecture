import 'dart:io';

import 'package:flutter_reference_app_2/domain/service/storage_service.dart';

class MockStorageService implements StorageService {
  @override
  Future<String> uploadImage({required File image}) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'https://1.bp.blogspot.com/-rb5mSYSN8pA/X6tmegQM2ZI/AAAAAAABcLw/_-n5UvfxhJItVJnKRrycKPShVDsxStrjACNcBGAsYHQ/s400/fruit_apple_yellow.png';
  }
}
