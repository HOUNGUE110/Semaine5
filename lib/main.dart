//import 'package:activite1/main.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'Redacteur.dart';
//import 'database_manager.dart';

//await tester.pumpWidget(const MyApp());
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 17, 30, 176),
        ),
      ),
      home: PageAcceuil(title: 'Magazine Infos'),
    );
  }
}

class PageAcceuil extends StatelessWidget {
  final String title;

  const PageAcceuil({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 3, 142),
        title: Text(
          title,
          style: GoogleFonts.roboto(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Rechercher',
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 54, 3, 142)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Redacteurs'),
              onTap: () {
                //Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RedacteurPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: const Column(
            children: [
              Image(
                image: AssetImage('assets/images/layout2.png'),
                //height: 1400,
                //width: 900,
              ),
              PartieTitre(),
              PartieText(),
              PartieIcone(),
              PartieRubrique(),
            ],
          ),
        ),
      ),
    );
  }
}

class PartieTitre extends StatelessWidget {
  const PartieTitre({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Bienvenue au Magazine Infos',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Votre magazine numérique, votre source d\'informations.',
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 73, 72, 72),
            ),
          ),
        ],
      ),
    );
  }
}

class PartieText extends StatelessWidget {
  const PartieText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        "Magazine Infos est bien plus qu'un simple magazine d'informations. C'est votre passerelle vers le monde, une source inestimable de connaissances et d'actualités soigneusement sélectionnées pour vous éclairer sur les enjeux mondiaux, la culture, la science et voir même le divertissement (les jeux).",
        style: TextStyle(fontSize: 16, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class PartieIcone extends StatelessWidget {
  const PartieIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Icon(
                  Icons.phone,
                  color: Color.fromRGBO(49, 5, 106, 1),
                  size: 35,
                ),
                SizedBox(height: 5),
                Text('Tel'.toUpperCase(), style: const TextStyle(fontSize: 11)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Icon(
                  Icons.mail,
                  color: Color.fromRGBO(49, 5, 106, 1),
                  size: 35,
                ),
                SizedBox(height: 5),
                Text(
                  'e-mail'.toUpperCase(),
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Icon(
                  Icons.share,
                  color: Color.fromRGBO(49, 5, 106, 1),
                  size: 35,
                ),
                SizedBox(height: 5),
                Text(
                  'Partage'.toUpperCase(),
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartieRubrique extends StatelessWidget {
  const PartieRubrique({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const Image(
              image: AssetImage('assets/images/green.jpg'),
              width: 135,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const Image(
              image: AssetImage('assets/images/blue.jpg'),
              width: 135,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class RedacteurPage extends StatefulWidget {
  const RedacteurPage({super.key});

  @override
  State<RedacteurPage> createState() => _RedacteurPageState();
}

class _RedacteurPageState extends State<RedacteurPage> {
  bool _isLoading = true;
  List<Redacteur> _redacteurs = [];
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final DatabaseManager databaseManager = DatabaseManager();

  @override
  void initState() {
    super.initState();
    _loadRedacteurs();
  }

  Future<void> _loadRedacteurs() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final redacteurs = await databaseManager.getRedacteurs();
      setState(() {
        _redacteurs = redacteurs.cast<Redacteur>();
      });
    } catch (e) {
      // Gérer les erreurs ici
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _ajouterRedacteur() {
    final nouveauRedacteur = Redacteur.sansId(
      nom: nomController.text,
      prenom: prenomController.text,
      email: emailController.text,
    );
    databaseManager.addRedacteur(nouveauRedacteur).then((_) {
      nomController.clear();
      prenomController.clear();
      emailController.clear();
      _loadRedacteurs();
    });
  }

  void _modifierRedacteurDialog(Redacteur redacteur) {
    final modifNomController = TextEditingController(text: redacteur.nom);
    final modifPrenomController = TextEditingController(text: redacteur.prenom);
    final modifEmailController = TextEditingController(text: redacteur.email);

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Modifier le rédacteur'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: modifNomController,
              decoration: InputDecoration(labelText: 'Nom'),
            ),
            TextField(
              controller: modifPrenomController,
              decoration: InputDecoration(labelText: 'Prenom'),
            ),
            TextField(
              controller: modifEmailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              final modifRedacteur = redacteur.copyWith(
                nom: modifNomController.text,
                prenom: modifPrenomController.text,
                email: modifEmailController.text,
              );
              databaseManager.updateRedacteur(modifRedacteur).then((_) {
                Navigator.pop(dialogContext);
                _loadRedacteurs();
              });
            },
            child: Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  void _supprimerRedacteur(Redacteur redacteur) {
    databaseManager.deleteRedacteur(redacteur.id).then((_) {
      _loadRedacteurs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 3, 142),
        title: Text(
          'Gestion des redacteurs',
          style: GoogleFonts.roboto(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Rechercher',
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 54, 3, 142)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageAcceuil(title: 'Magazine Infos'),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Redacteurs'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: nomController,
                decoration: const InputDecoration(labelText: 'Nom'),
              ),
              TextField(
                controller: prenomController,
                decoration: const InputDecoration(labelText: 'Prenom'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'email'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton.icon(
                  onPressed: _ajouterRedacteur,
                  label: Text('Ajouter un rédacteur'),
                  icon: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 74, 0, 212),
                    padding: EdgeInsets.all(5),
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 251, 251),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (_isLoading)
                CircularProgressIndicator()
              else ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Liste des redacteurs',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _redacteurs.length,
                  itemBuilder: (context, index) {
                    final redacteur = _redacteurs[index];
                    var listTile = ListTile(
                      title: Text('${redacteur.nom} ${redacteur.prenom}'),
                      subtitle: Text('$redacteur.email'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () =>
                                _modifierRedacteurDialog(redacteur),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _supprimerRedacteur(redacteur),
                          ),
                        ],
                      ),
                    );
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      child: listTile,
                    );
                  },
                ),
              ],
            ],
          ),
        ),
      );

  }
}
