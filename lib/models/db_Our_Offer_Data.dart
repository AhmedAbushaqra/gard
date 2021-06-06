class dbOurOfferData{
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

  dbOurOfferData({
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
  });
  factory dbOurOfferData.fromjson(dynamic obj){
    return dbOurOfferData(
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
      enddate: obj['enddate'].toString()
    );
  }
  dbOurOfferData.fromMap(Map<String, dynamic> data){
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
  }
  Map<String, dynamic> toMap() => {'id' : id, 'branchid': branchid,'chain': chain, 'branch':branch, 'itemnum':itemnum
    ,'catename':catename,'subcatename':subcatename,'subbrand':subBrand,'itemname':itemname, 'mainprice':MainPrice,
    'pormotionreason':PormotionReason,'pormotiontype':pormotiontype,'pormotiondetail':PormotionDetails,'startdate':startdate,'enddate':enddate };
}