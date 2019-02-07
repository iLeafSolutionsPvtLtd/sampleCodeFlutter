import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/containers/app_error.dart';
import 'package:sewer_vewier/containers/app_loading.dart';
import 'package:sewer_vewier/models/login_request_model.dart';
import 'package:sewer_vewier/models/models.dart';
import 'package:sewer_vewier/presentations/error_page.dart';
import 'package:sewer_vewier/redux/actions.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return Scaffold(
            body: AppLoading(builder: (context, loading) {
              return ModalProgressHUD(
                inAsyncCall: loading,
                child: SafeArea(
                  child: AppError(
                    builder: (context, isError) => isError
                        ? ErrorView(
                            errorType: ErrorType.serverError,
                          )
                        : ListView(
                            children: <Widget>[
                              Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                          color: Colors.green,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Image(
                                            image: AssetImage('assets/bg.png'),
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(19.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(child: Container()),
                                            Container(
                                                child: Image(
                                              image:
                                                  AssetImage('assets/logo.png'),
                                              fit: BoxFit.cover,
                                            )),
                                            Text(
                                              "User name",
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                color: const Color(0xffffffff),
                                                fontWeight: FontWeight.w700,
                                                fontFamily: "GoogleSans",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16.2,
                                              ),
                                            ),
                                            TextField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0x80ffffff),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "GoogleSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13.0),
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  Color.fromRGBO(
                                                                      222,
                                                                      222,
                                                                      222,
                                                                      1.0))),
                                                  hintText: 'Email',
                                                  hintStyle: TextStyle(
                                                      color: const Color(
                                                          0x80ffffff),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "GoogleSans",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 13.0)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 44),
                                              child: Text("Password",
                                                  style: const TextStyle(
                                                      color: const Color(
                                                          0xffffffff),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "GoogleSans",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 16.2)),
                                            ),
                                            TextField(
                                              obscureText: true,
                                              style: TextStyle(
                                                  color:
                                                      const Color(0x80ffffff),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "GoogleSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 13.0),
                                              decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color:
                                                                  Color.fromRGBO(
                                                                      222,
                                                                      222,
                                                                      222,
                                                                      1.0))),
                                                  hintText: 'Password',
                                                  hintStyle: TextStyle(
                                                      color: const Color(
                                                          0x80ffffff),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "GoogleSans",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 13.0)),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 0.0),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(),
                                                  ),
                                                  CupertinoButton(
                                                      child: Text(
                                                          "Forgot password ?",
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: const TextStyle(
                                                              color: const Color(
                                                                  0xffffffff),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "GoogleSans",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 11.3)),
                                                      onPressed: () {
                                                        print('pressed');
                                                        vm.updateLoadingStatus(
                                                            vm.isLoading);
                                                      })
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 78),
                                              child: Center(
                                                child: ButtonTheme(
                                                  buttonColor: Color.fromRGBO(
                                                      224, 235, 241, 1.0),
                                                  height: 48.3,
                                                  minWidth: 257.7,
                                                  child: RaisedButton(
                                                    onPressed: () {
                                                      vm.getUserDetails(
                                                          LoginRequest(
                                                              password: "",
                                                              email: ""));
                                                    },
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.15)),
                                                    child: Text("Login",
                                                        style: const TextStyle(
                                                            color: const Color(
                                                                0xff284dbe),
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                "GoogleSans",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 16.7)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                  ),
                ),
              );
            }),
          );
        });
  }
}

class _ViewModel {
  final bool isLoading;
  final bool isError;
  final Function(LoginRequest) getUserDetails;
  final Function(bool) updateLoadingStatus;
  final Function(bool) updateErrorStatus;

  _ViewModel({
    @required this.isLoading,
    @required this.isError,
    this.getUserDetails,
    @required this.updateLoadingStatus,
    @required this.updateErrorStatus,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        isLoading: store.state.isLoading,
        isError: store.state.isError,
        updateLoadingStatus: (status) {
          store.dispatch(UpdateLoadingStatus(!status));
        },
        updateErrorStatus: (status) {
          store.dispatch(UpdateErrorStatus(!status));
        },
        getUserDetails: (request) {
          store.dispatch(LoginUserAction(request));
        });
  }
}
