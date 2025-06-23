import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  task.imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              task.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(task.description, style: const TextStyle(fontSize: 18)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer<TaskProvider>(
                  builder:
                      (context, provider, _) => IconButton(
                        icon: Icon(
                          task.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: task.isFavorite ? Colors.red : null,
                          size: 32,
                        ),
                        onPressed: () => provider.toggleFavorite(task),
                        tooltip: 'Favorite',
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
