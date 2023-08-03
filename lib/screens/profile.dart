import 'package:flutter/material.dart';

class  profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 120,
                      backgroundImage: AssetImage('lib/images/175947558_1172077256589103_8021414409125915859_n.jpg'),
                    ),
                    Text(
                      'Abdelrahman Mansour',
                      style: TextStyle(
                          color: Color(0xff0F6292),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Flutter developer',
                      style: TextStyle(color: Color(0xff0F6292), fontSize: 24),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.phone,
                      color: Color(0xff0F6292),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '01277532063',
                      style: TextStyle(
                        color: Color(0xff0F6292),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.email,
                      color: Color(0xff0F6292),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'abdo.mansour741@gmail.com',
                      style: TextStyle(
                        color: Color(0xff0F6292),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.save,
                      color: Color(0xff0F6292),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'savad messages',
                          style: TextStyle(
                            color: Color(0xff0F6292),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.settings,
                      color: Color(0xff0F6292),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'settings',
                          style: TextStyle(
                            color: Color(0xff0F6292),
                          ),
                        ))
                  ],
                ),
              ],
              ),
          ],
        ),
      ),
    );
  }
}