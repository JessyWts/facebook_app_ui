import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeScreenDesktop({Key? key, required this.scrollController}) : super (key: key);

  @override
  Widget build(Object context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(
                currentUser: currentUser
              ),
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              // Stories
              SliverPadding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories
                  )
                ),
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
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(
                users: onlineUsers
              ),
            ),
          ),
        ),
      ],
    );
  }
}