import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/detail_surah.dart';


class DetailPage extends StatelessWidget {
final int nomor;
const DetailPage({super.key, required this.nomor});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Detail Surah')),
body: FutureBuilder<DetailSurah>(
future: ApiService.fetchDetailSurah(nomor),
builder: (context, snapshot) {
if (snapshot.hasData) {
return ListView.builder(
itemCount: snapshot.data!.ayat.length,
itemBuilder: (context, index) {
final ayat = snapshot.data!.ayat[index];
return ListTile(
title: Text(
ayat['teksArab'],
textAlign: TextAlign.right,
style: const TextStyle(fontSize: 22),
),
subtitle: Text(ayat['teksIndonesia']),
);
},
);
}
return const Center(child: CircularProgressIndicator());
},
),
);
}
}