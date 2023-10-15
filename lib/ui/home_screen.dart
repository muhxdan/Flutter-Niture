import "package:flutter/material.dart";
import "package:niture_app/model/furniture_data.dart";
import "package:niture_app/ui/detail_screen.dart";
import "package:niture_app/ui/search_screen.dart";
import "package:niture_app/utils/themes/styles.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildHeader(context),
            ),
            _buildListFurniture(),
          ],
        ),
      ),
    );
  }

  Expanded _buildListFurniture() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildBanner(),
            LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                int crossAxisCount;
                if (screenWidth <= 330.0) {
                  crossAxisCount = 1;
                } else if (screenWidth <= 600.0) {
                  crossAxisCount = 2;
                } else if (screenWidth <= 1200.0) {
                  crossAxisCount = 3;
                } else {
                  crossAxisCount = 6;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    mainAxisExtent: 290.0,
                  ),
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  itemCount: furnitureList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                                furnitureData: furnitureList[index]),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  furnitureList[index].image,
                                  fit: BoxFit.cover,
                                  height: 160,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      furnitureList[index].name,
                                      style: comfortaaTextStyle(
                                        fontWeight: comfortaaLight,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "\$${furnitureList[index].price}",
                                      style: comfortaaTextStyle(
                                        fontWeight: comfortaaBold,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
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
      margin: const EdgeInsets.only(
        bottom: 20.0,
        left: 20.0,
        right: 20.0,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: Image.asset(
              "assets/images/ic_search.png",
              width: 24.0,
            ),
            splashRadius: 20.0,
          ),
        ],
      ),
    );
  }
}
