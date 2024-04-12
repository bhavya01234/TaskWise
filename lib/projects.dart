import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set _selectedIndex to 0 by default
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Implement main menu functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTextButton(0, 'All', isFirst: true),
                buildTextButton(1, 'Ongoing'),
                buildTextButton(2, 'Completed', isLast: true),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Add padding for spacing
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow, // Background color of the tile
                      borderRadius: BorderRadius.circular(15), // Rounded rectangular shape
                    ),
                    child: ListTile(
                      title: Text(
                        'Todo ${index + 1}',
                        style: TextStyle(fontSize: 18), // Increased font size of the title
                      ),
                      subtitle: Text(
                        'Description of todo ${index + 1}',
                        style: TextStyle(fontSize: 16), // Increased font size of the subtitle
                      ),
                      trailing: Checkbox(
                        value: false,
                        onChanged: (value) {
                          // Implement checkbox functionality here
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined, size: 35),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment, size: 35),
            label: 'Document',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outlined, size: 60, color: Colors.deepPurpleAccent,),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_right_alt_rounded, size: 35),
            label: 'Send',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 35),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildTextButton(int index, String text, {bool isFirst = false, bool isLast = false}) {
    return Container(
      margin: EdgeInsets.only(
        left: isFirst ? 8.0 : 0,
        right: isLast ? 8.0 : 0,
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return _getSelectedColor(index);
              }
              return _selectedIndex == index
                  ? _getSelectedColor(index)
                  : Colors.grey; // Change default color here
            },
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }

  Color _getSelectedColor(int index) {
    if (index == 0) {
      return Colors.deepPurple;
    } else if (index == 1) {
      return Colors.deepPurpleAccent;
    } else {
      return Colors.purpleAccent;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: Projects(),
  ));
}
