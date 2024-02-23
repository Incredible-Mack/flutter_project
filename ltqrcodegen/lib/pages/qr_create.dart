import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LT SCANNER",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: mycontroller.text,
                size: 200,
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: 40,
              ),
              buildTextField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField() {
    return TextField(
      controller: mycontroller,
      decoration: InputDecoration(
        labelText: "Enter QR Code detail",
        suffixIcon: IconButton(
          icon: const Icon(Icons.done),
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
