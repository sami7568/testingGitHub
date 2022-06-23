import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Typography.englishLike2018.apply(fontSizeFactor: 2.sp)
        ),
        builder: (context,widget){
          return MediaQuery( 
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), 
              child: widget!
            );
        },
        home: child,
      );
      },
      child: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    print(ScreenUtil().scaleHeight);
    print(ScreenUtil().scaleWidth);
    print(ScreenUtil().pixelRatio);
    
    setState(() {
       _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
             Container(
              padding: REdgeInsets.all(9),
              height: 100.h,
              width: 100.w,
              decoration:const BoxDecoration(color: Colors.brown),
            ),
            
            Text(
              '16sp, will not change with the system.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
              textScaleFactor: 1.5,
            ),
            Text(
              '16sp,if data is not set in MediaQuery,my font size will change with the system.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
