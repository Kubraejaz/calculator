
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback onClearTap;
  final List<String> historyList;

  const HistoryWidget({
    super.key,
    required this.onBackTap,
    required this.historyList,
    required this.onClearTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: onBackTap,
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.arrow_back, color: Color(0xFFFF9500)),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: onClearTap,
              ),
            ],
          ),
        ),

        const Divider(color: Colors.white30),
        Expanded(
          child:
              historyList.isEmpty
                  ? const Center(
                    child: Text(
                      'No history yet',
                      style: TextStyle(color: Colors.white70),
                    ),
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: historyList.length,
                    itemBuilder: (context, index) {
                      final entry = historyList[index];
                      final parts = entry.split('=');
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              parts[0],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '= ${parts.length > 1 ? parts[1].trim() : ""}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }
}
