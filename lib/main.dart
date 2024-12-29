import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ValueNotifier<bool> _isDarkMode = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isDarkMode,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          title: 'CGPA Counter',
          debugShowCheckedModeBanner: false,
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(isDarkMode: _isDarkMode),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final ValueNotifier<bool> isDarkMode;

  HomePage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CGPA Compass'),
        backgroundColor: isDarkMode.value ? Colors.black : Colors.green[700],
        leading: IconButton(
          icon: Icon(
            isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
            color: Colors.white,
          ),
          onPressed: () {
            isDarkMode.value = !isDarkMode.value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Currently not functional
            },
            child: Text(
              'Login/Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode.value
                ? [Colors.black87, Colors.black54]
                : [Colors.green[700]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to CGPA Compass',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode.value ? Colors.white : Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Your academic assistant!',
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode.value ? Colors.white70 : Colors.black87,
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AboutPage(isDarkMode: isDarkMode)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isDarkMode.value ? Colors.black54 : Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'About the App',
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          isDarkMode.value ? Colors.white : Colors.green[700],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CGPACalculatorPage(isDarkMode: isDarkMode)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isDarkMode.value ? Colors.black54 : Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Calculate CGPA',
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          isDarkMode.value ? Colors.white : Colors.green[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  final ValueNotifier<bool> isDarkMode;

  AboutPage({required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the App'),
        backgroundColor: isDarkMode.value ? Colors.black : Colors.green,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode.value
                ? [Colors.black87, Colors.black54]
                : [Colors.green[100]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildFeatureCard(
                icon: Icons.info_outline,
                title: 'What is CGPA Compass?',
                description:
                    'This app helps students calculate their CGPA and track their academic progress effortlessly. It’s designed to save time and minimize errors.',
              ),
              SizedBox(height: 20),
              _buildFeatureCard(
                icon: Icons.calculate_outlined,
                title: 'How it Works',
                description:
                    'Enter your grades, credits, and subjects for each semester. The app calculates your semester GPA and total CGPA instantly.',
              ),
              SizedBox(height: 20),
              _buildFeatureCard(
                icon: Icons.school_outlined,
                title: 'Relevance in Bangladesh',
                description:
                    'CGPA is widely used in Bangladeshi institutions to measure academic performance. This app makes calculations simple and user-friendly for Bangladeshi students.',
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    'Developed by Swapnil Tarafdar',
                    style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode.value
                            ? Colors.white70
                            : Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Email: 1902042@icte.bdu.ac.bd',
                    style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode.value
                            ? Colors.white70
                            : Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      {required IconData icon,
      required String title,
      required String description}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.green[700],
              size: 40,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CGPACalculatorPage extends StatefulWidget {
  final ValueNotifier<bool> isDarkMode;

  CGPACalculatorPage({required this.isDarkMode});

  @override
  _CGPACalculatorPageState createState() => _CGPACalculatorPageState();
}

class _CGPACalculatorPageState extends State<CGPACalculatorPage> {
  List<Map<String, dynamic>> semesters = [
    {
      'subjects': [{}, {}],
      'gpa': 0.0
    }
  ];

  final List<String> grades = [
    '4.00/A+',
    '3.75/A',
    '3.50/A-',
    '3.25/B+',
    '3.00/B',
    '2.75/B-',
    '2.50/C+',
    '2.25/C',
    '2.00/D',
    '0.00/F',
  ];

  void calculateSemesterGPA(int semesterIndex) {
    double totalPoints = 0.0;
    int totalCredits = 0;

    for (var subject in semesters[semesterIndex]['subjects']) {
      if (subject['credits'] != null && subject['grade'] != null) {
        double gradePoint = double.parse(subject['grade']!.split('/')[0]);
        int credits = subject['credits'];
        totalPoints += gradePoint * credits;
        totalCredits += credits;
      }
    }

    setState(() {
      semesters[semesterIndex]['gpa'] =
          totalCredits > 0 ? totalPoints / totalCredits : 0.0;
    });
  }

  double calculateTotalCGPA() {
    double totalPoints = 0.0;
    int totalCredits = 0;

    for (var semester in semesters) {
      for (var subject in semester['subjects']) {
        if (subject['credits'] != null && subject['grade'] != null) {
          double gradePoint = double.parse(subject['grade']!.split('/')[0]);
          int credits = subject['credits'];
          totalPoints += gradePoint * credits;
          totalCredits += credits;
        }
      }
    }

    return totalCredits > 0 ? totalPoints / totalCredits : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate CGPA'),
        backgroundColor:
            widget.isDarkMode.value ? Colors.black : Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ...semesters.asMap().entries.map((entry) {
                int semesterIndex = entry.key;
                List subjects = entry.value['subjects'];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  elevation: 5,
                  color:
                      widget.isDarkMode.value ? Colors.black54 : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Semester ${semesterIndex + 1}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: widget.isDarkMode.value
                                ? Colors.white
                                : Colors.green[700],
                          ),
                        ),
                        SizedBox(height: 10),
                        ...subjects.asMap().entries.map((subjectEntry) {
                          int subjectIndex = subjectEntry.key;
                          Map subject = subjectEntry.value;

                          return Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      subject['name'] = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Subject',
                                    hintStyle: TextStyle(
                                      color: widget.isDarkMode.value
                                          ? Colors.white70
                                          : Colors.black54,
                                    ),
                                    filled: true,
                                    fillColor: widget.isDarkMode.value
                                        ? Colors.black54
                                        : Colors.white,
                                  ),
                                  style: TextStyle(
                                    color: widget.isDarkMode.value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: subject['grade'],
                                  onChanged: (value) {
                                    setState(() {
                                      subject['grade'] = value;
                                      calculateSemesterGPA(semesterIndex);
                                    });
                                  },
                                  items: grades.map((grade) {
                                    return DropdownMenuItem<String>(
                                      value: grade,
                                      child: Text(
                                        grade,
                                        style: TextStyle(
                                          color: widget.isDarkMode.value
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  hint: Text(
                                    'Grade',
                                    style: TextStyle(
                                      color: widget.isDarkMode.value
                                          ? Colors.white70
                                          : Colors.black54,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      subject['credits'] =
                                          int.tryParse(value) ?? 0;
                                      calculateSemesterGPA(semesterIndex);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Credits',
                                    hintStyle: TextStyle(
                                      color: widget.isDarkMode.value
                                          ? Colors.white70
                                          : Colors.black54,
                                    ),
                                    filled: true,
                                    fillColor: widget.isDarkMode.value
                                        ? Colors.black54
                                        : Colors.white,
                                  ),
                                  style: TextStyle(
                                    color: widget.isDarkMode.value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                        SizedBox(height: 10),
                        Text(
                          'Semester GPA: ${(semesters[semesterIndex]['gpa'] as double).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: widget.isDarkMode.value
                                ? Colors.white
                                : Colors.green[700],
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (subjects.length < 15) {
                              setState(() {
                                subjects.add({});
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: widget.isDarkMode.value
                                ? Colors.black87
                                : Colors.green[100],
                          ),
                          child: Text(
                            'Add Subject',
                            style: TextStyle(
                              color: widget.isDarkMode.value
                                  ? Colors.white
                                  : Colors.green[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              ElevatedButton(
                onPressed: () {
                  if (semesters.length < 12) {
                    setState(() {
                      semesters.add({
                        'subjects': [{}],
                        'gpa': 0.0,
                      });
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: widget.isDarkMode.value
                      ? Colors.black87
                      : Colors.green[100],
                ),
                child: Text(
                  'Add Semester',
                  style: TextStyle(
                    color: widget.isDarkMode.value
                        ? Colors.white
                        : Colors.green[700],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Total CGPA: ${calculateTotalCGPA().toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: widget.isDarkMode.value
                      ? Colors.white
                      : Colors.green[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
