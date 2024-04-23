import 'package:e_commerce_app/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../customs/text_field.dart';
import '../../model/check_user.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  TextEditingController FirstNameController = TextEditingController();
  TextEditingController LastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController profileImageURLController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 35,
          ),
        ),
        title: const Align(
          alignment: AlignmentDirectional(-1.00, 0.00),
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/vectors/man-avatar-icon-man-flat-icon-man-faceless-avatar-man-character-vector-id1027705656?k=6&m=1027705656&s=170667a&w=0&h=NbSJL7Ko0eFpRi4gKcD4EAMvRRLdXPY6GF4NsrlpSX8=",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text_Field(
                icon: Icons.person,
                text: 'First Name',
                input: TextInputType.name,
                controller: FirstNameController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text_Field(
                icon: Icons.person,
                text: 'Last Name',
                input: TextInputType.name,
                controller: LastNameController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text_Field(
                icon: Icons.call,
                text: 'Phone Number',
                input: TextInputType.phone,
                controller: phoneController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text_Field(
                icon: Icons.call,
                text: 'Profile Image URL',
                input: TextInputType.url,
                controller: profileImageURLController,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStatePropertyAll(Size(330, 50)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
