import 'package:flutter/material.dart';

class AnimatedBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChange;

  const AnimatedBottomNavBar({Key key, this.currentIndex, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => onChange(0),
              child: BottomNavItem(
                icon: Icons.explore,
                title: "Explore",
                activeColor: Color(0xffff8f00),
                isActive: currentIndex == 0,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChange(1),
              child: BottomNavItem(
                icon: Icons.chrome_reader_mode,
                title: "Reading ",
                activeColor: Color(0xffff8f00),
                isActive: currentIndex == 1,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChange(2),
              child: BottomNavItem(
                icon: Icons.bookmark_border,
                title: "Bookmark",
                activeColor: Color(0xffff8f00),
                isActive: currentIndex == 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final Color activeColor;
  final Color inactiveColor;
  final String title;

  const BottomNavItem(
      {Key key, this.isActive = false, this.icon, this.activeColor, this.inactiveColor, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 200),
      child: isActive
          ? Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: activeColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    width: 5.0,
                    height: 5.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeColor ?? Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          : Icon(
              icon,
              color: inactiveColor ?? Colors.grey,
            ),
    );
  }
}
