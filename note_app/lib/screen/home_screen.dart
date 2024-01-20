import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/screen/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> filtersampleNotes = [];
  @override
  void initState() {
    super.initState();
    filtersampleNotes = sampleNotes;
  }

  void onSearchTextChanged(String SearchText) {
    setState(() {
      filtersampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(SearchText.toLowerCase()) ||
              note.title.toLowerCase().contains(SearchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notes",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(.8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: onSearchTextChanged,
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  hintText: "Search Notes....",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.grey.shade900,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.transparent))),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: sampleNotes.length,
              itemBuilder: (context, Index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 20),
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text: "${filtersampleNotes[Index].title}\n",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: "${filtersampleNotes[Index].content}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5),
                                ),
                              ])),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "${DateFormat("EEE MMM d,yyyy h:mm a").format(sampleNotes[Index].modifiedTime)}",
                          style: TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey),
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }
}
