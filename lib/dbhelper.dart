import 'package:gard/models/ExpireCate.dart';
import 'package:gard/models/ExtraCate.dart';
import 'package:gard/models/db_Extra_Data.dart';
import 'package:gard/models/db_Final_Data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/db_Expire_Data.dart';

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
    //await deleteDatabase(path);
    db = await openDatabase(path,version: 1,onCreate: (Database db, int v)async{
      //create all tables
      await db.execute(
          "create table FinalData(id integer primary key , branchid varchar(20) , date varchar(20), chain varchar(50), branch varchar(50), catename varchar(50), subcatename varchar(50), itemname varchar(50), capacity varchar(50), faces varchar(10))"
      );
      await db.execute(
          "create table ExtraData(id integer primary key , branchid varchar(20) , date varchar(20), chain varchar(50), branch varchar(50), type varchar(50),  capacity varchar(50), faces varchar(10) , situation varchar(50), condition varchar(50))"
      );
      await db.execute(
          "create table ExtraCate(id integer primary key ,branchid varchar(20) , extraName varchar(20))"
      );
      await db.execute(
          "create table ExpireData(id integer primary key , branchid varchar(20) , chain varchar(50), branch varchar(50), itemnum varchar(20),  catename varchar(50), subcatename varchar(50), itemname varchar(50), count varchar(20), itemtype varchar(20), expirydate varchar(20))"
      );
      await db.execute(
          "create table ExpireCate(id integer primary key,itemnum varchar(20) ,branchid varchar(20) ,subcate varchar(30), expireName varchar(20))"
      );
    });
    return db;
  }

  Future<int> createFinalData(dbFinalData dbFD) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('FinalData', dbFD.toMap());
  }

  Future<int> createExtraCate(ExtraCate dbEC) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('ExtraCate', dbEC.toMap());
  }

  Future<int> createExtraData(dbExtraData dbED) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('ExtraData', dbED.toMap());
  }

  Future<int> createExpireData(dbExpireData dbED) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('ExpireData', dbED.toMap());
  }

  Future<int> createExpireCate(ExpireCate dbEC) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('ExpireCate', dbEC.toMap());
  }

  Future<List> allFinalData() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('FinalData');
  }

  Future<List> allExtraCate() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('ExtraCate');
  }

  Future<List> allExtraData() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('ExtraData');
  }

  Future<List> allExpireCate() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('ExpireCate');
  }

  Future<List> allExpireData() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('ExpireData');
  }

  Future<int> deleteFinalData(int id) async{
    Database db = await createDatabase();
    return db.delete('FinalData',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteExtraCate(int id) async{
    Database db = await createDatabase();
    return db.delete('ExtraCate',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteExtraData(int id) async{
    Database db = await createDatabase();
    return db.delete('ExtraData',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteExpireCate(int id) async{
    Database db = await createDatabase();
    return db.delete('ExpireCate',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteExpireData(int id) async{
    Database db = await createDatabase();
    return db.delete('ExpireData',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> clearPreviousDay()async{
    Database db=await createDatabase();
    return db.delete('FinalData');
  }

  Future<int> clearExtraCatePreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ExtraCate');
  }

  Future<int> clearExtraPreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ExtraData');
  }

  Future<int> clearExpireCatePreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ExpireCate');
  }

  Future<int> clearExpirePreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ExpireData');
  }

  Future<int> updateFinalData(dbFinalData dbFD) async{
    Database db = await createDatabase();
    return await db.update('FinalData', dbFD.toMap(),where: 'id = ?', whereArgs: [dbFD.id]);
  }

  Future<int> updateExtraCate(dbExtraData dbEC) async{
    Database db = await createDatabase();
    return await db.update('ExtraCate', dbEC.toMap(),where: 'id = ?', whereArgs: [dbEC.id]);
  }

  Future<int> updateExtraData(dbExtraData dbED) async{
    Database db = await createDatabase();
    return await db.update('ExtraData', dbED.toMap(),where: 'id = ?', whereArgs: [dbED.id]);
  }

  Future<int> updateExpireCate(dbExpireData dbEC) async{
    Database db = await createDatabase();
    return await db.update('ExpireCate', dbEC.toMap(),where: 'id = ?', whereArgs: [dbEC.id]);
  }

  Future<int> updateExpireData(dbExpireData dbED) async{
    Database db = await createDatabase();
    return await db.update('ExpireData', dbED.toMap(),where: 'id = ?', whereArgs: [dbED.id]);
  }
}