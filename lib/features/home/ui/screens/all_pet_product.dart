part of home_ui_module;

class AllPetProducts extends StatefulWidget {
  const AllPetProducts({Key? key}) : super(key: key);

  @override
  State<AllPetProducts> createState() => _AllPetProductsState();
}

class _AllPetProductsState extends State<AllPetProducts> {
  @override
  void initState() {
    super.initState();
    sl<ProductProvider>().getPetShopProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pet Shop"),
      ),
      body: Consumer2<ProductProvider, HomeProvider>(
        builder: (context, productProvider, homeProvider, child) =>
            productProvider.products == null
                ? const CustomCircularProgressIndicator()
                : Padding(
                    padding: 20.paddingVertical,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 0.0, // Spacing between columns
                        mainAxisSpacing: 8.0, // Spacing between rows
                      ),
                      itemCount: productProvider.products!.products!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          productProvider.setProductObject(
                              current:
                                  productProvider.products!.products![index]);
                        },
                        child: ShodCardGrid(
                          onTap: () {},
                          singleProduct:
                              productProvider.products!.products![index],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
