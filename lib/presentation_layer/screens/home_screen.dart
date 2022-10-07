import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_db_iti_task/business_layer/movie_db_cubit.dart';

import '../../data_layer/models/models.dart';
import '../widgets/show_poster.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Models> modelsList;
  List<Models> searchedFilmList = [];
  bool isSearcing = false;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MovieDbCubit>(context).getAllData();
  }

  Widget _buildAPPBarSearch() {
    return TextField(
      cursorColor: Colors.grey,
      style: const TextStyle(fontSize: 18, color: Colors.white),
      controller: searchController,
      decoration: const InputDecoration(
          hintText: 'Search for film ...',
          hintStyle: TextStyle(fontSize: 20),
          border: InputBorder.none),
      onChanged: (searchedFilm) {
        addFilmToSearchBar(searchedFilm);
      },
    );
  }

  void addFilmToSearchBar(String searchedFilm) {
    searchedFilmList = modelsList
        .where((data) => data.title.toLowerCase().startsWith(searchedFilm))
        .toList();
    setState(() {
    });
  }
  List<Widget>_buildAppBarActions(){
    if(isSearcing){
      return [
        IconButton(onPressed: (){
          Navigator.pop(context);
          _clearSearch();
        }, icon: const Icon(Icons.clear))
      ];
    }else{
      return [
        IconButton(onPressed: (){
          _startSearch();
        }, icon: const Icon(Icons.search))
      ];
    }
  }
  void _startSearch(){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: ()=>_stopSearch()
    ));
    setState(() {
      isSearcing=true;
    });
  }
  void _stopSearch(){
    _clearSearch();
    setState(() {
      isSearcing=false;
    });
  }
void _clearSearch(){
    setState(() {
      searchController.clear();
    });
}
  Widget _buildAppBarTitle() {
    return Text(
      'Movie App'.toUpperCase(),
      style: const TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: isSearcing == true ? _buildAPPBarSearch() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      backgroundColor: Colors.black12,
      body: BlocBuilder<MovieDbCubit, MovieDbState>(
        builder: (context, state) {
          if (state is ModelsLoaded) {
            modelsList = (state).models;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1),
              itemCount: searchController.text.isEmpty
                  ? modelsList.length
                  : searchedFilmList.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return ShowPoster(
                  models: searchController.text.isEmpty
                      ? modelsList[index]
                      : searchedFilmList[index],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
