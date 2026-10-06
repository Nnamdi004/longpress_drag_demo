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

class DragDemoPage extends StatefulWidget {
  const DragDemoPage({super.key});

  @override
  State<DragDemoPage> createState() => _DragDemoPageState();
}

class _DragDemoPageState extends State<DragDemoPage> {
  bool isDropped = false;

  String message =
      'Long-press the card and drag it to the drop area.';

  void resetDemo() {
    setState(() {
      isDropped = false;
      message =
          'Long-press the card and drag it to the drop area.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LongPressDraggable Demo'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
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

              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 35),

              // DRAGGABLE CARD
              LongPressDraggable<String>(
                // PROPERTY 1: DATA
                data: 'purple_card',

                // PROPERTY 2: FEEDBACK
                feedback: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 160,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Dragging!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // PROPERTY 3: CHILDWHENDRAGGING
                childWhenDragging: Container(
                  width: 180,
                  height: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 2,
                    ),
                  ),
                  child: const Text(
                    'Drag in progress',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // NORMAL CHILD
                child: Container(
                  width: 180,
                  height: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pan_tool,
                        color: Colors.white,
                        size: 32,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Hold and Drag',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 45),

              const Text(
                'Drop Zone',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // DROP TARGET
              DragTarget<String>(
                onWillAcceptWithDetails: (details) {
                  return details.data == 'purple_card';
                },
                onAcceptWithDetails: (details) {
                  setState(() {
                    isDropped = true;
                    message =
                        'Success! The DragTarget received the data.';
                  });
                },
                builder: (
                  context,
                  candidateData,
                  rejectedData,
                ) {
                  final bool isHovering =
                      candidateData.isNotEmpty;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: 240,
                    height: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isDropped
                          ? Colors.green.shade100
                          : isHovering
                              ? Colors.orange.shade100
                              : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDropped
                            ? Colors.green
                            : isHovering
                                ? Colors.orange
                                : Colors.grey,
                        width: 3,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Icon(
                          isDropped
                              ? Icons.check_circle
                              : Icons.move_to_inbox,
                          size: 42,
                          color: isDropped
                              ? Colors.green
                              : Colors.deepPurple,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          isDropped
                              ? 'Card Accepted!'
                              : isHovering
                                  ? 'Release Here'
                                  : 'Drop Here',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 25),

              OutlinedButton.icon(
                onPressed: resetDemo,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Demo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}