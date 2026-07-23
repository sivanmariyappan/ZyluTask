import 'package:exsizeproject/common/constant/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.name,
    required this.email,
    required this.department,
    required this.salary,
    required this.experience,
    required this.active,
    this.joiningDate,
     required this.image,
  });

  final String name;
  final String email;
  final String department;
  final int salary;
  final int experience;
  final bool active;
  final DateTime? joiningDate;
  final String image;

  @override
  Widget build(BuildContext context) {

    final bool isEligible = active && experience >= 5;

    return Card(    
      color: isEligible ? Colors.green.shade50 : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isEligible ? Colors.green : Colors.grey.shade300,
          width: 1,
        ),
      ),
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipOval(
                child: Image.network(
                  image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return   CircleAvatar(
                  radius: 30,
                  child: Text(
                    name.isNotEmpty 
                        ? name[0].toUpperCase()
                        : "",
                ),
              );
                  },
                ),
              ),   

            const SizedBox(width: 12),

            Expanded(
            
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(email),

                  Text(
                    department,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),               

                ],
              ),
            ),

            Column(
              children: [
                CustomButtonWidget(onPressed: (){},
                  text: active ? "Active" : "Inactive",
                  inactiveColor: Color.fromARGB(255, 245, 168, 167),
                  activeColor: const Color.fromARGB(255, 70, 144, 77),
                  isActive:active ,

                 ),
                      
                RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: experience.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const TextSpan(
                      text: " years",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
  
              ],
            ),
            const SizedBox(width: 12),
            Icon(Icons.arrow_forward_ios_sharp,size: 15,)

        
          ],
        ),
      ),
    );
  }
}