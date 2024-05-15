import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/commonwidget/customcontainer.dart';
import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/view_model/home_provider.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class MisReport extends StatefulWidget {
  const MisReport({super.key});

  @override
  State<MisReport> createState() => _MisReportState();
}

class _MisReportState extends State<MisReport> {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  double totalAmount = 0;
  @override
  void initState() {
    final home = context.read<HomeProvider>();
    home.misendate = DateFormat('dd MMMyy').format(selectedDateend!);
    home.misstartdate = DateFormat('dd MMMyy').format(selectedDateend!);
    super.initState();
  }

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
  int? selectedbranch = 0;
  DateTime? selectedDateend = DateTime.now();

  DateTime? selectedDatestart = DateTime.now();
  refresh() async {
    final home = context.read<HomeProvider>();
    selectedDateend = DateTime.now();
    selectedDatestart = DateTime.now();
    home.misendate = DateFormat('dd MMMyy').format(selectedDateend!);
    home.misstartdate = DateFormat('dd MMMyy').format(selectedDateend!);

    // await home.getpaymentsub();
    // await home.getpaymentmode();
    await home.getbranch();
  }

  @override
  Widget build(BuildContext context) {
    tzdata.initializeTimeZones();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        automaticallyImplyLeading: true,
        title: Text(
          "MIS Report",
          style: FontPalette.black16500,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 248, 246, 246),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SafeArea(
            child: Consumer<HomeProvider>(builder: (context, value, child) {
          int len = value.misreportdata?.data?.length ?? 0;
          if (value.misreportdata?.data != null) {
            totalAmount = 0;

            for (int i = 0; i < len; i++) {
              totalAmount += double.parse(
                  "${value.misreportdata?.data![i].totalGrossAmount}");
            }
          }
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        selectedDatestart = await showDatePicker(
                            cancelText: 'Cancel',
                            confirmText: 'Ok',
                            context: context,
                            initialDate: selectedDatestart,
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101));
                        if (selectedDatestart != null) {
                          value.getmisstartdate(selectedDatestart!);
                        } else {
                          // User canceled the operation
                        }
                      },
                      child: CustomContainer(
                        boxcolor: "FCFFFC",
                        borderradius: 4.r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "From",
                                  style: FontPalette.black11500,
                                  maxLines: 2,
                                ),
                                Text(
                                  "${value.misstartdate}",
                                  style: FontPalette.black16700,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: HexColor("#2388C4"),
                            )
                          ],
                        ).verticalPadding(5.h).horizontalPadding(15.w),
                      ),
                    ),
                  ),
                  5.horizontalSpace,
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        selectedDateend = await showDatePicker(
                            cancelText: 'Cancel',
                            confirmText: 'Ok',
                            context: context,
                            initialDate: selectedDateend,
                            firstDate: DateTime(2015, 8),
                            lastDate: DateTime(2101));
                        if (selectedDateend != null) {
                          // Do something with the selected date
                          value.getmisenddate(selectedDateend!);
                        } else {
                          // User canceled the operation
                        }
                      },
                      child: CustomContainer(
                        bordercolor: "2388C4",
                        boxshadow: [
                          BoxShadow(
                              color: HexColor("#000000"),
                              blurRadius: 1.r,
                              offset: Offset(0, .1.w))
                        ],
                        boxcolor: "FCFFFC",
                        borderradius: 4.r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To",
                                  style: FontPalette.blue11500,
                                  maxLines: 2,
                                ),
                                Text(
                                  "${value.misendate}",
                                  style: FontPalette.blue16700,
                                )
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: HexColor("#2388C4"),
                            )
                          ],
                        ).verticalPadding(5.h).horizontalPadding(15.w),
                      ),
                    ),
                  ),
                ],
              ).horizontalPadding(20.w),
              10.verticalSpace,
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         // onTap: () {
              //         //   showModalBottomSheet(
              //         //       context: context,
              //         //       builder: (BuildContext context) {
              //         //         return SizedBox(
              //         //             height: 250.h,
              //         //             child: Column(
              //         //               children: [
              //         //                 Row(
              //         //                   mainAxisAlignment:
              //         //                       MainAxisAlignment.spaceBetween,
              //         //                   children: [
              //         //                     Text(
              //         //                       "Select Payment Source",
              //         //                       style: FontPalette.black16700,
              //         //                     ),
              //         //                     InkWell(
              //         //                         onTap: () =>
              //         //                             Navigator.of(context).pop(),
              //         //                         child: Icon(
              //         //                           Icons.close,
              //         //                           size: 35,
              //         //                           color: Colors.grey,
              //         //                         ))
              //         //                   ],
              //         //                 ),
              //         //                 18.verticalSpace,
              //         //                 Row(
              //         //                   mainAxisAlignment:
              //         //                       MainAxisAlignment.spaceBetween,
              //         //                   children: [
              //         //                     Text(
              //         //                       "UPI",
              //         //                       style: FontPalette.black14500,
              //         //                     ),
              //         //                     Radio(
              //         //                         activeColor: HexColor("#37C423"),
              //         //                         value: 1,
              //         //                         groupValue: 1,
              //         //                         onChanged: (val) {})
              //         //                   ],
              //         //                 ),
              //         //                 10.verticalSpace,
              //         //                 Container(
              //         //                   height: 1.h,
              //         //                   color: HexColor("#F0EBEB"),
              //         //                 ),
              //         //                 10.verticalSpace,
              //         //                 Row(
              //         //                   mainAxisAlignment:
              //         //                       MainAxisAlignment.spaceBetween,
              //         //                   children: [
              //         //                     Text(
              //         //                       "Cash",
              //         //                       style: FontPalette.grey14500,
              //         //                     ),
              //         //                     Radio(
              //         //                         activeColor: HexColor("#B9B5B5"),
              //         //                         value: 1,
              //         //                         groupValue: 1,
              //         //                         onChanged: (val) {})
              //         //                   ],
              //         //                 ),
              //         //                 10.verticalSpace,
              //         //                 Container(
              //         //                   height: 1.h,
              //         //                   color: HexColor("#F0EBEB"),
              //         //                 ),
              //         //                 10.verticalSpace,
              //         //                 Row(
              //         //                   mainAxisAlignment:
              //         //                       MainAxisAlignment.spaceBetween,
              //         //                   children: [
              //         //                     Text(
              //         //                       "Google Pay",
              //         //                       style: FontPalette.grey14500,
              //         //                     ),
              //         //                     Radio(
              //         //                         activeColor: HexColor("#B9B5B5"),
              //         //                         value: 1,
              //         //                         groupValue: 1,
              //         //                         onChanged: (val) {})
              //         //                   ],
              //         //                 ),
              //         //               ],
              //         //             )
              //         //                 .verticalPadding(20.h)
              //         //                 .horizontalPadding(20.w));
              //         //       });
              //         // },
              //         child: CustomContainer(
              //           height: 32.h,
              //           boxcolor: "FCFFFC",
              //           borderradius: 4.r,
              //           child: Center(
              //             child: TextField(
              //               decoration: InputDecoration(
              //                   border: InputBorder.none,
              //                   contentPadding:
              //                       EdgeInsets.symmetric(horizontal: 10.w),
              //                   hintText: "Invoice Number",
              //                   hintStyle: FontPalette.grey14500),
              //             ).verticalPadding(5.h).horizontalPadding(5.w),
              //           ),
              //         ),
              //       ),
              //     ),
              //     5.horizontalSpace,
              //     Expanded(
              //       child: InkWell(
              //         // onTap: () {
              //         //   showModalBottomSheet(
              //         //       context: context,
              //         //       builder: (BuildContext context) {
              //         //         return SizedBox(
              //         //             height: 250.h,
              //         //             child: Column(
              //         //               children: [
              //         //                 Row(
              //         //                   mainAxisAlignment:
              //         //                       MainAxisAlignment.spaceBetween,
              //         //                   children: [
              //         //                     Text(
              //         //                       "Select Payment Source",
              //         //                       style: FontPalette.black16700,
              //         //                     ),
              //         //                     InkWell(
              //         //                         onTap: () =>
              //         //                             Navigator.of(context).pop(),
              //         //                         child: Icon(
              //         //                           Icons.close,
              //         //                           size: 35,
              //         //                           color: Colors.grey,
              //         //                         ))
              //         //                   ],
              //         //                 ),
              //         //                 18.verticalSpace,
              //         //                 Row(
              //         //                   mainAxisAlignment:
              //         //                       MainAxisAlignment.spaceBetween,
              //         //                   children: [
              //         //                     Text(
              //         //                       "UPI",
              //         //                       style: FontPalette.black14500,
              //         //                     ),
              //         //                     Radio(
              //         //                         activeColor: HexColor("#37C423"),
              //         //                         value: 1,
              //         //                         groupValue: 1,
              //         //                         onChanged: (val) {})
              //         //                   ],
              //         //                 ),
              //         //                 10.verticalSpace,
              //         //                 Container(
              //         //                   height: 1.h,
              //         //                   color: HexColor("#F0EBEB"),
              //         //                 ),
              //         //                 10.verticalSpace,
              //         //                 Row(
              //         //                   mainAxisAlignment:
              //         //                       MainAxisAlignment.spaceBetween,
              //         //                   children: [
              //         //                     Text(
              //         //                       "Cash",
              //         //                       style: FontPalette.grey14500,
              //         //                     ),
              //         //                     Radio(
              //         //                         activeColor: HexColor("#B9B5B5"),
              //         //                         value: 1,
              //         //                         groupValue: 1,
              //         //                         onChanged: (val) {})
              //         //                   ],
              //         //                 ),
              //         //                 10.verticalSpace,
              //         //                 Container(
              //         //                   height: 1.h,
              //         //                   color: HexColor("#F0EBEB"),
              //         //                 ),
              //         //                 10.verticalSpace,
              //         //                 Row(
              //         //                   mainAxisAlignment:
              //         //                       MainAxisAlignment.spaceBetween,
              //         //                   children: [
              //         //                     Text(
              //         //                       "Google Pay",
              //         //                       style: FontPalette.grey14500,
              //         //                     ),
              //         //                     Radio(
              //         //                         activeColor: HexColor("#B9B5B5"),
              //         //                         value: 1,
              //         //                         groupValue: 1,
              //         //                         onChanged: (val) {})
              //         //                   ],
              //         //                 ),
              //         //               ],
              //         //             )
              //         //                 .verticalPadding(20.h)
              //         //                 .horizontalPadding(20.w));
              //         //       });
              //         // },
              //         child: CustomContainer(
              //           height: 32.h,
              //           boxcolor: "FCFFFC",
              //           borderradius: 4.r,
              //           child: TextField(
              //             decoration: InputDecoration(
              //                 border: InputBorder.none,
              //                 contentPadding:
              //                     EdgeInsets.symmetric(horizontal: 10.w),
              //                 hintText: "Customer Name",
              //                 hintStyle: FontPalette.grey12500),
              //           ).verticalPadding(5.h).horizontalPadding(5.w),
              //         ),
              //       ),
              //     ),
              //     5.horizontalSpace,
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           showModalBottomSheet(
              //               context: context,
              //               builder: (BuildContext context) {
              //                 return StatefulBuilder(
              //                     builder: (BuildContext context, setState) {
              //                   return SingleChildScrollView(
              //                     child: Container(
              //                         child: Column(
              //                       children: [
              //                         Row(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.spaceBetween,
              //                           children: [
              //                             Text(
              //                               "Select Branch",
              //                               style: FontPalette.black16700,
              //                             ),
              //                             InkWell(
              //                                 onTap: () =>
              //                                     Navigator.of(context).pop(),
              //                                 child: const Icon(
              //                                   Icons.close,
              //                                   size: 35,
              //                                   color: Colors.grey,
              //                                 ))
              //                           ],
              //                         ),
              //                         18.verticalSpace,
              //                         ListView.builder(
              //                             shrinkWrap: true,
              //                             itemCount:
              //                                 value.branchdata?.data?.length ??
              //                                     0,
              //                             itemBuilder: (context, index) {
              //                               return Row(
              //                                 mainAxisAlignment:
              //                                     MainAxisAlignment
              //                                         .spaceBetween,
              //                                 children: [
              //                                   Text(
              //                                     "${value.branchdata?.data![index].branchName}",
              //                                     style: FontPalette.black14500,
              //                                   ),
              //                                   Radio(
              //                                       activeColor:
              //                                           HexColor("#37C423"),
              //                                       value: index,
              //                                       groupValue: selectedbranch,
              //                                       onChanged: (val) {
              //                                         print(val);
              //                                         setState(() {
              //                                           selectedbranch =
              //                                               val; // Update the selected index
              //                                         });
              //                                       })
              //                                 ],
              //                               );
              //                             }),
              //                       ],
              //                     )
              //                             .verticalPadding(20.h)
              //                             .horizontalPadding(20.w)),
              //                   );
              //                 });
              //               });
              //         },
              //         child: CustomContainer(
              //           borderradius: 4.r,
              //           boxcolor: "FCFFFC",
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Text(
              //                 "Branch",
              //                 style: FontPalette.black13500,
              //                 maxLines: 2,
              //               ),
              //               const Icon(
              //                 Icons.keyboard_arrow_down_outlined,
              //               )
              //             ],
              //           ).verticalPadding(5.h).horizontalPadding(5.w),
              //         ),
              //       ),
              //     ),
              //   ],
              // ).horizontalPadding(20.w),
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
                              await value.getmisreport(
                                startdate:
                                    "${selectedDatestart?.year}-${selectedDatestart?.month}-${selectedDatestart?.day}",
                                endate:
                                    "${selectedDateend?.year}-${selectedDateend?.month}-${selectedDateend?.day}",
                              );
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
                            height: 440.h,
                            child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                physics: const AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  DateTime dateTime = DateTime.parse(
                                      "${value.misreportdata?.data![index].invoiceDateTime}");

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
                                              "Inv No: ${value.misreportdata?.data![index].invoiceNo}",
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
                                              "Gross Amt: Rs ${value.misreportdata?.data![index].totalGrossAmount}",
                                              style: FontPalette.black13500,
                                            ),
                                            Text(
                                              "Mode: ${value.misreportdata?.data![index].paymentModeName}",
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
                                itemCount: value.misreportdata!.data!.length),
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
