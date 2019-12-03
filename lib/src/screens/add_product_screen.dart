import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_it/src/models/product.dart';
import 'package:store_it/src/models/store.dart';
import 'package:store_it/src/widgets/product_text_form_field.dart';
import 'package:store_it/src/widgets/store_it_button.dart';

class AddProductScreen extends StatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();
  String title, description, imageUrl;
  num price;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ProductTextFormField(
                hintText: 'Product naam vb. "Dell XPS 13',
                errorText: 'Product naam is verplicht',
                onSaved: (value) => title = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ProductTextFormField(
                keyboardType: TextInputType.multiline,
                hintText:
                    'Product beschrijving vb. "Gloednieuwe Dell XPS 13 laptop',
                errorText: 'Product beschrijving is verplicht',
                onSaved: (value) => description = value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ProductTextFormField(
                hintText: 'Product prijs vb. "39.39',
                errorText: 'Product prijs is verplicht',
                keyboardType: TextInputType.number,
                onSaved: (value) => price = double.parse(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: ProductTextFormField(
                hintText: 'Product afbeelding url',
                errorText: 'Product afbeelding url is verplicht',
                keyboardType: TextInputType.url,
                onSaved: (value) => imageUrl = value,
              ),
            ),
            StoreItButton(
              text: 'Bevestig',
              backgroundColor:
                  Theme.of(context).highlightColor.withOpacity(0.20),
              textColor: Theme.of(context).accentColor,
              onPressed: () {
                if (formKey.currentState.validate()) {
                  // add product
                  formKey.currentState.save();
                  final newProduct = Product(
                    title: title,
                    description: description,
                    price: price,
                    imageUrl: imageUrl,
                  );

                  final store = Provider.of<Store>(context);

                  store.addProduct(newProduct);
                  formKey.currentState.reset();

                  final snackbar = SnackBar(
                      backgroundColor: Theme.of(context).accentColor,
                      content: Text('Product toegevoegd aan de winkel'));
                  Scaffold.of(context).showSnackBar(snackbar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
