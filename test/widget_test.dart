import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';  // Gantilah dengan path yang sesuai jika perlu

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 1. Bangun aplikasi dan lakukan frame.
    await tester.pumpWidget(const MyApp());

    // 2. Verifikasi bahwa counter dimulai dengan nilai 0.
    expect(find.text('0'), findsOneWidget);  // Cek apakah teks "0" ada di tampilan awal
    expect(find.text('1'), findsNothing);  // Cek apakah teks "1" tidak ada pada awalnya

    // 3. Tap ikon '+' dan lakukan frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();  // Perbarui tampilan setelah tap

    // 4. Verifikasi bahwa counter telah bertambah.
    expect(find.text('0'), findsNothing);  // Pastikan teks "0" sudah tidak ada
    expect(find.text('1'), findsOneWidget);  // Verifikasi bahwa teks "1" muncul
  });
}
