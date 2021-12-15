import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_app/app/controllers/movie.search.controller.dart';
import 'package:movies_app/app/utils/constants.dart';
import 'package:movies_app/app/views/widgets/custom.text.widget.dart';
import 'package:movies_app/app/views/widgets/search.input.widget.dart';

class MoviesSearchPage extends StatelessWidget {
  MoviesSearchPage({Key? key}) : super(key: key);

  final controller = Modular.get<MovieSearchController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomTextWidget(
          text: 'Advanced Search',
          fontSize: width * .055,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          SearchInputWidget(),
          SizedBox(height: height * .02),
          Expanded(
            child: Observer(
              builder: (_) {
                final future = controller.moviesSearch;
                if (future == null) {
                  return const SizedBox();
                }
                switch (future.status) {
                  case FutureStatus.pending:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case FutureStatus.rejected:
                    return Center(
                      child: CustomTextWidget(
                        text:
                            'Filme não encontrado a partir do texto digitado.',
                        fontSize: width * .05,
                        textAlign: TextAlign.center,
                      ),
                    );
                  case FutureStatus.fulfilled:
                    final data = future.value;
                    return ListView.builder(
                      itemCount: data?.results.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.symmetric(vertical: height * .03),
                        child: GestureDetector(
                          onTap: () => Modular.to.pushNamed(
                              '/start/home/movie/${data?.results[index].id}'),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(width * .07),
                                ),
                                child: data!.results[index].posterPath != null
                                    ? Image.network(
                                        Constants.imageRelativePath +
                                            data.results[index].posterPath!,
                                        height: height * .3,
                                        fit: BoxFit.fill,
                                        width: width * .8,
                                      )
                                    : Image.asset(
                                        'assets/images/default_movie_image.jpeg',
                                        height: height * .3,
                                        fit: BoxFit.fill,
                                        width: width * .8,
                                      ),
                              ),
                              SizedBox(height: height * .01),
                              CustomTextWidget(
                                text: data.results[index].title,
                                fontSize: width * .05,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              CustomTextWidget(
                                text:
                                    "Pontuação de popularidade: ${data.results[index].popularity}",
                                fontSize: width * .035,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
