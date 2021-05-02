class dbFinalData{
  int id;
  String branchid;
  String date;
  String chain;
  String branch;
  String catename;
  String subcatename;
  String itemname;
  String capacity;
  String faces;

  dbFinalData({
    this.id,
    this.branchid,
    this.date,
    this.chain,
    this.branch,
    this.catename,
    this.subcatename,
    this.itemname,
    this.capacity,
    this.faces
});
  factory dbFinalData.fromjson(dynamic obj){
    return dbFinalData(
    id: obj['id'],
    branchid:  obj['branchid'].toString(),
    date: obj['date'].toString(),
    chain: obj['chain'].toString(),
    branch: obj['branch'].toString(),
    catename: obj['catename'].toString(),
    subcatename:obj['subcatename'].toString(),
    itemname: obj['itemname'].toString(),
    capacity: obj['capacity'].toString(),
    faces: obj['faces'].toString(),
    );
  }
  dbFinalData.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid = data['branchid'];
    date =data['date'];
    chain = data['chain'];
    branch=data['branch'];
    catename =data['catename'];
    subcatename=data['subcatename'];
    itemname=data['itemname'];
    capacity=data['capacity'];
    faces=data['faces'];
  }
  Map<String, dynamic> toMap() => {'id' : id, 'branchid': branchid,'date' : date,'chain': chain, 'branch':branch, 'catename':catename
                                   ,'subcatename':subcatename, 'itemname':itemname,'capacity':capacity,'faces':faces };
}