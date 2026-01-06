import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:profile_projects_app/main.dart' show Project;

void main() {
  group('Project persistence', () {
    test('encodes and decodes project list via JSON', () {
      const projects = [
        Project(title: 'One', description: 'First project'),
        Project(title: 'Two', description: 'Second project'),
      ];

      final String encoded =
          jsonEncode(projects.map((project) => project.toMap()).toList());

      final List<dynamic> decodedRaw = jsonDecode(encoded) as List<dynamic>;
      final List<Project> decoded = decodedRaw
          .map((item) => Project.fromMap((item as Map).cast<String, dynamic>()))
          .toList();

      expect(decoded.length, projects.length);
      for (int i = 0; i < projects.length; i++) {
        expect(decoded[i].title, projects[i].title);
        expect(decoded[i].description, projects[i].description);
      }
    });
  });
}
