import 'package:gard/models/ExpireCate.dart';
import 'package:gard/models/ExtraCate.dart';
import 'package:gard/models/db_Comp_offerData.dart';
import 'package:gard/models/db_Extra_Data.dart';
import 'package:gard/models/db_Final_Data.dart';
import 'package:gard/models/db_Our_Offer_Cate.dart';
import 'package:gard/models/db_Our_Offer_Data.dart';
import 'package:gard/models/db_allOfferData.dart';
import 'package:gard/models/db_comp_offerCate.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/db_Expire_Data.dart';
import 'models/db_catesend.dart';

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
          "create table ExpireCate(id integer primary key,itemnum varchar(20) ,branchid varchar(20) , catename varchar(50), subcate varchar(30), expireName varchar(20))"
      );
      await db.execute(
          "create table CateSend(id integer primary key autoincrement , branchid varchar(20) , catename varchar(30) )"
      );
      await db.execute(
          "create table CateSendSheet(id integer primary key autoincrement , branchid varchar(20) , catename varchar(30) )"
      );
      await db.execute(
          "create table OurOfferData(id integer primary key , branchid varchar(20) , chain varchar(50), branch varchar(50), itemnum varchar(20),  catename varchar(50), subcatename varchar(50), subbrand varchar(40), itemname varchar(50), mainprice varchar(20), pormotionreason varchar(20), pormotiontype varchar(20), pormotiondetail varchar(150),startdate varchar(20),enddate varchar(20))"
      );
      await db.execute(
          "create table OurOfferCate( id integer primary key , branchid varchar(20) , chain varchar(50), branch varchar(50), itemnum varchar(20),  catename varchar(50), subcate varchar(50), subbrand varchar(40), ItemName varchar(50))"
      );
      await db.execute(
          "create table ComOfferData(id integer primary key , branchid varchar(20) , catename varchar(50), company varchar(50),ItemName varchar(50), mainprice varchar(20), pormotionreason varchar(20), pormotiontype varchar(20), pormotiondetail varchar(150),startdate varchar(20),enddate varchar(20))"
      );
      await db.execute(
          "create table ComOfferCate( id integer primary key , branchid varchar(20) , catename varchar(50), company varchar(50))"
      );
      await db.execute(
          "create table AllOfferData( id integer primary key, branchid varchar(20), chain varchar(50), branch varchar(50),  itemnum varchar(20), catename varchar(50), subcatename varchar(50), subbrand varchar(50), itemname varchar(50),  mainprice varchar(20), pormotionreason varchar(50), pormotiontype varchar(50), pormotiondetail varchar(150), startdate varchar(20), enddate varchar(20), compid varchar(20),  compcatename  varchar(50),  company varchar(50), compitemname varchar(50), compMainPrice varchar(20), compPormotionReason varchar(50), comppormotiontype varchar(50), compPormotionDetails varchar(150), compstartdate varchar(20), compenddate varchar(20))"
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

  Future<int> createcatesend(Catesend dbc) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('CateSend', dbc.toMap());
  }

  Future<int> createcatesendsheet(Catesend dbc) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('CateSendSheet', dbc.toMap());
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

  Future<int> createOurOfferData(dbOurOfferData dbED) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('OurOfferData', dbED.toMap());
  }

  Future<int> createOurOfferCate(dbOurOfferCate dbEC) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('OurOfferCate', dbEC.toMap());
  }

  Future<int> createComOfferData(dbCompOfferData dbED) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('ComOfferData', dbED.toMap());
  }

  Future<int> createComOfferCate(dbCompOfferCate dbEC) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('ComOfferCate', dbEC.toMap());
  }

  Future<int> createAllOfferData(dbAllOfferData dbEC) async{
    Database db = await createDatabase();
    //db.rawInsert('insert into courses')
    return db.insert('AllOfferData', dbEC.toMap());
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

  Future<List> allCatesend() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('CateSend');
  }

  Future<List> allCatesendsheet() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('CateSendSheet');
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

  Future<List> allOurOfferCate() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('OurOfferCate');
  }

  Future<List> allOurOfferData() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('OurOfferData');
  }

  Future<List> allComOfferCate() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('ComOfferCate');
  }

  Future<List> allComOfferData() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('ComOfferData');
  }

  Future<List> allAllOfferData() async{
    Database db = await createDatabase();
    //db.rawQuery("select * from courses")
    return db.query('AllOfferData');
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

  Future<int> deleteCatesend(int id) async{
    Database db = await createDatabase();
    return db.delete('CateSend',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteCatesendsheet(int id) async{
    Database db = await createDatabase();
    return db.delete('CateSendSheet',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteExpireCate(int id) async{
    Database db = await createDatabase();
    return db.delete('ExpireCate',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteExpireData(int id) async{
    Database db = await createDatabase();
    return db.delete('ExpireData',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteOurOfferCate(int id) async{
    Database db = await createDatabase();
    return db.delete('OurOfferCate',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteOurOfferData(int id) async{
    Database db = await createDatabase();
    return db.delete('OurOfferData',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteComOfferCate(int id) async{
    Database db = await createDatabase();
    return db.delete('ComOfferCate',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteComOfferData(int id) async{
    Database db = await createDatabase();
    return db.delete('ComOfferData',where: 'id = ?',whereArgs:[id] );
  }

  Future<int> deleteAllOfferData(int id) async{
    Database db = await createDatabase();
    return db.delete('AllOfferData',where: 'id = ?',whereArgs:[id] );
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

  Future<int> clearcatePreviousDay()async{
    Database db=await createDatabase();
    return db.delete('CateSend');
  }

  Future<int> clearcatesheetPreviousDay()async{
    Database db=await createDatabase();
    return db.delete('CateSendSheet');
  }

  Future<int> clearExpireCatePreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ExpireCate');
  }

  Future<int> clearExpirePreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ExpireData');
  }

  Future<int> clearOurOfferCatePreviousDay()async{
    Database db=await createDatabase();
    return db.delete('OurOfferCate');
  }

  Future<int> clearOurOfferDataPreviousDay()async{
    Database db=await createDatabase();
    return db.delete('OurOfferData');
  }

  Future<int> clearComOfferCatePreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ComOfferCate');
  }

  Future<int> clearComOfferDataPreviousDay()async{
    Database db=await createDatabase();
    return db.delete('ComOfferData');
  }

  Future<int> clearAllOfferDataPreviousDay()async{
    Database db=await createDatabase();
    return db.delete('AllOfferData');
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

  Future<int> updateCatesend(dbExtraData dbc) async{
    Database db = await createDatabase();
    return await db.update('CateSend', dbc.toMap(),where: 'id = ?', whereArgs: [dbc.id]);
  }

  Future<int> updateCatesendsheet(dbExtraData dbc) async{
    Database db = await createDatabase();
    return await db.update('CateSendSheet', dbc.toMap(),where: 'id = ?', whereArgs: [dbc.id]);
  }

  Future<int> updateExpireCate(dbExpireData dbEC) async{
    Database db = await createDatabase();
    return await db.update('ExpireCate', dbEC.toMap(),where: 'id = ?', whereArgs: [dbEC.id]);
  }

  Future<int> updateExpireData(dbExpireData dbED) async{
    Database db = await createDatabase();
    return await db.update('ExpireData', dbED.toMap(),where: 'id = ?', whereArgs: [dbED.id]);
  }

  Future<int> updateOurOfferCate(dbOurOfferCate dbEC) async{
    Database db = await createDatabase();
    return await db.update('OurOfferCate', dbEC.toMap(),where: 'id = ?', whereArgs: [dbEC.id]);
  }

  Future<int> updateOurOfferData(dbOurOfferData dbED) async{
    Database db = await createDatabase();
    return await db.update('OurOfferData', dbED.toMap(),where: 'id = ?', whereArgs: [dbED.id]);
  }

  Future<int> updateComOfferCate(dbCompOfferCate dbEC) async{
    Database db = await createDatabase();
    return await db.update('ComOfferCate', dbEC.toMap(),where: 'id = ?', whereArgs: [dbEC.id]);
  }

  Future<int> updateComOfferData(dbCompOfferData dbED) async{
    Database db = await createDatabase();
    return await db.update('ComOfferData', dbED.toMap(),where: 'id = ?', whereArgs: [dbED.id]);
  }

  Future<int> updateAllOfferData(dbAllOfferData dbED) async{
    Database db = await createDatabase();
    return await db.update('AllOfferData', dbED.toMap(),where: 'id = ?', whereArgs: [dbED.id]);
  }
}