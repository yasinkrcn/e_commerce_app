class AssetPaths {
  static final AssetPaths _instance = AssetPaths._init();
  AssetPaths._init();

  factory AssetPaths() {
    return _instance;
  }

  String _toSVG(String name) => 'assets/svg/$name.svg';
  String _toPNG(String name) => 'assets/png/$name.png';
  String _toJPEG(String name) => 'assets/jpeg/$name.jpeg';
  String _toJSON(String name) => 'assets/json/$name.json';
  String _toGIF(String name) => 'assets/gif/$name.gif';

  //*PNG

  String get googlePNG => _toPNG("google");
  String get logoColorlessPNG => _toPNG("logo_colorless");
  String get successCreatedProfilePNG => _toPNG("success_created_profile");
  String get findStadiumPNG => _toPNG("find_stadium");
  String get findPlayerPNG => _toPNG("find_player");
  String get findTeamPNG => _toPNG("find_team");
  String get findGoalkeeperPNG => _toPNG("find_goalkeeper");
  String get findHakemPNG => _toPNG("find_hakem");
  String get findAwayPNG => _toPNG("find_away");

  //*SVG

  String get homeDefaultSVG => _toSVG("home_default");
  String get homeActiveSVG => _toSVG("home_active");
  String get searchDefaultSVG => _toSVG("search_default");
  String get searchActiveSVG => _toSVG("search_active");
  String get chatDefaultSVG => _toSVG("chat_default");
  String get chatActiveSVG => _toSVG("chat_active");
  String get profileDefaultSVG => _toSVG("profile_default");
  String get profileActiveSVG => _toSVG("profile_active");
  String get selectedMainSVG => _toSVG("selected_main");
  String get unselectedMainSVG => _toSVG("unselected_main");
  String get searchIconSVG => _toSVG("search_icon");
  String get filterIconSVG => _toSVG("filter_icon");
  String get starIconSVG => _toSVG("star_icon");
  String get locationIconSVG => _toSVG("location_icon");
  String get locationIconColorlessSVG => _toSVG("location_icon_colorless");
  String get calenderIconColorlessSVG => _toSVG("calender_icon_colorless");

  String get teamIconSVG => _toSVG("team_icon");
  String get clockIconSVG => _toSVG("clock_icon");
  String get locationBlackSVG => _toSVG("location_black");

  String get mapIconSVG => _toSVG("map_icon");
  String get createAnnounceIconSVG => _toSVG("create_announce_icon");
  String get notificationIconSVG => _toSVG("notification_icon");
  String get notificationAvailableIconSVG => _toSVG("notification_available_icon");

  String get bookmarkIconSVG => _toSVG("bookmark_icon");
  String get closeIconSVG => _toSVG("close_icon");
  String get backIconSVG => _toSVG("back_icon");
  String get addIconSVG => _toSVG("add_icon");
  String get menuIconSVG => _toSVG("menu_icon");
  String get arrowRightIconSVG => _toSVG("arrow_right");
  String get leftArrowSVG => _toSVG("left_arrow");
  String get bookmarkDefaultSVG => _toSVG("bookmark_default");
}
