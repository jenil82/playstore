import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../gane/tab1/view/view.dart';
import '../../gane/tab2/view/topview.dart';
import '../../view/appscreen.dart';
import '../provider/bases_provider.dart';

class Basescreen extends StatefulWidget {
  const Basescreen({Key? key}) : super(key: key);

  @override
  State<Basescreen> createState() => _BasescreenState();
}

Baseprovider? baseprovider;
Baseprovider? baseproviderTrue;

class _BasescreenState extends State<Basescreen> {
  @override
  Widget build(BuildContext context) {
    baseprovider = Provider.of(context, listen: false);
    baseproviderTrue = Provider.of(context, listen: true);

    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(
                      bottom: BorderSide(color: Colors.black12),
                    ),
                  ),
                  child: TabBar(
                    indicatorColor: Colors.green,
                    tabs: [
                      Tab(
                        child: Text(
                          "For you",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Top chart",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 583,
                  width: double.infinity,
                  child: TabBarView(
                    children: [
                      baseproviderTrue!.navigationClick
                          ? Foryouscreen()
                          : Appliactionscreen(),
                      Topviewscreen(),
                      Foryouscreen(),

                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: SingleChildScrollView(
            child: BottomNavigationBar(
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey.shade600,
              backgroundColor: Colors.black,
              currentIndex: baseproviderTrue!.i,
              onTap: (value) {
                baseprovider!.navigationPosition(value);
                baseproviderTrue!.navigationOnClick();
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.sports_esports,
                      color: Colors.white,
                    ),
                    label: "Games",
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.theaters,
                      color: Colors.white,
                    ),
                    label: "movies",
                    backgroundColor: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
