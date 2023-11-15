import 'package:cuwea/components/cuwea_logo.dart';
import 'package:cuwea/components/cw_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerChild extends StatelessWidget {
  const DrawerChild({super.key});

  Future<void> launchWeatherApiSite() async {
    await launchUrl(Uri.parse('https://www.weatherapi.com/'),
        mode: LaunchMode.externalApplication);
  }

  Future<void> launchOpenWeatherApiSite() async {
    await launchUrl(Uri.parse('https://openweathermap.org/'),
        mode: LaunchMode.externalApplication);
  }

  Future<void> launchGitHubPage() async {
    await launchUrl(
        Uri.parse('https://github.com/Adwaith-Rajesh/CuWea/tree/master'),
        mode: LaunchMode.externalApplication);
  }

  Future<void> launchSponsorPage() async {
    await launchUrl(Uri.parse('https://github.com/sponsors/Adwaith-Rajesh'),
        mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 72, 110, 187),
            Color.fromARGB(255, 233, 129, 69),
          ],
        ),
      ),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const DrawerHeader(
                    child: CuWeaLogo(),
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  const CWText(
                    text: 'Credits',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      launchWeatherApiSite();
                    },
                    child: Image.asset(
                      'assets/images/weatherapi_logo.webp',
                    ),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      launchOpenWeatherApiSite();
                    },
                    child: Image.asset(
                      'assets/images/owm_logo.png',
                      width: 256,
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  const CWText(
                    text: 'Like what you see?',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchGitHubPage();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade800,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          const CWText(
                            text: 'Give us a star on GitHub',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/github-logo.png',
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const CWText(
                                  text: 'CuWea',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      launchSponsorPage();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade800,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Column(
                        children: [
                          CWText(
                            text: 'Or, Sponsor Us',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite_outline,
                                color: Colors.pink,
                                size: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CWText(
                                  text: 'CuWea',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
