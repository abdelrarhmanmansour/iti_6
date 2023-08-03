import 'package:flutter/material.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        width: 300,
                        height: 40,
                        child: TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Color(0xff0F6292),
                                ),
                                onPressed: () {},
                              ),
                              hintText: 'search person here',
                              hintStyle: TextStyle(
                                color: Color(0xff0F6292),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        )),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Divider(
                  height: 3,
                  color: Color(0xff0F6292),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 650,
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('lib/images/175947558_1172077256589103_8021414409125915859_n.jpg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'abdelrahman mansour',
                                  style: TextStyle(
                                      color: Color(0xff0F6292),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'hi abdelrahman mansour ',
                                  style: TextStyle(
                                    color: Color(0xff0F6292),
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '7:13 PM',
                                  style: TextStyle(
                                    color: Color(0xff0F6292),
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 3,
                          color: Color(0xff0F6292),
                        );
                      },
                      itemCount: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
