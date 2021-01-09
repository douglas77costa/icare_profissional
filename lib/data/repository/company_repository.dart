import 'package:hive/hive.dart';
import 'package:icare_profissional/data/model/company/company.dart';
import 'package:icare_profissional/util/constants.dart';

class CompanyRepository{

  static Future<Company> saveCompany(Company company)async{
    var dbCompany = await Hive.openBox<Company>(Constants.BD_COMPANY);
    await dbCompany.clear();
    await dbCompany.put(company.id, company);
    return company;
  }

  static Future<List<Company>> allCompany()async{
    var dbCompany = await Hive.openBox<Company>(Constants.BD_COMPANY);
    return dbCompany.values.toList();
  }

  static Future<Company> getCompany()async{
    var dbCompany = await Hive.openBox<Company>(Constants.BD_COMPANY);
    return dbCompany.values.toList().first;
  }
}