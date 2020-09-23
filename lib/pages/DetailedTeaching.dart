
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:fwf/widgets/AppBarWidget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class DetailedTeaching extends StatefulWidget {
  String id;
  String title;
  String category;
  String name;
  String description;
  String date;
  String profile;
  String video;
DetailedTeaching({Key key, @required this.id,
  @required this.video,
  @required this.profile,
  @required this.title,
  @required this.name,
  @required this.category,
  @required this.description,
  @required this.date,}): super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DetailedTeachingState();
  }
}

class _DetailedTeachingState extends State<DetailedTeaching> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;
//  final imgUrl = "${}";
  bool downloading = false;
  var progressString = "";
  int progress = 0;
  _launchURL(String url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      print("path ${dir.path}");
      await dio.download(widget.video, "${dir.path}/${widget.title}.mp4",
          onReceiveProgress: (rec, total) {
            print("Rec: $rec , Total: $total");

            setState(() {
              downloading = true;
              progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
            });
          });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }
  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(widget.video);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
       placeholder: Container(
         color: Colors.grey,
       ),
       autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:appBarWidget(context),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10,),
                Chewie(
                  controller: _chewieController,
//                ),
//              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${widget.title}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),))
              ],
            ),
            Row(
              children: <Widget>[
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("by  ${widget.name}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                    ),)
                ),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

//              Text("$progress", style: TextStyle(fontSize: 10),),
              IconButton(
                icon: Icon(Icons.file_download),
                onPressed: () async {
                  setState(() async {

                      await _launchURL('${widget.video}'); // your URL

//                    downloadFile();
                  });
//                final status = await Permission.storage.request();
//
//                if (status.isGranted) {
//                  final externalDir = await getExternalStorageDirectory();
//
//                  final id = await FlutterDownloader.enqueue(
//                    url:
//                    "${widget.video}",
//                    savedDir: externalDir.path,
//                    fileName: "download",
//                    showNotification: true,
//                    openFileFromNotification: true,
//                  );
//
//                } else {
//                  print("Permission deined");
//                }
              },
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed:  () async{
                   try {
                     await  WcFlutterShare.share(
                  sharePopupTitle: 'Share',
                  subject: 'This is subject',
                  text: 'This is text',
                  mimeType: 'text/plain');
                  } catch (e) {
                  print(e);
                  }
                },
              ),
            ],
          ),

            _buildDescription(context)
          ],
        ),

    );
  }
  _buildDescription(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.8,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(widget.description,
              style: TextStyle(
                color: Colors.grey,
              ),),

          ],
        ),
      ),
    );
  }
}