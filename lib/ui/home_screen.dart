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
              _buildBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 35.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        image: const DecorationImage(
          image: AssetImage(
            "assets/images/img_banner.png",
          ),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover Furniture \nHigh Quality",
                style: comfortaaTextStyle(
                  color: const Color(0xff4E5471),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "70%",
                    style: comfortaaTextStyle(
                      color: const Color(0xff4E5471),
                      fontWeight: comfortaaBold,
                      fontSize: 35.0,
                    ),
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  Text(
                    "off",
                    style: comfortaaTextStyle(
                      color: const Color(0xff4E5471),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
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
              radius: 25.0,
              onTap: () {},
              borderRadius: BorderRadius.circular(50.0),
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
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  "Find the best home furniture",
                  style: comfortaaTextStyle(
                    fontWeight: comfortaaLight,
                    color: const Color(0xFF808991),
                    fontSize: 14.0,
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
            width: 24.0,
          ),
          splashRadius: 20.0,
        ),
      ],
    );
  }
}
