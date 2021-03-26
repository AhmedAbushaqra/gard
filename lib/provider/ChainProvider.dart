import 'package:flutter/material.dart';
import 'package:gard/models/ExpiryData.dart';
import 'package:gard/models/MissingData.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/models/final_data.dart';
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

  void submitForm(
      FinalData finaldata, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbz48rnB9hUyO94_iSM-8hhojLAkVY9Fv7Wv9GTbfGvZxflO2oDNjk4RzUN3SlZ8mCz6/exec";
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
    String URL="https://script.google.com/macros/s/AKfycbwyIsyjv75uOpiuB3JpKUD2-Kk6pV8GhPY-25Yp9_zibszuJDVCrlK7DEddRsW5rNA_Kg/exec";
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

  Future <List<FinalData>> getFinalData() async{
    String url="https://script.googleusercontent.com/macros/echo?user_content_key=t8uhE5hYfZIf9qi-zFxhaRVhZfEzSm4LtFLmQauSTlMrAnxpPFaKRhKg4N5aFw3fGTdSfchu04-8iSYikTMlq3kC8lda5iU2m5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnGGcslfnUjN6VO1QOyZlPfeQf1Y8_1kn8HNjiMxPh9rVgH5ZG8cw3FLkM0nMJ8I1M-V5AzzEaSC5Jbbwct18HuK5cYJfSf_JZA&lib=M3t1tCGwgHqOX9dp5NQev3sTi32_F69pn";
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
  var places = [
    {
      'id':'1',
      'name':'Carrefour',
      'imgUrl':'images/Carrefour.jpeg'
    },
    {
      'id':'2',
      'name':'Carrefour Express',
      'imgUrl':'images/CarrefourExpress.jpeg'
    },
    {
      'id':'3',
      'name':'Hipper one',
      'imgUrl':'images/HipperOne.jpeg'
    },
    {
      'id':'4',
      'name':'Spinneys',
      'imgUrl':'images/Spinneys.jpeg'
    },
    {
      'id':'5',
      'name':'Seoudi',
      'imgUrl':'images/Seoudi.jpeg'
    },
    {
      'id':'6',
      'name':'Ragab sons',
      'imgUrl':'images/RagabSons.jpeg'
    },
    {
      'id':'7',
      'name':'Metro',
      'imgUrl':'images/Metro.jpeg'
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
    // {
    //   'id':'14',
    //   'BranchName':  "مراكز",
    // },
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
    } else {
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
      'cateName':'WATER',
      'cateImage':'images/WATER.png'
    },

  ];
  var bonjornoSub=[
    {
      'id':'1',
      'SubCate':'Bon.Mixes',
      'Itemname':' khamsina2in1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Bon.Mixes',
      'Itemname':' (6) gm Mehwega',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
    'id':'1',
    'SubCate':'Bon.Mixes',
    'Itemname':' 2in1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg',
    },
    {
      'id':'1',
      'SubCate':'Bon.Mixes',
      'Itemname':' 2in1Hazelnut',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg',
    },
    {
      'id':'1',
      'SubCate':'Bon.Mixes',
      'Itemname':' 2in1 Jar 400g EG',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Mocha',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Latte',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Hazelnut',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Latte Caramel',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Vanilla',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Bon.Cappuuccino',
      'Itemname':' Latte Cinnamon Cocoa',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var Nescafesub=[
    {
      'id':'1',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLASSIC 1.8g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE Pouch 18g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' CL200 Pouch',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE Pouch 50g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLASSIC 100g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLASSIC 200g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLSSIC 200g Red Mug',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CLASSIC ',
      'Itemname':' NESCAFE CLASSIC Creama 100g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE G 100g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE G 200g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE G 50g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE GOLD Dcf 100g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE ESPRESSO 100g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE GOLD Stick 1.8g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE ESPRESSO 1.8g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE GOLD',
      'Itemname':' NESCAFE GOLD Dcf 100g 20%PriceOff',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'NESCAFE MIX 2 IN 1',
      'Itemname':' 2IN1 (24 Sticks )',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 2 IN 1',
      'Itemname':' 2IN1 (12 Sticks )',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3IN1 RICH',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' GOLD 3IN1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' Arabiana',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 Hzn',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 Choc',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 Caramel',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3IN1 Milk',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 ICE',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' NESC 3in1 Salted Crml',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE MIX 3 IN 1',
      'Itemname':' 3in1 Vanilla',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':' GOLD Sweet',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':'GOLD Latte',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':'GOLD Vanilla',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':'GOLD Mocha',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'NESCAFE CAPPU',
      'Itemname':'GOLD Caramel',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

  ];
  var CoffeeMateSub=[
    {
      'id':'1',
      'SubCate':'Coffee - Mate',
      'Itemname':'400 g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Coffee - Mate',
      'Itemname':'170 g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Coffee - Mate',
      'Itemname':'CFMT + NESC CLAS CP (400g+50g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var NidoSub=[
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 25g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 100g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 200g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 300g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 450g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 700g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 1500g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'Elasasy 275 g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO(1.5KG+450g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NIDO 900g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NESTLE Powder Salep 17g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NESTLE SCM 397g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Nido',
      'Itemname':'NESTLE Milk Cream 160g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'GUMs',
      'Itemname':'NIDO 1+ (576g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'GUMs',
      'Itemname':'NIDO 1+ (288g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'GUMs',
      'Itemname':'NIDO 1+ (145g)',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var babyfoodSub = [
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'MAN 3 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'MAN 1 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'MAN 2 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'NESTOGEN 1 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'NESTOGEN 3 200G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'NESTOGEN 2 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'PROGRESS GOLD 3 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'Pro GOLD Tin 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'Promil Gold 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'PROGRESS GOLD 3 800G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'Pro GOLD Tin 800G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'Promil GOLD 800G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Wyeth',
      'Itemname':'RESOURCE JUNIOR 400G',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Rice Wtht Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Rice Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Rise+Vegetables Wtht Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Dates Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Honey Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'3 Fruits Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Wheat Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Wheat Without Milk 125g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Wheat Without Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Rice Without Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Wheat Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'3 Fruits Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Honey Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Iron + Rice Milk 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Iron + Wheat Milk 500g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Iron+ 3 Fruits Milk 500g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Iron+ Wheat Milk 500g Price Off EG',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'CERELAC',
      'Itemname':'Iron+ 3Frt Milk 500g Price Off EG',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];


  var nesquikSub=[
    {
      'id':'1',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 880g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 330g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 154g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 11g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 77g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Powder',
      'Itemname':'NESQUIK 44g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Powder',
      'Itemname':'BONJORNO Hot Choc Hazelnut',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Powder',
      'Itemname':'BONJORNO Hot Chocolate',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'RTD',
      'Itemname':'Chocolate RTD ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'RTD',
      'Itemname':'Strawbery Milk RTD ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var maggiSub = [
    {
      'id':'1',
      'SubCate':'Tab',
      'Itemname':'MAGGI 72g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Tab',
      'Itemname':'MAGGI Beef 20g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Tab',
      'Itemname':'MAGGI LowSalt 20g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Tab',
      'Itemname':'MAGGI V 18g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Tab',
      'Itemname':'MAGGI V 72g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Tab',
      'Itemname':'MAGGI 12 Tab',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Bechamel',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Shawerma',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Shish Tawuuk',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Fish',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Burger',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Hawawshi',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Kofta',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Kofta With Parsley',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Chicken Mashawy',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Chinese',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Mix',
      'Itemname':'Indian',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Soup',
      'Itemname':'Chicken Noodle',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Soup',
      'Itemname':'Chicken ABC',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Soup',
      'Itemname':'Chicken Cream',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Soup',
      'Itemname':'Mushroom',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Soup',
      'Itemname':'Chicken pasta',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Soup',
      'Itemname':'Kids potato',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var cerealSub = [
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'FITNESS 375g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'LION 400g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'NESQUIK 330g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'NESQUIK 180g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'LION 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'FITNESS & FRT 375g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'FITNESS HNY&LMD 355g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'NESQUIK 25g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'LION 25g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Cereal',
      'Itemname':'Cheerios',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var confectionerySub = [
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'QUALITY STREET 240g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'QUALITY STREET 480g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'QUALITY STREET 900g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'MACKINTOSH\'S QUALITY 200g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'MACKINTOSH\'S QUALITY 375g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'MACKINTOSH\'S QUALITY 850g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 4F',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY Lotus',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY Caramel ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY Cookies & Cream',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY peant butter',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY White',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CKY Popcorn',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CHUNKY Red',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT Dark',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 4F White',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F Caramel',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F Hazelnut',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F Cookie',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT 2F Raspberry',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT MINI Bag 2F 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT Mini Mix Bag 227',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT Minis 232g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT CUNKY Mini 250g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KITKAT MINI Moments 272',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KIT KAT MINI Moments Desserts',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'KITKAT MINI Moments Lotus',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Chocolate',
      'Itemname':'Kit Kat Miniatures',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2 Finger4 + 1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 4 Finger 5 + 1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT CHUNKY Red 3+1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2 Finger +6 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 4 Finger + 4 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2F Hazelnut 5+ 1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2F Cookie Crumble 5+1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2F Caramel 5+1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Promotion',
      'Itemname':'KIT KAT 2F Raspberry 5+1 Free',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Honey Mustard',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Tomato Herbs',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Cumin Lemon',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Mix Spices',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Cheese',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'FITNESS Toasties',
      'Itemname':'FITNESS Biscuits App&Cinnamon',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'FITNESS Toasties',
      'Itemname':'Fitness Biscuits Plain',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'DOLCECA',
      'Itemname':'Coat Wafer Eshta',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'DOLCECA',
      'Itemname':'Coat Wafer Choc',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'DOLCECA',
      'Itemname':'Long Chocolate',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'DOLCECA',
      'Itemname':'Long Brownie',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'DOLCECA',
      'Itemname':'Long Eshta',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Swch Milk 56g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Swch Choc 28g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Swch Choc 56g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Swch Milk 28g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Choco 37g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Choco 75g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Buscuits Nesquik',
      'Itemname':'Milk 37g',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];

  var waterSub=[
    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'NPL 1.5 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'NPL .6 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Nestle Shrink 6L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Kids Charcters 330L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Sparkling 0.24 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'1.5 Shrink',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Baraka 1.5L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Baraka 0.6 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Baraka Shrink 6 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Lime 12B',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Vitality .500 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Lemon 12B',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Mixed Berries 12B',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },

    {
      'id':'1',
      'SubCate':'Water',
      'Itemname':'Green Apple 12B',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];


  var subCategory = [];
  List<Chain> _expireItems=[];
  List<Chain> get expireItems {
    return [..._expireItems];
  }
  String selectedCategory;
  String selectedSubCategory;
  String itemId;
  String ItemName;
  bool isClick= false;

  String reportType;

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
    }
    else if (cate == 'NESCAFE') {
      subCategory = Nescafesub;
    }
    else if (cate == 'COFFEE-MATE') {
      subCategory = CoffeeMateSub;
    }
    else if (cate == 'NIDO') {
      subCategory = NidoSub;
    } else if (cate == 'BABY FOOD') {
      subCategory = babyfoodSub;
    } else if (cate == 'NESQUIK') {
      subCategory = nesquikSub;
    }else if (cate == 'MAGGI') {
      subCategory = maggiSub;
    }else if (cate == 'CEREAL') {
      subCategory = cerealSub;
    }else if (cate == 'CONFECTIONERY') {
      subCategory = confectionerySub;
    } else if (cate == 'WATER') {
      subCategory = waterSub;
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