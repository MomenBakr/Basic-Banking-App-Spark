import 'package:basic_banking_app/cubit/cubit/cubit.dart';
import 'package:basic_banking_app/cubit/states/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferMoneyScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BankCubit(),
      child: BlocConsumer<BankCubit,BankStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('User Account '),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Username :',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  const SizedBox(height: 30,),
                  const Text('Email :',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),

                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        print('${value}\$ Transferred Successfuly  ');
                      },
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: '10000',
                        prefixIcon: Icon(Icons.attach_money_outlined,color: Colors.green),
                        labelText: 'Transfer Now',
                        prefixIconColor: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
