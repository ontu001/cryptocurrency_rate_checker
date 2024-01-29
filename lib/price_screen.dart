// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:crypto_tracker_starter/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }
  String SelectedCurrency = "USD";
  int rate =0;




  List <DropdownMenuItem> getCurrencyItem(){
    List <DropdownMenuItem> dropDownMenu = [];
    for(String currency in currenciesList){
      dropDownMenu.add(
        DropdownMenuItem(child: Text(currency),value: currency,),
      );
    }

    return dropDownMenu;
  }

  void fetchdata()async{
    Response response = await get(Uri.parse("https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=F01AC99C-84BF-44FF-9227-6493587AFEEE"));
    if( response.statusCode==200){
      var result = jsonDecode(response.body);
      setState(() {
        double rt = result['rate'];
        rate = rt.toInt();
      });


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Crypto Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                width: 400,
                child: Card(
                  color: Colors.deepOrangeAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $rate $SelectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),



              SizedBox(
                width: 400,
                child: Card(
                  color: Colors.deepOrangeAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ? USD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),



              SizedBox(
                width: 400,
                child: Card(
                  color: Colors.deepOrangeAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = ? USD',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              color: Colors.black87,
            ),
            child: DropdownButton(
              items: getCurrencyItem(),
              value: SelectedCurrency,
              onChanged: (value){
                setState(() {
                  SelectedCurrency = "$value";
                });

              },

            ),
          ),
        ],
      ),
    );
  }
}
