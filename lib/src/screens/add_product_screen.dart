import 'package:flutter/material.dart';
import 'package:store_it/src/widgets/product_text_form_field.dart';
import 'package:store_it/src/widgets/store_it_button.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductTextFormField(
                hintText: 'Product naam vb. "Dell XPS 13',
                errorText: 'Product naam is verplicht',
                onSaved: (value) => print('saved'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductTextFormField(
                keyboardType: TextInputType.multiline,
                hintText:
                    'Product beschrijving vb. "Gloednieuwe Dell XPS 13 laptop',
                errorText: 'Product beschrijving is verplicht',
                onSaved: (value) => print(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductTextFormField(
                hintText: 'Product prijs vb. "39.39',
                errorText: 'Product prijs is verplicht',
                keyboardType: TextInputType.number,
                onSaved: (value) => print('saved'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ProductTextFormField(
                hintText: 'Product afbeelding url',
                errorText: 'Product afbeelding url is verplicht',
                keyboardType: TextInputType.url,
                onSaved: (value) => print('saved'),
              ),
            ),
            StoreItButton(
              text: 'Bevestig',
              onPressed: () {
                if(formKey.currentState.validate()){
                  // add product
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
