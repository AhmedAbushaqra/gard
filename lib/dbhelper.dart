import 'package:gard/models/db_Extra_Data.dart';
import 'package:gard/models/db_Final_Data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
   Database db;

  Future<Database> createDatabase() async{
    if(db != null){
      return db;
    }
    //define the path to the database
    String path = join(await getDatabasesPath(), 'gard.db');
    await deleteDatabase(path);
    db = await openDatabase(path,version: 1,onCreate: (Database db, int v)async{
      //create all tables
      await db.execute(
          "create table FinalData(id integer primary key , branchid varchar(20) , date varchar(20), chain varchar(50), branch varchar(50), catename varchar(50), subcatename varchar(50), itemname varchar(50), capacity varchar(50), faces varchar(10))"
      );
      await db.execute(
          "create table ExtraData(id integer primary key , branchid varchar(20) , date varchar(20), chain varchar(50), branch varchar(50), type varchar(50),  capacity varchar(50), faces varchar(10) , situation varchar(50), condition varchar(50))"
      );
    });
    return db;
  }

  Future<int> createFinalData(dbFinalData dbFD) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('FinalData', dbFD.toMap());
  }

  Future<int> createExtraData(dbExtraData dbED) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('ExtraData', dbED.toMap());
  }

  Future<List> allFinalData() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('FinalData');
  }

  Future<List> allExtraData() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('ExtraData');
  }

  Future<int> deleteFinalData(int id) async{
    Database db = await createDatabase();
    return db.delete('FinalData',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteExtraData(int id) async{
    Database db = await createDatabase();
    return db.delete('ExtraData',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> clearPreviousDay()async{
    Database db=await createDatabase();
    return db.delete('FinalData');
  }

  Future<int> clearExtraPreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ExtraData');
  }

  Future<int> updateFinalData(dbFinalData dbFD) async{
    Database db = await createDatabase();
    return await db.update('FinalData', dbFD.toMap(),where: 'id = ?', whereArgs: [dbFD.id]);
  }

  Future<int> updateExtraData(dbExtraData dbED) async{
    Database db = await createDatabase();
    return await db.update('ExtraData', dbED.toMap(),where: 'id = ?', whereArgs: [dbED.id]);
  }
}