import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home/BottomNavBar.dart';



class AppOpenAdManager {

  String adUnitId = Platform.isAndroid
      ? 'ca-app-pub-8431950968120119/9468808592'
      : 'ca-app-pub-8431950968120119/5422849850';

  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;

  /// Load an AppOpenAd.
  void loadAd() {
    AppOpenAd.load(
      adUnitId: adUnitId,
      orientation: AppOpenAd.orientationPortrait,
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
    );
  }

  /// Whether an ad is available to be shown.
  bool get isAdAvailable {
    return _appOpenAd != null;
  }

  void showAdIfAvailable() {
    if (!isAdAvailable) {
      print('Tried to show ad before available.');
      loadAd();
      return;
    }
    if (_isShowingAd) {
      print('Tried to show ad while already showing an ad.');
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        print('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
      },
    );
  }
}








class Pub extends StatelessWidget {
   Pub({Key? key}) : super(key: key) {
    _initAd();
  }

  late InterstitialAd _intersitialAd;
  bool _isLoaded = false;

  void _initAd()
  {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-8431950968120119/9468808592',
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _intersitialAd = ad,
        onAdFailedToLoad: (error){}
    )
    );
  }

   void onAdLoaded(InterstitialAd ad) {
    _intersitialAd = ad;
    _isLoaded = true;


   }
   final _controller = PageController();
   bool isLastPage = false;


  @override
  Widget build(BuildContext context) => Scaffold(
     body : Container( color: const  Color(0xFFFCFFFC),
         child: PageView(

           controller: _controller,
           children: [Scaffold(
             body: Column(children : [SingleChildScrollView(child: Center(child: Container(child:ElevatedButton(onPressed: (){ if(_isLoaded){ _intersitialAd.show(); } }, child: Text("Regarder une pub 1/10"), ),),
             ),),
          ElevatedButton(onPressed: () async {Navigator.push(context, MaterialPageRoute(builder: (context) => Pub1()));}, child: Text("lel"))
           ],),)
           ],

         )
     ),
     bottomSheet: isLastPage
         ? Container(color : const Color(0xFFFCFFFC),
       padding: EdgeInsets.symmetric(horizontal: 24), height: 80,
       child: Row( mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextButton(
               style: TextButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),backgroundColor: const Color(0xFF414BB2), minimumSize: const Size.fromRadius(15.1)),
               onPressed: () async{
                 Navigator.push(context, MaterialPageRoute(builder: (context) => menu()));
               }, child: const Text("Commencer", style: TextStyle(fontSize: 24,color: Colors.white)))
         ],),)



         : Container(color :  Color(0xFFFCFFFC),
       padding: EdgeInsets.symmetric(horizontal: 24), height: 80,
       child: Row( mainAxisAlignment: MainAxisAlignment.center,
         children: [

           Center(child: SmoothPageIndicator(controller: _controller, count: 5,
             onDotClicked: (index) => _controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
           ),),


         ],
       ),

     ),
   );
}

class Pub1 extends StatelessWidget {
  Pub1({Key? key}) : super(key: key) {
    _initAd();
  }

  late InterstitialAd _intersitialAd;
  bool _isLoaded = false;

  void _initAd() {
    InterstitialAd.load(adUnitId: 'ca-app-pub-8431950968120119/9468808592',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: (error) {}
        )
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _intersitialAd = ad;
    _isLoaded = true;
  }

  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SingleChildScrollView(
          child: Center(child: Container(child: ElevatedButton(onPressed: () {
            if (_isLoaded) {
              _intersitialAd.show();
            }
          }, child: Text("Regarder une pub 1/10"),),),
          ),),
        ElevatedButton(onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Pub2()));
        }, child: Text("lel"))
      ],),);
  }

}

class Pub2 extends StatelessWidget {
   Pub2({Key? key}) : super(key: key){
    _initAd();
  }

  late InterstitialAd _intersitialAd;
  bool _isLoaded = false;

  void _initAd() {
    InterstitialAd.load(adUnitId: 'ca-app-pub-8431950968120119/9468808592',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: (error) {}
        )
    );
  }

  void onAdLoaded(InterstitialAd ad) {
    _intersitialAd = ad;
    _isLoaded = true;
  }

  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SingleChildScrollView(
          child: Center(child: Container(child: ElevatedButton(onPressed: () {
            if (_isLoaded) {
              _intersitialAd.show();
            }
          }, child: Text("Regarder une pub 1/10"),),),
          ),),
        ElevatedButton(onPressed: () async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Pub1()));
        }, child: Text("lel"))
      ],),);
  }

}