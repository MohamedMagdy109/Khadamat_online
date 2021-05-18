import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopper/stopper.dart';

import 'bottom_Sheet_9.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';
import 'package:cached_network_image/cached_network_image.dart';

class mapHome extends StatefulWidget {
  @override
  _mapHomeState createState() => _mapHomeState();
}

class _mapHomeState extends State<mapHome> {
  bool active = false;

  final controller = MapController(
    location: LatLng(35.71, 51.41),
  );

  void _gotoDefault() {
    controller.center = LatLng(35.68, 51.41);
  }

  void _onDoubleTap() {
    controller.zoom += 0.5;
  }

  Offset _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart;
      _dragStart = now;
      controller.drag(diff.dx, diff.dy);
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        if (active == true) {
          Navigator.of(context).pop();
          setState(() {
            active = false;
          });
        } else {
          SystemNavigator.pop(); //close the app
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: true,
        body: SafeArea(
          child: Stack(
            //  alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: GestureDetector(
                  onDoubleTap: _onDoubleTap,
                  onScaleStart: _onScaleStart,
                  onScaleUpdate: _onScaleUpdate,
                  child: Map(
                    controller: controller,
                    builder: (context, x, y, z) {
                      final url =
                          'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                      return CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (active == false)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 2.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(25.0),
                                ),
                                child: CircleAvatar(
                                  // backgroundImage: AssetImage('assets/images/surface1.png'),
                                  child: Icon(
                                    Icons.filter_alt_sharp,
                                    color: Colors.black,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                ),
                              ),
                              Container(
                                  width: 250,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0), //(x,y)
                                        blurRadius: 2.0,
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  '         ابحث عن مقدم خدمة',
                                              suffixIcon: Icon(
                                                Icons.search_outlined,
                                                color: Color(0xFFF707070),
                                              ))))),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      active = false;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 2.0,
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                    ),
                                    child: CircleAvatar(
                                      // backgroundImage: AssetImage('assets/images/surface1.png'),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ),
                                      backgroundColor: Colors.white,
                                      radius: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    MaterialButton(
                      onPressed: () {
                        if (active == false) {
                          // showBottomSheet(
                          //     //isScrollControlled: true,
                          //     context: context,
                          //     builder: (ctx) => bottom_Sheet());

                          showStopper(
                            userCanClose: false,
                            context: context,
                            stops: [0.4 * h, h],
                            builder: (context, scrollController, scrollPhysics,
                                stop) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.2,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                                child: SafeArea(
                                  child: ClipRRect(
                                    borderRadius: stop == 0
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25),
                                          )
                                        : BorderRadius.only(),
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      // color: Colors.orange,
                                      child: CustomScrollView(
                                        slivers: <Widget>[
                                          // SliverAppBar(
                                          //   title: Text("sadsd"),
                                          //   backgroundColor: Colors.white10,
                                          //   automaticallyImplyLeading: false,
                                          //   primary: false,
                                          //   floating: true,
                                          //   pinned: true,
                                          // ),
                                          SliverList(
                                            delegate:
                                                SliverChildBuilderDelegate(
                                              (context, idx) => bottom_Sheet(),
                                              childCount: 1,
                                            ),
                                          )
                                        ],
                                        controller: scrollController,
                                        physics: scrollPhysics,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                          ////////////////
                          setState(() {
                            active = true;
                          });
                        }
                      },
                      child: Column(
                        children: [
                          Icon(Icons.wallet_travel_outlined),
                          Text('اسم مقدم الخمة'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'طلباتي الحالية',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 134, //134
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              itemCount: 2,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 15,
                              ),
                              itemBuilder: (context, index) => Container(
                                // width: 260,
                                // height: 80,
                                //   child: Card(
                                ////////////////////////////////
                                width: 260,
                                height: 80,
                                margin: const EdgeInsets.only(bottom: 0.7),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 1.0,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                // elevation: 2.0,
                                // margin: EdgeInsets.zero,
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(18.0),
                                //   // side: BorderSide(color: Colors.red)
                                // ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                //  color: Colors.amber,
                                                width: 150,
                                                height: 29,
                                                child: Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,

                                                  alignment: WrapAlignment.end,
                                                  // Gap between adjacent chips.
                                                  spacing: -10.0,
                                                  // Gap between lines.
                                                  runSpacing: 4.0,
                                                  children: [
                                                    'نجار',
                                                    'سباك',
                                                  ]
                                                      .map((String name) =>
                                                          Container(
                                                            width: 60,
                                                            height: 40,
                                                            child: Transform(
                                                              transform:
                                                                  new Matrix4
                                                                      .identity()
                                                                    ..scale(
                                                                        0.8),
                                                              child: Chip(
                                                                backgroundColor:
                                                                    Colors.blue[
                                                                        50],
                                                                label: Text(
                                                                  name,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .blue,
                                                                      fontSize:
                                                                          15),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                              Text(
                                                'اسم مقدم الخدمة',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                textAlign: TextAlign.right,
                                                textDirection:
                                                    TextDirection.rtl,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            child: Image.network(
                                                'https://www.digitalartsonline.co.uk/cmsdata/features/3692307/deekay-kwon-2_thumb1200_16-9.jpg',
                                                height: 55.0,
                                                width: 55.0,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'التاريخ ',
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFFF707070),
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.right,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      child: Text(
                                                        'اليوم 12/4/2012',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12),
                                                        textAlign:
                                                            TextAlign.right,
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey[100],
                                                  radius: 15,
                                                  child: Icon(
                                                    Icons.date_range_outlined,
                                                    color: Colors.blue,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'الوقت ',
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFFF707070),
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.right,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    Text(
                                                      '10 م - 12م',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.right,
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.grey[100],
                                                  radius: 15,
                                                  child: Icon(
                                                    Icons.watch_later,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
