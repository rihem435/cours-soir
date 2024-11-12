import 'package:app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
                  'username',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                  ),
                ),
                accountEmail: Text(
                  'user@gmail.com',
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
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
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
                        "data",
                      ),
                    );
                  },
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                ),
              )
            ],
          ),
        ));
  
  
  
  
  }
}
