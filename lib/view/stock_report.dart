import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/commonwidget/customcontainer.dart';
import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'package:rynoz/view_model/home_provider.dart';

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
  double totalAmount = 0;
  // int? selectedbranch = 0;

  final List<String> type = [
    'All Stock',
    'Available Stock',
    'Minus Stock',
    'Zero Stock'
  ];
  final List<String> baseon = [
    'Purchase Rate',
    'Purchase Cost',
    'Average rate'
  ];
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final TextEditingController barcode = TextEditingController();
  // final TextEditingController baseon = TextEditingController();
  final TextEditingController productname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    tzdata.initializeTimeZones();
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
            child: Consumer<HomeProvider>(builder: (context, value, child) {
          int len = value.salesreportdata?.data?.length ?? 0;
          if (value.salesreportdata?.data != null) {
            totalAmount = 0;
            for (int i = 0; i < len; i++) {
              totalAmount += double.parse(
                  "${value.salesreportdata?.data![i].totalGrossAmount}");
            }
          }

          return Column(
            children: [
              Row(
                children: [
                  CustomContainer(
                      width: 100.w,
                      height: 32.h,
                      boxcolor: "FCFFFC",
                      borderradius: 4.r,
                      child: Center(
                          child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Barcode",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.w),
                            hintStyle: FontPalette.grey14500),
                      ))),
                  5.horizontalSpace,
                  Expanded(
                      child: CustomContainer(
                          height: 32.h,
                          boxcolor: "FCFFFC",
                          borderradius: 4.r,
                          child: Center(
                              child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Product Name",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.w),
                                hintStyle: FontPalette.grey14500),
                          )))),
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
                              return StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                return SingleChildScrollView(
                                  child: Container(
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
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: type.length ?? 0,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  type[index],
                                                  style: FontPalette.black14500,
                                                ),
                                                Radio(
                                                    activeColor:
                                                        HexColor("#37C423"),
                                                    value: index,
                                                    groupValue:
                                                        value.stockselected,
                                                    onChanged: (val) {
                                                      value.getstockselected(
                                                          val!);
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    })
                                              ],
                                            );
                                          }),
                                    ],
                                  )
                                          .verticalPadding(20.h)
                                          .horizontalPadding(20.w)),
                                );
                              });
                            });
                      },
                      child: CustomContainer(
                        boxcolor: "FCFFFC",
                        borderradius: 4.r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value.stockselected == null
                                  ? 'Type'
                                  : type[value.stockselected!],
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
                              return StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                return SingleChildScrollView(
                                  child: Container(
                                      child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Select Baseon",
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
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: baseon.length ?? 0,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  baseon[index],
                                                  style: FontPalette.black14500,
                                                ),
                                                Radio(
                                                    activeColor:
                                                        HexColor("#37C423"),
                                                    value: index,
                                                    groupValue:
                                                        value.baseonselected,
                                                    onChanged: (val) {
                                                      value.getbaseonselected(
                                                          val!);
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    })
                                              ],
                                            );
                                          }),
                                    ],
                                  )
                                          .verticalPadding(20.h)
                                          .horizontalPadding(20.w)),
                                );
                              });
                            });
                      },
                      child: CustomContainer(
                        boxcolor: "FCFFFC",
                        borderradius: 4.r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              value.baseonselected == null
                                  ? 'Baseon'
                                  : baseon[value.baseonselected!],
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
                  // 5.horizontalSpace,
                  // Expanded(
                  //   child: InkWell(
                  //     onTap: () {
                  //       showModalBottomSheet(
                  //           context: context,
                  //           builder: (BuildContext context) {
                  //             return StatefulBuilder(
                  //                 builder: (BuildContext context, setState) {
                  //               return SingleChildScrollView(
                  //                 child: Container(
                  //                     child: Column(
                  //                   children: [
                  //                     Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Text(
                  //                           "Select Branch",
                  //                           style: FontPalette.black16700,
                  //                         ),
                  //                         InkWell(
                  //                             onTap: () =>
                  //                                 Navigator.of(context).pop(),
                  //                             child: const Icon(
                  //                               Icons.close,
                  //                               size: 35,
                  //                               color: Colors.grey,
                  //                             ))
                  //                       ],
                  //                     ),
                  //                     18.verticalSpace,
                  //                     ListView.builder(
                  //                         shrinkWrap: true,
                  //                         itemCount:
                  //                             value.branchdata?.data?.length ??
                  //                                 0,
                  //                         itemBuilder: (context, index) {
                  //                           return Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment
                  //                                     .spaceBetween,
                  //                             children: [
                  //                               Text(
                  //                                 "${value.branchdata?.data![index].branchName}",
                  //                                 style: FontPalette.black14500,
                  //                               ),
                  //                               Radio(
                  //                                   activeColor:
                  //                                       HexColor("#37C423"),
                  //                                   value: index,
                  //                                   groupValue: selectedbranch,
                  //                                   onChanged: (val) {
                  //                                     print(val);
                  //                                     setState(() {
                  //                                       selectedbranch =
                  //                                           val; // Update the selected index
                  //                                     });
                  //                                   })
                  //                             ],
                  //                           );
                  //                         }),
                  //                   ],
                  //                 )
                  //                         .verticalPadding(20.h)
                  //                         .horizontalPadding(20.w)),
                  //               );
                  //             });
                  //           });
                  //     },
                  //     child: CustomContainer(
                  //       borderradius: 4.r,
                  //       boxcolor: "FCFFFC",
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             "Branch",
                  //             style: FontPalette.black13500,
                  //             maxLines: 2,
                  //           ),
                  //           const Icon(
                  //             Icons.keyboard_arrow_down_outlined,
                  //           )
                  //         ],
                  //       ).verticalPadding(5.h).horizontalPadding(5.w),
                  //     ),
                  //   ),
                  // ),
                ],
              ).horizontalPadding(20.w),
              10.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder<bool>(
                        valueListenable: isLoading,
                        builder: (context, values, child) {
                          return CustomButton(
                            isLoading: isLoading.value,
                            height: 40.h,
                            borderRadius: 4.r,
                            title: "Show",
                            onPressed: () async {
                              isLoading.value = true;
                              totalAmount = 0;
                              // await value.getstockreport(
                              //     barcode: barcode.text,
                              //     baseon: int.parse(baseon.text),
                              //     productname: productname.text,
                              //     type: value.stockselected);
                              isLoading.value = false;
                            },
                          );
                        }),
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
              len == 0
                  ? const SizedBox()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 400.h,
                            child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  DateTime dateTime = DateTime.parse(
                                      "${value.salesreportdata?.data![index].invoiceDateTime}");

                                  // Convert to Indian Standard Time (IST)
                                  tz.Location ist =
                                      tz.getLocation('Asia/Kolkata');
                                  tz.TZDateTime istDateTime =
                                      tz.TZDateTime.from(dateTime, ist);

                                  // Format the date/time in IST
                                  String formattedDateTime =
                                      DateFormat('dd-MM-yyyy HH:mm:ss a')
                                          .format(istDateTime);

                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10.r,
                                              color: const Color.fromARGB(
                                                  255, 217, 215, 215))
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        border: Border.all(color: Colors.grey)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Inv No: ${value.salesreportdata?.data![index].invoiceNo}",
                                              style: FontPalette.black11500,
                                            ),
                                            Text(
                                              "Inv Date: $formattedDateTime",
                                              style: FontPalette.black11300,
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Gross Amt: Rs ${value.salesreportdata?.data![index].totalGrossAmount}",
                                              style: FontPalette.black13500,
                                            ),
                                            Text(
                                              "Mode: ${value.salesreportdata?.data![index].paymentModeName}",
                                              style: FontPalette.black13500,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                        .verticalPadding(7.h)
                                        .horizontalPadding(8.w),
                                  ).horizontalPadding(20.w);
                                },
                                separatorBuilder: (context, index) =>
                                    10.verticalSpace,
                                itemCount: value.salesreportdata!.data!.length),
                          ),
                        ],
                      ),
                    ),
              len == 0
                  ? const SizedBox()
                  : CustomContainer(
                      // boxcolor: "#000000",
                      borderradius: 4.r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: FontPalette.black17500,
                          ),
                          Text(
                            totalAmount.toStringAsFixed(2),
                            style: FontPalette.black21600,
                          )
                        ],
                      ).horizontalPadding(10.w).verticalPadding(10.h),
                    ),
            ],
          );
        })),
      ),
    );
  }
}
