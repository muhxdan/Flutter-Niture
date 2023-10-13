import "package:flutter/material.dart";
import "package:niture_app/utils/themes/styles.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _buildHeader(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              radius: 25,
              onTap: () {},
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 21.0,
                  backgroundImage: AssetImage("assets/images/me.jpg"),
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Welcome Back!👋",
                  style: comfortaaTextStyle(
                    fontWeight: comfortaaBold,
                  ),
                ),
                Text(
                  "Find the best home furniture",
                  style: comfortaaTextStyle(
                    fontWeight: comfortaaLight,
                    color: const Color(0xFF808991),
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/images/ic_search.png",
            width: 24,
          ),
          splashRadius: 20,
        ),
      ],
    );
  }
}
