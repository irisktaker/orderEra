import 'package:flutter/material.dart';
import 'package:orderera_dio_http/ui/views/select_language_screen/select_language_screen.dart';
import 'package:orderera_dio_http/ui/views/welcome_screen/welcome_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final WelcomeBloc _bloc = WelcomeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.callRequest();
  }

  void callSelectedLanguageScreen() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
        return SelectedLanguageScreen();
      }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: StreamBuilder<bool>(
        stream: _bloc.isLoadingStream.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          if (snapshot.hasData && snapshot.data) {
            callSelectedLanguageScreen();
          }

          return snapshot.hasData
              ? snapshot.data
                  ? Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    )
                  : Container()
              : Container();
        },
      ),
    );
  }
}
