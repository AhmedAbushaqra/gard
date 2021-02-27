import 'package:flutter/material.dart';
import 'package:gard/models/chainModel.dart';

class Chains with ChangeNotifier {
  List<Chain> _chains = [];

  List<Chain> get chains {
    return [..._chains];
  }


  final List<String> places = [
    'Carrefour',
    'Carrefour Express',
    'Hipper one',
    'Spinneys',
    'Seoudi',
    'Ragab sons',
    'Metro',
  ];
  final List<String> Carrefour = [
    'المعادى',
    "مول مصر",
    "CFC",
    "الماظه",
    "داندى مول",
    "العبور",
    "صن ستى",
    "الشروق",
    "مدينتى",
    "محرم بك",
    "العروبه",
    "ستى لايت",
    "طنطا",
    "مراكز",
  ];
  final List<String> CarrefourExpress = [
    'دمشق',
    'الزيتون',
    'سرايا مول',
    'بفرلى هيلز',
    'الجزيره مول',
    'المحافظه',
    'دولفن مول',
    'مشعل',
    'زيزينيا مول',
    'شبرا',
    'طيبه مول',
    'ميفيدا',
    'ميراج',
    'الرحاب',
    'الحمد',
    'ميجا',
    'داون تاون',
    'حلوان',
    'الاسمرات',
    'المقطم',
    'اعمار',
    'دجله',
    'البارون',
    'مايو 15',
    'الجزائر',
    'طره',
    'ونجت',
    'المنتزه',
    'كفر عبده',
    'جرين بلازا',
    'محطة الرمل',
    'الملتقى',
    'زكى رجب - الابراهيميه',
    'الهانوفيل',
    'دمنهور',
    'المنصورة',
  ];
  List<String> HipperOne = [
    'العاشر من رمضان',
    'زايد',
    'السليمانيه',
  ];
  List<String> Spinneys = [
    'ارينا مول',
    'سيتى سكيب',
    'مول العرب',
    'الهرم',
    'زايد',
    'الشروق',
    'التجمع الخامس',
    'المقطم',
    'سموحة',
  ];
  List<String> Seoudi = [
    'سيتى ستارز',
    'واتر واى',
    'الشيخ زايد',
    'التجمع الخامس',
    'شيراتون',
    'حسنين هيكل',
    'دريم',
    'روكسى',
    'سوديك',
    'االدقى',
    'الحجاز',
    'الحكمه',
    'سفنكس',
    'الطيران',
    'المعادى',
    'دجله',
  ];
  List<String> RagabSons = [
    'التجنيد',
    'الزيتون',
    'النعام',
    'جسر السويس',
    'الفتح',
    'ألف مسكن',
    'الميرغنى 2',
    'الميرغنى 1',
    'النزهه',
    'حدائق القبه',
    'الظاهر',
    'المطار',
    'الحجاز',
    'فيصل الاطباء',
    'الطالبية',
    'ناصر الثورة',
    'الوفاء والامل',
    'الحصري',
    'مول فايف ستارز',
    'الملكه',
    'الجيزة',
    'المجزر',
    'حدائق الأهرام',
    'السيدة',
    'يلبغا',
    'أحمد فخري',
    'الفنجري',
    'الحي الثامن',
    'الحي العاشر',
    'مصطفى النحاس',
    'وندر لاند',
    'التجمع الأول',
    'مدينتي 1',
    'مدينتي 2',
    'الشباب',
    'المدينة',
    'الرحاب',
    'التجمع الخامس',
    'حدائق حلوان',
    'حلوان',
    'رياض باشا',
    'شريف باشا',
    'المقطم 1',
    'اللاسلكي',
    'المقطم 2',
    'الجزائر',
    'المندرة',
    'الاستاد',
    'سامية الجمل',
    'قناة السويس',
  ];
  List<String> Metro = [
    'روكسي',
    'الخليفه المأمون',
    'عمار بن ياسر',
    'شيراتون',
    'العريش',
    'المنيل',
    'كوبري الجامعة',
    'مصدق',
    'الثورة',
    'المساحة',
    'سوريا',
    'الزمالك',
    'جامعة الدول',
    'لبنان',
    'النادي الاهلي',
    'جنينه مول',
    'مدينتي',
    'الشروق',
    'الرحاب',
    'المقطم',
    'اللاسلكي',
    'دجله',
    'معادي الزراعي',
    'سموحه',
    'زيزينيا',
    'لوران',
    'رشدي',
    'المنصورة',
  ];
  List<String> branches = [];
  String selectedPlace;
  String selectedBranch;




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
}