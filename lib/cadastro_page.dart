import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  bool verSenha = true;
  bool verCSenha = true;
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _nomeController;
  late TextEditingController _sobrenomeController;
  late TextEditingController _emailController;
  late TextEditingController _senhaController;
  late TextEditingController _csenhaController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _sobrenomeController = TextEditingController();
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    _csenhaController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nomeController.dispose();
    _sobrenomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _csenhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text('Crie sua conta',style: Theme.of(context).textTheme.headlineLarge),
            Text("Faça seu cadastro para criar o acesso ao app",
            style: Theme.of(context).textTheme.labelLarge),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _nomeController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'nome',
                    ),
                    validator:(value){
                      if(value == null || value.isEmpty){
                        return 'Por favor, informe seu nome';
                      }
                      return null;
                    }
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: _sobrenomeController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'sobre nome',
                    ),
                    validator:(value){
                      if(value == null || value.isEmpty){
                        return 'Por favor, informe seu sobre nome';
                      }
                      return null;
                    }
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
