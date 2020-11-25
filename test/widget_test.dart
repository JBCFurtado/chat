// Este é um teste básico do widget Flutter.
//
// Para realizar uma interação com um widget em seu teste, use o WidgetTester
// utilitário que o Flutter fornece. Por exemplo, você pode enviar tocar e rolar
// gestos. Você também pode usar o WidgetTester para encontrar widgets filhos no widget
// árvore, leia o texto e verifique se os valores das propriedades do widget estão corretos.

import 'package:chat/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  testWidgets('Teste de fumaça do contador', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());
    
        // Verify that our counter starts at 0.
        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);
    
        // Tap the '+' icon and trigger a frame.
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
    
        // Verify that our counter has incremented.
        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      });
    }
    