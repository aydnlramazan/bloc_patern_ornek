import 'package:bloc_patern_ornek/entity/kisi.dart';
import 'package:flutter/material.dart';

class KisiDetaySayfa extends StatelessWidget {
  final Kisi kisi;
  KisiDetaySayfa({Key? key, required this.kisi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detay"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person,
                    size: 65,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${kisi.kisi_id}"),
                    Text("AD: ${kisi.kisi_ad}"),
                    Text("TEL: ${kisi.kisi_tel}"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
