import 'package:basic_banking_app/cubit/cubit/cubit.dart';
import 'package:basic_banking_app/cubit/states/states.dart';
import 'package:basic_banking_app/modules/users/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class BankLayoutScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BankCubit()..CreateDataBase(),
      child: BlocConsumer<BankCubit,BankStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return  Scaffold(
            appBar: AppBar(
              title: Text('Bank App'),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.cyan,
                      child: Image(
                          image:
                          NetworkImage(
                              'https://media.gettyimages.com/id/79989024/photo/visa-plans-largest-ipo-in-u-s-history.webp?s=2048x2048&w=gi&k=20&c=wAm6Ks1KU92Wm0_tqGSVFDVKOYzYLzGH5cayaqeVamY=')),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UsersScreen()),
                        );
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:40 ,vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.people_alt_rounded,size: 30,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Show All Users',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }

}
