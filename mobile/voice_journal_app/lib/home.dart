import 'package:flutter/material.dart';
import 'package:voice_journal_app/Playback.dart';
import 'theme.dart';
import 'RecordingPage.dart';
import 'package:hive/hive.dart'; //Importing the local database
import 'package:hive_flutter/hive_flutter.dart';
import 'schema.dart';

//init variables
bool boxOpened = false;
var rbox = Hive.box<Recording>('recordings');
//end of variables
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
  void updateList(){
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding for white space
          child: Container(
            padding: const EdgeInsets.only(bottom: 60.0, top: 90.0), // Adjusted to accommodate FAB and title
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // Aligns children to the bottom
              crossAxisAlignment: CrossAxisAlignment.stretch, // Stretches children horizontally to match the column width
              children: <Widget>[
                const Text(
                  'Emoz',
                  textAlign: TextAlign.center, //
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.black, 
                  ),
                ),
                const SizedBox(height: 20), // Adds space between the title and the first container
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor, // Background color
                    borderRadius: BorderRadius.circular(10), // Rounds corners
                  ), // Placeholder text
                  margin: const EdgeInsets.only(bottom: 20, top: 20),
                  child: const Center(child: Text('Emotion Stats')), // Space between the rectangles and additional top padding
                ),
                Expanded( // 
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor, // Background color of the rectangle
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    child: ListView.builder( 
                      itemCount: rbox.length, // Number of items in the list, for demonstration
                      itemBuilder: (context, index){
                      int reversedIndex = rbox.length - 1 - index;
                      final recording = rbox.getAt(reversedIndex);
                      return ListTile(
                    title: recording != null
                        ? TextButton(
                            onPressed: () {
                              if(recording != (null)){
                              displayRecording(recording);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const PlaybackPage(title: 'playback page')),
                                );
                              }
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(AppColors.lightGray),
                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.mutedTeal),
                            ),
                            child: Text(recording.title),
                          )
                        : const Text('No recording available'),
                       );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Spaces icons evenly
            children: <Widget>[
              IconButton(icon: const Icon(Icons.auto_graph), onPressed: () {}),
              IconButton(icon: const Icon(Icons.home), onPressed: () {}),
              IconButton(icon: const Icon(Icons.date_range), onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordingPage(title: 'recording page', callback: updateList)),
                );
            },
          backgroundColor: AppColors.accentColor,
          child: const Icon(Icons.add_circle_rounded),
        ),
      );
  }
}
