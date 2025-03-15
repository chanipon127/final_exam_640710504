import 'package:flutter/material.dart';

class MyApp_profile extends StatefulWidget {
  const MyApp_profile({super.key});
  @override
  State<MyApp_profile> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp_profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("โปรไฟล์ผู้ใช้"),
          backgroundColor: Colors.blue,
          //centerTitle: true, // ทำให้ Title อยู่ตรงกลาง
        ),
        body: const Center(
          child: Profile(
            name: "John Doe",
            email: "johndoe@example.com",
            setting: "การตั้งค่า",
            password: "เปลี่ยนรหัสผ่าน",
            private: "ความเป็นส่วนตัว",
            imageUrl:
                "https://upload.wikimedia.org/wikipedia/commons/a/a3/June_odd-eyed-cat.jpg",
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final String setting;
  final String password;
  final String private;

  const Profile({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.password,
    required this.private,
    required this.setting,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50, // เพิ่มมิติให้ Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(150),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _InfoRow(
                    icon: Icons.settings,
                    text: setting,
                    iconColor: Colors.blue),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _InfoRow(
                    icon: Icons.lock, text: password, iconColor: Colors.blue),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _InfoRow(
                    icon: Icons.question_mark_sharp,
                    text: private,
                    iconColor: Colors.blue),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('แก้ไขโปรไฟล์'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('ออกจากระบบ'),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const _InfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
