import 'package:flutter/material.dart';

class ConsultaFarmaciaWidget extends StatefulWidget {
  const ConsultaFarmaciaWidget({Key? key}) : super(key: key);

  @override
  _ConsultaFarmaciaWidgetState createState() => _ConsultaFarmaciaWidgetState();
}

class _ConsultaFarmaciaWidgetState extends State<ConsultaFarmaciaWidget> {
  String? dropDownValue;
  TextEditingController? nameController;
  TextEditingController? addressController;
  TextEditingController? textController3;

  final dropValue = ValueNotifier('');
  final dropOptions = ["A Vista", "Crédito", "Débito", "PIX"];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Nome:');
    addressController = TextEditingController(text: 'CPF:');
    textController3 = TextEditingController(text: 'Rua:');
    //textController4 = TextEditingController(text: 'Anexar Receita');
    //textController5 = TextEditingController(text: 'Entrar');
  }

  @override
  void dispose() {
    nameController?.dispose();
    addressController?.dispose();
    textController3?.dispose();
    //textController4?.dispose();
    //textController5?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromRGBO(3, 153, 186, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: 375,
              height: 812,
              decoration: const BoxDecoration(
                color: Color(0xFF0399BA),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(-0.65, 0),
                    child: Text(
                      '{nomeDaFármacia}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Container(
                      width: 330,
                      height: 400,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(3, 153, 186, 1),
                      ),
                      alignment: const AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, -0.05),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(padding: EdgeInsets.all(5)),
                                Container(
                                  width: 320,
                                  child: TextFormField(
                                    controller: nameController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFD0D6D8),
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Container(
                                  width: 320,
                                  child: TextFormField(
                                    controller: addressController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFD0D6D8),
                                    ),
                                    //style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Container(
                                  width: 320,
                                  child: TextFormField(
                                    controller: textController3,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFD0D6D8),
                                    ),
                                    //style: FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),

                                const Padding(padding: EdgeInsets.all(5)),

                                ValueListenableBuilder(
                                  valueListenable: dropValue,
                                  builder:
                                      (BuildContext context, String value, _) {
                                    return DropdownButtonFormField<String>(
                                      hint: const Text('Pagamento', style: TextStyle(color: Colors.black),),
                                      value: (value.isEmpty) ? null : value,
                                      onChanged: (choice) =>
                                          dropValue.value = choice.toString(),
                                      items: dropOptions
                                          .map(
                                            (op) => DropdownMenuItem(
                                              value: op,
                                              child: Text(op),
                                            ),
                                          )
                                          .toList(),
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFFD0D6D8),
                                      ),
                                    );
                                  },
                                ),

                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Anexar Receita",
                                    style: TextStyle(
                                        color: Color.fromRGBO(3, 153, 186, 1),
                                        fontSize: 20),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll<Color>(
                                            Colors.yellow),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            width: 3, color: Colors.yellow),
                                      ),
                                    ),
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Solicitar",
                                    style: TextStyle(
                                        color: Color.fromRGBO(3, 153, 186, 1),
                                        fontSize: 20),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll<Color>(
                                            Colors.yellow),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: const BorderSide(
                                            width: 3, color: Colors.yellow),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
