import 'package:baby_names_bestmom/components/search_results_tile.dart';
import 'package:baby_names_bestmom/models/name_model.dart';
import 'package:baby_names_bestmom/services/names_api.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../constants.dart';

class SearchResultsPage extends StatefulWidget {
  final Map<String, String> q;
  SearchResultsPage({this.q});
  @override
  _SearchResultsPageState createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  static const _pageSize = 10;
  final _pagingController = PagingController<int, Name>(
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(widget.q, pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(Map<String, String> q, int pageKey) async {
    try {
      final newItems = await NamesApiModel().getNamesPaginated(q, pageKey);
      final isLastPage = newItems.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  // @override
  // void didUpdateWidget(PagedArticleListView oldWidget) {
  //   if (oldWidget.listPreferences != widget.listPreferences) {
  //     _pagingController.refresh();
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void dispose() {
    // 4
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      // 1
      Theme(
          data: new ThemeData.dark(),
          child: Scaffold(
            backgroundColor: kblueColor,
            appBar: AppBar(
              backgroundColor: kblueColor,
              elevation: 0.0,
              title: SizedBox(
                child: Center(
                  child: Text(
                    'Search Results',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.share),
                  tooltip: 'Share Name',
                  onPressed: () {},
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () => Future.sync(
                // 2
                () => _pagingController.refresh(),
              ),
              // 3
              child: PagedListView.separated(
                // 4
                pagingController: _pagingController,
                // padding: const EdgeInsets.all(16),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                ),
                builderDelegate: PagedChildBuilderDelegate<Name>(
                  itemBuilder: (context, name, index) => SearchResultTile(
                    name: name,
                  ),
                  // firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
                  //   error: _pagingController.error,
                  //   onTryAgain: () => _pagingController.refresh(),
                  // ),
                  // noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(),
                ),
              ),
            ),
          ));
}
