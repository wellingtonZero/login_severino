import 'package:flutter/material.dart';
import 'package:login_severino/cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool verSenha = true;
  final _formKey = GlobalKey<FormState>();
  //como a variavel _emailController não vai ser inicializada agora criamos um late
  late TextEditingController _emailController;
  late TextEditingController _senhaController;

  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              'Acesso o aplicativo',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
                "Informe suas credencias para descrobrir o que o app tem a oferecer",
                style: Theme.of(context).textTheme.labelLarge),
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'e-mail'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe seu email';
                  }
                  return null;
                }),
            TextFormField(
              controller: _senhaController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: verSenha,
              decoration: InputDecoration(
                labelText: 'senha',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      verSenha = !verSenha;
                    });
                  },
                  icon: Icon(
                    verSenha
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira sua senha';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text("Entrar")),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (_) => const CadastroPage(),
                    ),);
              },
              child: Text("Se não tem senha cadastre-se"),
            ),
          ],
        ),
      ),
    );
  }
}
