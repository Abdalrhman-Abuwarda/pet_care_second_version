part of shop_screens;

class FurnitureShop extends StatefulWidget {
  const FurnitureShop({Key? key}) : super(key: key);

  @override
  State<FurnitureShop> createState() => _FurnitureShopState();
}

class _FurnitureShopState extends State<FurnitureShop> {
  final shopController = Get.put(ShopController());
  final productProvider = sl<ProductProvider>();
  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  void initState() {
    super.initState();
    productProvider.getPetShopProvider();
    shopController.initPharmacyShopState();
  }

  @override
  void dispose() {
    super.dispose();
    shopController.disposePharmacyState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      body: SingleChildScrollView(
        child: Column(
          children: [
            (Get.height * 0.03).verticalSpace,
            BannerCard(
              controller: shopController.bannerCardController,
              onTap: (int index) =>
                  shopController.updateCurrantBannerCard(index),
              listSvg: SvgAssets.bannersPng,
            ),
            const RVerticalSpace(height: AppSize.s32),
            DividerShopCard(
              title: 'Best Furniture',
              textButton: "See all",
              onPressed: () {},
            ),
            const RVerticalSpace(height: AppSize.s16),
            SizedBox(
                height: 280.height,
                child: productProvider.products == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: productProvider.products!.products!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                productProvider.setProductObject(
                                    current: productProvider
                                        .products!.products![index]);
                              },
                              child: ShodCard(
                                onTap: () {
                                  setState(() {
                                    productProvider.products!.products![index]
                                                .inCart !=
                                            true
                                        ? productProvider.deleteFromCart(
                                            productProvider
                                                .products!.products![index])
                                        : productProvider.addToCart(
                                            productProvider
                                                .products!.products![index]);
                                    productProvider
                                            .products!.products![index].inCart =
                                        !productProvider
                                            .products!.products![index].inCart!;
                                  });
                                },
                                singleProduct:
                                    productProvider.products!.products![index],
                              )
                                  .animate(delay: 200.ms)
                                  .moveX(begin: -100)
                                  .then()
                                  .shakeX(hz: 4, amount: 3),
                            ))),
            const RVerticalSpace(height: AppSize.s32),
            DividerShopCard(
              title: 'Top Furniture',
              textButton: "See all",
              onPressed: () {},
            ),
            Image.asset(ImageAssets.bannerImage),
          ],
        ),
      ),
    );
  }
}
