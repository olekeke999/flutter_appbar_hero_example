import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_expand_card/details/bloc/details_bloc.dart';
import 'package:flutter_application_expand_card/model/card_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    required this.card,
    super.key,
  });
  final CardItem card;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsBloc()..add(InitializeEvent()),
      child: BlocConsumer<DetailsBloc, DetailsState>(
        listener: (context, state) {
          Future.delayed(
            const Duration(milliseconds: 50),
            () {
              setState(
                () {
                  _opacity = 1.0;
                },
              );
            },
          );
        },
        listenWhen: (previous, current) {
          return previous is LoadingState && current is DetailsContentState;
        },
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                    color: Colors.white,
                  ),
                  expandedHeight: 250.0,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    // title: Text(item.title),
                    background: Hero(
                      tag: widget.card.title,
                      child: CachedNetworkImage(
                        imageUrl: widget.card.imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfWd9a_CRaMLJ-KGXzS9gB_8SLwfo-lkhy5Q&s'),
                      ),
                    ),
                  ),
                ),
                switch (state) {
                  DetailsContentState content => SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: AnimatedOpacity(
                          curve: Curves.easeInOut,
                          opacity: _opacity,
                          duration: const Duration(seconds: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                // data from previous card
                                widget.card.title,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                content.newData,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  LoadingState() => const SliverFillRemaining(
                      child: Center(
                        child: SizedBox(
                            width: 75,
                            height: 75,
                            child: CircularProgressIndicator()),
                      ),
                    ),
                },
              ],
            ),
          );
        },
      ),
    );
  }

  double _contentOpacity(DetailsState state) {
    return switch (state) {
      DetailsContentState() => 1,
      LoadingState() => 0,
    };
  }
}
