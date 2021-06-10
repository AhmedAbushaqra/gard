//id,branchid,catename,company,ItemName,mainprice,pormotionreason,pormotiontype,pormotiondetail,startdate,enddate
class dbCompOfferData{
  int id;
  String branchid;
  String catename;
  String company;
  String itemname;
  String MainPrice;
  String PormotionReason;
  String pormotiontype;
  String PormotionDetails;
  String startdate;
  String enddate;

  dbCompOfferData({
    this.id,
    this.branchid,
    this.catename,
    this.company,
    this.itemname,
    this.MainPrice,
    this.PormotionReason,
    this.pormotiontype,
    this.PormotionDetails,
    this.startdate,
    this.enddate,
  });
  factory dbCompOfferData.fromjson(dynamic obj){
    return dbCompOfferData(
        id: obj['id'],
        branchid:  obj['branchid'].toString(),
        catename: obj['catename'].toString(),
        company: obj['company'].toString(),
        itemname:obj['itemname'].toString(),
        MainPrice: obj['mainprice'].toString(),
        PormotionReason: obj['pormotionreason'].toString(),
        pormotiontype: obj['pormotiontype'].toString(),
        PormotionDetails: obj['pormotiondetail'].toString(),
        startdate: obj['startdate'].toString(),
        enddate: obj['enddate'].toString()
    );
  }
  dbCompOfferData.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid = data['branchid'];
    catename=data['catename'];
    company=data['company'];
    itemname=data['itemname'];
    MainPrice=data['mainprice'];
    PormotionReason=data['pormotionreason'];
    pormotiontype =data['pormotiontype'];
    PormotionDetails=data['pormotiondetail'];
    startdate=data['startdate'];
    enddate=data['enddate'];
  }
  Map<String, dynamic> toMap() => {'id' : id, 'branchid': branchid,'catename':catename,'company':company,'itemname':itemname, 'mainprice':MainPrice,
    'pormotionreason':PormotionReason,'pormotiontype':pormotiontype,'pormotiondetail':PormotionDetails,'startdate':startdate,'enddate':enddate };
}