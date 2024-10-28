import 'package:flutter/material.dart';
import 'package:member_humic/presentation/admin_pages/widget/gradientborder.dart';

class Announcmentpage extends StatefulWidget {
  const Announcmentpage({super.key});

  @override
  State<Announcmentpage> createState() => _AnnouncmentpageState();
}

class _AnnouncmentpageState extends State<Announcmentpage> {
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
            'Announcement',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Add New Announcement',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Container(
                        color: Colors
                            .red.shade50,
                        child:CustomPaint(
                          painter: GradientDottedBorderPainter(
                            strokeWidth: 2,
                            dashPattern: [6, 3],
                            radius: const Radius.circular(8),
                            gradient: const LinearGradient(
                              colors: [Color(0xff800C05), Color(0xffE91407)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) => const LinearGradient(
                                    colors: [Color(0xff800C05), Color(0xffE91407)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                                  child: const Icon(
                                    Icons.cloud_upload_outlined,
                                    size: 45,
                                    color: Colors
                                        .white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Drag & drop files or ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: ShaderMask(
                                      shaderCallback: (bounds) => const LinearGradient(
                                        colors: [Color(0xff800C05), Color(0xffE91407)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(bounds),
                                      child: const Text(
                                        'Browse',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          decoration: TextDecoration.underline, 
                                          decorationColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Supported formats: JPEG, PNG, GIF, MP4, PDF, PSD, AI, Word, PPT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Uploading - 3/3 files',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffE3E3E3),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'document-name.PDF',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                               IconButton(
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Color(0xffE6E6E6),
                                ),
                                onPressed: () {
                                  
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upploaded',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff11AF22),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'document-name.PDF',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration:const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFF3F3)
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete_forever_outlined,
                                  color: Color(0xffE41D1D),
                                ),
                                onPressed: () {
                                  
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Title',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'type the title here',
                          hintStyle: const TextStyle(
                            color: Color(0xffB9B9B9)
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'type the description here',
                          hintStyle: const TextStyle(
                            color: Color(0xffB9B9B9)
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Date',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'choose the date',
                          hintStyle: const TextStyle(
                            color: Color(0xffB9B9B9)
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Time',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'choose the time',
                          hintStyle: const TextStyle(
                            color: Color(0xffB9B9B9)
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff006AFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'UPLOAD',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
