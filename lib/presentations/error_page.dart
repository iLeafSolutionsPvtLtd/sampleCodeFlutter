import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ErrorType { noInternet, serverError }

class ErrorView extends StatelessWidget {
  final ErrorType errorType;
  final Function didSelectReload;

  const ErrorView({Key key, this.errorType, this.didSelectReload})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return errorType == ErrorType.noInternet
        ? Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/error.png"),
                  ),
                ),
                Text("No internet available."),
                CupertinoButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Try again",
                          style: TextStyle(color: Colors.green),
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.green,
                        )
                      ],
                    ),
                    onPressed: () {
                      didSelectReload();
                    })
              ],
            )),
          )
        : Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/error.png"),
                  ),
                ),
                Text("Something went wrong."),
                CupertinoButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Try again",
                          style: TextStyle(color: Colors.green),
                        ),
                        Icon(
                          Icons.refresh,
                          color: Colors.green,
                        )
                      ],
                    ),
                    onPressed: () {
                      didSelectReload();
                    })
              ],
            )),
          );
  }
}
