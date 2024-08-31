import 'dart:math';

import 'package:flutter/material.dart';
import 'package:habit/page/side_bar/menu_screen/support/support.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'side_bar/menu_screen/App Maintenance/app_maintenance.dart';
import 'side_bar/menu_screen/home/home.dart';
import 'side_bar/menu_screen/journal/journal.dart';
import 'side_bar/menu_screen/settings/settings_screen.dart';
import 'side_bar/menu_screen/view/view_all.dart';
import 'side_bar/side_bar.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;
  int milliseconds = 200;
  int currentIndex = 0;
  bool isOpen = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: milliseconds,
      ),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> menu = const [
      Home(),
      Journal(),
      ViewAllScreen(),
      Settings(),
      AppMaintenance(),
      SupportUs(),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 200),
            width: 288,
            left: isOpen ? 0 : -288,
            height: MediaQuery.of(context).size.height,
            child: SideBar(
              onTap: (int newIndex) {
                _animationController.reverse();
                setState(() {
                  isOpen = false;
                  currentIndex = newIndex;
                });
              },
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              // We rotate 30 degree
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: menu[currentIndex],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            top: isOpen ? 6 : 0,
            left: isOpen ? 220 : 0,
            curve: Curves.fastOutSlowIn,
            // top: 10,
            duration: Duration(milliseconds: milliseconds),
            child: MenuBtn(
              milliseconds: milliseconds,
              isOpen: isOpen,
              press: () {
                setState(() {
                  isOpen = !isOpen;
                  if (isOpen) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBtn extends StatefulWidget {
  const MenuBtn({
    super.key,
    required this.isOpen,
    required this.press,
    required this.milliseconds,
  });
  final VoidCallback press;
  final bool isOpen;
  final int milliseconds;
  @override
  State<MenuBtn> createState() => _MenuBtnState();
}

class _MenuBtnState extends State<MenuBtn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.milliseconds),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isOpen) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
          top: 10,
          left: 15,
        ),
        child: GestureDetector(
          onTap: widget.press,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 3),
                    blurRadius: 8,
                  ),
                ]),
            child: Center(
              child: AnimatedIcon(
                color: Colors.white,
                icon: AnimatedIcons.menu_close,
                progress: _controller,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
