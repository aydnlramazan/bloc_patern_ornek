import 'package:bloc_patern_ornek/views/anasayfa.dart';
import 'package:flutter/material.dart';

class KisiKayitSayfa extends StatefulWidget {
  const KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  _KisiKayitSayfaState createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tKisiAd = TextEditingController();
  var tKisiTel = TextEditingController();

  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    //print("kişiyi kaydet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Kayıt Ekranı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              TextField(
                controller: tKisiAd,
                decoration:
                    const InputDecoration(hintText: "Kişi Adını Yazınız!"),
              ),
              TextField(
                controller: tKisiTel,
                decoration:
                    const InputDecoration(hintText: "Kişi Telefonunu Yazınız!"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  kaydet(tKisiAd.text, tKisiTel.text),
                                )));
                  });
                },
                child: const Text("KAYDET"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
