import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('WhatsApp'),
          bottom: TabBar(

              onTap: (index) {
                setState(() {
                  indexTab = index;
                });
              },
              tabs: [
                Tab(child: Icon(Icons.camera_alt),),
                Tab(child: Text('Chats')),
                Tab(child: Text('Status')),
                Tab(child: Text('Call')),
              ]),
          actions: [Icon(Icons.qr_code),
            SizedBox(width: 10,),
            Icon(Icons.search),
            SizedBox(width: 10,),
            PopupMenuButton(
                icon: Icon(Icons.more_vert_outlined),

                itemBuilder: (context) =>
                [
                  PopupMenuItem(
                    value: 1,
                    child: Text('New Group'),),
                  PopupMenuItem(
                    value: 2,
                    child: Text('New Community'),),
                  PopupMenuItem(
                    value: 3,
                    child: Text('New Broadcast'),),
                  PopupMenuItem(
                    value: 4,
                    child: Text('Linked devices'),),
                  PopupMenuItem(
                    value: 5,
                    child: Text('Starred'),),
                  PopupMenuItem(
                    value: 6,
                    child: Text('Payments'),),
                  PopupMenuItem(
                    value: 7,
                    child: Text('Read all'),),
                  PopupMenuItem(
                    value: 8,
                    child: Text('Settings'),)

                ]
            ),
            SizedBox(width: 10,)
          ],

        ),
        body: TabBarView(children: [
          Container(
              alignment: (Alignment.center),
              child:  Icon(Icons.camera_alt_rounded,size: 30,
              color: Colors.black12),
          ),
          ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    title: Text('Mom'),
                    subtitle: Text('Did you had lunch?'),
                    trailing: Text('1:15 PM'),
                  );
                }else{
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://th.bing.com/th?q=Boss+Starz&w=120&h=120&c=1&rs=1&qlt=90&cb=1&dpr=1.25&pid=InlineBlock&mkt=en-IN&cc=IN&setlang=en&adlt=moderate&t=1&mw=247')
                    ),
                    title: Text('Laksh'),
                    subtitle: Text("send me today's assignment"),
                    trailing: Text('12:45 PM'),
                  );

                }
              }
                ),
          ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('  Status', style: TextStyle(fontWeight: FontWeight
                            .w300),),
                        ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 3,
                                )
                            ),
                            child: CircleAvatar(
                              child: Icon(Icons.add_a_photo),
                                
                            ),
                          ),
                          title: Text('My status'),
                          subtitle: Text('disappear after 24 hours'),


                        ),
                      ],
                    ),
                  );
                } else {
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 3,
                          )
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage( index %2 ==0 ?
                            'https://www.pexels.com/photo/woman-wearing-black-spaghetti-strap-top-415829/' :
                        'https://www.pexels.com/photo/woman-wearing-black-spaghetti-strap-top-415829/'),
                      ),
                    ),
                    title: Text(index %2 ==0 ? 'papa' : 'Sumit'),
                    subtitle: Text(index %2 ==0 ?'35m ago' : 'a minute ago'),


                  );
                }
              }
          ),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.pexels.com/photo/woman-wearing-black-spaghetti-strap-top-415829/'),
                    ),
                    title: Text(index % 3 == 0 ? 'Mom' : 'lilly'),
                    subtitle: Text(index % 2 == 0
                        ? 'yesterday, 10:44 AM'
                        : 'you have missed video call'),
                    trailing: Icon(
                        index % 2 == 0 ? Icons.phone : Icons.video_call)
                );
              }
          ),
        ]
        ),
      ),
    );
  }
}