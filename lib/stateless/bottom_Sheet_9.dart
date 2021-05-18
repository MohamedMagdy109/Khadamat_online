import 'package:flutter/material.dart';

class bottom_Sheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 810,
        // // padding: const EdgeInsets.all(8.0),
        // decoration: BoxDecoration(
        //   border: Border.all(
        //     color: Colors.black,
        //     width: 0.2,
        //   ),
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(30.0),
        //     topRight: Radius.circular(30.0),
        //   ),
        // ),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            firstSection(context),
            secSectionList(),
            thrdSectionReviews(),
            fourthsection(context),
            finalBottun(),
          ],
        ),
      ),
    );
  }
}

Widget firstSection(var context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
        child: Center(
          child: Container(
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width * 0.3,
            height: 5,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              // mainAxisAlignment:
              //     MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  //  color: Colors.amber,
                  width: 150,
                  height: 29,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,

                    alignment: WrapAlignment.end,
                    // Gap between adjacent chips.
                    spacing: -10.0,
                    // Gap between lines.
                    runSpacing: 4.0,
                    children: [
                      'نجار',
                      'سباك',
                    ]
                        .map((String name) => Container(
                              width: 60,
                              height: 40,
                              child: Transform(
                                transform: new Matrix4.identity()..scale(0.8),
                                child: Chip(
                                  backgroundColor: Colors.blue[50],
                                  label: Text(
                                    name,
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Text(
                  'اسم مقدم الخدمة',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    Text(
                      'الممفضلة',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 10,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '22 ساعة',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: 10,
                      child: Icon(
                        Icons.location_on_sharp,
                        color: Colors.blue,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: Image.network(
                  'https://www.digitalartsonline.co.uk/cmsdata/features/3692307/deekay-kwon-2_thumb1200_16-9.jpg',
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.fill),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'مواعيد',
                        style:
                            TextStyle(color: Color(0xFFF707070), fontSize: 12),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        width: 60,
                        child: Text(
                          '12ص 12م',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 15,
                    child: Icon(
                      Icons.watch_later_outlined,
                      color: Colors.blue,
                      size: 23,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        'متوسط',
                        style:
                            TextStyle(color: Color(0xFFF707070), fontSize: 12),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '30-300 ج.م',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    radius: 15,
                    child: Icon(
                      Icons.money_rounded,
                      color: Colors.blue,
                      size: 23,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget secSectionList() {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'صور الخمة المقدمة',
              style: TextStyle(color: Colors.black, fontSize: 22),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 150,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(18.0),
                    child: Image.network(
                        'https://www.digitalartsonline.co.uk/cmsdata/features/3692307/deekay-kwon-2_thumb1200_16-9.jpg',
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.fill),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: 6),
        ),
      ],
    ),
  );
}

Widget thrdSectionReviews() {
  return Padding(
    padding: const EdgeInsets.only(right: 12),
    child: Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '4.9',
              style: TextStyle(color: Colors.grey, fontSize: 16),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            Icon(Icons.star, color: Colors.yellow),
            Text(
              'التقيمات',
              style: TextStyle(color: Colors.black, fontSize: 22),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 125,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              reverse: true,
              itemBuilder: (context, index) => Container(
                    width: 250,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'اسم المستخدم',
                                  style: TextStyle(
                                      color: Color(0xFFF707070), fontSize: 20),
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                ),
                                reviewIcons(5),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr3qBVX4XIA8zq3LpBn64zAuOt9_IZ7_H5uA&usqp=CAU'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'هذالنص مثال لنص يمكن ان يستبدل',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]),
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
              itemCount: 6),
        ),
      ],
    ),
  );
}

Widget reviewIcons(var num) {
  return Container(
    width: 90,
    height: 10,
    child: ListView.builder(
      reverse: true,
      scrollDirection: Axis.horizontal,
      itemCount: num,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.yellow,
        size: 13,
      ),
    ),
  );
}

Widget fourthsection(context) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(
            'وصف الخدمة',
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
          ),
          SizedBox(
            height: 15,
          ),
        ]),
        Container(
          height: 100,
          // width: MediaQuery.of(context).size.width * 0.,
          child: Text(
            'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع. ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق. هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.',
            style: TextStyle(color: Colors.grey, fontSize: 20),
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        ),
      ],
    ),
  );
}

Widget finalBottun() {
  return Container(
    width: double.infinity,
    height: 70,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        // boxShadow: [
        //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
        // ],
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 5.0,
          ),
        ],
        color: Colors.white),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        topRight: Radius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 9.0, right: 9),
          child: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              "طلب الخمدمة",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {},
          ),
        ),
      ),
    ),
  );
}
