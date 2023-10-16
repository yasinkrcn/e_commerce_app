import '../_core_exports.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? actions;
  final Widget? leading;
  final String? title;

  const CommonAppBar({Key? key, this.actions, this.title, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: leading ?? InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back)),
      title: AppText(
        title ?? "",
        style: const TextStyle(color: Colors.black, fontSize: 24),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.black),
      actions: [
        if (actions != null) actions!,
        10.widthR,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
