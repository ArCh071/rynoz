import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/commonwidget/custombutton.dart';
import 'package:rynoz/commonwidget/customcontainer.dart';
import 'package:rynoz/datamodel/stockreport_datamodel.dart';
import 'package:rynoz/helper/color_palette.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/helper/helpers.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:rynoz/view_model/home_provider.dart';

import 'package:pdf/widgets.dart' as pw;

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

  Future<void> _savePdf(Uint8List pdfData) async {
    final downloadsDirectory = Directory('/storage/emulated/0/Download');

    final directory = await getExternalStorageDirectory();
    final file = File("${downloadsDirectory.path}/stock_report.pdf");
    await file.writeAsBytes(pdfData);

    // Share.shareFiles([file.path], text: 'Here is the PDF file.');
    // Printing.sharePdf(bytes: pdfData, filename: 'sales_report.pdf');
  }

  Future<Uint8List> generatePdf(StockreportDatamodel invoices) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.robotoRegular();
    const int rowsPerPage = 28; // Adjust this value as needed
    int pageCount = (invoices.data!.length / rowsPerPage).ceil();

    for (int page = 0; page < pageCount; page++) {
      final List<Data> pageInvoices =
          invoices.data!.skip(page * rowsPerPage).take(rowsPerPage).toList();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Table(
              border: pw.TableBorder.all(),
              children: [
                pw.TableRow(
                  children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        padding: const pw.EdgeInsets.all(7),
                        child: pw.Text('Product Id',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                font: font, fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        padding: const pw.EdgeInsets.all(7),
                        child: pw.Text('Barcode',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                font: font, fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.Expanded(
                      flex: 3,
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        padding: const pw.EdgeInsets.all(7),
                        child: pw.Text('Product Name',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                font: font, fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        padding: const pw.EdgeInsets.all(7),
                        child: pw.Text('Stock',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                font: font, fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        padding: const pw.EdgeInsets.all(7),
                        child: pw.Text('Stock Value',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                font: font, fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        alignment: pw.Alignment.center,
                        padding: const pw.EdgeInsets.all(7),
                        child: pw.Text('GrossAmt',
                            textAlign: pw.TextAlign.center,
                            style: pw.TextStyle(
                                font: font, fontWeight: pw.FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                ...pageInvoices.map((invoice) {
                  return pw.TableRow(
                    children: [
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.all(7),
                          alignment: pw.Alignment.center,
                          child: pw.Text(invoice.productID.toString(),
                              textAlign: pw.TextAlign.center),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.all(7),
                          alignment: pw.Alignment.center,
                          child: pw.Text(invoice.barcode.toString(),
                              textAlign: pw.TextAlign.center),
                        ),
                      ),
                      pw.Expanded(
                        flex: 3,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.all(7),
                          alignment: pw.Alignment.centerLeft,
                          child: pw.Text(invoice.productName.toString(),
                              textAlign: pw.TextAlign.center, softWrap: true),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.all(7),
                          alignment: pw.Alignment.center,
                          child: pw.Text(invoice.stock.toString(),
                              textAlign: pw.TextAlign.center),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.all(7),
                          alignment: pw.Alignment.center,
                          child: pw.Text(invoice.stockValue.toString(),
                              textAlign: pw.TextAlign.center),
                        ),
                      ),
                      pw.Expanded(
                        flex: 1,
                        child: pw.Container(
                          padding: const pw.EdgeInsets.all(7),
                          alignment: pw.Alignment.center,
                          child: pw.Text(invoice.mrp.toString(),
                              textAlign: pw.TextAlign.center),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            );
          },
        ),
      );
    }

    return pdf.save();
  }

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
  final ValueNotifier<bool> isLoadingpdf = ValueNotifier(false);

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
          int len = value.stockreportdata?.data?.length ?? 0;
          if (value.stockreportdata?.data != null) {
            len = value.stockreportdata?.data?.length ?? 0;
            totalAmount = 0;
            for (int i = 0; i < len; i++) {
              totalAmount +=
                  double.parse("${value.stockreportdata?.data![i].mrp}");
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
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Barcode",
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 7.h),
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
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Product Name",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 7.h),
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
                              await value.getstockreport(
                                  barcode: barcode.text,
                                  baseon: value.baseonselected,
                                  productname: productname.text,
                                  type: value.stockselected);
                              isLoading.value = false;
                            },
                          );
                        }),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: isLoadingpdf,
                    builder: (context, values, child) {
                      return InkWell(
                          onTap: () async {
                            if (value.stockreportdata != null) {
                              isLoadingpdf.value = true;
                              final pdfData =
                                  await generatePdf(value.stockreportdata!);
                              await _savePdf(pdfData);
                              isLoadingpdf.value = false;
                              Helpers.showToast("File Downloaded");
                            }
                            // showModalBottomSheet(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return SizedBox(
                            //           height: 250.h,
                            //           child: Column(
                            //             children: [
                            //               Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     "Select File Type",
                            //                     style: FontPalette.black16700,
                            //                   ),
                            //                   InkWell(
                            //                       onTap: () =>
                            //                           Navigator.of(context).pop(),
                            //                       child: const Icon(
                            //                         Icons.close,
                            //                         size: 35,
                            //                         color: Colors.grey,
                            //                       ))
                            //                 ],
                            //               ),
                            //               18.verticalSpace,
                            //               Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     "PDF",
                            //                     style: FontPalette.black14500,
                            //                   ),
                            //                   Radio(
                            //                       activeColor: HexColor("#37C423"),
                            //                       value: 1,
                            //                       groupValue: 1,
                            //                       onChanged: (val) {})
                            //                 ],
                            //               ),
                            //               10.verticalSpace,
                            //               Container(
                            //                 height: 1.h,
                            //                 color: HexColor("#F0EBEB"),
                            //               ),
                            //               10.verticalSpace,
                            //               Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     "Excel",
                            //                     style: FontPalette.grey14500,
                            //                   ),
                            //                   Radio(
                            //                       activeColor: HexColor("#B9B5B5"),
                            //                       value: 1,
                            //                       groupValue: 1,
                            //                       onChanged: (val) {})
                            //                 ],
                            //               ),
                            //               10.verticalSpace,
                            //               Container(
                            //                 height: 1.h,
                            //                 color: HexColor("#F0EBEB"),
                            //               ),
                            //               10.verticalSpace,
                            //               Row(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.spaceBetween,
                            //                 children: [
                            //                   Text(
                            //                     "Doc",
                            //                     style: FontPalette.grey14500,
                            //                   ),
                            //                   Radio(
                            //                       activeColor: HexColor("#B9B5B5"),
                            //                       value: 1,
                            //                       groupValue: 1,
                            //                       onChanged: (val) {})
                            //                 ],
                            //               ),
                            //             ],
                            //           )
                            //               .verticalPadding(20.h)
                            //               .horizontalPadding(20.w));
                            //     });
                          },
                          child: SizedBox(
                              width: 50.w,
                              // height: 40.h,
                              child: isLoadingpdf.value == true
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.green,
                                      ),
                                    )
                                  : Image.asset(
                                      "assets/pdf.png",
                                      fit: BoxFit.cover,
                                    )));
                    },
                  )
                ],
              ).horizontalPadding(20.w),
              10.verticalSpace,
              len == 0
                  ? const SizedBox()
                  : value.stockreportdata?.data != null
                      ? SizedBox(
                          height: 420.h,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.r),
                                  color:
                                      const Color.fromARGB(255, 238, 236, 236),
                                ),
                                child: DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text('Product Id'),
                                    ),
                                    DataColumn(
                                      label: Text('Barcode'),
                                    ),
                                    DataColumn(
                                      label: Text('Product Name'),
                                    ),
                                    DataColumn(
                                      label: Text('Stock'),
                                    ),
                                    DataColumn(
                                      label: Text('Stock Value'),
                                    ),
                                    DataColumn(
                                      label: Text('GrossAmt'),
                                    ),
                                  ],
                                  rows: value.stockreportdata!.data!
                                      .map((invoice) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text("${invoice.productID}")),
                                        DataCell(Text("${invoice.barcode}")),
                                        DataCell(Text(
                                            invoice.productName.toString())),
                                        DataCell(
                                            Text(invoice.stock.toString())),
                                        DataCell(Text(
                                            invoice.stockValue.toString())),
                                        DataCell(Text(invoice.mrp.toString())),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ).horizontalPadding(20.w),
                            ),
                          ),
                        )
                      : const SizedBox(),
              // SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           height: 400.h,
              //           child: ListView.separated(
              //               scrollDirection: Axis.vertical,
              //               physics: const AlwaysScrollableScrollPhysics(),
              //               shrinkWrap: true,
              //               itemBuilder: (context, index) {

              //                 return Container(
              //                   decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       boxShadow: [
              //                         BoxShadow(
              //                             blurRadius: 10.r,
              //                             color: const Color.fromARGB(
              //                                 255, 217, 215, 215))
              //                       ],
              //                       borderRadius:
              //                           BorderRadius.circular(7.r),
              //                       border: Border.all(color: Colors.grey)),
              //                   child: Column(
              //                     children: [
              //                       Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Text(
              //                             "Product Id: ${value.stockreportdata?.data![index].productID}",
              //                             style: FontPalette.black11500,
              //                           ),
              //                           Text(
              //                             "Barcode: ${value.stockreportdata?.data![index].barcode}",
              //                             style: FontPalette.black11300,
              //                           )
              //                         ],
              //                       ),
              //                       Row(
              //                         children: [
              //                           Expanded(
              //                             child: Text(
              //                               "${value.stockreportdata?.data![index].productName}",
              //                               style: FontPalette.black13500,
              //                               maxLines: 3,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                       Row(
              //                         children: [
              //                           Text(
              //                             "Gross Amt: Rs ${value.stockreportdata?.data![index].mrp}",
              //                             style: FontPalette.black13500,
              //                           ),
              //                         ],
              //                       )
              //                     ],
              //                   )
              //                       .verticalPadding(7.h)
              //                       .horizontalPadding(8.w),
              //                 ).horizontalPadding(20.w);
              //               },
              //               separatorBuilder: (context, index) =>
              //                   10.verticalSpace,
              //               itemCount: value.stockreportdata!.data!.length),
              //         ),
              //       ],
              //     ),
              //   ),
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
