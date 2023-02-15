import 'package:flutter/material.dart';
import '../model/product_model.dart';
import '../repository/auth_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F2FF),
      appBar: AppBar(
        title: const Text("Fetch Data from API"),
        centerTitle: true,
      ),
      body: FutureBuilder<ProductModel>(
          future: AuthRepo().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  itemCount: snapshot.data!.data.products.results.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (_, index) {
                    return Container(
                      width: 164,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Image.network(
                                snapshot.data?.data.products.results[index].image ?? "",height: 80,
                              )),
                              Text(
                                snapshot.data!.data.products.results[index].brand.name.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff323232),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        " ক্রয়",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8,
                                          color: Color(0xff646464),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        snapshot.data!.data.products.results[index].charge.currentCharge
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 8,
                                            color: Color(0xffDA2079)),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    snapshot.data!.data.products.results[index].charge.discountCharge.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        color: Color(0xffDA2079)),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "বিক্রয়",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8,
                                          color: Color(0xff646464),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.data.products.results[index].charge.sellingPrice.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Color(0xff646464)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "লাভ/ক্ষতি",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8,
                                          color: Color(0xff646464),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        snapshot.data!.data.products.results[index].charge.profit.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xff646464),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
