import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A MIT Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adiciona margem nas bordas
        child: Center(
          child: SingleChildScrollView( // Permite a rolagem do texto
            child: Column(
              children: [
                Text(
                  'MIT Place - Inovação e Tecnologia!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18, // Tamanho do texto em negrito
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 16), // Espaço entre o título e o parágrafo
                Text(
                    'Somos uma equipe apaixonada por criar experiências online excepcionais. Desde o nosso início, dedicamo-nos a desenvolver sites incríveis que não apenas impressionam visualmente, mas também funcionam de maneira perfeita. Nossa missão é entender a visão única de cada cliente e transformá-la em uma presença online envolvente e eficaz. Combinamos design criativo, desenvolvimento de alta qualidade e estratégia sólida para criar sites que se destacam na multidão.\n\n'
                        'Na MIT Place, não apenas construímos sites; construímos parcerias duradouras. Trabalhamos em estreita colaboração com nossos clientes, ouvindo suas necessidades e objetivos, para fornecer soluções personalizadas que geram resultados reais.\n\n'

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
