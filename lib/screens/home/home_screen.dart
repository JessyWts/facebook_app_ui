import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../config/palette.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '../../data/data.dart';
import '../screens.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController = TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop: HomeScreenDesktop(scrollController: _trackingScrollController),
          tablet: _HomeScreenMobile(scrollController: _trackingScrollController),
        )
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(Object context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          actions: [
            CircleButton(icon: Icons.search, iconSize: 30.0, onPressed: (){}),
            CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30.0, onPressed: (){}),
          ],
          backgroundColor: Colors.white,
          centerTitle: false,
          floating: true,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2
            ),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        ),
        SliverToBoxAdapter(
          child: CreatePostContainer(
            currentUser: currentUser
          ),
        ),
        // Online users
        SliverPadding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(
              onlineUsers: onlineUsers
            ),
          ),
        ),
        // Stories
        SliverPadding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories
            )
          ),
        ),
        // Post
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final Post post = posts[index];
              return PostContainer(
                post: post
              );
            },
            childCount: posts.length
          )
        ),
      ],
    );
  }
}