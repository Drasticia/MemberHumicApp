import 'package:flutter/material.dart';
import 'package:member_humic/models/projectmodels.dart';
import 'package:member_humic/presentation/admin_pages/projectgallery/previewprojectgallery.dart';

class Projectgallerypage extends StatefulWidget {
  const Projectgallerypage({super.key});

  @override
  State<Projectgallerypage> createState() => _ProjectgallerypageState();
}

class _ProjectgallerypageState extends State<Projectgallerypage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xff800C05), Color(0xffE91407)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: const Text(
            'Project Gallery',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0), 
          child: Container(
            color: const Color(0xff000000).withOpacity(0.1), 
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                'List Project Approval',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(80.0),
                    1: FixedColumnWidth(80.0),
                    2: FixedColumnWidth(110.0),
                    3: FixedColumnWidth(100.0),
                  },
                  border: TableBorder.all(
                    color: Colors.grey,
                  ),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: const Color(0xff000000).withOpacity(0.06),
                      ),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'No',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'TITLE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'DESCRIPTION',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    ...projectmodel.asMap().entries.map((entry) {
                      int index = entry.key + 1;
                      var project = entry.value;
                      return TableRow(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(index.toString(),
                                    textAlign: TextAlign.center)),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(project.tittle,
                                    textAlign: TextAlign.start)),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(project.description,
                                    textAlign: TextAlign.start)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: (){
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PreviewProject(project: project),
                                    ),
                                  );
                                }, 
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Color(0xffB9B9B9),
                                )
                              )
                            ),
                          ],
                        );
                      } 
                    ) 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}