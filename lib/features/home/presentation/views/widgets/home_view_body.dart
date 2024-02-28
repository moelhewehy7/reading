import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/constants.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:reading/features/home/presentation/manager/Fetch%20feautred%20books%20cubit/featured_books_cubit.dart';
import 'package:reading/features/home/presentation/views/widgets/sliver_appbar.dart';
import '../../manager/newest books cubit/newest_books_cubit.dart';
import 'bestsellersliverlist.dart';
import 'featuredbookslistview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    BuildContext currentContext = context;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      color: kprimarycolor,
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 3));
        if (!currentContext.mounted) return;
        fetchdata(currentContext);
        // currentContext is used to check if the widget is still mounted
        // before calling the fetchdata method. This is done to avoid calling fetchdata on a
        // widget that has been removed from the widget tree,
        //  which could lead to errors.
      },
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FeaturedBooksListView(
                  height: height,
                  width: width,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Trending",
                    style: Styles.textStyle20,
                  ),
                ),
              ],
            ),
          ),
          NewestBooksSliverList(height: height, width: width)
        ],
      ),
    );
  }

  void fetchdata(BuildContext context) {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchfeaturedBooks;
    BlocProvider.of<NewestBooksCubit>(context).fetchnewestBooks;
  }
}
