import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:redux/redux.dart';
import 'package:sewer_vewier/actions/login_user_action.dart';
import 'package:sewer_vewier/containers/app_error.dart';
import 'package:sewer_vewier/containers/app_loading.dart';
import 'package:sewer_vewier/containers/email_container.dart';
import 'package:sewer_vewier/containers/password_container.dart';
import 'package:sewer_vewier/models/app_state.dart';
import 'package:sewer_vewier/models/loading_status.dart';
import 'package:sewer_vewier/models/login_request_model.dart';
import 'package:sewer_vewier/presentations/error_page.dart';
import 'package:sewer_vewier/strings.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  FocusNode _emailNode = new FocusNode();
  FocusNode _passNode = new FocusNode();

  AnimationController _controllerAnim;
  Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controllerAnim = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _animation = new Tween(begin: 200.0, end: 0.0).animate(
      new CurvedAnimation(
        parent: _controllerAnim,
        curve: Curves.ease,
      ),
    );
    _emailNode.addListener(() {
      setState(() {});
    });
    _passNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        onInit: (store) {
          // do token check here
          _animation.addStatusListener((status) {
            if (status == AnimationStatus.dismissed ||
                status == AnimationStatus.completed) {
              //store.dispatch(new ChangeScreenStateAction(ScreenState.SINGIN));
            }
          });
          _animation.addListener(() {
            setState(() {});
          });
          _controllerAnim.forward();
        },
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return Scaffold(
            body: AppLoading(builder: (context, loadingStatus) {
              print('in builder');
              print(loadingStatus);
              return ModalProgressHUD(
                inAsyncCall: loadingStatus == LoadingStatus.loading,
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
                                            EmailValidator(builder:
                                                (context, isEmailValid) {
                                              print(
                                                  'email error status in builder');
                                              print(isEmailValid);
                                              return TextField(
                                                onChanged: (text) {
                                                  vm.validateEmail(text);
                                                },
                                                controller: _emailController,
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
                                                    errorText: isEmailValid
                                                        ? null
                                                        : email_error,
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
                                                        fontFamily:
                                                            "GoogleSans",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 13.0)),
                                              );
                                            }),
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
                                            PasswordValidator(
                                              builder:
                                                  (context, isPasswordValid) {
                                                return TextField(
                                                  controller: _passController,
                                                  obscureText: true,
                                                  style: TextStyle(
                                                      color: const Color(
                                                          0x80ffffff),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "GoogleSans",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 13.0),
                                                  decoration: InputDecoration(
                                                      errorText: isPasswordValid
                                                          ? null
                                                          : "Invalid password.",
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
                                                          fontFamily:
                                                              "GoogleSans",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 13.0)),
                                                );
                                              },
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
                                                        //  vm.updateLoadingStatus(
                                                        // loading);
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
                                                              password:
                                                                  _passController
                                                                      .text,
                                                              email:
                                                                  _emailController
                                                                      .text));
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
  final emailErrorMessage;
  final Function(LoginRequest) getUserDetails;
  final Function(String) validateEmail;
  final Function(String) validatePassword;
  _ViewModel(
      {this.getUserDetails,
      this.validateEmail,
      this.validatePassword,
      this.emailErrorMessage});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        getUserDetails: (request) {
          store.dispatch(LoginUserAction(request));
        },
        validateEmail: (email) {
          store.dispatch(ValidateEmailAction(email));
        },
        emailErrorMessage: store.state.authState.passwordErrorMessage);
  }
}
