import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _openDetail(BuildContext context, Task task) {
    Navigator.pushNamed(context, '/detail', arguments: task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProTasker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            tooltip: 'Favorites',
            onPressed: () => Navigator.pushNamed(context, '/favorites'),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () => Navigator.pushNamed(context, '/search'),
          ),
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, provider, _) {
          final tasks = provider.tasks;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      task.imageUrl,
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    task.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(task.description),
                  trailing: IconButton(
                    icon: Icon(
                      task.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: task.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () => provider.toggleFavorite(task),
                  ),
                  onTap: () => _openDetail(context, task),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
