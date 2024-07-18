import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_mania/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_mania/constants/colors.dart';
import 'package:pizza_mania/constants/images.dart';
import 'package:pizza_mania/constants/text.dart';
import 'package:pizza_mania/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza_mania/screens/home/views/pizza_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              pizzaslicecartoon,
              scale: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              pizzamaniatxt,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 27,
                color: blackColor,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: greyColor,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<SignInBloc>().add(SignOutRequired());
            },
            icon: const Icon(
              Icons.logout,
              color: greyColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if (state is GetPizzaSuccess) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 9 / 17),
                itemCount: state.pizzas.length,
                itemBuilder: (context, int i) {
                  return Material(
                    elevation: 3,
                    color: whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                DetailsScreen(state.pizzas[i]),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(state.pizzas[i].picture),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 2,
                                    ),
                                    child: Icon(
                                      Icons.circle,
                                      color: state.pizzas[i].isVeg
                                          ? greenColor
                                          : redColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: state.pizzas[i].spicy == 1
                                        ? greenColor.withOpacity(0.7)
                                        : state.pizzas[i].spicy == 2
                                            ? yellowColor.withOpacity(0.7)
                                            : state.pizzas[i].spicy == 3
                                                ? orangeColor.withOpacity(0.7)
                                                : state.pizzas[i].spicy == 4
                                                    ? redColor.withOpacity(0.7)
                                                    : null,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      state.pizzas[i].spicy == 1
                                          ? mildtxt
                                          : state.pizzas[i].spicy == 2
                                              ? hottxt
                                              : state.pizzas[i].spicy == 3
                                                  ? extrahottxt
                                                  : state.pizzas[i].spicy == 4
                                                      ? extremelyhottxt
                                                      : hoterrortxt,
                                      style: const TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              state.pizzas[i].name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              state.pizzas[i].description,
                              style: const TextStyle(
                                fontSize: 13,
                                color: greyColor,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Rs ${(state.pizzas[i].price - (state.pizzas[i].price * (state.pizzas[i].discount / 100))).toInt()}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      "Rs ${state.pizzas[i].price}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: greyColor,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_circle),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetPizzaLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text("An error has occoured..."),
              );
            }
          },
        ),
      ),
    );
  }
}
