import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class ListviewBuilderScreen extends StatefulWidget {
   
  const ListviewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListviewBuilderScreen> createState() => _ListviewBuilderScreenState();
}

class _ListviewBuilderScreenState extends State<ListviewBuilderScreen> {

  final List<int> imagesIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels+200 >= _scrollController.position.maxScrollExtent){
        //_loadMore();
        fetchData();
      }
    });
  }

  Future fetchData () async {
    if(isLoading) return;
    setState(() { isLoading = true; });

    await Future.delayed(const Duration(seconds: 3));
    _loadMore();
    setState(() {isLoading = false;});

    if(_scrollController.position.pixels+100 <= _scrollController.position.maxScrollExtent) return;

    _scrollController.animateTo(
      _scrollController.position.pixels+120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn
    );
  }

  void _loadMore(){
    final lastId = imagesIds.last;
    imagesIds.addAll([1,2,3,4,5].map((e)=>lastId+e));
    setState(() {});
  }

  Future<void> _onRefresh()  async{
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId+1);
    _loadMore();
  }


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(

          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: _onRefresh,
              child: ListView.builder(
                //physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                itemCount: imagesIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/images/jar-loading.gif'),
                    image: NetworkImage('https://picsum.photos/500/300/?image=${imagesIds[index]}'),
                  );
                },
              ),
            ),

            if(isLoading)
            Positioned(
              bottom: 40,
              left: size.width * 0.5 - 30,
              child: const _LoadingIcon()
            )
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(100),
      ),
      height: 60,
      width: 60,
      child:  const CircularProgressIndicator( color: AppTheme.primary),
    );
  }
}