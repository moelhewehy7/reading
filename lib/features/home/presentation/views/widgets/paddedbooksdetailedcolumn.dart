import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';
import 'package:reading/features/home/presentation/views/widgets/bookrating.dart';
import 'package:reading/features/home/presentation/views/widgets/booksactionbutton.dart';
import 'package:reading/features/home/presentation/views/widgets/custom_appbar.dart';

class BooksDetailedColumn extends StatelessWidget {
  const BooksDetailedColumn(
      {super.key,
      required this.height,
      required this.width,
      required this.book});

  final double height;
  final double width;
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomAppBar(
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            book.volumeInfo.title ?? "Title not available",
            style: Styles.textStyle25,
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  book.volumeInfo.authors?[0] ?? "Author not available",
                  style: Styles.textStyle16,
                ),
                BookRating(
                    rating: book.volumeInfo.averageRating ?? 0,
                    count: book.volumeInfo.ratingsCount ?? 0)
              ],
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: height * .50,
            width: width * .90,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    book.volumeInfo.imageLinks?.thumbnail ?? "",
                  ),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          BooksActionButton(bookmodel: book),
          const SizedBox(
            height: 20,
          ),
          Text(
            "You can also like",
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
