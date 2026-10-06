import 'package:flutter/material.dart';

void main() {
  runApp(const LongPressDragDemo());
}

class LongPressDragDemo extends StatelessWidget {
  const LongPressDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LongPressDraggable Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const DragDemoPage(),
    );
  }
}

class DragDemoPage extends StatelessWidget {
  const DragDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LongPressDraggable Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.touch_app,
                size: 55,
                color: Colors.deepPurple,
              ),

              const SizedBox(height: 12),

              const Text(
                'LongPressDraggable',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Press and hold the card to drag it.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40),

              LongPressDraggable<String>(
                // Required by LongPressDraggable.
                // We will improve this in Commit 3.
                feedback: const SizedBox(
                  width: 160,
                  height: 100,
                ),

                child: Container(
                  width: 160,
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pan_tool,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Hold and Drag',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}