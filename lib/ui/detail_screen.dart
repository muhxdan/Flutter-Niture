import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:niture_app/model/furniture_data.dart";
import "package:niture_app/utils/themes/styles.dart";

class DetailScreen extends StatelessWidget {
  final FurnitureData furnitureData;

  const DetailScreen({super.key, required this.furnitureData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  furnitureData.image,
                  width: double.infinity,
                  height: 400.0,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomButton(
                      widget: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                      padding: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Text(
                furnitureData.name,
                style: comfortaaTextStyle(
                  fontSize: 20,
                  fontWeight: comfortaaSemiBold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 15, 15.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${furnitureData.price}",
                    style: comfortaaTextStyle(
                      fontWeight: comfortaaBold,
                      fontSize: 22,
                    ),
                  ),
                  const ValueItem()
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xFFF2C94C),
                          ),
                          const SizedBox(
                            width: 7.0,
                          ),
                          Text(
                            "${furnitureData.rating}",
                            style: comfortaaTextStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "${furnitureData.totalReviews} Reviews",
                        style: comfortaaTextStyle(
                          color: const Color(0xFFAAAAAA),
                        ),
                      )
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Reviewer(
                            right: 0.0,
                            indexUrl: "1",
                          ),
                          Reviewer(right: 27.0, indexUrl: "2"),
                          Reviewer(right: 56.0, indexUrl: "3"),
                          Reviewer(right: 85.0, indexUrl: "4"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              child: Text(
                furnitureData.description,
                style: comfortaaTextStyle().copyWith(
                  height: 1.3,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomAppBar(context),
    );
  }

  BottomAppBar _bottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const FavoriteButton(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CustomButton(
                  widget: Text(
                    "Add to bag",
                    style: comfortaaTextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    var snackBar = const SnackBar(
                        content: Text("Will be updated soon •ᴗ•"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final Color color;
  final double padding;
  const CustomButton({
    super.key,
    required this.widget,
    required this.onPressed,
    this.color = Colors.black,
    this.padding = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
            vertical: (widget is Icon) ? padding : 15.0, horizontal: padding),
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: widget,
    );
  }
}

class Reviewer extends StatelessWidget {
  final double right;
  final String indexUrl;
  const Reviewer({super.key, required this.right, required this.indexUrl});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: right,
      child: CachedNetworkImage(
        imageUrl: "https://avatar.iran.liara.run/public/$indexUrl",
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageBuilder: (context, imageProvider) => CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: imageProvider,
          ),
        ),
      ),
    );
  }
}

class ValueItem extends StatefulWidget {
  const ValueItem({super.key});

  @override
  State<ValueItem> createState() => _ValueItemState();
}

class _ValueItemState extends State<ValueItem> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          widget: const Icon(
            Icons.remove,
            color: Colors.black,
          ),
          onPressed: () => value > 1 ? setState(() => value--) : value = 1,
          color: const Color(0xffF3F3F3),
          padding: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            value.toString(),
            style: comfortaaTextStyle(fontSize: 18),
          ),
        ),
        CustomButton(
          widget: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () => setState(() => value++),
          color: const Color(0xffF3F3F3),
          padding: 6,
        ),
      ],
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      widget: Icon(Icons.favorite,
          color: isFavorite ? const Color(0xFFFE4030) : Colors.white),
      onPressed: () => setState(() => isFavorite = !isFavorite),
      padding: 12,
    );
  }
}
