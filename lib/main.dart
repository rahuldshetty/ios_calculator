import 'package:flutter/material.dart';

void main() => runApp(new IosCloneCalculator());

class IosCloneCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: new IosCloneCalc(),
    );
  }
}

class IosCloneCalc extends StatefulWidget {
  IosCloneState createState() => IosCloneState();
}

class IosCloneState extends State<IosCloneCalc> {
  dynamic text = '0';

  dynamic history='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic historyText='';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black12,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  history,
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.clip,
                )
                    ,
                )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 60.0),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              btn('C', const Color(0xffa5a5a5), Colors.black45),
              btn('+/-', const Color(0xffa5a5a5), Colors.black45),
              btn('%', const Color(0xffa5a5a5), Colors.black45),
              btn('/', Colors.orange, Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              btn('7', const Color(0xff333333), Colors.white),
              btn('8', const Color(0xff333333), Colors.white),
              btn('9', const Color(0xff333333), Colors.white),
              btn('x', Colors.orange, Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              btn('4', const Color(0xff333333), Colors.white),
              btn('5', const Color(0xff333333), Colors.white),
              btn('6', const Color(0xff333333), Colors.white),
              btn('-', Colors.orange, Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              btn('1', const Color(0xff333333), Colors.white),
              btn('2', const Color(0xff333333), Colors.white),
              btn('3', const Color(0xff333333), Colors.white),
              btn('+', Colors.orange, Colors.white)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              zeroBtn('0', const Color(0xff333333), Colors.white),
              btn('.', const Color(0xff333333), Colors.white),
              btn('=', Colors.orange, Colors.white)
            ],
          )
        ],
      ),
    );
  }

  Widget btn(btnText, Color colors, Color txtcolor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: new RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(fontSize: 30.0, color: txtcolor),
        ),
        onPressed: () {calculation(btnText);},
        color: colors,
        padding: EdgeInsets.all(22.0),
        shape: CircleBorder(),
      ),
    );
  }

  Widget zeroBtn(btnText, Color colors, Color txtcolor) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: new RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(fontSize: 30.0, color: txtcolor),
        ),
        onPressed: () {calculation(btnText);},
        color: colors,
        padding:
            EdgeInsets.only(left: 85.0, top: 20.0, right: 85.0, bottom: 20.0),
        shape: StadiumBorder(),
      ),
    );
  }

  void calculation(btnText) {
    if (btnText == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      opr = '';
      historyText='';
      preOpr = '';
    }
    else if(btnText=="+/-")
      {
        finalResult=(0-double.parse(result)).toString();
        result=finalResult;
      }
    else if (btnText == '=' ) {
      numTwo = double.parse(finalResult);
      if(preOpr=='+')
      {
          finalResult = (numOne + numTwo).toString() ;
      }
      else  if(preOpr=='-')
      {
        finalResult = (numOne - numTwo).toString() ;
      }
      else  if(preOpr=='x')
      {
        finalResult = (numOne * numTwo).toString() ;
      }

      else  if(preOpr=='/')
      {
        finalResult = (numOne  / numTwo).toString() ;
      }

      else  if(preOpr=='%')
      {
        finalResult = (numOne % numTwo).toString() ;
      }

      result = finalResult;
      preOpr='';

    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '%') {


      if(preOpr=='')
      {
          numOne = double.parse(result);
          preOpr = btnText;
          result='';
          finalResult = '';
      }
      else{

        if(preOpr=='+')
        {
          numOne = (numOne + double.parse(result)) ;
        }
        else  if(preOpr=='-')
        {
          numOne = (numOne - double.parse(result)) ;
        }
        else  if(preOpr=='x')
        {
          numOne = (numOne * double.parse(result)) ;
        }

        else  if(preOpr=='/')
        {
          numOne = (numOne / double.parse(result)) ;
        }

        else  if(preOpr=='%')
        {
          numOne = (numOne % double.parse(result)) ;
        }

        preOpr = btnText;
        result='';
        finalResult = '';


      }



    } else if(btnText!='+/-'){
      result = result + btnText;
      finalResult  = result;
    }


    if(btnText!='C' && btnText!='+/-')
    historyText += btnText;

    setState( (){
         text = finalResult;
         history=historyText;
    });

  }
}
