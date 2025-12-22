import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _youtubeController = TextEditingController();

  bool isProcessing = false;
  String statusMessage = '';

  void startProcessing() {
    if (_youtubeController.text.isEmpty) {
      setState(() {
        statusMessage = '❌ Встав посилання на YouTube';
      });
      return;
    }

    setState(() {
      isProcessing = true;
      statusMessage = '⏳ Обробка відео...';
    });

    // 🔹 ТУТ ПОТІМ БУДЕ API ЗАПИТ ДО БЕКЕНДУ
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isProcessing = false;
        statusMessage = '✅ Кліпи успішно створені та опубліковані';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Clip Creator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'YouTube посилання',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: _youtubeController,
              decoration: const InputDecoration(
                hintText: 'https://youtube.com/...',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isProcessing ? null : startProcessing,
              child: const Text('🎬 Створити та опублікувати кліпи'),
            ),

            const SizedBox(height: 20),

            if (isProcessing)
              const Center(child: CircularProgressIndicator()),

            const SizedBox(height: 10),

            Text(
              statusMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
