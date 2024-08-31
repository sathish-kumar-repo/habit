import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubItemTile extends StatelessWidget {
  const SubItemTile({
    super.key,
    required this.name,
    required this.icon,
    required this.clr,
    required this.onTap,
  });
  final String name;
  final IconData icon;
  final Color clr;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            size: 23,
            color: clr,
          ),
          title: Text(
            name,
            style: GoogleFonts.poppins(),
          ),
          trailing: const Icon(
            Icons.drag_handle_rounded,
            size: 23,
          ),
        ),
      ),
    );
  }
}
