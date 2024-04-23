import 'package:flutter/material.dart';

import '../../customs/animateroute.dart';
import '../login/presentation/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: MediaQuery
                  .sizeOf(context)
                  .height,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(TextSpan(
                            text: "Profile",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              )
                            ])),
                        Icon(
                          Icons.person,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .surface,
                          size: 45,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(150),
                              child: Image.network(
                                "https://th.bing.com/th/id/OIP.eU8MYLNMRBadK-YgTT6FJQHaHw?rs=1&pid=ImgDetMain",
                                fit: BoxFit.fill,
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: const Row(
                            children: [
                              Text(
                                "UserName:  ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              Text(
                                "Ahmed Mohamed",
                                // account.accountModel[0].username,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: const Row(
                            children: [
                              Text(
                                "Email:  ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              Text(
                                "Ahmed@gmail.com",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     padding: const EdgeInsets.all(8),
                      //     decoration: BoxDecoration(
                      //         color: Theme.of(context)
                      //             .colorScheme
                      //             .primary,
                      //         borderRadius:
                      //         BorderRadius.circular(15)),
                      //     child: TextButton(
                      //       onPressed: () {
                      //         Navigator.of(context)
                      //             .pushAndRemoveUntil(
                      //             SlideRightTransition(
                      //                 page: const EditProfile()),
                      //                 (route) => false);
                      //       },
                      //       child: Text(
                      //         "Edit Profile",
                      //         style: TextStyle(
                      //             color: Theme.of(context)
                      //                 .colorScheme
                      //                 .secondary,
                      //             fontSize: 20),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushAndRemoveUntil(
                                  SlideRightTransition(
                                      page: LoginScreen()),
                                      (route) => false);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.logout_outlined, size: 25,
                                  color: Colors.red,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
