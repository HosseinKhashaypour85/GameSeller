import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_shop/const.dart';
import 'package:game_shop/model/game_model.dart';
import 'package:game_shop/screens/deatils_screen.dart';
import 'package:game_shop/screens/signin_screen.dart';
// import 'package:game_shop/screens/deatail_screen.dart';

enum Category {
  action,
  racing,
  strategy,
  children,
  others,
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Enum enumStatus = Category.action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              topSection(),
              const SizedBox(height: 20),
              searchBar(),
              const SizedBox(height: 20),
              categoryFunction(),
              const SizedBox(height: 20),
              TrendingSectionFunction(),
              const SizedBox(height: 20),
              TrendingSection(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New games",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // اضافه کردن فیزیک اسکرول به نور
                shrinkWrap: true, // برای اینکه ارتفاع مناسب داشته باشه
                itemCount: GameModel.gameModelList.length,
                itemBuilder: (context, index) {
                  final helper = GameModel.gameModelList[index];
                  return Container(
                    width: double.infinity,
                    height: 120,
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              helper.cover_image,
                              width: 200,
                            ),
                          ),
                          const SizedBox(width: 8), // فاصله بین تصویر و متن
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                helper.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                  height: 8), // فاصله بین متن و ردیف زیرین
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsetsDirectional.symmetric(
                                      horizontal: 7.5,
                                      vertical: 2.5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade200,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                            width:
                                                4), // فاصله بین آیکون و امتیاز
                                        Text(
                                          helper.score,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                      width: 20), // فاصله بین امتیاز و دکمه
                                  const CustomElevatedButton()
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Column TrendingSection() {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
        ),
      ],
    );
  }

  Column TrendingSectionFunction() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: GameModel.gameModelList.length,
            itemBuilder: (context, index) {
              return TrendingItemWidget(
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }

  Container categoryFunction() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryFunction(
                  title: "Action",
                  icon: Icons.directions_walk,
                  primaryColor: enumStatus == Category.action
                      ? primaryColor
                      : Colors.grey.shade800,
                  function: () {
                    setState(() {
                      enumStatus = Category.action;
                    });
                  },
                ),
                CategoryFunction(
                  title: "Racing",
                  icon: Icons.car_crash,
                  primaryColor: enumStatus == Category.racing
                      ? primaryColor
                      : Colors.grey.shade800,
                  function: () {
                    setState(() {
                      enumStatus = Category.racing;
                    });
                  },
                ),
                CategoryFunction(
                  title: "Strategy",
                  icon: Icons.castle,
                  primaryColor: enumStatus == Category.strategy
                      ? primaryColor
                      : Colors.grey.shade800,
                  function: () {
                    setState(() {
                      enumStatus = Category.strategy;
                    });
                  },
                ),
                CategoryFunction(
                  title: "Children",
                  icon: Icons.child_care,
                  primaryColor: enumStatus == Category.children
                      ? primaryColor
                      : Colors.grey.shade800,
                  function: () {
                    setState(() {
                      enumStatus = Category.children;
                    });
                  },
                ),
                CategoryFunction(
                  title: "Others",
                  icon: Icons.more,
                  primaryColor: enumStatus == Category.others
                      ? primaryColor
                      : Colors.grey.shade800,
                  function: () {
                    setState(() {
                      enumStatus = Category.others;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell CategoryFunction({
    required title,
    required IconData icon,
    required Function function,
    required Color primaryColor,
  }) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 26,
              color: primaryColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row topSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.black),
          ),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Warning!"),
                    content: const Text("Are you sure Want to sign out?"),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                fixedSize: const Size(120, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ));
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                fixedSize: const Size(120, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.all(5),
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(250),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.orange,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '2356',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.search,
              size: 26,
            ),
            Text("Search games"),
            Icon(
              Icons.menu,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingItemWidget extends StatelessWidget {
  const TrendingItemWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DeatilsScreen(
            gameModel: GameModel.gameModelList[index],
          ),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                GameModel.gameModelList[index].cover_image,
                width: 187,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: 187,
                    height: 120,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          GameModel.gameModelList[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          GameModel.gameModelList[index].category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 26,
                            ),
                            Text(
                              GameModel.gameModelList[index].score,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const CustomElevatedButton(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        "install",
        style: TextStyle(color: primaryColor),
      ),
    );
  }
}
