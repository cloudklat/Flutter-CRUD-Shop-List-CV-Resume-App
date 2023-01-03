import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CvPage extends StatelessWidget {
  const CvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.commentDots,
                color: Colors.black54,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black54,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Text(
                    "Over 8+ years of experience and web development and 5+ years of experience in mobile applications development "),
              ),
              _buildTitle("Skills"),
              SizedBox(height: 10.0),
              _buildSkillRow("Wordpress", 0.75),
              SizedBox(height: 5.0),
              _buildSkillRow("Laravel", 0.6),
              SizedBox(height: 5.0),
              _buildSkillRow("React JS", 0.65),
              SizedBox(height: 5.0),
              _buildSkillRow("Flutter", 0.5),
              SizedBox(height: 30.0),
              _buildTitle("Experience"),
              _buildExperienceRow(
                  company: "Coding PGT",
                  position: "Wordpress Developer",
                  duration: "2011-2024"),
              _buildExperienceRow(
                  company: "Code PGT",
                  position: "Laravel Developer",
                  duration: "2012-2025"),
              _buildExperienceRow(
                  company: "Google LLC",
                  position: "Web Developer",
                  duration: "2015-2027"),
              _buildExperienceRow(
                  company: "Google LLC",
                  position: "Flutter Developer",
                  duration: "2017-Current"),
              SizedBox(height: 20.0),
              _buildTitle("Education"),
              SizedBox(height: 5.0),
              _buildExperienceRow(
                  company: "Coding PGT, Indonesia",
                  position: "Computer Science and Information Technology",
                  duration: "2011-2015"),
              _buildExperienceRow(
                  company: "Harvard University, Indonesia",
                  position: "A Level",
                  duration: "2008-2010"),
              _buildExperienceRow(
                  company: "Oxford University, Indonesia",
                  position: "SLC",
                  duration: "2008"),
              SizedBox(height: 20.0),
              _buildTitle("Contact"),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.mail,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "cloudklat@proton.me",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "+62-878762737267",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              _buildSocialsRow(),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSocialsRow() {
    return Row(
      children: <Widget>[
        SizedBox(width: 20.0),
        IconButton(
          color: Colors.indigo,
          icon: Icon(FontAwesomeIcons.facebookF),
          onPressed: () {
            _launchUrl("https://github.com/cloudklat");
          },
        ),
        SizedBox(width: 5.0),
        IconButton(
          color: Colors.indigo,
          icon: Icon(FontAwesomeIcons.github),
          onPressed: () {
            _launchUrl("https://github.com/cloudklat");
          },
        ),
        SizedBox(width: 5.0),
        IconButton(
          color: Colors.red,
          icon: Icon(FontAwesomeIcons.youtube),
          onPressed: () {
            _launchUrl("https://github.com/cloudklat");
          },
        ),
        SizedBox(width: 5.0),
      ],
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _buildExperienceRow(
      {required String company,
      required String position,
      required String duration}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          FontAwesomeIcons.solidCircle,
          size: 12.0,
          color: Colors.black54,
        ),
      ),
      title: Text(
        company,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$position ($duration)"),
    );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10.0),
        Expanded(
            flex: 2,
            child: Text(
              skill.toUpperCase(),
              textAlign: TextAlign.right,
            )),
        SizedBox(width: 10.0),
        Expanded(
          flex: 4,
          child: LinearProgressIndicator(
            value: level,
          ),
        ),
        SizedBox(width: 10.0),
      ],
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20.0,
        ),
        Container(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage('assets/img/1.jpg')))),
        SizedBox(width: 20.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Nanang Priambudi",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            Text("Full Stack Developer"),
            SizedBox(height: 5.0),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.map,
                  size: 12.0,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Cikupa, Tangerang",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
