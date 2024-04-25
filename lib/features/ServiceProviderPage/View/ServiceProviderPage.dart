import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_application/common/widgets/FavouriteIcon.dart';
import 'package:ecommerce_application/features/ServicesPage/Model/ServicesModel.dart';
import 'package:ecommerce_application/generated/l10n.dart';
import 'package:ecommerce_application/utils/constants/image_strings.dart';
import 'package:ecommerce_application/utils/constants/local_storage.dart';
import 'package:ecommerce_application/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceProviderPage extends StatelessWidget {
  ServiceProviderPage({super.key, required this.servicePorvider});
  final ServicesModel servicePorvider;
  final isNetworkImage = true;
  final isArabic =
      AppLocalStorage().readData(LocalDataSourceKeys.localization) == 'ar';
  launch(String url) async {
    Uri convertedUri = Uri.parse(url);
    if (!await launchUrl(convertedUri)) {
      throw Exception('Could not launch $convertedUri');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      background: isNetworkImage
                          ? CachedNetworkImage(
                              alignment: Alignment.center,
                              width: 40.w,
                              height: 30.w,
                              imageUrl: servicePorvider.imageUrl,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            )
                          : ImageIcon(
                              AssetImage(MImages.productImage1),
                              size: 30.w,
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
                    top: 150.h,
                    left: 50.w,
                    right: 50.w,
                    child: Text(
                      isArabic
                          ? servicePorvider.nameAR
                          : servicePorvider.nameAR,
                      textAlign: TextAlign.center,
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
                height: 600.h,
                child: Padding(
                  padding: EdgeInsets.all(10.0.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        '${isArabic ? servicePorvider.descriptionAR : servicePorvider.description}',
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
                launch("tel://+${servicePorvider.phoneNumber}".trim());
              },
            ),
            ButtomButtton(
              title: 'Whatsapp',
              icon: FontAwesomeIcons.whatsapp,
              ontap: () => launch(
                  'whatsapp://send?text=sample text&phone=+${servicePorvider.whatsappNumber}'),
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
