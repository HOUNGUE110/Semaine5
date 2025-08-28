import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Redacteur {
  int id;
  String nom;
  String prenom;
  String email;

  Redacteur({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
  });

  Redacteur copyWith({int? id, String? nom, String? prenom, String? email}) {
    return Redacteur(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
    );
  }

  Redacteur.sansId({
    required this.nom,
    required this.prenom,
    required this.email,
  }) : id = 0;
  Map<String, dynamic> toMap() {
    return {'id': id, 'nom': nom, 'prenom': prenom, 'email': email};
  }
}

// database_manager.dart

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  DatabaseManager._internal();

  factory DatabaseManager() {
    return _instance;
  }
  final DatabaseManager databaseManager = DatabaseManager();

  Database? _database;

  //DatabaseManager._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'redacteurs.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE redacteurs(id INTEGER PRIMARY KEY, nom TEXT, prenom TEXT, email TEXT)',
        );
      },
    );
  }

  Future<void> insertRedacteur(Redacteur redacteur) async {
    final db = await database;
    await db.insert(
      'redacteurs',
      redacteur.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Redacteur>> getRedacteurs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('redacteurs');
    return List.generate(maps.length, (i) {
      return Redacteur(
        id: maps[i]['id'],
        nom: maps[i]['nom'],
        prenom: maps[i]['prenom'],
        email: maps[i]['email'],
      );
    });
  }

  Future<void> updateRedacteur(Redacteur redacteur) async {
    final db = await database;
    await db.update(
      'redacteurs',
      redacteur.toMap(),
      where: 'id = ?',
      whereArgs: [redacteur.id],
    );
  }

  Future<void> deleteRedacteur(int id) async {
    final db = await database;
    await db.delete('redacteurs', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> addRedacteur(nouveauRedacteur) async {
    await DatabaseManager().insertRedacteur(nouveauRedacteur);
  }
}
