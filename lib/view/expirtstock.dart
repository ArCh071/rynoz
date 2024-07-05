import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/view_model/home_provider.dart';

class ExpiryStockScreen extends StatefulWidget {
  const ExpiryStockScreen({super.key});

  @override
  State<ExpiryStockScreen> createState() => _ExpiryStockScreenState();
}

class _ExpiryStockScreenState extends State<ExpiryStockScreen> {
  refresh() async {
    final home = context.read<HomeProvider>();

    await home.getexpirystock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expiry Stock"),
          automaticallyImplyLeading: true,
        ),
        body: RefreshIndicator(
          onRefresh: () => refresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Consumer<HomeProvider>(builder: (context, value, child) {
              if (value.expirystockdata?.data?.length == 0) {
                return const SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No data found"),
                    ],
                  ),
                );
              }
              if (value.expirystockdataLoaderState == LoaderState.loading) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 40.h,
                        color: Colors.grey,
                      ).addShimmer().bottomPadding(10.h);
                    });
              }

              return Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.expirystockdata?.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.r,
                                  color:
                                      const Color.fromARGB(255, 217, 215, 215))
                            ],
                            // border: Border.all(color: Colors.grey)
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${value.expirystockdata?.data![index].productName}",
                                    style: FontPalette.black13700,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${value.expirystockdata?.data![index].categoryName}",
                                    style: FontPalette.grey12500,
                                  ),
                                  Text(
                                    "Days Left: ${value.expirystockdata?.data![index].daysLeft}",
                                    style: FontPalette.black12400,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Barcode: ${value.expirystockdata?.data![index].barcode}",
                                    style: FontPalette.black11500,
                                  ),
                                  Text(
                                    "Rs ${value.expirystockdata?.data![index].mrp}",
                                    style: FontPalette.black13700,
                                  )
                                ],
                              ),
                            ],
                          ).verticalPadding(10.h).horizontalPadding(10.w),
                        ).bottomPadding(10.h).horizontalPadding(20.w);
                      })
                ],
              );
            }),
          ),
        ));
  }
}
