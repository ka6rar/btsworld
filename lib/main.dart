import 'package:btsworld/audio/audios.dart';
import 'package:btsworld/curriculumvitae/curriculumvitae.dart';
import 'package:btsworld/image/fullsecraen.dart';
import 'package:btsworld/image/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  await FlutterDownloader.initialize(debug: true);
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
const String testDevice = 'YOUR_DEVICE_ID';
const int maxFailedLoadAttempts = 3;

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    _createRewardedAd();
    q
  }

  InterstitialAd? _interstitialAd;

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;


  static final AdRequest request =  AdRequest(
    keywords: <String> ['BTS', 'BTS World'],
    nonPersonalizedAds: true,
  );


  BannerAd bannerAd  =   BannerAd(
   size: AdSize.banner,
   adUnitId:  'ca-app-pub-1389909100713616/6088550647' ,
   listener:  BannerAdListener(
   onAdLoaded:  (Ad ad) {
     print('Ad Loaded');
   } ,
    onAdFailedToLoad: (Ad ad , LoadAdError error) {
     ad.dispose();
      print('Ad Failed');
    } ,
    onAdOpened: (Ad ad ) {
      print('Ad Failed');
    }
  ) ,
   request:  request


  );








  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-1389909100713616/3896968743',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts <= maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type}');
    });
    _rewardedAd = null;
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e1c36),
      appBar: AppBar(
        title: Text('الرئيسية', style: GoogleFonts.cairo()),
        centerTitle: true,
        backgroundColor: const Color(0xff0e1c36),
        elevation: 0,
      ),
      body:Stack(
        textDirection: TextDirection.rtl,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: GridView.count(
              primary: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 40,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: [
                GestureDetector(
                  onTap: ()  async {
                    _showRewardedAd();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const  Audio(),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:const [
                           Icon(
                              Icons.music_note_outlined,
                          size: 50,
                          color: Colors.amberAccent,
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber[100],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showRewardedAd();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Images(),
                    ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                         Icon(
                          Icons.image_outlined,
                          size: 50,
                          color: Colors.green,
                        ),

                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.teal[100],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showRewardedAd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CurriculumVitae(),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  const [
                         Icon(
                          Icons.person_outline,
                          size: 50,
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(8),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       const Icon(
                //         Icons.slow_motion_video_rounded,
                //         size: 50,
                //         color: Colors.redAccent,
                //       ),
                //       Text('فديوات',
                //           style: GoogleFonts.cairo(
                //               fontSize: 20, color: Colors.redAccent))
                //     ],
                //   ),
                //   decoration: BoxDecoration(
                //       color: Colors.red[100],
                //       borderRadius: BorderRadius.circular(20)),
                // )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160 , left: 8 , right: 8),
            child: Container(
                height:  100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12) ,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('img/backround.jpg' ,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                )

            ),
          ) ,
          Padding(
              padding:  const EdgeInsets.only(top: 300 , left: 8 , right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [
                  Text('التطبيق خاص في فرقة BTS' , style: GoogleFonts.cairo(color: Colors.white , fontSize: 15 )  ,
                    textDirection: TextDirection.rtl,
                  ) ,
                  Text('يضم احدث الاغاني بالفرقة ' , style: GoogleFonts.cairo(color: Colors.white , fontSize: 15 ),
                  ) ,
                  Text('يضم الصور الخاصة بالفرقة بدقة عالية' , style: GoogleFonts.cairo(color: Colors.white , fontSize: 15 ) ,
                    textDirection: TextDirection.rtl,
                  ) ,
                  Text('يضم السيرة الذاتية الخاصة بالفرقة  ' , style: GoogleFonts.cairo(color: Colors.white , fontSize: 15 ) ,
                    textDirection: TextDirection.rtl,
                  ) ,

                ],
              )  ,

          ) ,

        ],
      ),
      bottomNavigationBar:   Container(
        child: AdWidget(ad: bannerAd..load() ,
          key: UniqueKey(),
        ),
        height: 60,
      ),
    );
  }
}
