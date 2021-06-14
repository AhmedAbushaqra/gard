class OfferDataSheet {
  final String branchid;
  final String chain;
  final String branch;
  final String itemnum;
  final String catename;
  final String subcatename;
  final String subBrand;
  final String itemname;
  final String MainPrice;
  final String PormotionReason;
  final String pormotiontype;
  final String PormotionDetails;
  final String startdate;
  final String enddate;
  final String compcatename;
  final String company;
  final String compitemname;
  final String compMainPrice;
  final String compPormotionReason;
  final String comppormotiontype;
  final String compPormotionDetails;
  final String compstartdate;
  final String compenddate;

  OfferDataSheet({
    this.branchid,
    this.chain,
    this.branch,
    this.itemnum,
    this.catename,
    this.subcatename,
    this.subBrand,
    this.itemname,
    this.MainPrice,
    this.PormotionReason,
    this.pormotiontype,
    this.PormotionDetails,
    this.startdate,
    this.enddate,
    this.compcatename,
    this.company,
    this.compitemname,
    this.compMainPrice,
    this.compPormotionReason,
    this.comppormotiontype,
    this.compPormotionDetails,
    this.compstartdate,
    this.compenddate,
  });

  factory OfferDataSheet.fromJson(dynamic json) {
    return OfferDataSheet(
      branchid: json['branchid'].toString(),
      chain: json['chain'].toString(),
      branch: json['branch'].toString(),
      itemnum:json['itemnum'].toString(),
      catename:json['catename'].toString(),
      subcatename:json['subcatename'].toString(),
      subBrand:json['subBrand'].toString(),
      itemname:json['itemname'].toString(),
      MainPrice:json['mainPrice'].toString(),
      PormotionReason:json['pormotionReason'].toString(),
      pormotiontype:json['pormotiontype'].toString(),
      PormotionDetails:json['pormotionDetails'].toString(),
      startdate:json['startdate'].toString(),
      enddate:json['enddate'].toString(),
      compcatename:json['compcatename'].toString(),
      company:json['company'].toString(),
      compitemname:json['compitemname'].toString(),
      compMainPrice:json['compMainPrice'].toString(),
      compPormotionReason:json['compPormotionReason'].toString(),
      comppormotiontype:json['comppormotiontype'].toString(),
      compPormotionDetails:json['compPormotionDetails'].toString(),
      compstartdate:json['compstartdate'].toString(),
      compenddate:json['compenddate'].toString(),
    );
  }

  Map toJson() => {
    'branchid': branchid,
    'chain': chain,
    'branch': branch,
    'itemnum':itemnum,
    'catename': catename,
    'subcatename': subcatename,
    'subBrand':subBrand,
    'itemname': itemname,
    'mainPrice':MainPrice,
    'pormotionReason':PormotionReason,
    'pormotiontype':pormotiontype,
    'pormotionDetails':PormotionDetails,
    'startdate':startdate,
    'enddate':enddate,
    'compcatename':compcatename,
    'company':company,
    'compitemname':compitemname,
    'compMainPrice':compMainPrice,
    'compPormotionReason':compPormotionReason,
    'comppormotiontype':comppormotiontype,
    'compPormotionDetails':compPormotionDetails,
    'compstartdate':compstartdate,
    'compenddate':compenddate,
  };
}