part of auth_module;

class MainAuthScreen extends StatefulWidget {
  const MainAuthScreen({Key? key}) : super(key: key);

  @override
  State<MainAuthScreen> createState() => _MainAuthScreenState();
}

class _MainAuthScreenState extends State<MainAuthScreen>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
    sl<AuthProvider>().tabController = TabController(length: 2,
        vsync: this); // Change length according to the number of tabs
  }

  @override
  void dispose() {
    sl<AuthProvider>().tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // Set this to true
        backgroundColor: ColorManager.soft,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              width: AppSize.s210.width,
              padding: const EdgeInsets.all(0),
              margin: EdgeInsetsDirectional.only(
                bottom: AppSize.s20.height,
                start: AppSize.s10.width,
              ),
              decoration: BoxDecoration(
                color: ColorManager.soft,
              ),
              child: Consumer<AuthProvider>(
                builder: (context, auth, child) =>
                    TabBar(
                      controller: auth.tabController,
                      onTap: (index) => auth.changeCurrantTap(index),
                      unselectedLabelColor: ColorManager.primary,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: ColorManager.soft,
                      dividerColor: ColorManager.soft,
                      indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: ColorManager.secondary, width: 3),
                        ),
                        color: ColorManager.transparent,
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            AppStrings.signIn,
                            maxLines: 1,
                            style: auth.tabController.index == 0
                                ? titleSemiBoldSecondary
                                : titleRegular,
                          ),
                        ),
                        Tab(
                          child: Text(
                            AppStrings.signUp,
                            maxLines: 1,
                            style: auth.tabController.index == 1
                                ? titleSemiBoldSecondary
                                : titleRegular,
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
        builder: (_, __) =>
        Consumer<AuthProvider>(
          builder: (context, auth, child) =>
              TabBarView(
                controller: auth.tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  LoginScreen(),
                  SignUpScreen(),
                ],
              ),
        )
    ,
    )
    ,
    );
  }
}
