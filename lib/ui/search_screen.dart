import "package:flutter/material.dart";
import "package:niture_app/model/furniture_data.dart";
import "package:niture_app/ui/detail_screen.dart";
import "package:niture_app/utils/themes/styles.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  List<FurnitureData> filteredFurnitureList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(5.0, 15.0, 15.0, 15.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    splashRadius: 20.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: searchController,
                      autofocus: true,
                      cursorColor: const Color(0xFF162D3A),
                      onChanged: (value) {
                        setState(() {
                          if (value.trim().isNotEmpty) {
                            filteredFurnitureList = furnitureList
                                .where((furniture) => furniture.name
                                    .toLowerCase()
                                    .contains(value))
                                .toList();
                          } else {
                            searchController.text = "";
                            filteredFurnitureList = [];
                          }
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: "Search furniture name",
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF162D3A),
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                        ),
                        prefixIconColor: const Color(0xffB0B0B0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredFurnitureList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                  furnitureData: filteredFurnitureList[index]),
                            ),
                          );
                        },
                        leading: Image.asset(
                          filteredFurnitureList[index].image,
                          fit: BoxFit.cover,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: Text(
                            filteredFurnitureList[index].name,
                            style: comfortaaTextStyle(
                              fontWeight: comfortaaLight,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "\$${filteredFurnitureList[index].price}",
                          style: comfortaaTextStyle(
                            fontWeight: comfortaaBold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
