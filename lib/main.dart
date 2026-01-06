import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class Project {
  const Project({required this.title, required this.description});

  final String title;
  final String description;

  Map<String, String> toMap() => {'title': title, 'description': description};

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      title: map['title'] as String? ?? '',
      description: map['description'] as String? ?? '',
    );
  }
}

const List<Project> _seedProjects = [
  Project(
    title: 'Weather App',
    description: 'A Flutter app that shows weather forecasts using API',
  ),
  Project(
    title: 'Todo List',
    description: 'Task management app with local storage',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile & Projects',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProfileProjectsApp(),
    );
  }
}

class ProfileProjectsApp extends StatefulWidget {
  const ProfileProjectsApp({super.key});

  @override
  State<ProfileProjectsApp> createState() => _ProfileProjectsAppState();
}

class _ProfileProjectsAppState extends State<ProfileProjectsApp> {
  static const String _storageKey = 'projects';

  List<Project> _projects = const [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? stored = prefs.getString(_storageKey);

    if (stored != null) {
      try {
        final List<dynamic> decoded = jsonDecode(stored) as List<dynamic>;
        final List<Project> loaded = decoded
            .map((item) => Project.fromMap((item as Map).cast<String, dynamic>()))
            .toList();

        setState(() {
          _projects = loaded;
          _isLoading = false;
        });
        return;
      } catch (_) {
        // If stored data is corrupted, fall back to seeds and reset storage.
        await prefs.remove(_storageKey);
      }
    }

    setState(() {
      _projects = _seedProjects;
      _isLoading = false;
    });
    await _persistProjects();
  }

  Future<void> _persistProjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encoded =
        jsonEncode(_projects.map((project) => project.toMap()).toList());
    await prefs.setString(_storageKey, encoded);
  }

  Future<void> _addProject(String title, String description) async {
    final String trimmedTitle = title.trim();
    final String trimmedDescription = description.trim();

    if (trimmedTitle.isEmpty || trimmedDescription.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both title and description.')),
      );
      return;
    }

    setState(() {
      _projects = [
        ..._projects,
        Project(title: trimmedTitle, description: trimmedDescription),
      ];
    });

    await _persistProjects();
  }

  Future<void> _updateProject(int index, String title, String description) async {
    final String trimmedTitle = title.trim();
    final String trimmedDescription = description.trim();

    if (trimmedTitle.isEmpty || trimmedDescription.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both title and description.')),
      );
      return;
    }

    setState(() {
      _projects = List<Project>.from(_projects)
        ..[index] = Project(title: trimmedTitle, description: trimmedDescription);
    });

    await _persistProjects();
  }

  Future<void> _deleteProject(int index) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete project?'),
          content: const Text('This cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed != true) {
      return;
    }

    setState(() {
      _projects = List<Project>.from(_projects)..removeAt(index);
    });

    await _persistProjects();
  }

  void _showAddProjectDialog() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Project'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Project Title',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Project Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _addProject(titleController.text, descriptionController.text);
                if (mounted && Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditProjectDialog(int index, Project project) {
    final TextEditingController titleController =
        TextEditingController(text: project.title);
    final TextEditingController descriptionController =
        TextEditingController(text: project.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Project'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Project Title',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Project Description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _updateProject(
                  index,
                  titleController.text,
                  descriptionController.text,
                );
                if (mounted && Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile & Projects'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'Profile'),
              Tab(icon: Icon(Icons.work), text: 'Projects'),
            ],
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  _buildProfileTab(),
                  _buildProjectsTab(),
                ],
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddProjectDialog,
          tooltip: 'Add Project',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildProfileTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Yoganathan C',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Intern ID: MT1286',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Bio',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Flutter App Development Intern at Maincrafts Technology. Passionate about building cross-platform mobile applications and learning new technologies.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.contact_mail, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Contact',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildContactRow(Icons.email, 'iamyoganathanc@gmail.com'),
                    const SizedBox(height: 8),
                    _buildContactRow(Icons.phone, '+91 9626671504'),
                    const SizedBox(height: 8),
                    _buildContactRow(Icons.location_on, 'Tamil Nadu, India'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.school, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Internship Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow('Domain', 'Flutter App Development'),
                    const SizedBox(height: 8),
                    _buildDetailRow('Duration', '12 Weeks'),
                    const SizedBox(height: 8),
                    _buildDetailRow('Start Date', '07 December 2025'),
                    const SizedBox(height: 8),
                    _buildDetailRow('End Date', '07 April 2026'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
      ],
    );
  }

  Widget _buildProjectsTab() {
    return _projects.isEmpty
        ? const Center(
            child: Text(
              'No projects yet. Add one using the + button!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              final Project project = _projects[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.folder, color: Colors.blue),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              project.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            tooltip: 'Edit',
                            onPressed: () => _showEditProjectDialog(index, project),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            tooltip: 'Delete',
                            onPressed: () => _deleteProject(index),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        project.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
