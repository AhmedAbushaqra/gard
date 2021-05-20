class dbExtraData{
  int id;
  String branchid;
  String date;
  String chain;
  String branch;
  String type;
  String capacity;
  String faces;
  String situation;
  String condition;


  dbExtraData({
    this.id,
    this.branchid,
    this.date,
    this.chain,
    this.branch,
    this.type,
    this.capacity,
    this.faces,
    this.situation,
    this.condition,
  });
  factory dbExtraData.fromjson(dynamic obj){
    return dbExtraData(
      id: obj['id'],
      branchid:  obj['branchid'].toString(),
      date: obj['date'].toString(),
      chain: obj['chain'].toString(),
      branch: obj['branch'].toString(),
      type: obj['type'].toString(),
      capacity: obj['capacity'].toString(),
      faces: obj['faces'].toString(),
      situation:obj['situation'].toString(),
      condition: obj['condition'].toString(),
    );
  }
  dbExtraData.fromMap(Map<String, dynamic> data){
    id = data['id'];
    branchid = data['branchid'];
    date =data['date'];
    chain = data['chain'];
    branch=data['branch'];
    type =data['type'];
    capacity=data['capacity'];
    faces=data['faces'];
    situation=data['situation'];
    condition=data['condition'];
  }
  Map<String, dynamic> toMap() => {'id' : id, 'branchid': branchid,'date' : date,'chain': chain, 'branch':branch, 'type':type
    ,'capacity':capacity,'faces':faces,'situation':situation, 'condition':condition, };
}