import 'package:e_commerce_app/view/product/product_category.dart';
import 'package:e_commerce_app/view/product/product_details.dart';
import 'package:e_commerce_app/view/product/products.dart';
import 'package:e_commerce_app/view/special_offers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../API/APIforAllProducts.dart';
import '../customs/category_button.dart';
import '../customs/most_popular.dart';
import '../model/check_user.dart';
import '../model/products.dart';
import '../provider/selectedindex.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int quantity = 2;
  int getQuantityBasedOnIndex(int index) {
    switch (index) {
      case 0:
        return 12;
      case 1:
        return 2;
      case 2:
        return 2;
      case 3:
        return 2;
      case 4:
        return 2;
      default:
        return 12;
    }
  }

  String getCategoryBasedOnIndex(int index) {
    switch (index) {
      case 0:
        return "https://fakestoreapi.com/products";

      case 1:
        return "https://fakestoreapi.com/products/category/men's%20clothing";
      case 2:
        return "https://fakestoreapi.com/products/category/women's%20clothing";
      case 3:
        return "https://fakestoreapi.com/products/category/jewelery";
      case 4:
        return "https://fakestoreapi.com/products/category/electronics";
      default:
        return "https://fakestoreapi.com/products";
    }
  }

  List<ProductsResponse> products = [];
  bool _selectOn = false;

  bool isAfterNoon() {
    DateTime now = DateTime.now();
    print(now.hour);
    return now.hour >= 12;
  }

  @override
  Widget build(BuildContext context) {
    final selectedCategoryProvider =
        Provider.of<SelectedCategoryProvider>(context);
    int _selectedCat = selectedCategoryProvider.selectedCat;
    int _selectedIndex = selectedCategoryProvider.selectedIndex;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                title: Text(
                    isAfterNoon() ? "Good Evening 😊" : "Good Morning 😊",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        letterSpacing: .3)),
                trailing: Wrap(
                  spacing: 0,
                  children: [
                    // we can remove the notification button as it is not used
                    IconButton(
                        icon: Icon(Icons.notifications_outlined,
                            color: Colors.grey[700] , size: 35,),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: _selectOn ? Colors.red : Colors.black, size: 35,
                        ),
                        onPressed: () {
                          setState(() {
                            _selectOn = !_selectOn;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Special Offers",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      letterSpacing: .1),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SpecialOffers()));
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
                padding: const EdgeInsets.only(left: 20),
                height: MediaQuery.of(context).size.height * .25,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: '25% \n',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            height: 1),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Today\'s Special! \n',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  height: 1.9)),
                          TextSpan(
                            text: 'Get discount for every\n',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: 1.75),
                          ),
                          TextSpan(
                            text: 'order. only valid for today',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: .8),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height: 160,
                        // margin: EdgeInsets.only(right: 10,left: 90),
                        child: Image.asset(
                          "assets/13.png",
                          fit: BoxFit.cover,
                        ))
                  ],
                )),

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            //categories
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                children: [
                  customButton(
                    icon: "assets/icons/shirt.png",
                    text: "Men",
                    funtion: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedCat = 0;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Product_Category()));
                    },
                  ),
                  customButton(
                    icon: "assets/icons/dress.png",
                    text: "Women",
                    funtion: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedCat = 1;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Product_Category()));
                    },
                  ),
                  customButton(
                    icon: "assets/icons/accessory.png",
                    text: "Accessories",
                    funtion: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedCat = 2;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Product_Category()));
                    },
                  ),
                  customButton(
                    icon: "assets/icons/device.png",
                    text: "Electronics",
                    funtion: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedCat = 3;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Product_Category()));
                    },
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Most Popular",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      letterSpacing: .01),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Products()));
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),

            //Most popular products
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  customMostPopularButton(
                    function: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedIndex = 0;
                    },
                    text: " All ",
                    selected: _selectedIndex == 0,
                  ),
                  customMostPopularButton(
                    function: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedIndex = 1;
                    },
                    text: " Men ",
                    selected: _selectedIndex == 1,
                  ),
                  customMostPopularButton(
                    function: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedIndex = 2;
                    },
                    text: "Women",
                    selected: _selectedIndex == 2,
                  ),
                  customMostPopularButton(
                    function: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedIndex = 3;
                    },
                    text: "Accessories",
                    selected: _selectedIndex == 3,
                  ),
                  customMostPopularButton(
                    function: () {
                      Provider.of<SelectedCategoryProvider>(context,
                              listen: false)
                          .selectedIndex = 4;
                      // setState(() {
                      //   _selectedIndex = 4;
                      // });
                    },
                    text: "Electronics",
                    selected: _selectedIndex == 4,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),

            //Grid view of the Most popular products

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: FutureBuilder<List<ProductsResponse>>(
                future: ProductsAPI().getProductsByCategory(
                    "${getCategoryBasedOnIndex(Provider.of<SelectedCategoryProvider>(context).selectedIndex)}"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // set data into products list to use it in search
                    products = snapshot.data!;

                    // Shuffle the list of products
                    products.shuffle();

                    // Display only the first 6 products (or less if there are fewer than 6)
                    final displayedProducts = products
                        .take(getQuantityBasedOnIndex(
                            Provider.of<SelectedCategoryProvider>(context)
                                .selectedIndex))
                        .toList();

                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: displayedProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        ProductsResponse item = displayedProducts[index];
                        return InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => productDetails(iteam: item),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 6, child: Image.network(item.image)),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    item.title,
                                    style: const TextStyle(fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                      Icon(
                                        Icons.star_half,
                                        size: 25,
                                        color: Colors.yellow[700],
                                      ),
                                      Text(
                                        item.rating.rate.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const Expanded(
                                          flex: 4, child: SizedBox()),
                                      Text(
                                        "${item.price}",
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      Icon(
                                        Icons.attach_money,
                                        color: Colors.green[400],
                                        size: 22,
                                      ),
                                      const Expanded(
                                          flex: 1, child: SizedBox()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }

                  if (snapshot.hasError) {
                    print('Error in snapshot Data: ${snapshot.error}');
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
