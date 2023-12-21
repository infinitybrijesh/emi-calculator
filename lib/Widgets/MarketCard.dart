// ignore_for_file: file_names

import 'package:emi_calculator/Models/NewsModel.dart';
import 'package:flutter/material.dart';

class MarketCard extends StatelessWidget {
  final int index;
  final Article feed;
  const MarketCard({super.key, required this.index, required this.feed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: const EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      feed.urlToImage,
                      fit: BoxFit.cover,
                    )),
              ),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ImageScreen(
                //       imageUrl: image,
                //       headline: title,
                //     ),
                //   ),
                // );
              },
            ),
            GestureDetector(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    feed.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    feed.description,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      '${feed.publishedAt.day}-${feed.publishedAt.month}-${feed.publishedAt.year}',
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 12.0)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    height: 0,
                  ),
                ],
              ),
              onTap: () {
                //  ArticleScreen
              },
            ),
          ],
        ),
      ),
    );
    // Card(
    //     margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     child: ExpansionTile(
    //       tilePadding: EdgeInsets.zero,
    //       trailing: const SizedBox(),
    //       title: Container(
    //         height: 70,
    //         padding: const EdgeInsets.only(left: 10),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Row(
    //               children: [
    //                 SizedBox(
    //                   height: 60,
    //                   width: 60,
    //                   child: Image.network(feed.urlToImage.toString()),
    //                 ),
    //                 const SizedBox(
    //                   width: 5,
    //                 ),
    //                 const VerticalDivider(
    //                   indent: 8,
    //                   endIndent: 8,
    //                   thickness: 1,
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(left: 15),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       SizedBox(
    //                         width: MediaQuery.of(context).size.width * 0.35,
    //                         child: Text(
    //                           feed.source.toUpperCase(),
    //                           maxLines: 1,
    //                           style: const TextStyle(
    //                               fontWeight: FontWeight.bold,
    //                               letterSpacing: 1,
    //                               fontSize: 18),
    //                         ),
    //                       ),
    //                       Text(
    //                         feed.topics[0].relevanceScore,
    //                         style: const TextStyle(
    //                             fontSize: 15, color: Appcolor.green),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Padding(
    //                 padding: const EdgeInsets.only(right: 0),
    //                 child: Row(
    //                   children: [
    //                     const Icon(Icons.keyboard_arrow_up_rounded,
    //                         color: Appcolor.green),
    //                     const SizedBox(
    //                       width: 3,
    //                     ),
    //                     SizedBox(
    //                       width: MediaQuery.of(context).size.width * 0.16,
    //                       child: Text(
    //                         feed.topics[0].relevanceScore.toString(),
    //                         maxLines: 1,
    //                         overflow: TextOverflow.ellipsis,
    //                         style: const TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             letterSpacing: 1,
    //                             fontSize: 14,
    //                             color: Appcolor.green),
    //                       ),
    //                     ),
    //                   ],
    //                 ))
    //             // LineChartSample2(),
    //           ],
    //         ),
    //       ),
    //       children: [
    //         const Divider(
    //           thickness: 1,
    //           indent: 10,
    //           endIndent: 10,
    //         ),
    //         Container(
    //           height: 150,
    //           padding: const EdgeInsets.only(top: 10),
    //           child: ClipRRect(
    //               borderRadius: const BorderRadius.only(
    //                 bottomLeft: Radius.circular(10),
    //                 bottomRight: Radius.circular(10),
    //               ),
    //               child: LineChartSample2(
    //                 index: index,
    //               )),
    //         )
    //       ],
    //     ));
  }
}
//  Container(
//           height: 70,
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child:
//            Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   SizedBox(
//                     height: 60,
//                     width: 60,
//                     child: Image.network(
//                         'https://www.fintechfutures.com/files/2022/03/axis-bank-logo.jpg'),
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   const VerticalDivider(
//                     indent: 8,
//                     endIndent: 8,
//                     thickness: 1,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Text(
//                           "AXIS BANK",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1,
//                               fontSize: 18),
//                         ),
//                         index.isEven
//                             ? Text(
//                                 "${120.2 + index + 0.5} +",
//                                 style: const TextStyle(
//                                     fontSize: 15, color: Appcolor.green),
//                               )
//                             : Text(
//                                 "${90.01 + index} -",
//                                 style: const TextStyle(
//                                     fontSize: 15, color: Appcolor.red),
//                               ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: index.isEven
//                     ? Row(
//                         children: const [
//                           Icon(Icons.keyboard_arrow_up_rounded,
//                               color: Appcolor.green),
//                           SizedBox(
//                             width: 3,
//                           ),
//                           Text(
//                             "Rs.45,010",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1,
//                                 fontSize: 16,
//                                 color: Appcolor.green),
//                           ),
//                         ],
//                       )
//                     : Row(
//                         children: const [
//                           Icon(Icons.keyboard_arrow_down_rounded,
//                               color: Appcolor.red),
//                           SizedBox(
//                             width: 3,
//                           ),
//                           Text(
//                             "Rs.30,010",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1,
//                                 fontSize: 16,
//                                 color: Appcolor.red),
//                           ),
//                         ],
//                       ),
//               )
//               // LineChartSample2(),
//             ],
//           ),
//         )
