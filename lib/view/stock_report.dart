import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/commonwidget/customcontainer.dart';
import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';

class StockReport extends StatefulWidget {
  const StockReport({super.key});

  @override
  State<StockReport> createState() => _StockReportState();
}

class _StockReportState extends State<StockReport> {
  final List<List<String>> tableData = [
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
  ];
  final List<String> headers = [
    'S No',
    'Invoice No',
    'Invoice Date',
    'Header 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        automaticallyImplyLeading: true,
        title: Text(
          "Stock Summary",
          style: FontPalette.black16500,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                CustomContainer(
                    width: 90.w,
                    boxcolor: "FCFFFC",
                    borderradius: 4.r,
                    child: Center(
                      child: Text(
                        "Barcode",
                        style: FontPalette.grey14500,
                      ),
                    )),
                5.horizontalSpace,
                Expanded(
                  child: CustomContainer(
                      boxcolor: "FCFFFC",
                      borderradius: 4.r,
                      child: Center(
                        child: Text(
                          "Product Name",
                          style: FontPalette.grey14500,
                        ),
                      )),
                ),
              ],
            ).horizontalPadding(20.w),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: InkWell(
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Select File Type",
                                          style: FontPalette.black16700,
                                        ),
                                        InkWell(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Type 1",
                                          style: FontPalette.black14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#37C423"),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Type 2",
                                          style: FontPalette.grey14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#B9B5B5"),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Type 3",
                                          style: FontPalette.grey14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#B9B5B5"),
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
                    child: CustomContainer(
                      boxcolor: "FCFFFC",
                      borderradius: 4.r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Type",
                            style: FontPalette.black13500,
                            maxLines: 2,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          )
                        ],
                      ).verticalPadding(5.h).horizontalPadding(5.w),
                    ),
                  ),
                ),
                5.horizontalSpace,
                Expanded(
                  child: InkWell(
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Select Stock Type",
                                          style: FontPalette.black16700,
                                        ),
                                        InkWell(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Type 1",
                                          style: FontPalette.black14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#37C423"),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Type 2",
                                          style: FontPalette.grey14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#B9B5B5"),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Type 3",
                                          style: FontPalette.grey14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#B9B5B5"),
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
                    child: CustomContainer(
                      boxcolor: "FCFFFC",
                      borderradius: 4.r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Stock Below",
                            style: FontPalette.black13500,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          )
                        ],
                      ).verticalPadding(5.h),
                    ),
                  ),
                ),
                5.horizontalSpace,
                Expanded(
                  child: InkWell(
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Select Branch",
                                          style: FontPalette.black16700,
                                        ),
                                        InkWell(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Main Branch",
                                          style: FontPalette.black14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#37C423"),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Branch 1",
                                          style: FontPalette.grey14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#B9B5B5"),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Branch 2",
                                          style: FontPalette.grey14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#B9B5B5"),
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
                    child: CustomContainer(
                      borderradius: 4.r,
                      boxcolor: "FCFFFC",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Branch",
                            style: FontPalette.black13500,
                            maxLines: 2,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          )
                        ],
                      ).verticalPadding(5.h).horizontalPadding(5.w),
                    ),
                  ),
                ),
              ],
            ).horizontalPadding(20.w),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    height: 40.h,
                    borderRadius: 4.r,
                    title: "Show",
                  ),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Select File Type",
                                          style: FontPalette.black16700,
                                        ),
                                        InkWell(
                                            onTap: () =>
                                                Navigator.of(context).pop(),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "PDF",
                                          style: FontPalette.black14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#37C423"),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Excel",
                                          style: FontPalette.grey14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#B9B5B5"),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Doc",
                                          style: FontPalette.grey14500,
                                        ),
                                        Radio(
                                            activeColor: HexColor("#B9B5B5"),
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
                    child: Image.asset("assets/pdf.png"))
              ],
            ).horizontalPadding(20.w),
            10.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Header in a horizontally scrollable ListView
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: headers
                          .map((header) => SizedBox(
                                width: 108.w,
                                child: CustomContainer(
                                        borderradius: 8.r,
                                        boxcolor: "FCFFFC",
                                        child: Center(
                                            child: Text(
                                          header,
                                          style: FontPalette.black11500,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ).verticalPadding(8.h)))
                                    .horizontalPadding(2.w),
                              ))
                          .toList(),
                    ),
                  ),
                  10.verticalSpace,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        for (int i = 0; i < tableData.length; i++)
                          Row(
                            children: [
                              for (int j = 0; j < tableData[i].length; j++)
                                CustomContainer(
                                  width: 108.w,
                                  borderradius: 0,
                                  borderwidth: 0.05,
                                  bordercolor: "000000",
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 3.w),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  width: 0.1,
                                                  color: Colors.black))),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.h),
                                        child: Text(tableData[i][j]),
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ).leftPadding(20.w),
            10.verticalSpace,
            CustomContainer(
              borderradius: 4.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: FontPalette.black17500,
                  ),
                  Text(
                    "12456",
                    style: FontPalette.black21600,
                  )
                ],
              ).horizontalPadding(10.w).verticalPadding(10.h),
            ).horizontalPadding(20.w)
          ],
        )),
      ),
    );
  }
}
