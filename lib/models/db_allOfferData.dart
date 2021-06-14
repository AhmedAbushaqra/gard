class dbAllOfferData{
  int id;
  String branchid;
  String chain;
  String branch;
  String itemnum;
  String catename;
  String subcatename;
  String subBrand;
  String itemname;
  String MainPrice;
  String PormotionReason;
  String pormotiontype;
  String PormotionDetails;
  String startdate;
  String enddate;
  String compid;
  String compcatename;
  String company;
  String compitemname;
  String compMainPrice;
  String compPormotionReason;
  String comppormotiontype;
  String compPormotionDetails;
  String compstartdate;
  String compenddate;

  dbAllOfferData({
    this.id,
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
    this.compid,
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
  factory dbAllOfferData.fromjson(dynamic obj){
    return dbAllOfferData(
        id: obj['id'],
        branchid:  obj['branchid'].toString(),
        chain: obj['chain'].toString(),
        branch: obj['branch'].toString(),
        itemnum: obj['itemnum'].toString(),
        catename: obj['catename'].toString(),
        subcatename: obj['subcatename'].toString(),
        subBrand: obj['subbrand'].toString(),
        itemname:obj['itemname'].toString(),
        MainPrice: obj['mainprice'].toString(),
        PormotionReason: obj['pormotionreason'].toString(),
        pormotiontype: obj['pormotiontype'].toString(),
        PormotionDetails: obj['pormotiondetail'].toString(),
        startdate: obj['startdate'].toString(),
        enddate: obj['enddate'].toString(),
        compid: obj['compid'].toString(),
        compcatename: obj['compcatename'].toString(),
        company: obj['company'].toString(),
        compitemname: obj['compitemname'].toString(),
        compMainPrice: obj['compMainPrice'].toString(),
        compPormotionReason: obj['compPormotionReason'].toString(),
        comppormotiontype: obj['comppormotiontype'].toString(),
        compPormotionDetails: obj['compPormotionDetails'].toString(),
        compstartdate: obj['compstartdate'].toString(),
        compenddate: obj['compenddate'].toString(),
    );
  }
  dbAllOfferData.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid = data['branchid'];
    chain = data['chain'];
    branch=data['branch'];
    itemnum =data['itemnum'];
    catename=data['catename'];
    subcatename=data['subcatename'];
    subBrand=data['subbrand'];
    itemname=data['itemname'];
    MainPrice=data['mainprice'];
    PormotionReason=data['pormotionreason'];
    pormotiontype =data['pormotiontype'];
    PormotionDetails=data['pormotiondetail'];
    startdate=data['startdate'];
    enddate=data['enddate'];
    compid=data['compid'];
    compcatename=data['compcatename'];
    company=data['company'];
    compitemname=data['compitemname'];
    compMainPrice=data['compMainPrice'];
    compPormotionReason=data['compPormotionReason'];
    comppormotiontype=data['comppormotiontype'];
    compPormotionDetails=data['compPormotionDetails'];
    compstartdate=data['compstartdate'];
    compenddate=data['compenddate'];
  }
  Map<String, dynamic> toMap() => {'id' : id, 'branchid': branchid,'chain': chain, 'branch':branch, 'itemnum':itemnum
    ,'catename':catename,'subcatename':subcatename,'subbrand':subBrand,'itemname':itemname, 'mainprice':MainPrice,
    'pormotionreason':PormotionReason,'pormotiontype':pormotiontype,'pormotiondetail':PormotionDetails,'startdate':startdate,'enddate':enddate
    ,'compid':compid, 'compcatename':compcatename, 'company':company, 'compitemname':compitemname,'compMainPrice':compMainPrice,
    'compPormotionReason':compPormotionReason, 'comppormotiontype':comppormotiontype, 'compPormotionDetails':compPormotionDetails,
    'compstartdate':compstartdate, 'compenddate':compenddate};
}