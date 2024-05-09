import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:get/get.dart';
import 'package:sunhope_computer_software/constants/const_text_style.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';
import 'package:sunhope_computer_software/screens/category/category_screen.dart';
import 'package:sunhope_computer_software/screens/customer/customer_list_screen.dart';
import 'package:sunhope_computer_software/screens/discount/discount_screen.dart';
import 'package:sunhope_computer_software/screens/employee/employee_list_screen.dart';
import 'package:sunhope_computer_software/screens/home/widgets/home_widet.dart';
import 'package:sunhope_computer_software/screens/language/language_screen.dart';
import 'package:sunhope_computer_software/screens/report/date_range_report_screen.dart';
import 'package:sunhope_computer_software/screens/report/report_detail_screen.dart';
import 'package:sunhope_computer_software/screens/service/service_list_screen.dart';
import 'package:sunhope_computer_software/screens/shop/shop_list_screen.dart';

import '../../constants/languages.dart';
import '../../core/bluetooth_setup/bluetooth_setup.dart';
import '../checkout/checkout_screen.dart';
import '../report/daily_report_screen.dart';
import '../report/monthly_report_screen.dart';
import '../report/yearly_report_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideMenu(
              controller: sideMenu,
              // style: SideMenuStyle(
              //   backgroundColor: ConstColors.appColor.withOpacity(0.25),
              // ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 20.0, left: 30),
                child: Image.asset(
                  'assets/logo.png',
                  width: 80,
                ),
              ),
              footer: Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Powered By App4U',
                      textAlign: TextAlign.start,
                      style: ConstTextStyles.blackF12W3Op45,
                    ),
                  ],
                ),
              ),
              onDisplayModeChanged: (mode) {
                // print(mode);
              },
              items: [
                SideMenuItem(
                  title: Languages.home.tr,
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.home),
                  // badgeContent: const Text(
                  //   '3',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                ),
                SideMenuItem(
                  title: Languages.checkout.tr,
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.shopping_cart),
                  // badgeContent: const Text(
                  //   '3',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                ),
                SideMenuExpansionItem(
                  title: Languages.services.tr,
                  icon: const Icon(Icons.library_books),
                  children: [
                    SideMenuItem(
                      title: Languages.category.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                    SideMenuItem(
                      title: Languages.services.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    )
                  ],
                ),
                SideMenuItem(
                  title: Languages.customers.tr,
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.people),
                ),
                SideMenuItem(
                  title: Languages.employee.tr,
                  onTap: (index, _) {
                    sideMenu.changePage(index);
                  },
                  icon: const Icon(Icons.people_outlined),
                ),
                SideMenuExpansionItem(
                  title: Languages.report.tr,
                  icon: const Icon(Icons.library_books),
                  children: [
                    SideMenuItem(
                      title: Languages.yearly.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                    SideMenuItem(
                      title: Languages.monthly.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                    SideMenuItem(
                      title: Languages.daily.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                    SideMenuItem(
                      title: "Date Report",
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                    ),
                  ],
                ),
                SideMenuExpansionItem(
                  title: Languages.setting.tr,
                  icon: const Icon(Icons.settings),
                  children: [
                    SideMenuItem(
                      title: Languages.shop.tr,
                      onTap: (index, _) {
                        print(index);
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.supervisor_account),
                    ),
                    // SideMenuItem(
                    //   title: 'Promotion',
                    //   onTap: (index, _) {
                    //     print(index);
                    //     sideMenu.changePage(index);
                    //   },
                    //   icon: const Icon(Icons.campaign),
                    // ),
                    SideMenuItem(
                      title: Languages.language.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.translate),
                    ),
                  ],
                ),
                SideMenuItem(
                  title: Languages.logout.tr,
                  onTap: (index, _) {},
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  // const ReportDetailScreen(),
                  const HomeWidget(),
                  const CheckOutScreen(),
                  const CategoryScreen(),
                  const ServiceListScreen(),
                  const CustomerListScreen(),
                  const EmployeeeeListScreen(),
                  const YearlyReportScreen(),
                  const MonthlyReportScreen(),
                  const DailyReportScreen(),
                  const DateRangeReportScreen(),
                  const ShopListScreen(),
                  const LanguageScreen(),

                  // const ReportDetailScreen(),
                  const ShopListScreen(),
                  // const DiscountScreen(),
                  const Center(
                    child: Text('Expansion Item 1'),
                  ),
                  const Center(
                    child: Text('Expansion Item 2'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
