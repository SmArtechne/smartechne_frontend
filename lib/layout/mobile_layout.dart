import 'package:d_to_d/utils/provider/tab_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileLayout extends ConsumerStatefulWidget {
  const MobileLayout({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends ConsumerState<MobileLayout>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final tabState = ref.watch(tabStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo/logo.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "D to D",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              context.go('/message');
            },
            icon: Image.asset("assets/icons/alarm.png"),
            iconSize: 24,
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/search.png"),
            iconSize: 24,
          )
        ],
      ),
      body: SafeArea(child: widget.child),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 0,
        color: Colors.black,
        activeColor: Colors.black,
        backgroundColor: Colors.white,
        style: TabStyle.fixed,
        items: [
          TabItem(
            icon: tabState == TabPage.home
                ? Image.asset('assets/icons/home_FILL1.png')
                : Image.asset('assets/icons/home_FILL0.png'),
            title: '홈',
          ),
          TabItem(
            icon: tabState == TabPage.developer
                ? Image.asset('assets/icons/desktop_windows_FILL1.png')
                : Image.asset('assets/icons/desktop_windows_FILL0.png'),
            title: '개발자',
          ),
          TabItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.black,
              size: 40.0,
            ),
          ),
          TabItem(
            icon: tabState == TabPage.designer
                ? Image.asset('assets/icons/palette_FILL1.png')
                : Image.asset('assets/icons/palette_FILL0.png'),
            title: '디자이너',
          ),
          TabItem(
            icon: tabState == TabPage.setting
                ? Image.asset('assets/icons/settings_FILL1.png')
                : Image.asset('assets/icons/settings_FILL0.png'),
            title: '설정',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              ref.read(tabStateProvider.notifier).change(TabPage.home);
              context.go('/home');
              break;
            case 1:
              ref.read(tabStateProvider.notifier).change(TabPage.developer);
              context.go('/developer');
              break;
            case 2:
              ref.read(tabStateProvider.notifier).change(TabPage.addPost);
              context.push('/addpost');
              break;
            case 3:
              ref.read(tabStateProvider.notifier).change(TabPage.designer);
              context.go('/designer');
              break;
            case 4:
              ref.read(tabStateProvider.notifier).change(TabPage.setting);
              context.go('/setting');
              break;
          }
        },
      ),
    );
  }
}
