import 'package:flutter/material.dart';
import 'package:flutter_travel_app/utils/constants.dart';

class DescriptionPage extends StatelessWidget {
  final String cityName;
  final String subCity;
  final int price;
  final double rating;
  const DescriptionPage({
    this.cityName,
    this.subCity,
    this.price,
    this.rating,
  });

  Container _buildAppBar(var size, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      height: size.height * 0.3,
      color: AppColor.blueColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cityName,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(subCity),
                  Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColor.lightBlueColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        r"$" + price.toString(),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ],
              ),
              Text("Expires in: 58h 23 min")
            ],
          )
        ],
      ),
    );
  }

  Expanded _buildBody(var size) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(left: 20, top: 20),
        children: [
          _buildIncludedPart(),
          SizedBox(height: 20),
          _buildRatingsSection(size),
          SizedBox(height: 20),
          _buildGallerySection(),
        ],
      ),
    );
  }

  _buildGallerySection() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gallery",
            style: TextStyle(
              color: AppColor.blackColor,
              fontSize: 20,
            ),
          ),
          Text(
            "Sorted by recent photos",
            style: TextStyle(
              color: AppColor.greyColor,
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 140,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColor.containerGreyColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/img.png",
                      height: 40,
                      width: 50,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Container _buildRatingsSection(var size) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rating & Reviews",
                      style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "Sorted by recent reviews",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontFamily: 'Sfui',
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        SizedBox(width: 5),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "429 Reviews",
                      style: TextStyle(
                        color: AppColor.greyColor,
                        fontFamily: 'Sfui',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) {
                return SizedBox(width: 10);
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildReviewCard(size);
              },
            ),
          )
        ],
      ),
    );
  }

  Container _buildReviewCard(size) {
    return Container(
      padding: EdgeInsets.all(10),
      width: size.width - 60,
      decoration: BoxDecoration(
        color: AppColor.containerGreyColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$cityName is great!",
                    style: TextStyle(
                      color: AppColor.blackColor,
                      fontFamily: 'Sfui',
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 10,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "John Doe",
                    style: TextStyle(
                      color: AppColor.darkGreyColor,
                      fontFamily: 'Sfui',
                    ),
                  ),
                  Text(
                    "12/08/18",
                    style: TextStyle(
                        color: AppColor.greyColor, fontFamily: 'Sfui'),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "Donec sollicitudin molestie malesuada. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Sed porttitor lectus nibh. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla porttitor accumsan tincidunt. Sed porttitor lectus nibh. Nulla quis lorem ut libero malesuada feugiat. Curabitur aliquet quam id dui posuere blandit. Donec sollicitudin molestie malesuada.",
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: TextStyle(
              color: AppColor.darkGreyColor,
              fontFamily: "Sfui",
            ),
          ),
        ],
      ),
    );
  }

  Container _buildIncludedPart() {
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Included",
            style: TextStyle(
              color: AppColor.blackColor,
              fontSize: 20,
            ),
          ),
          Text(
            "For more details press on the icons",
            style: TextStyle(
              color: AppColor.greyColor,
              fontFamily: 'Sfui',
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIncludedThings(Icons.flight, "Flight"),
              _buildIncludedThings(Icons.hotel, "Hotel"),
              _buildIncludedThings(Icons.drive_eta, "Car"),
              _buildIncludedThings(Icons.terrain, "Tour"),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildIncludedThings(IconData icon, String name) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColor.lightBlueColor,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: AppColor.lightBlueColor,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          name,
          style: TextStyle(
            color: AppColor.blackColor,
            fontFamily: 'Sfui',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(size, context),
          _buildBody(size),
        ],
      ),
    );
  }
}
