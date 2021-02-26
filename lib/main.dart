import 'package:gard/category.dart';
import 'package:flutter/material.dart';
import 'package:gard/selectItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        category.RouteName:(ctx)=>category(),
        //selectItem.RouteName:(ctx)=>selectItem(),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.3,
            child: ListView(
              children: [
                Container(
                  height: 65,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Chain',
                      labelStyle: Theme.of(context)
                          .primaryTextTheme
                          .caption
                          .copyWith(color: Colors.black,fontSize: 18),
                      border: const OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        /// place dropdown
                        hint: Text('Select Place'),
                        value: selectedPlace,
                        isExpanded: true,
                        items: places.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: onChangedCallback,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 65,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Branch',
                      labelStyle: Theme.of(context)
                          .primaryTextTheme
                          .caption
                          .copyWith(color: Colors.black,fontSize: 18),
                      border:  OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        /// branch dropdown
                        hint: Text('Select branch'),
                        isExpanded: true,
                        value: selectedBranch,
                        items: branches.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (branch) {
                          setState(() {
                            selectedBranch = branch;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.of(context).pushNamed(category.RouteName);
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
    );
  }

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
    setState(() {
      selectedBranch = null;
      selectedPlace = place;
    });
  }
}
