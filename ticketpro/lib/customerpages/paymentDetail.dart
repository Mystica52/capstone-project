
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_stripe/src/widgets/card_form_field.dart';

class CardFormScreen extends StatelessWidget {
  const CardFormScreen({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pay with a credit card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Card Form', style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20,), 
            CardFormField(controller: CardFormEditController(),
            )
          ],
        ),
      ),
    );

  }
}

