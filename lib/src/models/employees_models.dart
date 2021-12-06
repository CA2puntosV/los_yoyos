class Employee {
  String address;
  String companyName;
  List employees = [];
  int? id;
  String name;
  String position;
  int wage;

  Employee({
    required this.address,
    required this.companyName,
    required this.employees,
    this.id,
    required this.name,
    required this.position,
    required this.wage,
  });
}
