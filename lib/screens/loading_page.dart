import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 34, 145),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.black,
              color: Color.fromARGB(255, 27, 34, 145),
            ),
            SizedBox(height: 10),
            Text(
              'Carregando...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
