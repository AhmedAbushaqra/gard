import 'package:flutter/material.dart';
import 'package:gard/models/ExpiryData.dart';
import 'package:gard/models/ExtraCate.dart';
import 'package:gard/models/ExtraData.dart';
import 'package:gard/models/MissingData.dart';
import 'package:gard/models/OfferDataSheet.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/models/empLogin.dart';
import 'package:gard/models/extraItems.dart';
import 'package:gard/models/final_data.dart';
import 'package:gard/translation/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Chains with ChangeNotifier {
  /*final void Function(String) callback;
  static const String URL="https://script.google.com/macros/s/AKfycbyeaJJtVRgXqEqJrW0VPzhhSfdjzGvbJSGLLE05gF858bR-Vp5UFRR__Q/exec";
  static const STATUS_SUCCESS="SUCCESS";
  Chains(this.callback);
*/
  List<Chain> _chains = [];

  List<Chain> get chains {
    return [..._chains];
  }
  String empcode;
  String empname;
  String empLocation;
  void submitLogIn(
      empLogIn emplogin, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbxXMEd8wtpR1nscl_4DlLLjbzF_mYb-yim3_sIQ8Bj9O29fibQHYkI-zA6-7oXMCAcd/exec";
    try {
      await http.post(URL, body: emplogin.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
            print(response.body);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void submitLogOut(
      empLogIn emplogout, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbyyeCbHAGva1fWOvQDqT_7GwGA0TPIAJL2T-S1xl8Ah2s_tM6F02K4i2sVt3LzkGadD/exec";
    try {
      await http.post(URL, body: emplogout.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
            print(response.body);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
          print(response.body);
          print(response.statusCode);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void submitForm(
      FinalData finaldata, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbz6KOa6RIj8Qfdjl5KdKzXC0jZnT4-seCbrCCen45cw0q1LZGRxEFAoSZBShL3vFNZVFw/exec";
    try {
      await http.post(URL, body: finaldata.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
            print(response.body);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void submitSelfShare(
      FinalData finaldata, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbwE-c7GVKVL6myj6_YtzexVWaZBlhc2pPF2-0RU4F6YWATWCXhq_rAxKgcSEr-m7aeVBw/exec";
    try {
      await http.post(URL, body: finaldata.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
            print(response.body);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void submitExtraForm(
      ExtraData extraData, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbzxkYzoEChngUhYjtkgZiptHIvSMIuGUYBf7AGhF3Xk6ZQYkqa4jMHRtzz8zgtyQgs2/exec";
    try {
      await http.post(URL, body: extraData.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
            print(response.body);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void submitMissingForm(
      MissingData missingData, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbwaK9qeiDftz4QdutY5Ad_yXxbFm8V51GznxNbr436590zCCAtROfwP25E1yW8RPtrMQQ/exec";
    try {
      await http.post(URL, body: missingData.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
            print(url);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void submitExpiryForm(
      ExpiryData expiryData, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbw-4Bi9Cv9x5lz5asBdjiqisNKbvk-DHbgFJfHwI6eygpjmm7_Zpw2cMkUhxXzutA21xQ/exec";
    try {
      await http.post(URL, body: expiryData.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void submitOfferForm(
      OfferDataSheet OfferData, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbwBokIu_uA5kL2IqsRr07nItJmYp4X0BU-ArabvCIVRqA5rMfbHHdo9vf_Ne1W54_ZO/exec";
    try {
      await http.post(URL, body: OfferData.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }


  Future <List<FinalData>> getFinalData() async{
    String url="https://script.google.com/macros/s/AKfycbw164_d4MZqJh2sSlfRGxae7Q6nYcZsMoXWToY9M5oTtZVhzOE_lzQtscMRYWcN4dbHDQ/exec";
    return await http.get(url).then((response){
      var jsonFinalData=convert.jsonDecode(response.body) as List;
      return jsonFinalData.map((json) => FinalData.fromJson(json)).toList();
    });
  }

  Future <List<MissingData>> getMissingData() async{
    String url="https://script.googleusercontent.com/macros/echo?user_content_key=H5r_K0kTna7cdAaTLuD_FOGOvCEMKfrdp-7dfGD25cyXbaPv4zjbyheehFawOE5wbQOou6iPdLbqSlMQgoNJCjo1wFZj9Ytnm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJ2EfnAQMcHN03OJI_QCBaQ0-zeNgHkqqwZJnyk9rUhYheLZF7Ythy3pEb83tFqEWjVB-BR8CHRpgkx4UgTMRkQi_fu5QULTZNz9Jw9Md8uu&lib=MjFhorCodd5ZCEa_dCMgbWR3FEm5DsUVw";
    return await http.get(url).then((response){
      var jsonFinalData=convert.jsonDecode(response.body) as List;
      return jsonFinalData.map((json) => MissingData.fromJson(json)).toList();
    });
  }
  Future <List<MissingData>> getBonjornoMissingData() async{
    String url="https://script.googleusercontent.com/macros/echo?user_content_key=JEe0E23Qy2HY1ZjDCQrkm3nm9qcO7-vCLklwsu0zx_XndQUoLGMrKnL-h-YxhwPSHplnBD7LmvxyA8SnVZQQ0RXOloZZ0fDgm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnE-qloKSsfROjS9-9Dq1Tn8r9XS6ltfeP04a5vizcRZqR30woaOvQI9ZsuYd3Bld-tY1Uu1SsGmSWCazKqwqsAJk9hoGjx7kAtz9Jw9Md8uu&lib=Mn5cc_qs_GvuLulE0D_Bwdh3FEm5DsUVw";
    return await http.get(url).then((response){
      var jsonFinalData=convert.jsonDecode(response.body) as List;
      return jsonFinalData.map((json) => MissingData.fromJson(json)).toList();
    });
  }
  Future <List<MissingData>> getKherzamanMissingData() async{
    String url="https://script.googleusercontent.com/macros/echo?user_content_key=H5r_K0kTna7cdAaTLuD_FOGOvCEMKfrdp-7dfGD25cyXbaPv4zjbyheehFawOE5wbQOou6iPdLbqSlMQgoNJCjo1wFZj9Ytnm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJ2EfnAQMcHN03OJI_QCBaQ0-zeNgHkqqwZJnyk9rUhYheLZF7Ythy3pEb83tFqEWjVB-BR8CHRpgkx4UgTMRkQi_fu5QULTZNz9Jw9Md8uu&lib=MjFhorCodd5ZCEa_dCMgbWR3FEm5DsUVw";
    return await http.get(url).then((response){
      var jsonFinalData=convert.jsonDecode(response.body) as List;
      return jsonFinalData.map((json) => MissingData.fromJson(json)).toList();
    });
  }
 /* List<empLogin> emploadedData=[];
  Future<void> getEmp()async{
    const url='https://nestle-2948e-default-rtdb.firebaseio.com/emp.json';
    try{
     final response=await http.get(url);
     final extractData=convert.json.decode(response.body)as Map<String,dynamic>;
     final List<empLogin> loadedData=[];
     extractData.forEach((empId, empData) {
       loadedData.add(empLogin(
         id: empId,
         empid: empData['id'],
         empname: empData['empname'],
         branchid: empData['branchid'],
         branchname: empData['branchname'],
         location: empData['location'],
       ));
     });
     emploadedData=loadedData;
     notifyListeners();
    }catch(error){
      throw error;
    }
  }
  Future<void> empdetails(empLogin emp){
    const url='https://nestle-2948e-default-rtdb.firebaseio.com/emp.json';
    return http.post(url,body: convert.json.encode({
      'empid':emp.empid,
      'empname':emp.empname,
      'location':emp.location,
      'branchid':emp.branchid,
      'branchname':emp.branchname,
    }),).then((response) {
      print(response);
    }).catchError((error){
      print(error);
      throw error;
    });
  }
  Future<void> Updateemp(String id , empLogin Newemp)async{
      final url = "https://shop-app-38c66.firebaseio.com/Proudcts/$id.json";
      await http.patch(url,body: convert.json.encode({
        'empid':Newemp.empid,
        'empname':Newemp.empname,
        'location':Newemp.location,
        'branchid':Newemp.branchid,
        'branchname':Newemp.branchname,
      }));
      notifyListeners();
  }*/
 /* void ChangelangtoEn(BuildContext context){
    context.locale=Locale('en');
    notifyListeners();
  }
  void ChangelangtoAr(BuildContext context){
    context.locale=Locale('en');
    notifyListeners();
  }*/

  var places = [
    {
      'id':'1',
      'trans':LocaleKeys.Carrfour.tr(),
      'name':'Carrefour',
      'imgUrl':'images/Carrefour.jpeg'
    },
    {
      'id':'2',
      'trans':LocaleKeys.CarrfourExpress.tr(),
      'name':'Carrefour Express',
      'imgUrl':'images/CarrefourExpress.jpeg'
    },
    {
      'id':'3',
      'trans':LocaleKeys.hipperOne.tr(),
      'name':'Hipper one',
      'imgUrl':'images/HipperOne.jpeg'
    },
    {
      'id':'4',
      'trans':LocaleKeys.Spinnyes.tr(),
      'name':'Spinneys',
      'imgUrl':'images/Spinneys.jpeg'
    },
    {
      'id':'5',
      'trans':LocaleKeys.Seoudi.tr(),
      'name':'Seoudi',
      'imgUrl':'images/Seoudi.jpeg'
    },
    {
      'id':'6',
      'trans':LocaleKeys.RagabSons.tr(),
      'name':'Ragab sons',
      'imgUrl':'images/RagabSons.jpeg'
    },
    {
      'id':'7',
      'trans':LocaleKeys.Metro.tr(),
      'name':'Metro',
      'imgUrl':'images/Metro.jpeg'
    },
    {
      'id':'8',
      'trans':LocaleKeys.KherZaman.tr(),
      'name':'Kher zaman',
      'imgUrl':'images/kher.jpeg'
    },
    {
      'id':'9',
      'trans':LocaleKeys.ELOtheim.tr(),
      'name':'El otheim',
      'imgUrl':'images/othaim.jpeg'
    },
    {
      'id':'10',
      'trans':LocaleKeys.raya.tr(),
      'name':'Raya',
      'imgUrl':'images/raya.jpeg'
    },
    {
      'id':'11',
      'trans':LocaleKeys.alfa.tr(),
      'name':'Alfa',
      'imgUrl':'images/alpha.jpeg'
    },
    {
      'id':'12',
      'trans':LocaleKeys.Elmahalawy.tr(),
      'name':'El Mahalawy',
      'imgUrl':'images/mahlawy.jpeg'
    },
    {
      'id':'13',
      'trans':LocaleKeys.panda.tr(),
      'name':'Panda',
      'imgUrl':'images/panda.jpeg'
    },
    {
      'id':'14',
      'trans':LocaleKeys.Elhawary.tr(),
      'name':'El Hawary',
      'imgUrl':'images/hawary.jpeg'
    },
    {
      'id':'15',
      'trans':LocaleKeys.oscar.tr(),
      'name':'Oscar',
      'imgUrl':'images/oscar.jpeg'
    },
    {
      'id':'16',
      'trans':LocaleKeys.lulu.tr(),
      'name':'Lulu',
      'imgUrl':'images/lulu.jpeg'
    },
    {
      'id':'17',
      'trans':LocaleKeys.FAthallaGomla.tr(),
      'name':'Fathalla Gomla',
      'imgUrl':'images/fatgomla.jpeg'
    },
    {
      'id':'18',
      'trans':LocaleKeys.BeitElgomal.tr(),
      'name':'Beit el gomla',
      'imgUrl':'images/biet.jpeg'
    },
    {
      'id':'19',
      'trans':LocaleKeys.AswaqFathalla.tr(),
      'name':'Aswaq Fathalla',
      'imgUrl':'images/aswaqfat.jpeg'
    },
    {
      'id':'20',
      'trans':LocaleKeys.AswaqFathallamini.tr(),
      'name':'Aswak fathalla mini',
      'imgUrl':'images/aswaqfat.jpeg'
    },
    {
      'id':'21',
      'trans':LocaleKeys.Zahran.tr(),
      'name':'Zahran',
      'imgUrl':'images/zahran.jpeg'
    },
    {
      'id':'22',
      'trans':LocaleKeys.freshfood.tr(),
      'name':'Fresh food',
      'imgUrl':'images/fresh.jpeg'
    },
    {
      'id':'23',
      'trans':LocaleKeys.RoyalHouse.tr(),
      'name':'Royal house',
      'imgUrl':'images/royal.jpeg'
    },
    {
      'id':'24',
      'trans':LocaleKeys.Martville.tr(),
      'name':'Mart ville',
      'imgUrl':'images/mart.jpeg'
    },
    {
      'id':'25',
      'trans':LocaleKeys.Premier.tr(),
      'name':'Premier',
      'imgUrl':'images/premier.jpeg'
    },
  ];
  var Carrefour = [
    {
      'id':'10001',
      'BranchName': 'المعادى',
    },
    {
      'id':'10002',
      'BranchName': "مول مصر",
    },
    {
      'id':'10003',
      'BranchName': "CFC",
    },
    {
      'id':'10004',
      'BranchName': "الماظه",
    },
    {
      'id':'10005',
      'BranchName': "داندى مول",
    },
    {
      'id':'10006',
      'BranchName': "العبور",
    },
    {
      'id':'10007',
      'BranchName': "صن ستى",
    },
    {
      'id':'10008',
      'BranchName': "الشروق",
    },
    {
      'id':'10009',
      'BranchName': "مدينتى",
    },
    {
      'id':'10010',
      'BranchName':  "محرم بك",
    },
    {
      'id':'10011',
      'BranchName': "العروبه",
    },
    {
      'id':'10012',
      'BranchName': "ستى لايت",
    },
    {
      'id':'10013',
      'BranchName':"طنطا",
    },
     {
       'id':'10314',
       'BranchName':  "مراكز",
     },
  ];
  var CarrefourExpress = [
    {
      'id':'10014',
      'BranchName': 'دمشق',
    },
    {
      'id':'10015',
      'BranchName': 'الزيتون',
    },
    {
      'id':'10016',
      'BranchName': 'سرايا مول',
    },
    {
      'id':'10017',
      'BranchName': 'بفرلى هيلز',
    },
    {
      'id':'10018',
      'BranchName': 'الجزيره مول',
    },
    {
      'id':'10019',
      'BranchName': 'المحافظه',
    },
    {
      'id':'10020',
      'BranchName': 'دولفن مول',
    },
    {
      'id':'10021',
      'BranchName': 'مشعل',
    },
    {
      'id':'10022',
      'BranchName': 'زيزينيا مول',
    },
    {
      'id':'10023',
      'BranchName': 'شبرا',
    },
    {
      'id':'10024',
      'BranchName': 'طيبه مول',
    },
    {
      'id':'10025',
      'BranchName': 'ميفيدا',
    },
    {
      'id':'10026',
      'BranchName': 'ميراج',
    },
    {
      'id':'10027',
      'BranchName': 'الرحاب',
    },
    {
      'id':'10028',
      'BranchName': 'الحمد',
    },
    {
      'id':'10029',
      'BranchName': 'ميجا',
    },
    {
      'id':'10030',
      'BranchName': 'داون تاون',
    },
    {
      'id':'10031',
      'BranchName': 'حلوان',
    },
    {
      'id':'10032',
      'BranchName': 'الاسمرات',
    },
    {
      'id':'10033',
      'BranchName': 'المقطم',
    },
    {
      'id':'10034',
      'BranchName': 'اعمار',
    },
    {
      'id':'10035',
      'BranchName': 'دجله',
    },
    {
      'id':'10036',
      'BranchName': 'البارون',
    },
    {
      'id':'10037',
      'BranchName': 'مايو 15',
    },
    {
      'id':'10038',
      'BranchName': 'الجزائر',
    },
    {
      'id':'10039',
      'BranchName': 'طره',
    },
    {
      'id':'10040',
      'BranchName': 'ونجت',
    },
    {
      'id':'10041',
      'BranchName': 'المنتزه',
    },
    {
      'id':'10042',
      'BranchName': 'كفر عبده',
    },
    {
      'id':'10043',
      'BranchName': 'جرين بلازا',
    },
    {
      'id':'10044',
      'BranchName': 'محطة الرمل',
    },
    {
      'id':'10045',
      'BranchName': 'الملتقى',
    },
    {
      'id':'10046',
      'BranchName': 'زكى رجب - الابراهيميه',
    },
    {
      'id':'10047',
      'BranchName': 'الهانوفيل',
    },
    {
      'id':'10048',
      'BranchName': 'دمنهور',
    },
    {
      'id':'10049',
      'BranchName': 'المنصورة',
    },
  ];
  var HipperOne = [
    {
      'id':'10050',
      'BranchName': 'العاشر من رمضان',
    },
    {
      'id':'10051',
      'BranchName': 'زايد',
    },
    {
      'id':'10052',
      'BranchName': 'السليمانيه',
    },
  ];
  var Spinneys = [
    {
      'id':'10053',
      'BranchName': 'ارينا مول',
    },
    {
      'id':'10054',
      'BranchName':  'سيتى سكيب',
    },
    {
      'id':'10055',
      'BranchName': 'مول العرب',
    },
    {
      'id':'10056',
      'BranchName':  'الهرم',
    },
    {
      'id':'10057',
      'BranchName': 'زايد',
    },
    {
      'id':'10058',
      'BranchName': 'الشروق',
    },
    {
      'id':'10059',
      'BranchName': 'التجمع الخامس',
    },
    {
      'id':'10060',
      'BranchName': 'المقطم',
    },
    {
      'id':'10061',
      'BranchName': 'سموحة',
    },
  ];
  var Seoudi = [
    {
      'id':'10062',
      'BranchName': 'سيتى ستارز',
    },
    {
      'id':'10063',
      'BranchName': 'واتر واى',
    },
    {
      'id':'10064',
      'BranchName': 'الشيخ زايد',
    },
    {
      'id':'10065',
      'BranchName': 'التجمع الخامس',
    },
    {
      'id':'10066',
      'BranchName': 'شيراتون',
    },
    {
      'id':'10067',
      'BranchName': 'حسنين هيكل',
    },
    {
      'id':'10068',
      'BranchName': 'دريم',
    },
    {
      'id':'10069',
      'BranchName': 'روكسى',
    },
    {
      'id':'10070',
      'BranchName': 'سوديك',
    },
    {
      'id':'10071',
      'BranchName': 'االدقى',
    },
    {
      'id':'10072',
      'BranchName': 'الحجاز',
    },
    {
      'id':'10073',
      'BranchName':'الحكمه',
    },
    {
      'id':'10074',
      'BranchName': 'سفنكس',
    },
    {
      'id':'10075',
      'BranchName': 'الطيران',
    },
    {
      'id':'10076',
      'BranchName': 'المعادى',
    },
    {
      'id':'10077',
      'BranchName': 'دجله',
    },
  ];
  var RagabSons = [
    {
      'id':'10078',
      'BranchName':'التجنيد',
    },
    {
      'id':'10079',
      'BranchName':  'الزيتون',
    },
    {
      'id':'10080',
      'BranchName': 'النعام',
    },
    {
      'id':'10081',
      'BranchName': 'جسر السويس',
    },
    {
      'id':'10082',
      'BranchName': 'الفتح',
    },
    {
      'id':'10083',
      'BranchName': 'ألف مسكن',
    },
    {
      'id':'10084',
      'BranchName': 'الميرغنى 2',
    },
    {
      'id':'10085',
      'BranchName': 'الميرغنى 1',
    },
    {
      'id':'10086',
      'BranchName':   'النزهه',
    },
    {
      'id':'10087',
      'BranchName': 'حدائق القبه',
    },
    {
      'id':'10088',
      'BranchName': 'الظاهر',
    },
    {
      'id':'10089',
      'BranchName': 'المطار',
    },
    {
      'id':'10090',
      'BranchName': 'الحجاز',
    },
    {
      'id':'10091',
      'BranchName': 'فيصل الاطباء',
    },
    {
      'id':'10092',
      'BranchName': 'الطالبية',
    },
    {
      'id':'10093',
      'BranchName': 'ناصر الثورة',
    },
    {
      'id':'10094',
      'BranchName': 'الوفاء والامل',
    },
    {
      'id':'10095',
      'BranchName': 'الحصري',
    },
    {
      'id':'10096',
      'BranchName': 'مول فايف ستارز',
    },
    {
      'id':'10097',
      'BranchName': 'الملكه',
    },
    {
      'id':'10098',
      'BranchName': 'الجيزة',
    },
    {
      'id':'10099',
      'BranchName': 'المجزر',
    },
    {
      'id':'10100',
      'BranchName': 'حدائق الأهرام',
    },
    {
      'id':'10101',
      'BranchName':  'السيدة',
    },
    {
      'id':'10102',
      'BranchName':  'يلبغا',
    },
    {
      'id':'10103',
      'BranchName': 'أحمد فخري',
    },
    {
      'id':'10104',
      'BranchName': 'الفنجري',
    },
    {
      'id':'10105',
      'BranchName':'الحي الثامن',
    },
    {
      'id':'10106',
      'BranchName': 'الحي العاشر',
    },
    {
      'id':'10107',
      'BranchName': 'مصطفى النحاس',
    },
    {
      'id':'10108',
      'BranchName':'وندر لاند',
    },
    {
      'id':'10109',
      'BranchName': 'التجمع الأول',
    },
    {
      'id':'10110',
      'BranchName': 'مدينتي 1',
    },
    {
      'id':'10111',
      'BranchName': 'مدينتي 2',
    },
    {
      'id':'10112',
      'BranchName': 'الشباب',
    },
    {
      'id':'10113',
      'BranchName': 'المدينة',
    },
    {
      'id':'10114',
      'BranchName': 'الرحاب',
    },
    {
      'id':'10115',
      'BranchName': 'التجمع الخامس',
    },
    {
      'id':'10116',
      'BranchName': 'حدائق حلوان',
    },
    {
      'id':'10117',
      'BranchName': 'حلوان',
    },
    {
      'id':'10118',
      'BranchName': 'رياض باشا',
    },
    {
      'id':'10119',
      'BranchName': 'شريف باشا',
    },
    {
      'id':'10120',
      'BranchName': 'المقطم 1',
    },
    {
      'id':'10121',
      'BranchName':'اللاسلكي',
    },
    {
      'id':'10122',
      'BranchName':'المقطم 2',
    },
    {
      'id':'10123',
      'BranchName':  'الجزائر',
    },
    {
      'id':'10124',
      'BranchName': 'المندرة',
    },
    {
      'id':'10125',
      'BranchName': 'الاستاد',
    },
    {
      'id':'10126',
      'BranchName':  'سامية الجمل',
    },
    {
      'id':'10127',
      'BranchName': 'قناة السويس',
    },
  ];
  var Metro = [
    {
      'id':'10128',
      'BranchName':  'روكسي',
    },
    {
      'id':'10129',
      'BranchName': 'الخليفه المأمون',
    },
    {
      'id':'10130',
      'BranchName': 'عمار بن ياسر',
    },
    {
      'id':'10131',
      'BranchName': 'شيراتون',
    },
    {
      'id':'10132',
      'BranchName':'العريش',
    },
    {
      'id':'10133',
      'BranchName': 'المنيل',
    },
    {
      'id':'10134',
      'BranchName':  'كوبري الجامعة',
    },
    {
      'id':'10135',
      'BranchName':  'مصدق',
    },
    {
      'id':'10136',
      'BranchName': 'الثورة',
    },
    {
      'id':'10137',
      'BranchName': 'المساحة',
    },
    {
      'id':'10138',
      'BranchName':  'سوريا',
    },
    {
      'id':'10139',
      'BranchName': 'الزمالك',
    },
    {
      'id':'10140',
      'BranchName': 'جامعة الدول',
    },
    {
      'id':'10141',
      'BranchName':  'لبنان',
    },
    {
      'id':'10142',
      'BranchName':  'النادي الاهلي',
    },
    {
      'id':'10143',
      'BranchName': 'جنينه مول',
    },
    {
      'id':'10144',
      'BranchName':'مدينتي',
    },
    {
      'id':'10145',
      'BranchName': 'الشروق',
    },
    {
      'id':'10146',
      'BranchName': 'الرحاب',
    },
    {
      'id':'10147',
      'BranchName': 'المقطم',
    },
    {
      'id':'10148',
      'BranchName': 'اللاسلكي',
    },
    {
      'id':'10149',
      'BranchName':  'دجله',
    },
    {
      'id':'10150',
      'BranchName': 'معادي الزراعي',
    },
    {
      'id':'10151',
      'BranchName':'سموحه',
    },
    {
      'id':'10152',
      'BranchName': 'زيزينيا',
    },
    {
      'id':'10153',
      'BranchName': 'لوران',
    },
    {
      'id':'10154',
      'BranchName': 'رشدي',
    },
    {
      'id':'10155',
      'BranchName':  'المنصورة',
    },
  ];
  var kherzman=[
    {
      'id':'10156',
      'BranchName':  'مصر والسودان',
    },
    {
      'id':'10157',
      'BranchName':  'النزهة',
    },
    {
      'id':'10158',
      'BranchName':  'العمرانية',
    },
    {
      'id':'10159',
      'BranchName':  'فيصل حسن محمد',
    },
    {
      'id':'10160',
      'BranchName':  'اكتوبر',
    },
    {
      'id':'10161',
      'BranchName':  'المنيل',
    },
    {
      'id':'10162',
      'BranchName':  'حدائق الأهرام',
    },
    {
      'id':'10163',
      'BranchName':  'التحرير',
    },
    {
      'id':'10164',
      'BranchName':  'نوال',
    },
    {
      'id':'10165',
      'BranchName':  'ايران',
    },
    {
      'id':'10166',
      'BranchName':  'السودان',
    },
    {
      'id':'10167',
      'BranchName':  'البطل احمد عبدالعزيز',
    },
    {
      'id':'10168',
      'BranchName':  'الاهلى',
    },
    {
      'id':'10169',
      'BranchName':  'ذاكر حسين',
    },
    {
      'id':'10170',
      'BranchName':  'السيدة',
    },
    {
      'id':'10171',
      'BranchName':  'نوبار',
    },
    {
      'id':'10172',
      'BranchName':  'الظاهر',
    },
    {
      'id':'10173',
      'BranchName':  'شبرا 1',
    },
    {
      'id':'10174',
      'BranchName':  'شبرا 2',
    },
    {
      'id':'10175',
      'BranchName':  'حلوان',
    },
    {
      'id':'10176',
      'BranchName':  'المقطم',
    },
    {
      'id':'10177',
      'BranchName':  'النخيل',
    },
    {
      'id':'10178',
      'BranchName':  'ريحانه',
    },
    {
      'id':'10179',
      'BranchName':  'زهراء المعادى',
    },
    {
      'id':'10180',
      'BranchName':  'سموحة',
    },
    {
      'id':'10181',
      'BranchName':  'بولكلي',
    },
    {
      'id':'10182',
      'BranchName':  'سبورتنج',
    },
    {
      'id':'10317',
      'BranchName':  'المنصورة',
    },
  ];
  var othaim=[
    {
      'id':'10183',
      'BranchName':  'الزيتون',
    },
    {
      'id':'10184',
      'BranchName':  'النزهه',
    },
    {
      'id':'10185',
      'BranchName':  'قباء',
    },
    {
      'id':'10186',
      'BranchName':  'الشوربجى',
    },
    {
      'id':'10187',
      'BranchName':  'الليبينى',
    },
    {
      'id':'10188',
      'BranchName':  'الدقى',
    },
    {
      'id':'10189',
      'BranchName':  'المهندسين',
    },
    {
      'id':'10190',
      'BranchName':  'سما مول',
    },
    {
      'id':'10191',
      'BranchName':  'التجمع الخامس',
    },
    {
      'id':'10283',
      'BranchName':  'منشية البكري',
    },
    {
      'id':'10284',
      'BranchName':  'المطرية',
    },
    {
      'id':'10285',
      'BranchName':  'مؤسسة الزكاة',
    },
    {
      'id':'10286',
      'BranchName':  'عين شمس',
    },
    {
      'id':'10287',
      'BranchName':  'السفارات',
    },
    {
      'id':'10288',
      'BranchName':  'مدينة نصر - كامل الحروني',
    },
    {
      'id':'10289',
      'BranchName':  'مدينة نصر - طرابلس',
    },
    {
      'id':'10290',
      'BranchName':  'مدينة نصر-لوساكا',
    },
    {
      'id':'10291',
      'BranchName':  'مدينة نصر - مهدى عرفة',
    },
    {
      'id':'10292',
      'BranchName':  'مدينة نصر أحمد حسن',
    },
    {
      'id':'10293',
      'BranchName':  'مصر الجديدة-الزاتون-سانان',
    },
    {
      'id':'10294',
      'BranchName':  'الزاتون-ابن سندر',
    },
    {
      'id':'10295',
      'BranchName':  'شارع عين شمس - الحلمية',
    },
    {
      'id':'10296',
      'BranchName':  'المقطم',
    },
    {
      'id':'10297',
      'BranchName':  'العجوزة - عدن',
    },
    {
      'id':'10298',
      'BranchName':  'حلوان 1',
    },
    {
      'id':'10299',
      'BranchName':  'حلوان 2',
    },
    {
      'id':'10300',
      'BranchName':  'الهرم - الثلاثيني',
    },
    {
      'id':'10301',
      'BranchName':  '15 مايو',
    },
    {
      'id':'10302',
      'BranchName':  'حلوان - خسرو',
    },
    {
      'id':'10303',
      'BranchName':  'حدائق حلوان',
    },
    {
      'id':'10304',
      'BranchName':  'الهرم - زغلول',
    },
    {
      'id':'10305',
      'BranchName':  'فيصل- العشرين',
    },
    {
      'id':'10306',
      'BranchName':  'الهرم - العوربة',
    },
    {
      'id':'10307',
      'BranchName':  'الهرم - التعاون',
    },
    {
      'id':'10308',
      'BranchName':  'أكتوبر - الفردوس',
    },
    {
      'id':'10309',
      'BranchName':  'فيصل - المطبعة',
    },
    {
      'id':'10310',
      'BranchName':  'فيصل - ميدان الساعة',
    },
    {
      'id':'10311',
      'BranchName':  'الدقي - الانصار',
    },
    {
      'id':'10312',
      'BranchName':  'الدقي - طهران',
    },
  ];
  var raya=[
    {
      'id':'10192',
      'BranchName':  'حدائق القبة',
    },
    {
      'id':'10193',
      'BranchName':  'شركة الراية  - العريش',
    },
    {
      'id':'10194',
      'BranchName':  'المهندسين',
    },
    {
      'id':'10195',
      'BranchName':  'الوفاء و الامل',
    },
    {
      'id':'10196',
      'BranchName':  'مدينة نصر',
    },
    {
      'id':'10197',
      'BranchName':  'التجمع الاول',
    },
    {
      'id':'10198',
      'BranchName':  'العبور',
    },
    {
      'id':'10199',
      'BranchName':  'المقطم',
    },
    {
      'id':'10200',
      'BranchName':  'المعادى',
    },
  ];
  var alfa=[
    {
      'id':'10201',
      'BranchName':  'الحجاز',
    },
    {
      'id':'10202',
      'BranchName':  'روكسى',
    },
    {
      'id':'10203',
      'BranchName':  'الدقى',
    },
    {
      'id':'10204',
      'BranchName':  'زايد',
    },
    {
      'id':'10205',
      'BranchName':  'الاعناب',
    },
    {
      'id':'10206',
      'BranchName':  'الزمالك',
    },
    {
      'id':'10207',
      'BranchName':  'المعادى',
    },
    {
      'id':'10313',
      'BranchName':  'التجمع',
    },
  ];
  var mahalawy=[
    {
      'id':'10208',
      'BranchName':  'تريومف',
    },
    {
      'id':'10209',
      'BranchName':  'الطيران',
    },
    {
      'id':'10210',
      'BranchName':  'مكرم عبيد',
    },
    {
      'id':'10211',
      'BranchName':  'مصطفى النحاس',
    },
    {
      'id':'10212',
      'BranchName':  'التجمع الخامس',
    },
    {
      'id':'10213',
      'BranchName':  'الحى العاشر',
    },
  ];
  var panda=[
    {
      'id':'10214',
      'BranchName':  'اكتوبر',
    },
    {
      'id':'10215',
      'BranchName':  'مكرم عبيد',
    },
    {
      'id':'10216',
      'BranchName':  'العبور',
    },
  ];
  var hawary=[
    {
      'id':'10217',
      'BranchName':  'المهندسين',
    },
  ];
  var oscar=[
    {
      'id':'10218',
      'BranchName':  'ارض الجولف',
    },
    {
      'id':'10219',
      'BranchName':  'التجمع الخامس',
    },
  ];
  var lulu=[
    {
      'id':'10220',
      'BranchName':  'شيراتون',
    },
    {
      'id':'10221',
      'BranchName':  'التجمع الاول',
    },
  ];
  var aswaqFat=[
    {
      'id':'10254',
      'BranchName':'ستانلى',
    },
    {
      'id':'10255',
      'BranchName':'طوسن',
    },
    {
      'id':'10256',
      'BranchName':'جاردينيا',
    },
    {
      'id':'10257',
      'BranchName':'سموحة',
    },
    {
      'id':'10258',
      'BranchName':'فليمنج',
    },
    {
      'id':'10259',
      'BranchName':'سيدى بشر',
    },
    {
      'id':'10260',
      'BranchName':'شارع النصر',
    },
    {
      'id':'10261',
      'BranchName':'الهانوفيل',
    },
    {
      'id':'10262',
      'BranchName':'اكتوبر',
    },
    {
      'id':'10263',
      'BranchName':'بحرى',
    },
    {
      'id':'10264',
      'BranchName':'الابراهيميه ريفيرا',
    },
    {
      'id':'10265',
      'BranchName':'سيدى جابر المحطة',
    },
    {
      'id':'10266',
      'BranchName':'العجمي ستار',
    },
    {
      'id':'10267',
      'BranchName':'كفر الدوار',
    },
    {
      'id':'10268',
      'BranchName':'دمنهور',
    },
    {
      'id':'10321',
      'BranchName':'طنطا اوت ليت',
    },
    {
      'id':'10322',
      'BranchName':'طنطا ش.سعيد',
    },
    {
      'id':'10323',
      'BranchName':'المحله',
    },
    {
      'id':'10326',
      'BranchName':'سيتي سكوير',
    },
    {
      'id':'10343',
      'BranchName':'الرحاب',
    },
  ];
  var fatGomla=[
    {
      'id':'10222',
      'BranchName':'الزيتون'
    },
    {
      'id':'10223',
      'BranchName':'بانوراما ( العبور )'
    },
    {
      'id':'10224',
      'BranchName':'برج العرب'
    },
    {
      'id':'10225',
      'BranchName':'بيانكى'
    },
    {
      'id':'10226',
      'BranchName':'روز جاردن'
    },
    {
      'id':'10227',
      'BranchName':'محرم بك'
    },
    {
      'id':'10228',
      'BranchName':'وابور المياة'
    },
    {
      'id':'10229',
      'BranchName':'الجمرك'
    },
    {
      'id':'10230',
      'BranchName':'الفراعنة'
    },
    {
      'id':'10231',
      'BranchName':'محرم بك المنشا'
    },
    {
      'id':'10232',
      'BranchName':'ragheb- كرموز'
    },
    {
      'id':'10233',
      'BranchName':'جناكليس'
    },
    {
      'id':'10234',
      'BranchName':'سان ستيفانو'
    },
    {
      'id':'10235',
      'BranchName':'المنتزة'
    },
    {
      'id':'10236',
      'BranchName':'العصافرة'
    },
    {
      'id':'10237',
      'BranchName':'سبورتنج'
    },
    {
      'id':'10238',
      'BranchName':'الابراهيميه'
    },
    {
      'id':'10239',
      'BranchName':'شارع 45'
    },
    {
      'id':'10240',
      'BranchName':'المنصورة'
    },
    {
      'id':'10324',
      'BranchName':'جرين تاور'
    }
  ];
  var beitgomla=[
    {
      'id':'10241',
      'BranchName':  'سموحة',
    },
    {
      'id':'10242',
      'BranchName':  'ونجت',
    },
    {
      'id':'10243',
      'BranchName':  'باكوس',
    },
    {
      'id':'10244',
      'BranchName':  'ميامي',
    },
    {
      'id':'10245',
      'BranchName':  'عرامه',
    },
    {
      'id':'10246',
      'BranchName':  'الترعه',
    },
    {
      'id':'10247',
      'BranchName':  'الفلكى',
    },
    {
      'id':'10248',
      'BranchName':  'شارع القاهره',
    },
    {
      'id':'10249',
      'BranchName':  'الدرايسه',
    },
    {
      'id':'10250',
      'BranchName':  'المنشية',
    },
    {
      'id':'10251',
      'BranchName':  'الورديان',
    },
    {
      'id':'10252',
      'BranchName':  'الحديد والصلب',
    },
    {
      'id':'10253',
      'BranchName':  'الهانوفيل',
    },
  ];
  var aswaqmini=[
    {
      'id':'10269',
      'BranchName':  'سنابل',
    },
    {
      'id':'10270',
      'BranchName':  'الجواهر',
    },
    {
      'id':'10271',
      'BranchName':  'سيدى جابر المينى',
    },
    {
      'id':'10272',
      'BranchName':  'الدخيله 2',
    },
    {
      'id':'10273',
      'BranchName':  'الدخيله 1',
    },
  ];
  var zahran=[
    {
      'id':'10274',
      'BranchName':  'سموحة',
    },
    {
      'id':'10275',
      'BranchName':  'زيزنيا',
    },
    {
      'id':'10276',
      'BranchName':  'المعمورة',
    },
    {
      'id':'10277',
      'BranchName':  'البيطاش',
    },
    {
      'id':'10278',
      'BranchName':  'دمنهور',
    },
    {
      'id':'10315',
      'BranchName':  'المنصورة',
    },
  ];
  var premier=[
    {
      'id':'10316',
      'BranchName':  'التجمع الثالث',
    },
  ];
  var freshfood=[
    {
      'id':'10279',
      'BranchName':  'Point 90 Mall',
    },
    {
      'id':'10280',
      'BranchName':  'سان استفانو',
    },
  ];
  var royalhouse=[
    {
      'id':'10281',
      'BranchName':  'هليوبليس',
    },
  ];
  var mart=[
    {
      'id':'10282',
      'BranchName':  'التجمع الخامس',
    },
  ];

  var branches = [];
  String selectedPlace;
  String imgUrlSelectedPlace;
  String selectedBranch;
  String id;

  void onChangedCallback(place) {
    if (place == 'Carrefour') {
      branches = Carrefour;
    } else if (place == 'Carrefour Express') {
      branches = CarrefourExpress;
    } else if (place == 'Hipper one') {
      branches = HipperOne;
    } else if (place == 'Spinneys') {
      branches = Spinneys;
    } else if (place == 'Seoudi') {
      branches = Seoudi;
    } else if (place == 'Ragab sons') {
      branches = RagabSons;
    } else if (place == 'Metro') {
      branches = Metro;
    } else if (place == 'Kher zaman'){
      branches = kherzman;
    } else if (place == 'El otheim'){
      branches = othaim;
    } else if (place == 'Raya'){
      branches = raya;
    } else if (place == 'Alfa'){
      branches = alfa;
    } else if (place == 'El Mahalawy'){
      branches = mahalawy;
    } else if (place == 'Panda'){
      branches = panda;
    } else if (place == 'El Hawary'){
      branches = hawary;
    } else if (place == 'Oscar'){
      branches = oscar;
    } else if (place == 'Lulu'){
      branches = lulu;
    }else if (place == 'Aswaq Fathalla'){
      branches = aswaqFat;
    }  else if (place == 'Beit el gomla'){
      branches = beitgomla;
    }else if (place == 'Fathalla Gomla'){
      branches = fatGomla;
    }else if (place == 'Aswak fathalla mini'){
      branches = aswaqmini;
    } else if (place == 'Zahran'){
      branches = zahran;
    }else if (place == 'Fresh food'){
      branches = freshfood;
    }else if (place == 'Royal house'){
      branches = royalhouse;
    }else if (place == 'Mart ville'){
      branches = mart;
    }else if (place == 'Premier'){
      branches = premier;
    }else {
      branches = [];
    }
    selectedBranch = null;
    selectedPlace=place;
    notifyListeners();
  }

  void setSelectedBranch(String branch){
    selectedBranch=branch;
    notifyListeners();
  }


  var Category=[
  {
   'cateName':'BONJORNO',
   'cateImage':'images/BONJORNO.jpg'
  },
    {
      'cateName':'NESCAFE',
      'cateImage':'images/NESCAFE.jpg'
    },
    {
      'cateName':'COFFEE-MATE',
      'cateImage':'images/COFFEE-MATE.jpg'
    },
    {
      'cateName':'NIDO',
      'cateImage':'images/NIDO.png'
    },
    {
      'cateName':'BABY FOOD',
      'cateImage':'images/BABY FOOD.png'
    },
    {
      'cateName':'NESQUIK',
      'cateImage':'images/NESQUIK.png'
    },
    {
      'cateName':'RTD',
      'cateImage':'images/nestle_logo.png'
    },
    {
      'cateName':'MAGGI',
      'cateImage':'images/MAGGI.jpg'
    },
    {
      'cateName':'CEREAL',
      'cateImage':'images/CEREAL.jpg'
    },
    {
      'cateName':'CONFECTIONERY',
      'cateImage':'images/CONFECTIONERY.png'
    },
    {
      'cateName':'Biscuits',
      'cateImage':'images/nestle_logo.jpg'
    },
    {
      'cateName':'WATER',
      'cateImage':'images/WATER.png'
    },
  ];
  var bonjornoSub=[
    {
      'id':'1',
      'SubCate':'Bon.Mixes',
      'Itemname':' khamsina2in1',
      'transItemName':LocaleKeys.Khamsina2in1.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'2',
      'SubCate':'Bon.Mixes',
      'Itemname':' (6) gm Mehwega',
      'transItemName':LocaleKeys.mehaweg6gm.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
    'id':'3',
    'SubCate':'Bon.Mixes',
    'Itemname':' 2in1',
      'transItemName':LocaleKeys.in1Bon.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg',
    },
    {
      'id':'4',
      'SubCate':'Bon.Mixes',
      'Itemname':' 2in1Hazelnut',
      'transItemName':LocaleKeys.in1Huzelnut.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg',
    },
    {
      'id':'5',
      'SubCate':'Bon.Mixes',
      'Itemname':' 2in1 Jar 400g EG',
      'transItemName':LocaleKeys.in1Jar400gEg.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'6',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Mocha',
      'transItemName':LocaleKeys.mocha.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'7',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Latte',
      'transItemName':LocaleKeys.latte.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'8',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Hazelnut',
      'transItemName':LocaleKeys.Hazelnut.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'9',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Latte Caramel',
      'transItemName':LocaleKeys.latteCaramel.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'10',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Vanilla',
      'transItemName':LocaleKeys.vanilla.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'11',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Latte Cinnamon Cocoa',
      'transItemName':LocaleKeys.latteCinnamonCocoa.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var Nescafesub=[
    {
      'id':'12',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLASSIC 1.8g',
      'transItemName':LocaleKeys.NescClassic18g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'13',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE Pouch 18g',
      'transItemName':LocaleKeys.NescPouch18g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'14',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':'NESCAFE CLASSIC 50g',
      'transItemName':LocaleKeys.NescClassic50g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'15',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' CL200 Pouch',
      'transItemName':LocaleKeys.CL200Pouch.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'16',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE Pouch 50g',
      'transItemName':LocaleKeys.Nescpouch50g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'17',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLASSIC 100g',
      'transItemName':LocaleKeys.NescClassic100g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'18',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLASSIC 200g',
      'transItemName':LocaleKeys.NescClassic200g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'19',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLSSIC 200g Red Mug',
      'transItemName':LocaleKeys.NescClassic200gRedMug.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'20',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLASSIC Creama 100g',
      'transItemName':LocaleKeys.NescClassicCreama100g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'21',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE G 100g',
      'transItemName':LocaleKeys.NescG100g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'22',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE G 200g',
      'transItemName':LocaleKeys.NescG200g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'23',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE G 50g',
      'transItemName':LocaleKeys.NescG50g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'24',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE GOLD Dcf 100g',
      'transItemName':LocaleKeys.NescGoldDcf100g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'25',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE ESPRESSO 100g',
      'transItemName':LocaleKeys.NescEspresso100g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'26',
      'SubCate':'NESCAFE GOLD',
      'Itemname':'NESCAFE ESPRESSO Rich Cream 100g',
      'transItemName':LocaleKeys.NescEspressoRichCream100g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'27',
      'SubCate':'NESCAFE GOLD',
      'Itemname':'NESCAFE GOLD COLOMBIA 100g',
      'transItemName':LocaleKeys.NescGoldColombia100g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'28',
      'SubCate':'NESCAFE GOLD',
      'Itemname':'NESCAFE GOLD ALTA RICA 100g',
      'transItemName':LocaleKeys.NescGoldAltarica100G.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'29',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE GOLD Stick 1.8g',
      'transItemName':LocaleKeys.NescGoldStick18g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'30',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE ESPRESSO 1.8g',
      'transItemName':LocaleKeys.NescEspressp18g.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'31',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE GOLD Dcf 100g 20%PriceOff',
      'transItemName':LocaleKeys.NescGoldDecf100gpriceoff.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'32',
      'SubCate':'NESCAFE MIX 2 IN 1',
      'Itemname':' 2IN1 (24 Sticks )',
      'transItemName':LocaleKeys.Nesc2in1stick24.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'33',
      'SubCate':'NESCAFE MIX 2 IN 1',
      'Itemname':' 2IN1 (12 Sticks )',
      'transItemName':LocaleKeys.Nesc2in1stick12.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'34',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1',
      'transItemName':LocaleKeys.Nesc3in1.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'35',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3IN1 RICH',
      'transItemName':LocaleKeys.Nesc3in1RICH.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'36',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' GOLD 3IN1',
      'transItemName':LocaleKeys.NescGold3in1.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'37',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' Arabiana',
      'transItemName':LocaleKeys.Arabiana.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'38',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 Hzn',
      'transItemName':LocaleKeys.Nesc3IN1Hzn.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'39',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 Choc',
      'transItemName':LocaleKeys.Nesc3in1Choc.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'40',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 Caramel',
      'transItemName':LocaleKeys.Nesc3in1Caramel.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'41',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3IN1 Milk',
      'transItemName':LocaleKeys.Nesc3in1Milk.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'42',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 ICE',
      'transItemName':LocaleKeys.Nesc3in1Ice.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'43',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' NESC 3in1 Salted Crml',
      'transItemName':LocaleKeys.Nesc3in1SaltedCrml.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'44',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 Vanilla',
      'transItemName':LocaleKeys.Nesc3in1Vanilla.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'45',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':' GOLD Sweet',
      'transItemName':LocaleKeys.GoldSweet.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'46',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':'GOLD Latte',
      'transItemName':LocaleKeys.GoldLatte.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'47',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':'GOLD Vanilla',
      'transItemName':LocaleKeys.GoldVanilla.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'48',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':'GOLD Mocha',
      'transItemName':LocaleKeys.GoldMocha.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'49',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':'GOLD Caramel',
      'transItemName':LocaleKeys.GoldCaramel.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var CoffeeMateSub=[
    {
      'id':'50',
      'SubCate':'Coffee - Mate',
      'Itemname':'400 g',
      'transItemName':LocaleKeys.g400.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'51',
      'SubCate':'Coffee - Mate',
      'Itemname':'170 g',
      'transItemName':LocaleKeys.g170.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'52',
      'SubCate':'Coffee - Mate',
      'Itemname':'CFMT + NESC CLAS CP (400g+50g)',
      'transItemName':LocaleKeys.CFMTMATE.tr(),
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var NidoSub=[
    {
      'id':'53',
      'SubCate':'Nido',
      'Itemname':'NIDO 25g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'54',
      'SubCate':'Nido',
      'Itemname':'NIDO 100g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'55',
      'SubCate':'Nido',
      'Itemname':'NIDO 200g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'56',
      'SubCate':'Nido',
      'Itemname':'NIDO 300g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'57',
      'SubCate':'Nido',
      'Itemname':'NIDO 450g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'58',
      'SubCate':'Nido',
      'Itemname':'NIDO 700g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'59',
      'SubCate':'Nido',
      'Itemname':'NIDO 1500g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'60',
      'SubCate':'Nido',
      'Itemname':'Elasasy 275 g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'61',
      'SubCate':'Nido',
      'Itemname':'NIDO(1.5KG+450g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'62',
      'SubCate':'Nido',
      'Itemname':'NIDO 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'63',
      'SubCate':'Nido',
      'Itemname':'NIDO 900g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'64',
      'SubCate':'Nido',
      'Itemname':'NESTLE Powder Sahlep 17g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'65',
      'SubCate':'Nido',
      'Itemname':'NESTLE SCM 397g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'66',
      'SubCate':'Nido',
      'Itemname':'NESTLE Milk Cream 160g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'67',
      'SubCate':'GUMs',
      'Itemname':'NIDO 1+ (576g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'68',
      'SubCate':'GUMs',
      'Itemname':'NIDO 1+ (288g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'69',
      'SubCate':'GUMs',
      'Itemname':'NIDO 1+ (145g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var babyfoodSub = [
    {
      'id':'70',
      'SubCate':'Wyeth',
      'Itemname':'NAN 3 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'71',
      'SubCate':'Wyeth',
      'Itemname':'NAN 1 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'72',
      'SubCate':'Wyeth',
      'Itemname':'NAN 2 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'73',
      'SubCate':'Wyeth',
      'Itemname':'NESTOGEN 1 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'74',
      'SubCate':'Wyeth',
      'Itemname':'NESTOGEN 3 200G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'75',
      'SubCate':'Wyeth',
      'Itemname':'NESTOGEN 2 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'76',
      'SubCate':'Wyeth',
      'Itemname':'PROGRESS GOLD 3 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'77',
      'SubCate':'Wyeth',
      'Itemname':'Pro GOLD Tin 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'78',
      'SubCate':'Wyeth',
      'Itemname':'Promil Gold 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'79',
      'SubCate':'Wyeth',
      'Itemname':'PROGRESS GOLD 3 800G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'80',
      'SubCate':'Wyeth',
      'Itemname':'Pro GOLD Tin 800G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'81',
      'SubCate':'Wyeth',
      'Itemname':'Promil GOLD 800G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'82',
      'SubCate':'Wyeth',
      'Itemname':'RESOURCE JUNIOR 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'83',
      'SubCate':'CERELAC',
      'Itemname':'Rice Wtht Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'84',
      'SubCate':'CERELAC',
      'Itemname':'Rice Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'85',
      'SubCate':'CERELAC',
      'Itemname':'Rise+Vegetables Wtht Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'86',
      'SubCate':'CERELAC',
      'Itemname':'Dates Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'87',
      'SubCate':'CERELAC',
      'Itemname':'Honey Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'88',
      'SubCate':'CERELAC',
      'Itemname':'3 Fruits Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'89',
      'SubCate':'CERELAC',
      'Itemname':'Wheat Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'90',
      'SubCate':'CERELAC',
      'Itemname':'Wheat Without Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'91',
      'SubCate':'CERELAC',
      'Itemname':'Wheat Without Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'92',
      'SubCate':'CERELAC',
      'Itemname':'Rice Without Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'93',
      'SubCate':'CERELAC',
      'Itemname':'Wheat Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'94',
      'SubCate':'CERELAC',
      'Itemname':'3 Fruits Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'95',
      'SubCate':'CERELAC',
      'Itemname':'Honey Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'96',
      'SubCate':'CERELAC',
      'Itemname':'Iron + Rice Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'97',
      'SubCate':'CERELAC',
      'Itemname':'Iron + Wheat Milk 500g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'98',
      'SubCate':'CERELAC',
      'Itemname':'Iron+ 3 Fruits Milk 500g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'99',
      'SubCate':'CERELAC',
      'Itemname':'Iron+ Wheat Milk 500g Price Off EG',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'100',
      'SubCate':'CERELAC',
      'Itemname':'Iron+ 3Frt Milk 500g Price Off EG',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];


  var nesquikSub=[
    {
      'id':'101',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 880g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'102',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 330g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'103',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 154g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'104',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 13g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'105',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 77g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'106',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 44g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'107',
      'SubCate':'Powder',
      'Itemname':'BONJORNO Hot Choc Hazelnut',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'108',
      'SubCate':'Powder',
      'Itemname':'BONJORNO Hot Chocolate',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var RtdSub=[
    {
      'id':'109',
      'SubCate':'RTD',
      'Itemname':'Chocolate RTD ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'110',
      'SubCate':'RTD',
      'Itemname':'Strawbery Milk RTD ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'111',
      'SubCate':'RTD',
      'Itemname':'Chocolate RTD shrink 3+1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'112',
      'SubCate':'RTD',
      'Itemname':'Strawbery Milk RTD shrink 3+1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var maggiSub = [
    {
      'id':'113',
      'SubCate':'Tab',
      'Itemname':'MAGGI 72g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'114',
      'SubCate':'Tab',
      'Itemname':'MAGGI Beef 20g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'115',
      'SubCate':'Tab',
      'Itemname':'MAGGI LowSalt 20g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'116',
      'SubCate':'Tab',
      'Itemname':'MAGGI V 18g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'117',
      'SubCate':'Tab',
      'Itemname':'MAGGI V 72g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'118',
      'SubCate':'Tab',
      'Itemname':'MAGGI 12 Tab',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'119',
      'SubCate':'Mix',
      'Itemname':'Bechamel',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'120',
      'SubCate':'Mix',
      'Itemname':'Bachamel Cheese',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'121',
      'SubCate':'Mix',
      'Itemname':'Shawerma',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'122',
      'SubCate':'Mix',
      'Itemname':'Shish Tawuuk',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'123',
      'SubCate':'Mix',
      'Itemname':'Fish',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'124',
      'SubCate':'Mix',
      'Itemname':'Burger',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'125',
      'SubCate':'Mix',
      'Itemname':'Hawawshi',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'126',
      'SubCate':'Mix',
      'Itemname':'Kofta',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'127',
      'SubCate':'Mix',
      'Itemname':'Kofta With Parsley',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'128',
      'SubCate':'Mix',
      'Itemname':'Chicken Mashawy',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'129',
      'SubCate':'Mix',
      'Itemname':'Chinese',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'130',
      'SubCate':'Mix',
      'Itemname':'Indian',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'131',
      'SubCate':'Soup',
      'Itemname':'Chicken Noodle',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'132',
      'SubCate':'Soup',
      'Itemname':'Chicken ABC',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'133',
      'SubCate':'Soup',
      'Itemname':'Chicken Cream',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'134',
      'SubCate':'Soup',
      'Itemname':'Mushroom',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'135',
      'SubCate':'Soup',
      'Itemname':'Chicken pasta',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'136',
      'SubCate':'Soup',
      'Itemname':'Kids potato',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var cerealSub = [
    {
      'id':'137',
      'SubCate':'Cereal',
      'Itemname':'FITNESS 375g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'138',
      'SubCate':'Cereal',
      'Itemname':'LION 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'139',
      'SubCate':'Cereal',
      'Itemname':'NESQUIK 330g (cer.)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'140',
      'SubCate':'Cereal',
      'Itemname':'NESQUIK 180g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'141',
      'SubCate':'Cereal',
      'Itemname':'CHOCAPIC 375g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'142',
      'SubCate':'Cereal',
      'Itemname':'LION 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'143',
      'SubCate':'Cereal',
      'Itemname':'FITNESS & FRT 375g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'144',
      'SubCate':'Cereal',
      'Itemname':'FITNESS HNY&LMD 355g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'145',
      'SubCate':'Cereal',
      'Itemname':'NESQUIK 25g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'146',
      'SubCate':'Cereal',
      'Itemname':'LION 25g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'147',
      'SubCate':'Cereal',
      'Itemname':'Cheerios',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var confectionerySub = [
    {
      'id':'148',
      'SubCate':'Chocolate',
      'Itemname':'MACKINTOSH\'S QUALITY  DATES 17*6g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'149',
      'SubCate':'Chocolate',
      'Itemname':'MACKINTOSH\'S QUALITY  DATES 17*15g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'150',
      'SubCate':'Chocolate',
      'Itemname':'MACKINTOSH\'S QUALITY 200g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'151',
      'SubCate':'Chocolate',
      'Itemname':'MACKINTOSH\'S QUALITY 375g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'152',
      'SubCate':'Chocolate',
      'Itemname':'MACKINTOSH\'S QUALITY 850g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'153',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 4F',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'154',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY Lotus',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'155',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY Caramel ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'156',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY Cookies & Cream',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'157',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY peant butter',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'158',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY White',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'159',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CKY Popcorn',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'160',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY Red',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'161',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT Dark',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'162',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 4F White',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'163',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'164',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F Caramel',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'165',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F Hazelnut',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'166',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F Cookie',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'167',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F Raspberry',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'168',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT MINI Bag 2F 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'169',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT Mini Mix Bag 227',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'170',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT Minis 232g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'171',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CUNKY Mini 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'172',
      'SubCate':'Chocolate',
      'Itemname':'KITKAT MINI Moments 272',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'173',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT MINI Moments Desserts',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'174',
      'SubCate':'Chocolate',
      'Itemname':'KITKAT MINI Moments Lotus',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'175',
      'SubCate':'Chocolate',
      'Itemname':'Kit Kat Miniatures',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'176',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2 Finger4 + 1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'177',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 4 Finger 5 + 1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'178',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT CHUNKY Red 3+1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'179',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2 Finger +6 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'180',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 4 Finger + 4 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'181',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2F Hazelnut 5+ 1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'182',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2F Cookie Crumble 5+1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'183',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2F Caramel 5+1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'184',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2F Raspberry 5+1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var BiscuitsSub=[
    {
      'id':'185',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Honey Mustard',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'186',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Tomato Herbs',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'187',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Cumin Lemon',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'188',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Mix Spices',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'189',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Cheese',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'190',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Olive&oregano Flaver',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'191',
      'SubCate':'FITNESS Toasties',
      'Itemname':'FITNESS Biscuits App&Cinnamon',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'192',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Fitness Biscuits Plain',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'193',
      'SubCate':'DOLCECA',
      'Itemname':'Coat Wafer Eshta',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'194',
      'SubCate':'DOLCECA',
      'Itemname':'Coat Wafer Choc',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'195',
      'SubCate':'DOLCECA',
      'Itemname':'Long Chocolate',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'196',
      'SubCate':'DOLCECA',
      'Itemname':'Long Brownie',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'197',
      'SubCate':'DOLCECA',
      'Itemname':'Long Eshta',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'198',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Swch Milk 56g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'199',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Swch Choc 28g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'200',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Swch Choc 56g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'201',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Swch Milk 28g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'202',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Choco 37g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'203',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Choco 75g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'204',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Milk 37g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var waterSub=[
    {
      'id':'205',
      'SubCate':'Water',
      'Itemname':'NPL 1.5 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'206',
      'SubCate':'Water',
      'Itemname':'NPL .6 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'207',
      'SubCate':'Water',
      'Itemname':'Nestle Shrink 6L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'208',
      'SubCate':'Water',
      'Itemname':'Kids Charcters 330L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'209',
      'SubCate':'Water',
      'Itemname':'Sparkling 0.24 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'210',
      'SubCate':'Water',
      'Itemname':'1.5 Shrink',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'211',
      'SubCate':'Water',
      'Itemname':'Baraka 1.5L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'212',
      'SubCate':'Water',
      'Itemname':'Baraka 0.6 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'213',
      'SubCate':'Water',
      'Itemname':'Nestle Gallon 18.9L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'214',
      'SubCate':'Water',
      'Itemname':'Vitality .500 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'215',
      'SubCate':'Water',
      'Itemname':'IMMUNITY ZINC',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'216',
      'SubCate':'Water',
      'Itemname':'Lemon 12B',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'217',
      'SubCate':'Water',
      'Itemname':'Mixed Berries 12B',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'218',
      'SubCate':'Water',
      'Itemname':'Green Apple 12B',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var Competator=[];
  var coffeComp=[
    {
      'id':'301',
      'name':'كوفى بريك',
    },
    {
      'id':'302',
      'name':'مرفا',
    },
    {
      'id':'303',
      'name':'على كافيه',
    },
    {
      'id':'304',
      'name':'كابتشينو دامور',
    },
    {
      'id':'305',
      'name':'بن اروما',
    },
    {
      'id':'306',
      'name':'بلاك',
    },
    {
      'id':'307',
      'name':'روز جاردين',
    },
    {
      'id':'308',
      'name':'مصر كافيه',
    },
  ];
  var coffeemateComp=[
    {
      'id':'309',
      'name':'دريم',
    },
    {
      'id':'310',
      'name':'كوفى ميت مستورد',
    },
    {
      'id':'311',
      'name':'على كافيه',
    },
    {
      'id':'312',
      'name':'كابتشينو دامور',
    },
    {
      'id':'313',
      'name':'بن اروما',
    },
    {
      'id':'314',
      'name':'بلاك',
    },
    {
      'id':'315',
      'name':'روز جاردين',
    },
    {
      'id':'316',
      'name':'مصر كافيه',
    },
  ];
  var hotchocComp=[
    {
      'id':'317',
      'name':'دريم',
    },
    {
      'id':'318',
      'name':'كادبورى',
    },
    {
      'id':'319',
      'name':'كورونا',
    },
    {
      'id':'320',
      'name':'بودر دى كوكا',
    },
    {
      'id':'321',
      'name':'حلو الشام',
    },
  ];
  var RTDComp=[
    {
      'id':'322',
      'name':'كوفى بريك',
    },
    {
      'id':'323',
      'name':'لاكتيل',
    },
    {
      'id':'324',
      'name':'دانو',
    },
    {
      'id':'325',
      'name':'المراعى',
    },
    {
      'id':'326',
      'name':'جهينه',
    },
  ];
  var nidoComp=[
    {
      'id':'327',
      'name':'ميرو',
    },
    {
      'id':'328',
      'name':'تاميو',
    },
    {
      'id':'329',
      'name':'روز جاردين',
    },
  ];
  var babyComp=[
    {
      'id':'330',
      'name':'هيرو',
    },
    {
      'id':'331',
      'name':'ابتمال',
    },
    {
      'id':'332',
      'name':'بيبلاك',
    },
    {
      'id':'333',
      'name':'هيرو',
    },
    {
      'id':'334',
      'name':'ريرى',
    },
  ];
  var maggiComp=[
    {
      'id':'335',
      'name':'كونور',
    },
    {
      'id':'336',
      'name':'سبايسى',
    },
    {
      'id':'337',
      'name':'5 شيف',
    },
    {
      'id':'338',
      'name':'كوجير',
    },
  ];
  var crealComp=[
    {
      'id':'339',
      'name':'تيميز',
    },
    {
      'id':'340',
      'name':'سانتى',
    },
  ];
  var chocolateComp=[
    {
      'id':'341',
      'name':'جلاكسى',
    },
    {
      'id':'342',
      'name':'كادبورى',
    },
    {
      'id':'343',
      'name':'كورونا',
    },
  ];
  var waterComp=[
    {
      'id':'344',
      'name':'ايلانو',
    },
    {
      'id':'345',
      'name':'بيبسى',
    },
    {
      'id':'346',
      'name':'ايزيس',
    },
    {
      'id':'347',
      'name':'كوكاكولا',
    },
  ];

  var empCodes=[
    {
      'code':'NE30',
      'name':'احمد ابوشقره'
    },
    {
      'code':'NE30210',
      'name':'مصطفى محمود عبد المنعم'
    },
    {
      'code':'NE30211',
      'name':'بولا عوض الله شكري يوسف'
    },
    {
      'code':'NE30214',
      'name':'يحيى محمد علي عبد السلام'
    },
    {
      'code':'NE30215',
      'name':'مصطفى قدري الطوخي عثمان'
    },
    {
      'code':'NE30216',
      'name':'محمد السيد احمد مصطفى'
    },
    {
      'code':'NE30219',
      'name':'عمرو محمد احمد ابو الهيثم'
    },
    {
      'code':'NE30218',
      'name':'عبد الحميد محمد بهجت'
    },
    {
      'code':'NE30217',
      'name':'عبد الفتاح عبد الحكيم عامر'
    },
    {
      'code':'NE30251',
      'name':'محمد سمير محمد محمد  مدبولي'
    },
    {
      'code':'NE30248',
      'name':'محمود سامي عبد الرحيم عبد المجيد'
    },
    {
      'code':'NE30265',
      'name':'احمد حسين علي حسين بكار'
    },
    {
      'code':'NE30258',
      'name':'محمد اسامه محمد عبد الهادي'
    },
    {
      'code':'NE30249',
      'name':'احمد محمد خليل محمود'
    },
    {
      'code':'NE30247',
      'name':'محمود فتحي عبد السميع صديق'
    },
    {
      'code':'NE30262',
      'name':'محمد حلمي امين سيد'
    },
    {
      'code':'NE30261',
      'name':'محمد عرفات محمد حسن'
    },
    {
      'code':'NE30260',
      'name':'حسام الدين مصطفي محمود حسن'
    },
    {
      'code':'NE30263',
      'name':'عبد الرحمن احمد السيد احمد'
    },
    {
      'code':'NE30259',
      'name':'محمد عادل محمد عبد الصبور'
    },
    {
      'code':'NE30255',
      'name':'محمد كمال السيد عبد الكريم'
    },
    {
      'code':'NE30252',
      'name':'حسن جابر حسن شاهين'
    },
    {
      'code':'NE30257',
      'name':'اسامه سعيد احمد عبدالحافظ'
    },
    {
      'code':'NE30254',
      'name':'اسلام احمد محمد  محمد  المرشدي'
    },
    {
      'code':'NE30246',
      'name':'شعبان جمال شعبان بدوي'
    },
    {
      'code':'NE30274',
      'name':'السيد عوض السيد عبد الشافي'
    },
    {
      'code':'NE30307',
      'name':'محمد احمد محمد حافظ'
    },
    {
      'code':'NE30308',
      'name':'ابراهيم سرور ابراهيم السيد'
    },
    {
      'code':'NE30310',
      'name':'عبد الرحمن صبحى ابراهيم الجندى'
    },
    {
      'code':'NE30093',
      'name':'محمد محمود محمد ابراهيم'
    },
    {
      'code':'NE30094',
      'name':'احمد امجد رمضان'
    },
    {
      'code':'NE30317',
      'name':'مصطفى ابراهيم ابراهيم النجار'
    },
    {
      'code':'NE30320',
      'name':'احمد ابراهيم احمد ابراهيم'
    },
    {
      'code':'NE30321',
      'name':'محمد الأنصارى رشدي'
    },
    {
      'code':'NE30322',
      'name':'أحمد حسن ابراهيم السيد'
    },
    {
      'code':'NE30323',
      'name':'احمد حسين محمد خليل'
    },
    {
      'code':'NE30331',
      'name':'رامي محمد احمد عبد اللطيف'
    },
    {
      'code':'NE30108',
      'name':'محمود محمد محود احمد'
    },
    {
      'code':'NE30311',
      'name':'عبد الرحمن عادل جمال محمد'
    },
    {
      'code':'NE30312',
      'name':'محمد محمود البشبيشي'
    },
  ];
  var subCategory = [];
  var subCategoryOffers=[];
  List<Chain> _expireItems=[];
  List<Chain> get expireItems {
    return [..._expireItems];
  }
  List<String> _extraItemId=[];
  List<String> get extraItemId{
    return [..._extraItemId];
}

  List<String> _expireItemId=[];
  List<String> get expireItemId{
    return [..._expireItemId];
  }

  List<String> _OurOfferItemId=[];
  List<String> get OurOfferItemId{
    return [..._OurOfferItemId];
  }

  List<String> _CompOfferItemId=[];
  List<String> get CompOfferItemId{
    return [..._CompOfferItemId];
  }

  List<ExtraCate> _extraItem=[];
  List<ExtraCate> get extraItem{
    return [..._extraItem];
  }

  int extraCatetime=0;
  int expireCatetime=0;
  int ourOfferCatetime=0;
  int CompOfferCatetime=0;

  String selectedCategory;
  String selectedSubCategory;
  String itemId;
  String ItemName;
  bool isClick= false;
  bool ReviewPromotion=false;

  String reportType;
  String extraVisType;

  void AddExtraItemId(String ExtraId){
    _extraItemId.add(ExtraId);
    notifyListeners();
  }

  void AddExpireItemId(String ExpireId){
    _expireItemId.add(ExpireId);
    notifyListeners();
  }

  void AddOurOfferItemId(String OurOfferId){
    _OurOfferItemId.add(OurOfferId);
    notifyListeners();
  }

  void AddCompOfferItemId(String CompOfferId){
    _CompOfferItemId.add(CompOfferId);
    notifyListeners();
  }

  void AddExtra(ExtraCate extraCate){
    final newExtraCate=ExtraCate(
      id: extraCate.id,
      extraName: extraCate.extraName,
    );
    _extraItem.add(newExtraCate);
    notifyListeners();
  }

  void AddProduct(Chain expiryData){
    final newExpireItem=Chain(
      id: expiryData.id,
      chain: expiryData.chain,
      branch: expiryData.branch,
      imgUrl: expiryData.imgUrl,
    );
    _expireItems.add(newExpireItem);
    notifyListeners();
  }

  void onChangedSecondCallback(cate) {
    if (cate == 'BONJORNO') {
      subCategory = bonjornoSub;
    } else if (cate == 'NESCAFE') {
      subCategory = Nescafesub;
      subCategoryOffers=Nescafesub+bonjornoSub;
      Competator=coffeComp;
    } else if (cate == 'COFFEE-MATE') {
      subCategory = CoffeeMateSub;
      Competator=coffeemateComp;
    } else if (cate == 'NIDO') {
      subCategory = NidoSub;
      Competator=nidoComp;
    } else if (cate == 'BABY FOOD') {
      subCategory = babyfoodSub;
      Competator=babyComp;
    } else if (cate == 'NESQUIK') {
      subCategory = nesquikSub;
      Competator=hotchocComp;
    }else if (cate == 'MAGGI') {
      subCategory = maggiSub;
      Competator=maggiComp;
    }else if (cate == 'CEREAL') {
      subCategory = cerealSub;
      Competator=crealComp;
    }else if (cate == 'CONFECTIONERY') {
      subCategory = confectionerySub;
    } else if (cate == 'WATER') {
      subCategory = waterSub;
      Competator=waterComp;
    } else if (cate == 'RTD'){
      subCategory=RtdSub;
      Competator=RTDComp;
    } else if (cate == 'Biscuits'){
      subCategory=BiscuitsSub;
      subCategoryOffers=BiscuitsSub+confectionerySub;
      Competator=chocolateComp;
    } else {
      subCategory = [];
    }
      selectedSubCategory = null;
      selectedCategory = cate;
      notifyListeners();
  }
  void onChangedCheckBox(){
    isClick = !isClick;
    notifyListeners();
  }
 /* void onChangedThiredCallback(subCate) {
    if(subCate=='Bon.Mixes'){
      items=BonMixItems;
    }else if(subCate=='Bon.Cappuuccino'){
      items=BonCappItems;
    }else if(subCate=='Powder'){
      items=NesPowderItems;
    }else if(subCate=='RTD'){
      items=NesRTDItems;
    }else if(subCate=='Water'){
      items=waterItems;
    }
    /* setState(() {
      selectedSubCategory = subCate;
    });*/
  }*/

}