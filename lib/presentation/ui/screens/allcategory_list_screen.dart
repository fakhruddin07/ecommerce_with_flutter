import 'package:ecommerce_with_flutter/presentation/ui/widgets/home/all_category_card.dart';
import 'package:flutter/material.dart';

class AllCategoryListScreen extends StatefulWidget {
  const AllCategoryListScreen({super.key});

  @override
  State<AllCategoryListScreen> createState() => _AllCategoryListScreenState();
}

class _AllCategoryListScreenState extends State<AllCategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "All Category",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16
          ),
          itemBuilder: (context, index) {
            return const FittedBox(child: AllCategoryCard(),);
          },
        ),
      ),
    );
  }
}
