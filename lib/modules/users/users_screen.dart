import 'package:basic_banking_app/components/components.dart';
import 'package:basic_banking_app/cubit/cubit/cubit.dart';
import 'package:basic_banking_app/cubit/states/states.dart';
import 'package:basic_banking_app/modules/transfer/transfer_money_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {

  List<Map<String,dynamic>> usersData = [];
  @override
  Widget build(BuildContext context) {
      var  indexx;
    return BlocProvider(
      create: (BuildContext context) => BankCubit()..usersData,
      child: BlocConsumer<BankCubit,BankStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var list = usersData;

          return Scaffold(
            appBar: AppBar(
              title: Text('Users'),
              // actions: [
              //   IconButton(onPressed: (){
              //     print(BankCubit.get(context).usersData);
              //
              //   }, icon: Icon(Icons.add)),
              // ],
            ),
            body: ListView.separated(
                itemBuilder: (context, index) {
                  indexx = index;
                 return InkWell(
                    onTap: (){
                      navigateTo(context, TransferMoneyScreen());
                    },
                    child:   Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('${indexx+1}',style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo
                            ),),
                          ),
                          Icon(
                            Icons.person,
                            size: 35,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'User Name',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'User Email',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            '1000000\$',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );

                },
                separatorBuilder: (context, index) => Container(height: 1,color: Colors.black12,),
                itemCount: 10),

          );
        },
      ),
    );
  }
}
