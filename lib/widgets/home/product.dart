import "package:barter/constant/color.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

List<String> images = [
  "https://positioningmag.com/wp-content/uploads/2022/06/Ibis-Ratchada.jpg",
  "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/85/88/8850006603185/8850006603185_4.jpg",
  "https://www.uboncomputer.co.th/pub/media/catalog/product/cache/566bac40c34e1b79304197de40a22c99/1/_/1_466.jpg",
  "https://cdn.thewirecutter.com/wp-content/media/2020/11/notebooks-2048px-2008.jpg?auto=webp&quality=75&width=1024"
];

List<String> productName = [
  "โรงแรม Novotel 5 ดาว",
  "แป้งเย็น Protex",
  "Notebook ASUS",
  "สมุดจดบันทึก"
];

List<String> price = ["5000", "30", "29900", "50"];

Widget productCard(
    List<String> images, List<String> productName, List<String> price) {
  return Container(
    padding: const EdgeInsets.only(bottom: 10, top: 5),
    margin: const EdgeInsets.all(5),
    width: Get.width,
    child: Column(
      children: [
        for (int i = 0;
            i < images.length;
            i += 2) // Increment by 2 to handle pairs of images
          SizedBox(
            width: Get.width,
            height: 230,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildProductContainer(
                      images[i], productName[i], price[i]),
                ),
                const SizedBox(width: 0), // Add some spacing between cards
                Expanded(
                  child: (i + 1 <
                          images
                              .length) // Check if there's another image available
                      ? _buildProductContainer(
                          images[i + 1], productName[i + 1], price[i + 1])
                      : Container(), // Placeholder if no more images
                ),
              ],
            ),
          ),
      ],
    ),
  );
}

Widget _buildProductContainer(
    String imageUrl, String productName, String price) {
  return TextButton(
    style: TextButton.styleFrom(padding: EdgeInsets.zero),
    onPressed: () {},
    child: Container(
      width: Get.width / 2.15,
      height: 220,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center the image within the container
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: Center(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                height: 150, // Adjust height as needed
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              productName,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "$price P",
              style: const TextStyle(fontSize: 14, color: Constants.orange),
            ),
          ),
        ],
      ),
    ),
  );
}
