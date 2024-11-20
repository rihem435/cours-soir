import 'package:app/controller/home_controller.dart';
import 'package:app/core/networking/app_api.dart';
import 'package:app/core/storage/app_storage.dart';
import 'package:app/core/theme/app_colors.dart';
import 'package:app/core/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Icon(
              Icons.notifications,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: Drawer(
          width: MediaQuery.sizeOf(context).width * .8,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/user.png",
                        ),
                      )),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                accountName: Text(
                  AppStorage.readUserName() ?? "username",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                  ),
                ),
                accountEmail: Text(
                  AppStorage.readEmail() ?? "user@gmail.com",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
                title: Text('My Profile'),
                onTap: () {},
              ),
              SizedBox(
                height: 80,
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
                title: Text('LogOut'),
                onTap: () {
                  showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                FutureBuilder(
                  future: controller.getAllCategory(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.allCategories!.isNotEmpty) {
                        return SizedBox(
                          height: 30,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                child: Text(
                                  snapshot.data!.allCategories![index].name!,
                                ),
                              );
                            },
                            itemCount: snapshot.data!.allCategories!.length,
                            separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                          ),
                        );
                      } else {
                        return Text("No Categories.");
                      }
                    }
                    return SizedBox();
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                FutureBuilder(
                  future: controller.getAllProduct(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      );
                    } else if (snapshot.hasData) {
                      if (snapshot.data!.allData!.isNotEmpty) {
                        return GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 10.0, // Spacing between columns
                              mainAxisSpacing: 10.0, // Spacing between rows
                            ),
                            itemCount: snapshot.data!.allData!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 200,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "${AppApi.getImageUrl}${snapshot.data!.allData![index].image![0]}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                      '\t\tRef : ${snapshot.data!.allData![index].ref}'),
                                  Text(
                                      '\t\tPrix : ${snapshot.data!.allData![index].price}'),
                                ],
                              );
                            });
                      } else {
                        return Text("No Products.");
                      }
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
