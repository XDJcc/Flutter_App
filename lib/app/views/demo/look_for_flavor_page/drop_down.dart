import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownScreen extends StatefulWidget {
  final Function updateSelection;

  const DropDownScreen({
    required this.updateSelection,
    Key? key,
  }) : super(key: key);
  @override
  State<DropDownScreen> createState() => DropDownScreenState();
}

class DropDownScreenState extends State<DropDownScreen> {
  bool showBootom = false;

  /* 全部 / 新品 */
  bool _isAll = true;

/* 

  品类  品牌  筛选  智能排序

 */
  int _showDropId = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  changeSelection(val, {type}) {
    widget.updateSelection(val, type ?? 0);
    setState(() {
      _showDropId = type ?? 0;
      showBootom = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SizedBox(
          width: double.infinity,
          height: 44.w,
          child: OverflowBox(
            alignment: Alignment.topLeft,
            maxHeight: 600.w,
            maxWidth: size.width,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 44.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 12.w, right: 12.w),
                          child: Row(children: [
                            InkWell(
                              onTap: () {
                                if (_isAll) return;
                                setState(() {
                                  _isAll = true;
                                });
                              },
                              child: Text(
                                '全部',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: _isAll
                                        ? const Color(0xFF24262B)
                                        : const Color(0xFF89909F)),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            InkWell(
                              onTap: () {
                                if (!_isAll) return;
                                setState(() {
                                  _isAll = false;
                                });
                              },
                              child: Text(
                                '新品',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: !_isAll
                                        ? const Color(0xFF24262B)
                                        : const Color(0xFF89909F)),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 15.w,
                          child: VerticalDivider(
                              color: const Color(0xFFBFC5CE), width: 1.w),
                        ),
                        SizedBox(
                          width: 22.w,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  changeSelection(true, type: 1);

                                  // if (_showDropId != 1 && showBootom) return;
                                  // setState(() {
                                  //   showBootom = !showBootom;
                                  //   _showDropId = 1;
                                  // });
                                },
                                child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            '品类',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: const Color(0xFF89909F)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12.w,
                                          height: 12.w,
                                          child: Transform(
                                            alignment: Alignment.center,
                                            transform:
                                                showBootom && _showDropId == 1
                                                    ? Matrix4.rotationZ(
                                                        3.1415926535897932)
                                                    : Matrix4.rotationZ(0),
                                            child: Image.asset(
                                                'assets/images/drop_icon.png',
                                                width: 20.w,
                                                height: 12.w,
                                                fit: BoxFit.fitWidth),
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                              InkWell(
                                onTap: () {
                                  changeSelection(true, type: 2);

                                  // if (_showDropId != 2 && showBootom) return;
                                  // setState(() {
                                  //   _showDropId = 2;
                                  //   showBootom = !showBootom;
                                  // });
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          '品牌',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xFF89909F)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                        height: 12.w,
                                        child: Transform(
                                          alignment: Alignment.center,
                                          transform:
                                              showBootom && _showDropId == 2
                                                  ? Matrix4.rotationZ(
                                                      3.1415926535897932)
                                                  : Matrix4.rotationZ(0),
                                          child: Image.asset(
                                              'assets/images/drop_icon.png',
                                              width: 20.w,
                                              height: 12.w,
                                              fit: BoxFit.fitWidth),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeSelection(true, type: 3);

                                  // if (_showDropId != 3 && showBootom) return;
                                  // setState(() {
                                  //   _showDropId = 3;
                                  //   showBootom = !showBootom;
                                  // });
                                },
                                child: Container(
                                  // width: 100.w,
                                  // height: 44.w,
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          '筛选',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xFF89909F)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                        height: 12.w,
                                        child: Transform(
                                          alignment: Alignment.center,
                                          transform:
                                              showBootom && _showDropId == 3
                                                  ? Matrix4.rotationZ(
                                                      3.1415926535897932)
                                                  : Matrix4.rotationZ(0),
                                          child: Image.asset(
                                              'assets/images/drop_icon.png',
                                              width: 20.w,
                                              height: 12.w,
                                              fit: BoxFit.fitWidth),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  changeSelection(true, type: 4);

                                  // if (_showDropId != 4 && showBootom) return;
                                  // setState(() {
                                  //   _showDropId = 4;
                                  //   showBootom = !showBootom;
                                  // });
                                },
                                child: Container(
                                  // width: 100.w,
                                  // height: 44.w,
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          '智能排序',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xFF89909F)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                        height: 12.w,
                                        child: Transform(
                                          alignment: Alignment.center,
                                          transform:
                                              showBootom && _showDropId == 4
                                                  ? Matrix4.rotationZ(
                                                      3.1415926535897932)
                                                  : Matrix4.rotationZ(0),
                                          child: Image.asset(
                                              'assets/images/drop_icon.png',
                                              width: 20.w,
                                              height: 12.w,
                                              fit: BoxFit.fitWidth),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        )
                      ],
                    ),
                  ),
                  // Offstage(
                  //   offstage: !(_showDropId == 1),
                  //   child: AnimatedContainer(
                  //     duration: const Duration(milliseconds: 200),
                  //     width: size.width,
                  //     height: showBootom ? 500.w : 0,
                  //     color: Colors.deepOrangeAccent,
                  //     child: _createTag(),
                  //   ),
                  // ),
                  // Offstage(
                  //   offstage: !(_showDropId == 2),
                  //   child: AnimatedContainer(
                  //     duration: const Duration(milliseconds: 200),
                  //     width: size.width,
                  //     height: showBootom ? 500.w : 0,
                  //     color: Color.fromARGB(255, 41, 151, 195),
                  //   ),
                  // ),
                  // Offstage(
                  //   offstage: !(_showDropId == 3),
                  //   child: AnimatedContainer(
                  //     duration: const Duration(milliseconds: 200),
                  //     width: size.width,
                  //     height: showBootom ? 500.w : 0,
                  //     color: Color.fromARGB(255, 41, 195, 123),
                  //   ),
                  // ),
                  // Offstage(
                  //   offstage: !(_showDropId == 4),
                  //   child: AnimatedContainer(
                  //     duration: const Duration(milliseconds: 200),
                  //     width: size.width,
                  //     height: showBootom ? 500.w : 0,
                  //     color: Color.fromARGB(255, 195, 41, 193),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _createTag() {
    List list = [
      {
        "id": 1,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 2,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 3,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 4,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 5,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 6,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 7,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
      {
        "id": 8,
        "name": '商品标签',
        "selection": false,
      },
    ];
    return showBootom
        ? CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 300.w,
                  color: Colors.red,
                  child: SingleChildScrollView(
                    child: Column(
                      children: list.map<Widget>((e) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(top: 20.w, right: 20.w),
                            padding: EdgeInsets.fromLTRB(18.w, 5.w, 18.w, 5.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.w),
                                color: e['selection']
                                    ? const Color(0xFFFEF8ED)
                                    : const Color(0xFFF0F3F6)),
                            child: Text(
                              e['name'],
                              style: TextStyle(
                                color: e['selection']
                                    ? const Color(0xFFF28E1C)
                                    : const Color(0xFF24262B),
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            ],
          )
        : const SizedBox();
  }
}
