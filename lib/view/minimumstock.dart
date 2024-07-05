import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rynoz/helper/extension.dart';
import 'package:rynoz/helper/font_palette.dart';
import 'package:rynoz/view_model/home_provider.dart';

class MinimumStockScreen extends StatefulWidget {
  const MinimumStockScreen({super.key});

  @override
  State<MinimumStockScreen> createState() => _MinimumStockScreenState();
}

class _MinimumStockScreenState extends State<MinimumStockScreen> {
  refresh() async {
    final home = context.read<HomeProvider>();

    await home.getminimumstock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Minimum Stock"),
          automaticallyImplyLeading: true,
        ),
        body: RefreshIndicator(
          onRefresh: () => refresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Consumer<HomeProvider>(builder: (context, value, child) {
              if (value.minimumstockdata?.data == null) {
                return const SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No data found"),
                    ],
                  ),
                );
              }
              if (value.stockportdataLoaderState == LoaderState.loading) {
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
                      itemCount: value.minimumstockdata?.data?.length,
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
                                    "${value.minimumstockdata?.data![index].productName}",
                                    style: FontPalette.black13700,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${value.minimumstockdata?.data![index].categoryName}",
                                    style: FontPalette.grey12500,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Minimum Stock: ${value.minimumstockdata?.data![index].minimumStock}",
                                    style: FontPalette.grey12500,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Stock: ${value.minimumstockdata?.data![index].stock}",
                                    style: FontPalette.black11500,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Barcode: ${value.minimumstockdata?.data![index].barcode}",
                                    style: FontPalette.black11500,
                                  ),
                                  Text(
                                    "Rs ${value.minimumstockdata?.data![index].mrp}",
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
