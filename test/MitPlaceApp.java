import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MitPlaceApp());
}

class MitPlaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MIT Place'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 200, height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
              child: Text('A Empresa'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ServicesPage()));
              },
              child: Text('Serviços'),
            ),
            ElevatedButton(
              onPressed: () async {
                const url = 'https://wa.me/message/QGKM2RLAR4NDI1';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  // Handle URL launch error
                }
              },
              child: Row(
                children: [
                  Icon(Icons.message),
                  Text('Contato'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ApplyJobPage()));
              },
              child: Text('Trabalhe Conosco'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A Empresa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Criamos sites funcionais, bonitos e que se adaptam ao seu Celular, PC ou Tablet e é mais barato do que você imagina!',
              textAlign: TextAlign.center,
            ),
            Image.asset('assets/logo.png', width: 100, height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
            ElevatedButton(
              onPressed: () async {
                const url = 'https://wa.me/message/QGKM2RLAR4NDI1';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  // Handle URL launch error
                }
              },
              child: Row(
                children: [
                  Icon(Icons.message),
                  Text('Contato'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviços'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nossos serviços incluem:'),
            Text('- Criação de Sites'),
            Text('- Lojas Virtuais'),
            Text('- Divulgação nas Redes Sociais'),
            Text('- Identidade Visual'),
            Text('- Logo'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
            ElevatedButton(
              onPressed: () async {
                const url = 'https://wa.me/message/QGKM2RLAR4NDI1';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  // Handle URL launch error
                }
              },
              child: Row(
                children: [
                  Icon(Icons.message),
                  Text('Contato'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ApplyJobPage extends StatefulWidget {
  @override
  _ApplyJobPageState createState() => _ApplyJobPageState();
}

class _ApplyJobPageState extends State<ApplyJobPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();

  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trabalhe Conosco'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: experienceController,
              decoration: InputDecoration(labelText: 'Experiências profissionais'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar o envio das informações aqui
                setState(() {
                  message = 'Obrigado, entraremos em contato em breve.';
                });
              },
              child: Text('Enviar'),
            ),
            Text(message),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
