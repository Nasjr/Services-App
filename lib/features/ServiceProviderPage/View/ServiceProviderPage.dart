import 'package:ecommerce_application/common/widgets/FavouriteIcon.dart';
import 'package:ecommerce_application/features/ServicesPage/Model/ServicesModel.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceProviderPage extends StatelessWidget {
  ServiceProviderPage({super.key, required this.servicePorvider});
  final ServicesModel servicePorvider;
  String phoneNumber = '01153453880';
  // Future<void> makePhoneCall(String phoneNumber) async {
  //   final Uri launchUri = Uri(
  //     scheme: 'tel',
  //     path: phoneNumber,
  //   );
  //   await launchUrl(launchUri);
  // }
  launch(String url) async {
    Uri convertedUri = Uri.parse(url);
    if (!await launchUrl(convertedUri)) {
      throw Exception('Could not launch $convertedUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(servicePorvider.name);
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
              automaticallyImplyLeading: false,
              centerTitle: true,
              pinned: true,
              expandedHeight: 200.h,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [
                          0.5,
                          1.0
                        ],
                            colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7)
                        ])),
                    child: FlexibleSpaceBar(
                      background: Image.asset(
                        MImages.productImage1,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 10,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Image.asset(
                          'assets/icons/payment_methods/back-button.png',
                          width: 35.w,
                        )),
                  ),
                  Positioned(
                      top: 35.h,
                      right: 10.w,
                      child: FavouritIconWidget(
                        size: 30.w,
                      )),
                  Positioned(
                    top: 190.h,
                    left: 100.w,
                    child: Text(
                      servicePorvider.name,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        '${servicePorvider.description}  -- What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like). those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                color: const Color.fromARGB(255, 219, 219, 219),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtomButtton(
              title: "Call",
              icon: Icons.call,
              ontap: () {
                launch("tel://+201153453880".trim());
              },
            ),
            ButtomButtton(
              title: 'Whatsapp',
              icon: FontAwesomeIcons.whatsapp,
              ontap: () => launch(
                  'whatsapp://send?text=sample text&phone=+201153453880'),
            ),
          ],
        ),
      ],
    ));
  }
}

class ButtomButtton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? ontap;
  const ButtomButtton(
      {super.key, required this.title, required this.icon, this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: Container(
          width: 150.w,
          height: 50.h,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 3, 136, 59),
                  Color.fromARGB(255, 4, 180, 92).withOpacity(0.9),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 3, 80, 35),
                    offset: Offset(0, 10),
                    blurRadius: 10)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (icon),
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '$title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: title.length > 5 ? 10.sp : 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
