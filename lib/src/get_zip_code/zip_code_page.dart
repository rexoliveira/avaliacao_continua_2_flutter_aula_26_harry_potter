import 'package:brasil_fields/brasil_fields.dart';
import 'package:breaking_bad_api/src/get_zip_code/zip_code_controller.dart';
import 'package:breaking_bad_api/src/get_zip_code/zip_code_repository.dart';
import 'package:breaking_bad_api/src/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/consts.dart';
import '../../widget/custom_dialog/text_rich_info_show_dialog.dart';
import '../../widget/form_register_account/cancel_linkwell.dart';
import '../../widget/form_register_account/custom_text_form_field.dart';
import '../../widget/form_register_account/validate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final zipCodeController = ZipCodeController(repository: ZipCodeRepository());
  final formkey = GlobalKey<FormState>();
  final zipCodeEditController = TextEditingController();
  String? zipCode = Consts.zipCodeText;
  late List<Address> address;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      backgroundColor: const Color(0xFF747474),
      appBar: AppBar(
        title: Text(Consts.titleBarText,
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: FutureBuilder(
        future: zipCodeController.getCep(cep: zipCode.toString()),
        builder: (context, snapshot) {
          if (!snapshot.hasData && !snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Consts.notZipCodeText,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/');
                    },
                    child: const Text(
                      'Voltar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(
              child: Text(Consts.notDataText,
                  style: Theme.of(context).textTheme.titleLarge),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              address = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.all(16.0),
                  color: const Color(0xB5FFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${address[index].logradouro}, ${address[index].complemento}",
                                style: textStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${address[index].bairro}, ${address[index].localidade} - ${address[index].uf}",
                                style: textStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                address[index].cep,
                                style: textStyle,
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: formkey,
                          onChanged: () {
                            setState(() {});
                          },
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Center(
                                heightFactor: 2.5,
                                child: Column(
                                  children: [
                                    TextRichInfoShowDialog(
                                        title: "Info",
                                        description: Consts.descriptionText,
                                        text: Text(Consts.consultaText,
                                            style: textStyle)),
                                    const SizedBox(height: 10),
                                    CustomTextFormField(
                                      prefixIcon: const Icon(
                                          Icons.location_on_outlined),
                                      label: Consts.textzipCodeText,
                                      name: zipCodeEditController,
                                      hintText: Consts.zipCodeText,
                                      validator: (value) => Validate.enterValue(
                                          value, 'o ${Consts.textzipCodeText}'),
                                      suffix: CanceLinkwell(
                                          controller: zipCodeEditController),
                                      textInputAction: TextInputAction.go,
                                      textInputFormatter: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CepInputFormatter(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: formkey.currentState != null &&
                                      formkey.currentState!.validate()
                                  ? () {
                                      setState(() {
                                        if (zipCodeEditController
                                            .text.isNotEmpty) {
                                          zipCode = zipCodeEditController.text
                                              .replaceAll(RegExp('[^0-9]'), '');
                                        }
                                      });
                                    }
                                  : null,
                              child: const Text(
                                'Buscar',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


