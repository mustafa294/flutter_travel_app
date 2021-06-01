import 'package:flutter/material.dart';
import 'package:flutter_travel_app/utils/constants.dart';

class HomePage extends StatelessWidget {
  final List<dynamic> bestDeals = [
    {
      'city_name': 'El Cairo',
      'sub_city': 'Egypt',
      'price': 260,
      'rating': 4.3,
    },
    {
      'city_name': 'London',
      'sub_city': 'England',
      'price': 330,
      'rating': 5.6,
    },
    {
      'city_name': 'El Cairo',
      'sub_city': 'Egypt',
      'price': 330,
      'rating': 2.6,
    }
  ];

  Column _buildBestDealPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Deals",
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              "Sorted by lower price",
              style: TextStyle(
                color: AppColor.greyColor,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColor.greyColor,
            ),
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                width: 180,
                decoration: BoxDecoration(
                  color: AppColor.containerGreyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _buildBestDealDescription(index),
              );
            },
          ),
        )
      ],
    );
  }

  _buildPopularDescription() {
    return Row();
  }

  Column _buildPopularDestinationPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Popular Destinations",
          style: TextStyle(
            color: AppColor.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              "Sorted by higher rating",
              style: TextStyle(
                color: AppColor.greyColor,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: AppColor.greyColor,
            ),
          ],
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: AppColor.containerGreyColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/img.png",
                        height: 40,
                        width: 50,
                      ),
                    ),
                  ),
                  _buildPopularDescription()
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Column _buildBestDealDescription(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bestDeals[index]['city_name'],
                  style: TextStyle(
                    fontFamily: 'Sfui',
                    color: AppColor.blackColor,
                  ),
                ),
                Text(
                  bestDeals[index]['sub_city'],
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Sfui',
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text(
                  r"$" + bestDeals[index]['rating'].toString(),
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                )
              ],
            )
          ],
        ),
        Image.asset(
          "assets/images/img.png",
          width: 50,
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "More",
                  style: TextStyle(
                    color: AppColor.lightBlueColor,
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  r"$" + bestDeals[index]['price'].toString(),
                  style: TextStyle(
                    color: AppColor.lightBlueColor,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(top: 25, left: 25),
        children: [
          _buildBestDealPart(),
          SizedBox(height: 10),
          _buildPopularDestinationPart(),
        ],
      ),
    );
  }

  Scaffold _buildMain(var size) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppbar(size),
          _buildBody(),
        ],
      ),
    );
  }

  Container _buildAppbar(size) {
    return Container(
      color: AppColor.blueColor,
      height: size.height * 0.3,
      // width: double.infinity
      child: Column(
        children: [
          Spacer(flex: 2),
          Text(
            "Where do you want to travel?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.tap_and_play),
              ),
              Container(
                width: size.width / 2,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Select Destination'),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.search),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return _buildMain(size);
  }
}
