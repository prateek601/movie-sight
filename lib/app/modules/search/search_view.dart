import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_movies/app/modules/search/search_cubit/search_cubit.dart';
import 'package:trending_movies/utils/textfield/search_text_field.dart';
import 'package:trending_movies/widgets/movie_list_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SearchTextField(
                    fillColor: Colors.grey[900]!,
                    searchCallback: (searchQuery) {
                      searchCubit.debounce.run(
                        () => searchCubit.fetchSearchData(
                            searchQuery: searchQuery),
                      );
                    },
                    controller: searchCubit.searchController,
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: CircularProgressIndicator(),
                        ));
                      } else if (state is SearchSuccess) {
                        return MovieListWidget(state.movieList);
                      } else if (state is SearchError) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: Text(
                            'Error in loading data!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
