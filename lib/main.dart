import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
  // List to store projects (in-memory)
  final List<Map<String, String>> _projects = [
    {
      'title': 'Weather App',
      'description': 'A Flutter app that shows weather forecasts using API',
    },
    {
      'title': 'Todo List',
      'description': 'Task management app with local storage',
    },
  ];

  // Add new project to the list
  void _addProject(String title, String description) {
    setState(() {
      _projects.add({'title': title, 'description': description});
    });
  }

  // Show dialog to add a new project
  void _showAddProjectDialog() {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Project'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Project Title',
                  border: OutlineInputBorder(),
                ),
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
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    descriptionController.text.isNotEmpty) {
                  _addProject(titleController.text, descriptionController.text);
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
        body: TabBarView(
          children: [
            // Profile Tab
            _buildProfileTab(),
            // Projects Tab
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

  // Profile Tab Widget
  Widget _buildProfileTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Photo
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 20),
            // Name
            const Text(
              'Yoganathan C',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Intern ID
            const Text(
              'Intern ID: MT1286',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            // Bio Section
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
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
                    const SizedBox(height: 12),
                    const Text(
                      'Flutter App Development Intern at Maincrafts Technology. Passionate about building cross-platform mobile applications and learning new technologies.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Contact Section
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
                            fontWeight: FontWeight.bold,
                          ),
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
            // Internship Details
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

  // Projects Tab Widget
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
              final project = _projects[index];
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
                              project['title']!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        project['description']!,
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
