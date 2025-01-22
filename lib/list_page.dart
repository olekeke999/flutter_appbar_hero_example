import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_expand_card/model/card_item.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = cards;
    return Scaffold(
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final card = items[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/card_details',
              arguments: card,
            ),
            child: Card(
              child: SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Hero(
                      tag: card.title,
                      child: CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: card.imageUrl,
                        errorWidget: (context, url, error) => CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfWd9a_CRaMLJ-KGXzS9gB_8SLwfo-lkhy5Q&s'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 8.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                card.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

extension _Data on ListPage {
  List<CardItem> get cards => [
        CardItem(
            title: "Spaghetti Carbonara",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/01/22/19/20/spaghetti-carbonara-2006086_960_720.jpg",
            description:
                "A classic Italian pasta dish with creamy sauce and pancetta."),
        CardItem(
            title: "Margherita Pizza",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",
            description:
                "A simple yet delicious pizza with fresh mozzarella and basil."),
        CardItem(
            title: "Caesar Salad",
            imageUrl:
                "https://cdn.pixabay.com/photo/2014/12/15/13/40/salad-569156_960_720.jpg",
            description:
                "Crisp romaine lettuce with Caesar dressing, croutons, and Parmesan cheese."),
        CardItem(
            title: "Grilled Salmon",
            imageUrl:
                "https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712665_960_720.jpg",
            description:
                "Fresh salmon fillet grilled to perfection, served with lemon and herbs."),
        CardItem(
            title: "Beef Burger",
            imageUrl:
                "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg",
            description:
                "Juicy beef patty with lettuce, tomato, and cheese in a toasted bun."),
        CardItem(
            title: "Sushi Platter",
            imageUrl:
                "https://cdn.pixabay.com/photo/2016/03/05/19/02/sushi-1238248_960_720.jpg",
            description:
                "Assorted sushi rolls with fresh fish, rice, and seaweed."),
        CardItem(
            title: "Tacos",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/09/02/20/10/tacos-2701959_960_720.jpg",
            description:
                "Soft corn tortillas filled with seasoned meat, lettuce, and cheese."),
        CardItem(
            title: "Pancakes",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908_960_720.jpg",
            description:
                "Fluffy pancakes stacked high, served with syrup and berries."),
        CardItem(
            title: "Chocolate Cake",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/01/17/15/46/chocolate-cake-1987802_960_720.jpg",
            description:
                "Rich and moist chocolate cake topped with creamy frosting."),
        CardItem(
            title: "Ice Cream Sundae",
            imageUrl:
                "https://cdn.pixabay.com/photo/2016/08/09/22/51/ice-cream-1580355_960_720.jpg",
            description:
                "Vanilla ice cream topped with chocolate sauce, nuts, and a cherry."),
        CardItem(
            title: "Grilled Cheese Sandwich",
            imageUrl:
                "https://cdn.pixabay.com/photo/2015/09/18/20/20/cheese-951874_960_720.jpg",
            description:
                "Melted cheese between two slices of golden, toasted bread."),
        CardItem(
            title: "Chicken Curry",
            imageUrl:
                "https://cdn.pixabay.com/photo/2016/11/18/15/15/chicken-1838603_960_720.jpg",
            description:
                "Spicy and flavorful chicken curry served with steamed rice."),
        CardItem(
            title: "Greek Salad",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/03/17/05/55/greek-salad-2151988_960_720.jpg",
            description:
                "Fresh salad with tomatoes, cucumbers, olives, and feta cheese."),
        CardItem(
            title: "Steak",
            imageUrl:
                "https://cdn.pixabay.com/photo/2015/03/26/09/39/steak-690403_960_720.jpg",
            description:
                "Grilled steak cooked to perfection, served with herbs and butter."),
        CardItem(
            title: "Pasta Primavera",
            imageUrl:
                "https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712666_960_720.jpg",
            description:
                "Pasta tossed with fresh vegetables and a light sauce."),
        CardItem(
            title: "Clam Chowder",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/01/22/19/20/clam-chowder-2006085_960_720.jpg",
            description: "Creamy soup with clams, potatoes, and herbs."),
        CardItem(
            title: "Pad Thai",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/06/02/18/24/pad-thai-2365812_960_720.jpg",
            description:
                "Stir-fried rice noodles with shrimp, tofu, and peanuts."),
        CardItem(
            title: "Cheesecake",
            imageUrl:
                "https://cdn.pixabay.com/photo/2017/01/17/15/46/cheesecake-1987804_960_720.jpg",
            description:
                "Creamy cheesecake with a graham cracker crust and fruit topping."),
        CardItem(
            title: "French Fries",
            imageUrl:
                "https://cdn.pixabay.com/photo/2014/04/22/02/56/french-fries-329523_960_720.jpg",
            description: "Crispy golden fries, perfect as a side or snack."),
        CardItem(
            title: "Apple Pie",
            imageUrl:
                "https://cdn.pixabay.com/photo/2016/10/27/22/52/apple-pie-1776643_960_720.jpg",
            description:
                "Classic dessert with sweet apple filling and flaky crust."),
      ];
}
