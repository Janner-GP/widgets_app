import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void addFiveImages() {
    final lastImageId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastImageId + e));
  }

  void moveScrollToEnd() {
    if ((scrollController.position.pixels + 150) <= scrollController.position.maxScrollExtent ) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 1));
    addFiveImages();

    if (!isMounted) return;
    isLoading = false;
    setState(() {});
    moveScrollToEnd();
  }

  Future onRefresh () async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    if (!isMounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: () => onRefresh(),
          child: FadeIn(
            child: _CustomListView(
              scrollController: scrollController,
              imagesIds: imagesIds
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: !isLoading
          ? FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))
          : SpinPerfect(infinite: true, child: const Icon(Icons.refresh)),
      ),
    );
  }
}

class _CustomListView extends StatelessWidget {
  const _CustomListView({
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: imagesIds.length,
      itemBuilder: (context, index) {
        return FadeInImage(
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
          placeholder: const AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage(
              'https://picsum.photos/id/${imagesIds[index]}/500/300/'),
        );
      },
    );
  }
}
