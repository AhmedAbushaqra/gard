import 'package:flutter/material.dart';
import 'package:gard/models/chainModel.dart';
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
      Chain chain, void Function(String) callback) async {
    String URL="https://script.google.com/macros/s/AKfycbyRLDv1yv8jvNCtB42-y-bI24TuspgjMQALfYiONdeaYLHZPBrDr00mxg/exec";
    try {
      await http.post(URL, body: chain.toJson()).then((response) async {
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


  // void submitForm(Chain chain) async{
  //    String URL="https://script.google.com/macros/s/AKfycbw-EtV4Rsh4kfoT9ETaj9ooCYHe7zd2U4tERo3SvK0JLP2MfpXuukM/exec";
  //   try {
  //    final response = await http.post(URL,body: chain.toParams()
  //     ).then((response){
  //       convert.jsonDecode(response.body)['status'];
  //     });
  //    notifyListeners();
  //   }catch (e){
  //     print(e);
  //   }
  // }
  var places = [
    {
      'id':'1',
      'name':'Carrefour',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'2',
      'name':'Carrefour Express',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'3',
      'name':'Hipper one',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'4',
      'name':'Spinneys',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'5',
      'name':'Seoudi',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'6',
      'name':'Ragab sons',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'id':'7',
      'name':'Metro',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var Carrefour = [
    {
      'id':'1',
      'BranchName': 'المعادى',
    },
    {
      'id':'2',
      'BranchName': "مول مصر",
    },
    {
      'id':'3',
      'BranchName': "CFC",
    },
    {
      'id':'4',
      'BranchName': "الماظه",
    },
    {
      'id':'5',
      'BranchName': "داندى مول",
    },
    {
      'id':'6',
      'BranchName': "العبور",
    },
    {
      'id':'7',
      'BranchName': "صن ستى",
    },
    {
      'id':'8',
      'BranchName': "الشروق",
    },
    {
      'id':'9',
      'BranchName': "مدينتى",
    },
    {
      'id':'10',
      'BranchName':  "محرم بك",
    },
    {
      'id':'11',
      'BranchName': "العروبه",
    },
    {
      'id':'12',
      'BranchName': "ستى لايت",
    },
    {
      'id':'13',
      'BranchName':"طنطا",
    },
    {
      'id':'14',
      'BranchName':  "مراكز",
    },
  ];
  var CarrefourExpress = [
    {
      'id':'1',
      'BranchName': 'دمشق',
    },
    {
      'id':'1',
      'BranchName': 'الزيتون',
    },
    {
      'id':'1',
      'BranchName': 'سرايا مول',
    },
    {
      'id':'1',
      'BranchName': 'بفرلى هيلز',
    },
    {
      'id':'1',
      'BranchName': 'الجزيره مول',
    },
    {
      'id':'1',
      'BranchName': 'المحافظه',
    },
    {
      'id':'1',
      'BranchName': 'دولفن مول',
    },
    {
      'id':'1',
      'BranchName': 'مشعل',
    },
    {
      'id':'1',
      'BranchName': 'زيزينيا مول',
    },
    {
      'id':'1',
      'BranchName': 'شبرا',
    },
    {
      'id':'1',
      'BranchName': 'طيبه مول',
    },
    {
      'id':'1',
      'BranchName': 'ميفيدا',
    },
    {
      'id':'1',
      'BranchName': 'ميراج',
    },
    {
      'id':'1',
      'BranchName': 'الرحاب',
    },
    {
      'id':'1',
      'BranchName': 'الحمد',
    },
    {
      'id':'1',
      'BranchName': 'ميجا',
    },
    {
      'id':'1',
      'BranchName': 'داون تاون',
    },
    {
      'id':'1',
      'BranchName': 'حلوان',
    },
    {
      'id':'1',
      'BranchName': 'الاسمرات',
    },
    {
      'id':'1',
      'BranchName': 'المقطم',
    },
    {
      'id':'1',
      'BranchName': 'اعمار',
    },
    {
      'id':'1',
      'BranchName': 'دجله',
    },
    {
      'id':'1',
      'BranchName': 'البارون',
    },
    {
      'id':'1',
      'BranchName': 'مايو 15',
    },
    {
      'id':'1',
      'BranchName': 'الجزائر',
    },
    {
      'id':'1',
      'BranchName': 'طره',
    },
    {
      'id':'1',
      'BranchName': 'ونجت',
    },
    {
      'id':'1',
      'BranchName': 'المنتزه',
    },
    {
      'id':'1',
      'BranchName': 'كفر عبده',
    },
    {
      'id':'1',
      'BranchName': 'جرين بلازا',
    },
    {
      'id':'1',
      'BranchName': 'محطة الرمل',
    },
    {
      'id':'1',
      'BranchName': 'الملتقى',
    },
    {
      'id':'1',
      'BranchName': 'زكى رجب - الابراهيميه',
    },
    {
      'id':'1',
      'BranchName': 'الهانوفيل',
    },
    {
      'id':'1',
      'BranchName': 'دمنهور',
    },
    {
      'id':'1',
      'BranchName': 'المنصورة',
    },
  ];
  var HipperOne = [
    {
      'id':'1',
      'BranchName': 'العاشر من رمضان',
    },
    {
      'id':'1',
      'BranchName': 'زايد',
    },
    {
      'id':'1',
      'BranchName': 'السليمانيه',
    },
  ];
  var Spinneys = [
    {
      'id':'1',
      'BranchName': 'ارينا مول',
    },
    {
      'id':'1',
      'BranchName':  'سيتى سكيب',
    },
    {
      'id':'1',
      'BranchName': 'مول العرب',
    },
    {
      'id':'1',
      'BranchName':  'الهرم',
    },
    {
      'id':'1',
      'BranchName': 'زايد',
    },
    {
      'id':'1',
      'BranchName': 'الشروق',
    },
    {
      'id':'1',
      'BranchName': 'التجمع الخامس',
    },
    {
      'id':'1',
      'BranchName': 'المقطم',
    },
    {
      'id':'1',
      'BranchName': 'سموحة',
    },
  ];
  var Seoudi = [
    {
      'id':'1',
      'BranchName': 'سيتى ستارز',
    },
    {
      'id':'1',
      'BranchName': 'واتر واى',
    },
    {
      'id':'1',
      'BranchName': 'الشيخ زايد',
    },
    {
      'id':'1',
      'BranchName': 'التجمع الخامس',
    },
    {
      'id':'1',
      'BranchName': 'شيراتون',
    },
    {
      'id':'1',
      'BranchName': 'حسنين هيكل',
    },
    {
      'id':'1',
      'BranchName': 'دريم',
    },
    {
      'id':'1',
      'BranchName': 'روكسى',
    },
    {
      'id':'1',
      'BranchName': 'سوديك',
    },
    {
      'id':'1',
      'BranchName': 'االدقى',
    },
    {
      'id':'1',
      'BranchName': 'الحجاز',
    },
    {
      'id':'1',
      'BranchName':'الحكمه',
    },
    {
      'id':'1',
      'BranchName': 'سفنكس',
    },
    {
      'id':'1',
      'BranchName': 'الطيران',
    },
    {
      'id':'1',
      'BranchName': 'المعادى',
    },
    {
      'id':'1',
      'BranchName': 'دجله',
    },
  ];
  var RagabSons = [
    {
      'id':'1',
      'BranchName':'التجنيد',
    },
    {
      'id':'1',
      'BranchName':  'الزيتون',
    },
    {
      'id':'1',
      'BranchName': 'النعام',
    },
    {
      'id':'1',
      'BranchName': 'جسر السويس',
    },
    {
      'id':'1',
      'BranchName': 'الفتح',
    },
    {
      'id':'1',
      'BranchName': 'ألف مسكن',
    },
    {
      'id':'1',
      'BranchName': 'الميرغنى 2',
    },
    {
      'id':'1',
      'BranchName': 'الميرغنى 1',
    },
    {
      'id':'1',
      'BranchName':   'النزهه',
    },
    {
      'id':'1',
      'BranchName': 'حدائق القبه',
    },
    {
      'id':'1',
      'BranchName': 'الظاهر',
    },
    {
      'id':'1',
      'BranchName': 'المطار',
    },
    {
      'id':'1',
      'BranchName': 'الحجاز',
    },
    {
      'id':'1',
      'BranchName': 'فيصل الاطباء',
    },
    {
      'id':'1',
      'BranchName': 'الطالبية',
    },
    {
      'id':'1',
      'BranchName': 'ناصر الثورة',
    },
    {
      'id':'1',
      'BranchName': 'الوفاء والامل',
    },
    {
      'id':'1',
      'BranchName': 'الحصري',
    },
    {
      'id':'1',
      'BranchName': 'مول فايف ستارز',
    },
    {
      'id':'1',
      'BranchName': 'الملكه',
    },
    {
      'id':'1',
      'BranchName': 'الجيزة',
    },
    {
      'id':'1',
      'BranchName': 'المجزر',
    },
    {
      'id':'1',
      'BranchName': 'حدائق الأهرام',
    },
    {
      'id':'1',
      'BranchName':  'السيدة',
    },
    {
      'id':'1',
      'BranchName':  'يلبغا',
    },
    {
      'id':'1',
      'BranchName': 'أحمد فخري',
    },
    {
      'id':'1',
      'BranchName': 'الفنجري',
    },
    {
      'id':'1',
      'BranchName':'الحي الثامن',
    },
    {
      'id':'1',
      'BranchName': 'الحي العاشر',
    },
    {
      'id':'1',
      'BranchName': 'مصطفى النحاس',
    },
    {
      'id':'1',
      'BranchName':'وندر لاند',
    },
    {
      'id':'1',
      'BranchName': 'التجمع الأول',
    },
    {
      'id':'1',
      'BranchName': 'مدينتي 1',
    },
    {
      'id':'1',
      'BranchName': 'مدينتي 2',
    },
    {
      'id':'1',
      'BranchName': 'الشباب',
    },
    {
      'id':'1',
      'BranchName': 'المدينة',
    },
    {
      'id':'1',
      'BranchName': 'الرحاب',
    },
    {
      'id':'1',
      'BranchName': 'التجمع الخامس',
    },
    {
      'id':'1',
      'BranchName': 'حدائق حلوان',
    },
    {
      'id':'1',
      'BranchName': 'حلوان',
    },
    {
      'id':'1',
      'BranchName': 'رياض باشا',
    },
    {
      'id':'1',
      'BranchName': 'شريف باشا',
    },
    {
      'id':'1',
      'BranchName': 'المقطم 1',
    },
    {
      'id':'1',
      'BranchName':'اللاسلكي',
    },
    {
      'id':'1',
      'BranchName':'المقطم 2',
    },
    {
      'id':'1',
      'BranchName':  'الجزائر',
    },
    {
      'id':'1',
      'BranchName': 'المندرة',
    },
    {
      'id':'1',
      'BranchName': 'الاستاد',
    },
    {
      'id':'1',
      'BranchName':  'سامية الجمل',
    },
    {
      'id':'1',
      'BranchName': 'قناة السويس',
    },
  ];
  var Metro = [
    {
      'id':'1',
      'BranchName':  'روكسي',
    },
    {
      'id':'1',
      'BranchName': 'الخليفه المأمون',
    },
    {
      'id':'1',
      'BranchName': 'عمار بن ياسر',
    },
    {
      'id':'1',
      'BranchName': 'شيراتون',
    },
    {
      'id':'1',
      'BranchName':'العريش',
    },
    {
      'id':'1',
      'BranchName': 'المنيل',
    },
    {
      'id':'1',
      'BranchName':  'كوبري الجامعة',
    },
    {
      'id':'1',
      'BranchName':  'مصدق',
    },
    {
      'id':'1',
      'BranchName': 'الثورة',
    },
    {
      'id':'1',
      'BranchName': 'المساحة',
    },
    {
      'id':'1',
      'BranchName':  'سوريا',
    },
    {
      'id':'1',
      'BranchName': 'الزمالك',
    },
    {
      'id':'1',
      'BranchName': 'جامعة الدول',
    },
    {
      'id':'1',
      'BranchName':  'لبنان',
    },
    {
      'id':'1',
      'BranchName':  'النادي الاهلي',
    },
    {
      'id':'1',
      'BranchName': 'جنينه مول',
    },
    {
      'id':'1',
      'BranchName':'مدينتي',
    },
    {
      'id':'1',
      'BranchName': 'الشروق',
    },
    {
      'id':'1',
      'BranchName': 'الرحاب',
    },
    {
      'id':'1',
      'BranchName': 'المقطم',
    },
    {
      'id':'1',
      'BranchName': 'اللاسلكي',
    },
    {
      'id':'1',
      'BranchName':  'دجله',
    },
    {
      'id':'1',
      'BranchName': 'معادي الزراعي',
    },
    {
      'id':'1',
      'BranchName':'سموحه',
    },
    {
      'id':'1',
      'BranchName': 'زيزينيا',
    },
    {
      'id':'1',
      'BranchName': 'لوران',
    },
    {
      'id':'1',
      'BranchName': 'رشدي',
    },
    {
      'id':'1',
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
   'cateImage':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
  },
    {
      'cateName':'NESQUIK',
      'cateImage':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'cateName':'WATER',
      'cateImage':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  final List<String> bonjornoSub=[
    'Bon.Mixes',
    'Bon.Cappuuccino',
  ];
  var BonMixItems=[
    {
      'name':'khamsina2in1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'2in1',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg',
    },
    {
      'name':'2in1Hazelnut',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg',
    }
  ];
  var BonCappItems=[
    {
      'name':'mocha',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'latte',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'vanilla',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  final List<String> nesquikSub=[
    'Powder',
    'RTD',
  ];
  var NesPowderItems=[
    {
      'name':'NESQUIK 880g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'NESQUIK 330g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'NESQUIK 154g ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  var NesRTDItems=[
    {
      'name':'Chocolate RTD ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'Strawbery Milk RTD ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];
  final List<String> waterSub=[
    'Water',
  ];
  var waterItems=[
    {
      'name':'Baraka 1 L',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'Baraka 0.6 L ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
    {
      'name':'Baraka Shrink 6 L ',
      'imgUrl':'https://www.nestle.com/sites/default/files/flickr-nestle-corporate-logo-2020.jpg'
    },
  ];


  List<String> subCategory = [];
  var items;
  String selectedCategory;
  String selectedSubCategory;


  void onChangedSecondCallback(cate) {
    if (cate == 'BONJORNO') {
      subCategory = bonjornoSub;
    } else if (cate == 'NESQUIK') {
      subCategory = nesquikSub;
    } else if (cate == 'WATER') {
      subCategory = waterSub;
    } else {
      subCategory = [];
    }
      selectedSubCategory = null;
      selectedCategory = cate;
      notifyListeners();
  }
  void onChangedThiredCallback(subCate) {
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
  }
}