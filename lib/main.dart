import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mit_place_app/pages/services_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIT Place',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController domainController = TextEditingController();

  String greetingMessage = '';
  bool formCompleted = false;
  bool showWelcomeText = true;
  bool showObjectiveForm = false;
  String? selectedObjective;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logobranca.png',
              width: 80,
              height: 80,
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showWelcomeText)
              Column(
                children: [
                  Text(
                    'Bem-vindo à MIT Place',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Estamos aqui para ajudá-lo a criar o seu site.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            if (!formCompleted && !showObjectiveForm) // Mostrar formulário na página principal
              Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Qual é o seu nome?'),
                  ),
                  TextFormField(
                    controller: areaController,
                    decoration: InputDecoration(labelText: 'Área de Atuação?'),
                  ),
                  TextFormField(
                    controller: companyController,
                    decoration: InputDecoration(labelText: 'Nome da Empresa'),
                  ),
                  TextFormField(
                    controller: domainController,
                    decoration: InputDecoration(
                      labelText: 'Domínio Desejado, Ex: www.empresa.com.br',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final name = nameController.text;
                      final area = areaController.text;
                      final company = companyController.text;
                      final domain = domainController.text;

                      if (name.isNotEmpty &&
                          area.isNotEmpty &&
                          company.isNotEmpty &&
                          domain.isNotEmpty) {
                        setState(() {
                          greetingMessage =
                          'Olá $name, ficamos felizes que tenha tomado a importante decisão de criar um site para a empresa $company com o domínio $domain.';
                          formCompleted = true;
                          showWelcomeText = false;
                          errorMessage = '';
                        });
                      } else {
                        setState(() {
                          errorMessage =
                          'Precisamos saber todas essas informações para continuarmos.';
                        });
                      }
                    },
                    child: Text('Enviar'),
                  ),
                  SizedBox(height: 20),
                  if (errorMessage.isNotEmpty)
                    Text(
                      errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            if (formCompleted && !showObjectiveForm)
              Column(
                children: [
                  if (greetingMessage.isNotEmpty)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Olá ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              nameController.text,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            text:
                            'Ficamos felizes que tenha tomado a importante decisão de criar um site para a empresa ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: companyController.text,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  SizedBox(height: 20),
                  Text(
                    'Por favor, informe seu WhatsApp e E-mail para podermos retornar o contato.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    controller: whatsappController,
                    decoration: InputDecoration(labelText: 'WhatsApp'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'E-mail'),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final whatsapp = whatsappController.text;
                          final email = emailController.text;
                          print('WhatsApp: $whatsapp');
                          print('E-mail: $email');

                          setState(() {
                            showObjectiveForm = true;
                          });
                        },
                        child: Text('Enviar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            formCompleted = false;
                            showWelcomeText = true;
                            greetingMessage = '';
                            errorMessage = '';
                          });
                        },
                        child: Text('Voltar'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            if (showObjectiveForm)
              Column(
                children: [
                  Text(
                    'Pronto, agora precisamos saber qual o objetivo do seu site:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String?>(
                    value: selectedObjective,
                    items: [
                      DropdownMenuItem(
                        value: null,
                        child: Text('Selecione o objetivo do site'),
                      ),
                      DropdownMenuItem(
                        value: 'Vender Online',
                        child: Text('Vender Online'),
                      ),
                      DropdownMenuItem(
                        value: 'Apresentar produtos ou serviços',
                        child: Text('Apresentar produtos ou serviços'),
                      ),
                      DropdownMenuItem(
                        value: 'Blog',
                        child: Text('Blog'),
                      ),
                      DropdownMenuItem(
                        value: 'Site de Notícias',
                        child: Text('Site de Notícias'),
                      ),
                      DropdownMenuItem(
                        value: 'Marcar e Agendar datas',
                        child: Text('Marcar e Agendar datas'),
                      ),
                      DropdownMenuItem(
                        value: 'Conseguir novos clientes',
                        child: Text('Conseguir novos clientes'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedObjective = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Selecione o objetivo do site',
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showObjectiveForm = false;
                          });
                        },
                        child: Text('Voltar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Faça algo com a seleção do objetivo aqui, se necessário
                        },
                        child: Text('Enviar'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Column(
                children: [
                  Icon(
                    Icons.home,
                    size: 18,
                  ),
                  Text(
                    'Início',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              tooltip: 'Início',
            ),
            IconButton(
              icon: Column(
                children: [
                  Icon(
                    Icons.build,
                    size: 18,
                  ),
                  Text(
                    'Outros',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              onPressed: () {
                // Navegue para a página de serviços
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServicesPage(),
                  ),
                );
              },
              tooltip: 'Serviços',
            ),
            IconButton(
              icon: Column(
                children: [
                  Image.asset(
                    'assets/images/icone_whatsapp.png',
                    width: 20,
                    height: 20,
                  ),
                  Text(
                    'Whats',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              onPressed: () {
                _launchWhatsApp();
              },
              tooltip: 'Whats',
            ),
          ],
        ),
      ),
    );
  }

  _launchWhatsApp() async {
    const url = 'https://wa.me/message/QGKM2RLAR4NDI1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o WhatsApp';
    }
  }
}
