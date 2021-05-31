class dbExpireData{
  int id;
  String branchid;
  String chain;
  String branch;
  String itemnum;
  String catename;
  String subcatename;
  String itemname;
  String count;
  String itemtype;
  String expirydate;

  dbExpireData({
    this.id,
    this.branchid,
    this.chain,
    this.branch,
    this.itemnum,
    this.catename,
    this.subcatename,
    this.itemname,
    this.count,
    this.itemtype,
    this.expirydate
  });
  factory dbExpireData.fromjson(dynamic obj){
    return dbExpireData(
      id: obj['id'],
      branchid:  obj['branchid'].toString(),
      chain: obj['chain'].toString(),
      branch: obj['branch'].toString(),
      itemnum: obj['itemnum'].toString(),
      catename: obj['catename'].toString(),
      subcatename: obj['subcatename'].toString(),
      itemname:obj['itemname'].toString(),
      count: obj['count'].toString(),
      itemtype: obj['itemtype'].toString(),
      expirydate: obj['expirydate'].toString(),
    );
  }
  dbExpireData.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid = data['branchid'];
    chain = data['chain'];
    branch=data['branch'];
    itemnum =data['itemnum'];
    catename=data['catename'];
    subcatename=data['subcatename'];
    itemname=data['itemname'];
    count=data['count'];
    itemtype=data['itemtype'];
    expirydate =data['expirydate'];
  }
  Map<String, dynamic> toMap() => {'id' : id, 'branchid': branchid,'chain': chain, 'branch':branch, 'itemnum':itemnum
    ,'catename':catename,'subcatename':subcatename,'itemname':itemname, 'count':count,'itemtype':itemtype,'expirydate':expirydate };
}