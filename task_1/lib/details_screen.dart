import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title'] ?? 'Details'),
        backgroundColor: const Color(0xFFB3E5FC),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB3E5FC),
              Color(0xFFE1F5FE),
              Color(0xFFE1F5FE),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item['image'] != null)
                Center(
                  child: Image.network(
                    item['image'],
                    fit: BoxFit.cover,
                    height: 280,
                    width: double.infinity,
                  ),
                ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Price:',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
                  Text(' \$${item['price'].toString()}',
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  const Text('Category:',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
                  Text(' ${item['category'] ?? ''}',
                      style: const TextStyle(fontSize: 20)),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Description:',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 22)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text('${item['description'] ?? ''}',
                        style: const TextStyle(fontSize: 20)
                  ),
                  ),
                ],
              ),

            
            ],
          ),
        ),
      ),
    );
  }
}
