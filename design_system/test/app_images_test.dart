import 'dart:developer';

import 'package:design_system/enums/app_images.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('app images ...', () {
    test('... should have a path', () {
      const images = AppImage.values;

      for (final image in images) {
        expect(
          image.file.existsSync(),
          true,
          reason: 'Image ${image.name} not found in path ${image.path}',
        );
      }
    });

    test('Not should have equal paths', () {
      const icons = AppImage.values;
      int iconsLength = icons.length;
      final expectedIconsList = icons.map((e) => e.path).toSet().toList();
      List duplicateIcons = [];
      if (iconsLength != expectedIconsList.length) {
        duplicateIcons = expectedIconsList
            .where((icon) =>
                icons.where((element) => element.path == icon).length > 1)
            .toList();
        log('Duplicate Images: $duplicateIcons');
        debugPrint('Duplicate Images: $duplicateIcons');
      }
      expect(iconsLength, expectedIconsList.length,
          reason: 'Duplicate Path $duplicateIcons');
    });
  });
}
