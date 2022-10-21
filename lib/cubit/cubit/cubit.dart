import 'package:basic_banking_app/cubit/states/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class BankCubit extends Cubit<BankStates>{
  BankCubit(): super(BankInitialState());
  static BankCubit get(context)=>BlocProvider.of(context);

   late Database database;
   List<Map<String,dynamic>> usersData = [];

  var list ;

  void CreateDataBase() async
  {
     database = await openDatabase(
        'balance.db',version: 1,
      onCreate: (database, version) {
        database.execute('CREATE TABLE balance (id INTEGER PRIMARY KEY , name TEXT , email TEXT, money TEXT)').then((value) {print('Table Created');}
        ).catchError((error){print('error when creating table ${error.toString()}');});
      },
      onOpen: (database) {
          GetDataFromDataBase(database);
          emit(OpenBankDataBaseState());

          //InsertToDataBase(database);
          print('DataBase Opened');
      },
    ).then((value) {
       // usersData = value as List<Map<String, dynamic>> ;
      return database =value;
      emit(OpenBankDataBaseState());
     });
  }


   InsertToDataBase() async
  {
      database.transaction((txn)async{
        int id1 = await txn.rawInsert(
            'INSERT INTO balance (name,email ,money ) VALUES("Micheal Jordain", "michealj23@gmail.com", "753,000")');
        print('inserted1: $id1');
        GetDataFromDataBase(database);
        emit(InsertBankDataBaseState());


  });
  }



  void GetDataFromDataBase(database)async
  {
    usersData =[];
    usersData = await database.rawQuery('SELECT * FROM balance');
    print(usersData);
    emit(GetBankDataBaseState());


    // List<Map> expectedList = [
    //   {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
    //   {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
    // ];
    // print(list);
    // print(expectedList);
    // assert(const DeepCollectionEquality().equals(list, expectedList));

  }
}