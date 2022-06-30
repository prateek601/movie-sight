import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/modules/search/search_cubit/search_cubit.dart';
import 'package:trending_movies/app/modules/search/search_view.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider<SearchCubit>(
                  create: (context) => SearchCubit(),
                ),
              ],
              child: const SearchView(),
            ),
          ),
        );
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: const Color(0xff2f3648),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 16,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'search movies',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
