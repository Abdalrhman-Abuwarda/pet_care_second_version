import 'package:flutter/material.dart';
import 'package:pet_care_second_version/utils/extension/responsive_extension.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_circularProgressIndicator.dart';
import '../../../../locator.dart';
import '../../controllers/home_provider.dart';
import '../../widgets/vet_card.dart';

class AllVetsDoctor extends StatefulWidget {
  const AllVetsDoctor({Key? key}) : super(key: key);

  @override
  State<AllVetsDoctor> createState() => _AllVetsDoctorState();
}

class _AllVetsDoctorState extends State<AllVetsDoctor> {
  @override
  void initState() {
    super.initState();
    sl<HomeProvider>().getVetsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Vets"),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) => homeProvider.vetsModel ==
                null
            ? const CustomCircularProgressIndicator()
            : Padding(
                padding: 20.paddingVertical,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 0.0, // Spacing between columns
                    mainAxisSpacing: 8.0, // Spacing between rows
                  ),
                  itemCount: homeProvider.vetsModel!.vets!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      homeProvider.setVetObject(
                          current: homeProvider.vetsModel!.vets![index]);
                    },
                    child: VetCardGrid(
                      vet: homeProvider.vetsModel!.vets![index],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
