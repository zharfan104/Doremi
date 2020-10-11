import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doremi/app_properties.dart';
import 'package:doremi/tabs/category/models/category.dart';
import 'package:doremi/tabs/category/models2/spotlight_best_top_food.dart';
import 'package:doremi/tabs/category/utils/app_colors.dart';
import 'package:doremi/tabs/category/utils/ui_helper.dart';
import 'package:doremi/tabs/category/widgets/custom_divider_view.dart';
import 'package:doremi/tabs/category/widgets/search_food_list_item_view.dart';

import 'components/staggered_category_card.dart';

class CategoryListPage extends StatefulWidget {
  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage>
    with TickerProviderStateMixin {
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Popular Event',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Jazz',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'RnB',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Funk',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Rock',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Metal',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Pop',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Hiphop',
      'assets/jeans_5.png',
    ),
  ];

  List<Category> searchResults;
  TextEditingController searchController = TextEditingController();
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    searchResults = categories;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: darkBlack,
      child: Container(
        // margin: const EdgeInsets.only(top: kToolbarHeight),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 4.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Cari Konser Terbaru!',
                    prefixIcon: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                      fit: BoxFit.scaleDown,
                    )),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    List<Category> tempList = List<Category>();
                    categories.forEach((category) {
                      if (category.category.toLowerCase().contains(value)) {
                        tempList.add(category);
                      }
                    });
                    setState(() {
                      searchResults.clear();
                      searchResults.addAll(tempList);
                    });
                    return;
                  } else {
                    setState(() {
                      searchResults.clear();
                      searchResults.addAll(categories);
                    });
                  }
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.6,
              child: TabBar(
                unselectedLabelColor: darkAqua,
                labelColor: Colors.grey[200],
                controller: _tabController,
                indicatorColor: darkAqua,
                labelStyle: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 18.0, color: Colors.white),
                unselectedLabelStyle: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 18.0, color: Colors.grey[200]),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      'Popular',
                    ),
                  ),
                  Tab(
                    child: Text('Genre'),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Container(
            //         padding: const EdgeInsets.only(
            //             left: 15.0, top: 2.0, bottom: 2.0),
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.grey[400]),
            //           borderRadius: BorderRadius.circular(2.0),
            //         ),
            //         child: Row(
            //           children: <Widget>[
            //             Expanded(
            //               child: TextField(
            //                 decoration: InputDecoration(
            //                   hintText: 'Search for restaurants and food',
            //                   hintStyle: Theme.of(context)
            //                       .textTheme
            //                       .subtitle2
            //                       .copyWith(
            //                         color: Colors.grey,
            //                         fontSize: 17.0,
            //                         fontWeight: FontWeight.w600,
            //                       ),
            //                   border: InputBorder.none,
            //                 ),
            //               ),
            //             ),
            //             UIHelper.horizontalSpaceMedium(),
            //             IconButton(
            //               icon: Icon(Icons.search),
            //               onPressed: () {},
            //             )
            //           ],
            //         ),
            //       ),
            //       UIHelper.verticalSpaceExtraSmall(),
            //       UIHelper.verticalSpaceSmall(),
            //       CustomDividerView(dividerHeight: 8.0),
            //       _SearchListView(),
            //     ],
            //   ),
            // ),

            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: searchResults.length,
                itemBuilder: (_, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: StaggeredCardCard(
                    begin: searchResults[index].begin,
                    end: searchResults[index].end,
                    categoryName: searchResults[index].category,
                    assetPath: searchResults[index].image,
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

class _SearchListView extends StatelessWidget {
  final List<SpotlightBestTopFood> foods =
      SpotlightBestTopFood.getPopularAllRestaurants();

  @override
  Widget build(BuildContext context) {
    foods.addAll(SpotlightBestTopFood.getPopularAllRestaurants());

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: foods.length,
        itemBuilder: (context, index) => SearchFoodListItemView(
          food: foods[index],
        ),
      ),
    );
  }
}
