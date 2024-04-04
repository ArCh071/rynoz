import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rynoz/commonwidget/customcontainer.dart';
import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/view/mis_report.dart';
import 'package:rynoz/view/profile.dart';
import 'package:rynoz/view/purchase_report.dart';
import 'package:rynoz/view/sales_report.dart';
import 'package:rynoz/view/stock_report.dart';
import 'package:rynoz/view/vat_report.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<Map<String, dynamic>> griddata = [
    {
      "image": "assets/1.png",
      "amount": "10,000",
      "type": "Sale",
      "typeamount": "500"
    },
    {
      "image": "assets/2.png",
      "amount": "10,000",
      "type": "Purchase",
      "typeamount": "500"
    },
    {
      "image": "assets/3.png",
      "amount": "10,000",
      "type": "S.Return",
      "typeamount": "500"
    },
    {
      "image": "assets/4.png",
      "amount": "10,000",
      "type": "P.Return",
      "typeamount": "500"
    },
    {
      "image": "assets/5.png",
      "amount": "10,000",
      "type": "Product",
      "typeamount": "500"
    },
    {
      "image": "assets/6.png",
      "amount": "10,000",
      "type": "Expense",
      "typeamount": "500"
    }
  ];
  DateTime setDate = DateTime.now();

  Widget openDatePicker() {
    return Center(
        child: Container(
            // margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 60),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.orangeAccent, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: CalendarDatePicker(
              initialDate: setDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 100000)),
              onDateChanged: (DateTime value) {},
            )));
  }

  int len = 5;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: Colors.white,
          elevation: 0,
          width: MediaQuery.of(context).size.width / 1.2,
          // Your drawer content here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Stack(children: [
                    Container(
                      height: 130.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/drawer.png"))),
                    ),
                    Column(
                      children: [
                        20.verticalSpace,
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            30.horizontalSpace,
                            SizedBox(
                                height: 60.h,
                                child: Image.asset("assets/splash.png"))
                          ],
                        ).horizontalPadding(15.w),
                      ],
                    )
                  ]),
                  20.verticalSpace,
                  Column(
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SalesReport(),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/purchase.png",
                                  color: Colors.black,
                                ),
                                10.horizontalSpace,
                                Text(
                                  "Sales Report",
                                  style: FontPalette.black13500,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: HexColor("#37C423"),
                            )
                          ],
                        ),
                      ),
                      15.verticalSpace,
                      Container(
                        height: .1.h,
                        color: HexColor("#000000"),
                      ).leftPadding(40.w),
                      15.verticalSpace,
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PurchaseReport(),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/sale.png"),
                                10.horizontalSpace,
                                Text(
                                  "Purchase Report",
                                  style: FontPalette.black13500,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: HexColor("#37C423"),
                            )
                          ],
                        ),
                      ),
                      15.verticalSpace,
                      Container(
                        height: .1.h,
                        color: HexColor("#000000"),
                      ).leftPadding(40.w),
                      15.verticalSpace,
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const StockReport(),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/stock.png"),
                                10.horizontalSpace,
                                Text(
                                  "Stock Report",
                                  style: FontPalette.black13500,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: HexColor("#37C423"),
                            )
                          ],
                        ),
                      ),
                      15.verticalSpace,
                      Container(
                        height: .1.h,
                        color: HexColor("#000000"),
                      ).leftPadding(40.w),
                      15.verticalSpace,
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const VatReport(),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/vat.png"),
                                10.horizontalSpace,
                                Text(
                                  "VAT Report",
                                  style: FontPalette.black13500,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: HexColor("#37C423"),
                            )
                          ],
                        ),
                      ),
                      15.verticalSpace,
                      Container(
                        height: .1.h,
                        color: HexColor("#000000"),
                      ).leftPadding(40.w),
                      15.verticalSpace,
                      InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MisReport(),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/mis.png"),
                                10.horizontalSpace,
                                Text(
                                  "MIS Report",
                                  style: FontPalette.black13500,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: HexColor("#37C423"),
                            )
                          ],
                        ),
                      ),
                      15.verticalSpace,
                      Container(
                        height: .1.h,
                        color: HexColor("#000000"),
                      ).leftPadding(40.w),
                    ],
                  ).horizontalPadding(30.w),
                ],
              ).bottomPadding(30.h),
              CustomContainer(
                width: 110.w,
                bordercolor: "37C423",
                borderradius: 4.r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/watsapp.png"),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "FOR HELP",
                          style: FontPalette.black13700,
                        ),
                        Text(
                          "Message Us",
                          style: FontPalette.black11300,
                        )
                      ],
                    ).verticalPadding(4.h)
                  ],
                ).horizontalPadding(5.w),
              )
            ],
          ).bottomPadding(20.h)),
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            CustomContainer(
              boxcolor: 'FCFFFC',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                              onTap: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              child: Image.asset("assets/Sort.png"))
                          .rightPadding(15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Shope Name",
                                style: FontPalette.black13500,
                              ),
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                            height: 250.h,
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Select Shope",
                                                      style: FontPalette
                                                          .black16700,
                                                    ),
                                                    InkWell(
                                                        onTap: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(),
                                                        child: const Icon(
                                                          Icons.close,
                                                          size: 35,
                                                          color: Colors.grey,
                                                        ))
                                                  ],
                                                ),
                                                18.verticalSpace,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Shope Name 1",
                                                      style: FontPalette
                                                          .black14500,
                                                    ),
                                                    Radio(
                                                        activeColor:
                                                            HexColor("#37C423"),
                                                        value: 1,
                                                        groupValue: 1,
                                                        onChanged: (val) {})
                                                  ],
                                                ),
                                                10.verticalSpace,
                                                Container(
                                                  height: 1.h,
                                                  color: HexColor("#F0EBEB"),
                                                ),
                                                10.verticalSpace,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Shope Name 2",
                                                      style:
                                                          FontPalette.grey14500,
                                                    ),
                                                    Radio(
                                                        activeColor:
                                                            HexColor("#B9B5B5"),
                                                        value: 1,
                                                        groupValue: 1,
                                                        onChanged: (val) {})
                                                  ],
                                                ),
                                                10.verticalSpace,
                                                Container(
                                                  height: 1.h,
                                                  color: HexColor("#F0EBEB"),
                                                ),
                                                10.verticalSpace,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Shope Name 3",
                                                      style:
                                                          FontPalette.grey14500,
                                                    ),
                                                    Radio(
                                                        activeColor:
                                                            HexColor("#B9B5B5"),
                                                        value: 1,
                                                        groupValue: 1,
                                                        onChanged: (val) {})
                                                  ],
                                                ),
                                              ],
                                            )
                                                .verticalPadding(20.h)
                                                .horizontalPadding(20.w));
                                      });
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: HexColor("#37C423"),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Counter #1",
                            style: FontPalette.grey12500,
                          )
                        ],
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    )),
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundColor: HexColor("#37C423"),
                      child: CircleAvatar(
                        radius: 21.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/profile.png'),
                          radius: 17.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ).horizontalPadding(10.w),
            ),
            10.verticalSpace,
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomContainer(
                        bordercolor: "2388C4",
                        borderradius: 8.r,
                        height: 31.h,
                        boxshadow: [
                          BoxShadow(
                              color: HexColor("#000000"),
                              blurRadius: 1.r,
                              offset: const Offset(0, 0.4))
                        ],
                        child: Center(
                            child: Text(
                          "Today",
                          style: FontPalette.blue13600,
                        )),
                      ),
                    ),
                    7.horizontalSpace,
                    Expanded(
                      child: CustomContainer(
                        borderradius: 8.r,
                        height: 31.h,
                        child: Center(
                            child: Text(
                          "Yesterday",
                          style: FontPalette.black11500,
                        )),
                      ),
                    ),
                    7.horizontalSpace,
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          await showDatePicker(
                              cancelText: '',
                              confirmText: '',
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2015, 8),
                              lastDate: DateTime(2101));
                        },
                        child: CustomContainer(
                          borderradius: 8.r,
                          height: 31.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Date",
                                style: FontPalette.black11500,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: HexColor("#2388C4"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                10.verticalSpace,
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),

                  shrinkWrap: true,
                  itemCount: griddata
                      .length, // 2 boxes horizontally and 4 boxes vertically will make 8 items
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                    childAspectRatio: 1.5.h,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CustomContainer(
                      boxcolor: "FFFFFFFF",
                      borderradius: 4.r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(griddata[index]["image"]),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹${griddata[index]["amount"]}",
                                style: FontPalette.black14500,
                              ),
                              Row(
                                children: [
                                  Text(
                                    griddata[index]["type"],
                                    style: FontPalette.blue11500,
                                  ),
                                  5.horizontalSpace,
                                  Text(griddata[index]["typeamount"],
                                      style: FontPalette.black11500),
                                ],
                              )
                            ],
                          )
                        ],
                      ).horizontalPadding(10.w),
                    );
                  },
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Monthly Sale",
                      style: FontPalette.black14500,
                    ),
                  ],
                ),
                10.verticalSpace,
                CustomContainer(
                  height: 150,
                  boxcolor: "FFFFFFFF",
                  boxshadow: [
                    BoxShadow(
                        color: HexColor("#37C423"),
                        blurRadius: 1.r,
                        offset: Offset(0, 0.8.w))
                  ],
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis
                        .horizontal, // Set the scroll direction to horizontal
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Expanded(
                            child: CustomContainer(
                              width: 12.w,
                              boxcolor: "F0EBEB",
                            ),
                          ),
                          Text(
                            month[index],
                            style: FontPalette.black7400,
                          )
                        ],
                      ).horizontalPadding(6.w);
                    },
                  ).horizontalPadding(10.w).verticalPadding(5.h),
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Stock Alert",
                      style: FontPalette.black14500,
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomContainer(
                        boxcolor: "FFFFFFFF",
                        child: Row(
                          children: [
                            Image.asset("assets/stock1.png"),
                            10.horizontalSpace,
                            Expanded(
                                child: Text(
                              "Minumum Stock Alert",
                              style: FontPalette.black13500,
                              maxLines: 2,
                            )),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: HexColor("#2388C4"),
                            )
                          ],
                        ).verticalPadding(7.h),
                      ),
                    ),
                    5.horizontalSpace,
                    Expanded(
                      child: CustomContainer(
                        bordercolor: "2388C4",
                        boxshadow: [
                          BoxShadow(
                              color: HexColor("#000000"),
                              blurRadius: 1.r,
                              offset: Offset(0, .1.w))
                        ],
                        boxcolor: "FFFFFFFF",
                        child: Row(
                          children: [
                            Image.asset("assets/stock2.png"),
                            10.horizontalSpace,
                            Expanded(
                                child: Text(
                              "Minumum Stock Alert",
                              style: FontPalette.blue13500,
                            )),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: HexColor("#2388C4"),
                            )
                          ],
                        ).verticalPadding(7.h),
                      ),
                    ),
                  ],
                ).horizontalPadding(10.w),
                10.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Top 10 Product",
                      style: FontPalette.black15500,
                    ),
                  ],
                ),
                10.verticalSpace,
                DefaultTabController(
                  length: 4,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.h,
                        // color: Colors.white,
                        child: TabBar(
                            indicator: BoxDecoration(
                              border: Border.all(color: HexColor("#2388C4")),
                              color: Colors.white, // Color of the indicator
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                            tabAlignment: TabAlignment.start,
                            dividerHeight: 0,
                            indicatorPadding: EdgeInsets.zero,
                            indicatorColor: Colors.blue,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: FontPalette.blue13500,
                            // unselectedLabelColor: Colors.amber,
                            unselectedLabelStyle: FontPalette.grey13500,
                            isScrollable: true,
                            tabs: const [
                              Tab(text: "Category 1"),
                              Tab(text: "Category 2"),
                              Tab(text: "Category 3"),
                              Tab(text: "Category 4"),
                            ]),
                      ),
                      10.verticalSpace,
                      CustomContainer(
                        boxcolor: "FFFFFFFF",
                        borderradius: 8.r,
                        height: 210.h,
                        child: TabBarView(children: [
                          Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: len,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (len - 1 == index) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/product.png"),
                                                    15.horizontalSpace,
                                                    Text(
                                                      "Product ${index + 1}",
                                                      style: FontPalette
                                                          .black11500,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "6789",
                                                  style: FontPalette.blue13600,
                                                )
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/product.png"),
                                                  15.horizontalSpace,
                                                  Text(
                                                    "Product ${index + 1}",
                                                    style:
                                                        FontPalette.black11500,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "6789",
                                                style: FontPalette.blue13600,
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 0.15.h,
                                            color: HexColor("#000000"),
                                          ).verticalPadding(5.h)
                                        ],
                                      );
                                    }),
                              ),
                              CustomContainer(
                                borderradius: 4.r,
                                width: 80.w,
                                bordercolor: "2388C4",
                                child: Center(
                                  child: Text(
                                    "View More",
                                    style: FontPalette.blue11500,
                                  ).verticalPadding(5.h),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: len,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (len - 1 == index) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/product.png"),
                                                    15.horizontalSpace,
                                                    Text(
                                                      "Product ${index + 1}",
                                                      style: FontPalette
                                                          .black11500,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "6789",
                                                  style: FontPalette.blue13600,
                                                )
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/product.png"),
                                                  15.horizontalSpace,
                                                  Text(
                                                    "Product ${index + 1}",
                                                    style:
                                                        FontPalette.black11500,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "6789",
                                                style: FontPalette.blue13600,
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 0.15.h,
                                            color: HexColor("#000000"),
                                          ).verticalPadding(5.h)
                                        ],
                                      );
                                    }),
                              ),
                              CustomContainer(
                                borderradius: 4.r,
                                width: 80.w,
                                bordercolor: "2388C4",
                                child: Center(
                                  child: Text(
                                    "View More",
                                    style: FontPalette.blue11500,
                                  ).verticalPadding(5.h),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: len,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (len - 1 == index) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/product.png"),
                                                    15.horizontalSpace,
                                                    Text(
                                                      "Product ${index + 1}",
                                                      style: FontPalette
                                                          .black11500,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "6789",
                                                  style: FontPalette.blue13600,
                                                )
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/product.png"),
                                                  15.horizontalSpace,
                                                  Text(
                                                    "Product ${index + 1}",
                                                    style:
                                                        FontPalette.black11500,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "6789",
                                                style: FontPalette.blue13600,
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 0.15.h,
                                            color: HexColor("#000000"),
                                          ).verticalPadding(5.h)
                                        ],
                                      );
                                    }),
                              ),
                              CustomContainer(
                                borderradius: 4.r,
                                width: 80.w,
                                bordercolor: "2388C4",
                                child: Center(
                                  child: Text(
                                    "View More",
                                    style: FontPalette.blue11500,
                                  ).verticalPadding(5.h),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: len,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (len - 1 == index) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/product.png"),
                                                    15.horizontalSpace,
                                                    Text(
                                                      "Product ${index + 1}",
                                                      style: FontPalette
                                                          .black11500,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  "6789",
                                                  style: FontPalette.blue13600,
                                                )
                                              ],
                                            ),
                                          ],
                                        );
                                      }
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                      "assets/product.png"),
                                                  15.horizontalSpace,
                                                  Text(
                                                    "Product ${index + 1}",
                                                    style:
                                                        FontPalette.black11500,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "6789",
                                                style: FontPalette.blue13600,
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 0.15.h,
                                            color: HexColor("#000000"),
                                          ).verticalPadding(5.h)
                                        ],
                                      );
                                    }),
                              ),
                              CustomContainer(
                                borderradius: 4.r,
                                width: 80.w,
                                bordercolor: "2388C4",
                                child: Center(
                                  child: Text(
                                    "View More",
                                    style: FontPalette.blue11500,
                                  ).verticalPadding(5.h),
                                ),
                              )
                            ],
                          ),
                        ]).verticalPadding(15.h).horizontalPadding(15.w),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace
              ],
            ).horizontalPadding(20.w),
          ],
        )),
      ),
    );
  }
}
