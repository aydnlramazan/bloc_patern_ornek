import 'package:bloc_patern_ornek/cubit/anasayfa_cubit.dart';
import 'package:bloc_patern_ornek/entity/kisi.dart';
import 'package:bloc_patern_ornek/views/Internet_connetion_widget.dart';
import 'package:bloc_patern_ornek/views/kisi_detay_sayfa.dart';
import 'package:bloc_patern_ornek/views/kisi_kayit_sayfa.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage(Future<void> kaydet, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kişiler Bloc Uygulaması"),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const KisiKayitSayfa(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ),
        body: BlocBuilder<AnasayfaCubit, List<Kisi>>(
          builder: (context, kisiListesi) {
            if (kisiListesi.isNotEmpty) {
              return ListView.builder(
                itemCount: kisiListesi.length,
                itemBuilder: (context, indeks) {
                  var kisi = kisiListesi[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  KisiDetaySayfa(kisi: kisi)));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(children: [
                        Text("${kisi.kisi_ad}"),
                        Text(" ${kisi.kisi_tel}")
                      ]),
                    ),
                  );
                },
              );
            } else {
              return InternetConnectionWidget();
            }
          },
        ));
  }
}
