import 'package:flutter/material.dart';

Map<String, List<IconData>> groupedIcons = {
  'All': [
    Icons.directions_ferry,
    Icons.bloodtype,
    Icons.fitbit,
    Icons.security,
    Icons.toys_outlined,
    Icons.location_city,
    Icons.healing,
    Icons.cake_outlined,
    Icons.waves,
    Icons.deck,
    Icons.emoji_food_beverage,
    Icons.directions_boat,
    Icons.accessibility_new,
    Icons.sports_volleyball,
    Icons.sports_kabaddi,
    Icons.sports_basketball,
    Icons.radio,
    Icons.military_tech,
    Icons.local_pizza,
    Icons.all_inclusive,
    Icons.place_outlined,
    Icons.schedule,
    Icons.king_bed,
    Icons.restaurant,
    Icons.luggage,
    Icons.school,
    Icons.sports_soccer_outlined,
    Icons.local_pharmacy,
    Icons.free_breakfast_outlined,
    Icons.paid,
    Icons.pie_chart_outline,
    Icons.person_remove_outlined,
    Icons.lightbulb_outline,
    Icons.hearing,
    Icons.spa,
    Icons.local_printshop,
    Icons.explore,
    Icons.cleaning_services,
    Icons.mood_bad,
    Icons.favorite,
    Icons.delete_forever,
    Icons.sports_golf_outlined,
    Icons.swap_horiz,
    Icons.directions_walk,
    Icons.airline_seat_flat_angled,
    Icons.person_add_outlined,
    Icons.subscriptions,
    Icons.backspace_rounded,
    Icons.local_bar,
    Icons.local_dining,
    Icons.local_phone,
    Icons.bakery_dining,
    Icons.group,
    Icons.local_laundry_service,
    Icons.local_bar_outlined,
    Icons.local_shipping,
    Icons.airline_seat_legroom_extra_outlined,
    Icons.bloodtype_outlined,
    Icons.hourglass_empty,
    Icons.business_center,
    Icons.group_sharp,
    Icons.person_remove,
    Icons.sports_mma,
    Icons.balcony,
    Icons.backspace_outlined,
    Icons.print,
    Icons.ac_unit,
    Icons.people_outline,
    Icons.directions,
    Icons.sports_volleyball_outlined,
    Icons.person_outline,
    Icons.directions_run,
    Icons.add_reaction,
    Icons.sentiment_satisfied_outlined,
    Icons.gamepad_outlined,
    Icons.mobile_off,
    Icons.child_care,
    Icons.sentiment_neutral,
    Icons.local_parking,
    Icons.local_play,
    Icons.notifications,
    Icons.airline_seat_recline_extra_outlined,
    Icons.airline_seat_recline_normal,
    Icons.volunteer_activism,
    Icons.music_note,
    Icons.clear_all,
    Icons.lunch_dining,
    Icons.create,
    Icons.photo_camera,
    Icons.sports_handball,
    Icons.sports_rugby,
    Icons.sports_tennis,
    Icons.nature,
    Icons.cake,
    Icons.clean_hands,
    Icons.sports_esports_outlined,
    Icons.phone_android,
    Icons.pets,
    Icons.videocam,
    Icons.car_rental,
    Icons.sports_golf,
    Icons.access_alarm,
    Icons.local_activity,
    Icons.thumb_down,
    Icons.brunch_dining,
    Icons.local_hospital,
    Icons.gamepad,
    Icons.remove_red_eye,
    Icons.sports_tennis_outlined,
    Icons.event_seat_outlined,
    Icons.pie_chart,
    Icons.airline_seat_recline_extra,
    Icons.mobile_screen_share,
    Icons.local_drink,
    Icons.event,
    Icons.fence,
    Icons.dry_outlined,
    Icons.train,
    Icons.museum,
    Icons.person,
    Icons.beach_access,
    Icons.countertops,
    Icons.alarm,
    Icons.sports_baseball_outlined,
    Icons.pool,
    Icons.gesture,
    Icons.bubble_chart,
    Icons.sanitizer,
    Icons.thumb_up,
    Icons.local_drink_outlined,
    Icons.airline_seat_legroom_normal_outlined,
    Icons.grass,
    Icons.insert_drive_file,
    Icons.wifi,
    Icons.sentiment_very_satisfied,
    Icons.rss_feed,
    Icons.hotel,
    Icons.wb_sunny,
    Icons.terrain,
    Icons.home,
    Icons.local_mall,
    Icons.cloud,
    Icons.local_gas_station,
    Icons.delete_sweep_outlined,
    Icons.nature_people,
    Icons.nightlight,
    Icons.thumb_down_outlined,
    Icons.local_convenience_store,
    Icons.restaurant_menu,
    Icons.local_florist,
    Icons.computer,
    Icons.bus_alert,
    Icons.airline_seat_individual_suite,
    Icons.sentiment_very_dissatisfied,
    Icons.sports_soccer,
    Icons.account_balance,
    Icons.child_friendly,
    Icons.airline_seat_legroom_normal,
    Icons.book,
    Icons.mail_outline,
    Icons.thumb_down_rounded,
    Icons.nights_stay,
    Icons.local_atm,
    Icons.theater_comedy,
    Icons.person_rounded,
    Icons.airline_seat_flat,
    Icons.eco,
    Icons.outdoor_grill,
    Icons.phone,
    Icons.local_cafe_outlined,
    Icons.lock,
    Icons.warning_amber_outlined,
    Icons.camera_alt,
    Icons.local_pizza_outlined,
    Icons.card_giftcard,
    Icons.airplanemode_active,
    Icons.no_meals,
    Icons.airline_seat_recline_normal_outlined,
    Icons.language,
    Icons.sports_cricket,
    Icons.apartment,
    Icons.local_grocery_store,
    Icons.fitness_center,
    Icons.airline_seat_legroom_extra,
    Icons.email,
    Icons.nightlife,
    Icons.games,
    Icons.weekend_outlined,
    Icons.money,
    Icons.local_offer,
    Icons.error_outline_rounded,
    Icons.directions_bus,
    Icons.translate,
    Icons.surfing,
    Icons.sports_hockey_outlined,
    Icons.golf_course,
    Icons.casino,
    Icons.adb,
    Icons.airline_seat_flat_outlined,
    Icons.sports_hockey,
    Icons.delete_sweep,
    Icons.format_list_bulleted,
    Icons.attach_file,
    Icons.donut_large,
    Icons.sync,
    Icons.sentiment_dissatisfied,
    Icons.self_improvement,
    Icons.desktop_mac,
    Icons.attach_money,
    Icons.undo,
    Icons.power_off,
    Icons.electric_bike,
    Icons.videogame_asset_outlined,
    Icons.headset,
    Icons.toys,
    Icons.airline_seat_flat_angled_outlined,
    Icons.directions_car,
    Icons.medical_services,
    Icons.archive,
    Icons.local_cafe,
    Icons.laptop,
    Icons.spa_outlined,
    Icons.food_bank,
    Icons.bento,
    Icons.dry,
    Icons.storage,
    Icons.shopping_bag,
    Icons.sports_motorsports,
    Icons.countertops_outlined,
    Icons.sports_kabaddi_outlined,
    Icons.bookmark,
    Icons.weekend,
    Icons.kitchen_outlined,
    Icons.free_breakfast,
    Icons.local_taxi,
    Icons.do_not_touch,
    Icons.scuba_diving,
    Icons.mood,
    Icons.trending_up,
    Icons.sports_football,
    Icons.cancel,
    Icons.thumb_up_outlined,
    Icons.local_see,
    Icons.kitchen,
    Icons.keyboard,
    Icons.face_retouching_natural,
    Icons.sentiment_satisfied,
    Icons.menu_book,
    Icons.kitesurfing,
    Icons.fastfood,
    Icons.brush,
    Icons.fastfood_outlined,
    Icons.local_library,
    Icons.not_accessible,
    Icons.mic,
    Icons.work,
    Icons.accessibility,
    Icons.shopping_cart,
    Icons.panorama,
    Icons.lightbulb,
    Icons.event_seat,
    Icons.whatshot,
    Icons.food_bank_outlined,
    Icons.airline_seat_individual_suite_outlined,
    Icons.person_add,
    Icons.tag_faces,
    Icons.flag,
    Icons.snowboarding,
    Icons.emoji_emotions,
    Icons.folder,
    Icons.tv,
    Icons.sports_rugby_outlined,
    Icons.cancel_schedule_send,
    Icons.edit,
    Icons.watch_later,
    Icons.family_restroom,
    Icons.directions_bike,
    Icons.backup,
    Icons.flight,
    Icons.warning,
    Icons.groups,
    Icons.sentiment_satisfied_alt,
    Icons.error_outline,
    Icons.escalator_warning,
    Icons.sports_esports,
    Icons.error,
    Icons.movie,
    Icons.local_post_office,
    Icons.palette,
    Icons.directions_railway,
    Icons.people,
    Icons.group_outlined,
    Icons.place,
    Icons.search,
    Icons.smartphone,
    Icons.theaters,
    Icons.sports_cricket_outlined,
    Icons.videogame_asset,
    Icons.local_movies,
  ],
  'Popular': [
    Icons.directions_run,
    Icons.directions_bike,
    Icons.directions_walk,
    Icons.local_cafe,
    Icons.restaurant_menu,
    Icons.local_dining,
    Icons.spa,
    Icons.sports_soccer,
    Icons.sports_basketball,
    Icons.sports_tennis,
    Icons.local_pizza,
    Icons.fastfood,
    Icons.restaurant,
    Icons.local_bar,
    Icons.free_breakfast,
    Icons.local_drink,
    Icons.local_laundry_service,
    Icons.local_play,
    Icons.local_parking,
    Icons.local_pharmacy,
    Icons.local_shipping,
    Icons.local_gas_station,
    Icons.local_hospital,
    Icons.local_mall,
    Icons.local_printshop,
    Icons.local_see,
    Icons.local_taxi,
    Icons.local_offer,
    Icons.local_florist,
    Icons.local_atm,
    Icons.local_convenience_store,
    Icons.local_activity,
    Icons.local_post_office,
    Icons.local_phone,
    Icons.local_grocery_store,
    Icons.luggage,
    Icons.shopping_bag,
    Icons.shopping_cart,
    Icons.school,
    Icons.sports_cricket,
    Icons.sports_esports,
    Icons.sports_football,
    Icons.sports_golf,
    Icons.sports_handball,
    Icons.sports_hockey,
    Icons.sports_kabaddi,
    Icons.sports_mma,
    Icons.sports_motorsports,
    Icons.sports_rugby,
    Icons.sports_soccer,
    Icons.sports_tennis,
    Icons.sports_volleyball,
    Icons.cake,
    Icons.deck,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_ferry,
    Icons.directions_railway,
    Icons.watch_later,
    Icons.local_library,
    Icons.movie,
    Icons.games,
    Icons.music_note,
    Icons.radio,
    Icons.tv,
    Icons.smartphone,
    Icons.laptop,
    Icons.desktop_mac,
    Icons.local_movies,
    Icons.directions_car,
    Icons.train,
    Icons.flight,
    Icons.beach_access,
    Icons.hotel,
    Icons.airplanemode_active,
    Icons.home,
    Icons.family_restroom,
    Icons.alarm,
    Icons.lightbulb_outline,
    Icons.brush,
    Icons.book,
    Icons.computer,
    Icons.work,
    Icons.business_center,
    Icons.favorite,
    Icons.camera_alt,
    Icons.headset,
    Icons.access_alarm,
    Icons.accessibility,
    Icons.account_balance,
    Icons.attach_file,
    Icons.backup,
    Icons.bookmark,
    Icons.cloud,
    Icons.donut_large,
    Icons.electric_bike,
    Icons.email,
    Icons.event,
    Icons.folder,
    Icons.golf_course,
    Icons.insert_drive_file,
    Icons.keyboard,
    Icons.location_city,
    Icons.lock,
    Icons.mail_outline,
    Icons.mic,
    Icons.money,
    Icons.notifications,
    Icons.palette,
    Icons.panorama,
    Icons.pets,
    Icons.phone,
    Icons.photo_camera,
    Icons.pool,
    Icons.print,
    Icons.security,
    Icons.subscriptions,
    Icons.sync,
    Icons.tag_faces,
    Icons.theaters,
    Icons.thumb_up,
    Icons.translate,
    Icons.trending_up,
    Icons.videogame_asset,
    Icons.wb_sunny,
    Icons.weekend,
    Icons.whatshot,
    Icons.wifi,
    Icons.king_bed,
    Icons.lunch_dining,
    Icons.medical_services,
    Icons.military_tech,
    Icons.museum,
    Icons.nightlife,
    Icons.no_meals,
    Icons.not_accessible,
    Icons.paid,
  ],
  'Health': [
    Icons.local_hospital,
    Icons.medical_services,
    Icons.healing,
    Icons.favorite,
    Icons.favorite_rounded,
    Icons.accessibility,
    Icons.accessibility_new,
    Icons.add_reaction,
    Icons.airline_seat_flat,
    Icons.airline_seat_individual_suite,
    Icons.airline_seat_legroom_extra,
    Icons.airline_seat_recline_extra,
    Icons.airline_seat_recline_normal,
    Icons.all_inclusive,
    Icons.apartment,
    Icons.balcony,
    Icons.beach_access,
    Icons.bento,
    Icons.bloodtype,
    Icons.bloodtype_outlined,
    Icons.brunch_dining,
    Icons.bus_alert,
    Icons.car_rental,
    Icons.clean_hands,
    Icons.countertops,
    Icons.countertops_outlined,
    Icons.do_not_touch,
    Icons.dry,
    Icons.dry_outlined,
    Icons.escalator_warning,
    Icons.fence,
    Icons.fitbit,
  ],
  'Hobby': [
    Icons.sports_soccer,
    Icons.sports_basketball,
    Icons.sports_tennis,
    Icons.directions_bike,
    Icons.pool,
    Icons.music_note,
    Icons.palette,
    Icons.videogame_asset,
    Icons.book,
    Icons.camera,
    Icons.sports_baseball,
    Icons.sports_golf,
    Icons.sports_volleyball,
    Icons.sports_rugby,
    Icons.sports_cricket,
    Icons.directions_run,
    Icons.directions_walk,
    Icons.hiking,
    Icons.fitness_center,
    Icons.local_movies,
    Icons.tv,
    Icons.golf_course,
    Icons.laptop,
    Icons.shopping_cart,
    Icons.local_airport,
    Icons.beach_access,
    Icons.pets,
    Icons.toys,
    Icons.gamepad,
    Icons.sports_basketball,
    Icons.surfing,
    Icons.snowboarding,
    Icons.directions_boat,
    Icons.waves,
    Icons.kitesurfing,
    Icons.self_improvement,
    Icons.mic,
    Icons.casino,
    Icons.sports_martial_arts,
    Icons.directions_run,
    Icons.scuba_diving,
    Icons.terrain,
    Icons.adb,
    Icons.airplanemode_active,
    Icons.nature,
    Icons.nightlight,
    Icons.local_florist,
    Icons.restaurant,
    Icons.create,
    Icons.rss_feed,
    Icons.videocam,
    Icons.mic,
    Icons.directions_walk,
    Icons.explore,
    Icons.museum,
    Icons.music_note,
    Icons.theater_comedy,
    Icons.directions_run,
    Icons.directions_bike,
    Icons.brush,
    Icons.card_giftcard,
  ],
  'Diet': [
    Icons.restaurant,
    Icons.local_dining,
    Icons.fastfood,
    Icons.fastfood_outlined,
    Icons.local_pizza,
    Icons.local_pizza_outlined,
    Icons.local_cafe,
    Icons.local_cafe_outlined,
    Icons.local_bar,
    Icons.local_drink,
    Icons.food_bank,
    Icons.icecream,
    Icons.breakfast_dining,
    Icons.lunch_dining,
    Icons.dinner_dining,
    Icons.brunch_dining,
    Icons.local_grocery_store,
    Icons.shopping_bag,
    Icons.shopping_cart,
    Icons.add_shopping_cart,
    Icons.remove_shopping_cart,
    Icons.shopping_basket,
    Icons.shopping_basket_outlined,
    Icons.shopping_cart_outlined,
    Icons.add_shopping_cart_outlined,
    Icons.remove_shopping_cart_outlined,
    Icons.add_shopping_cart_rounded,
    Icons.remove_shopping_cart_rounded,
    Icons.shopping_bag_rounded,
    Icons.menu_book,
    Icons.local_atm,
    Icons.monetization_on,
    Icons.money,
    Icons.money_off,
    Icons.attach_money,
    Icons.local_mall,
    Icons.local_offer,
    Icons.local_shipping,
  ],
  'Lifestyle': [
    Icons.weekend,
    Icons.hiking,
    Icons.directions_bike,
    Icons.directions_walk,
    Icons.directions_run,
    Icons.directions,
    Icons.place,
    Icons.place_outlined,
    Icons.restaurant,
    Icons.local_cafe,
    Icons.local_dining,
    Icons.local_drink,
    Icons.local_pizza,
    Icons.local_bar,
    Icons.fastfood,
    Icons.food_bank,
    Icons.kitchen,
    Icons.free_breakfast,
    Icons.cake,
    Icons.pie_chart,
    Icons.emoji_emotions,
    Icons.event_seat,
    Icons.sports_esports,
    Icons.videogame_asset,
    Icons.gamepad,
    Icons.toys,
    Icons.child_care,
    Icons.child_friendly,
    Icons.face,
    Icons.tag_faces,
    Icons.spa,
    Icons.sports_tennis,
    Icons.sports_golf,
    Icons.sports_baseball,
    Icons.sports_basketball,
    Icons.sports_cricket,
    Icons.sports_hockey,
    Icons.sports_kabaddi,
    Icons.sports_rugby,
    Icons.sports_soccer,
    Icons.sports_volleyball,
    Icons.movie_filter,
    Icons.movie_creation,
    Icons.calendar_today,
    Icons.outdoor_grill,
    Icons.icecream,
    Icons.local_florist,
    Icons.airplanemode_active,
    Icons.bakery_dining,
    Icons.dinner_dining,
    Icons.local_activity,
    Icons.local_atm,
    Icons.local_car_wash,
    Icons.local_convenience_store,
    Icons.local_fire_department,
    Icons.local_gas_station,
    Icons.local_grocery_store,
    Icons.local_laundry_service,
    Icons.local_library,
    Icons.local_mall,
    Icons.local_movies,
    Icons.local_offer,
    Icons.local_parking,
    Icons.local_pharmacy,
    Icons.beach_access,
    Icons.book,
    Icons.card_giftcard,
  ],
  'Efficiency': [
    Icons.analytics,
    Icons.bar_chart,
    Icons.leaderboard,
    Icons.pie_chart,
    Icons.assessment,
    Icons.insert_chart,
    Icons.show_chart,
    Icons.timeline,
    Icons.trending_down,
    Icons.trending_flat,
    Icons.trending_up,
    Icons.multiline_chart,
    Icons.equalizer,
    Icons.speed,
    Icons.layers,
    Icons.extension,
    Icons.format_quote,
    Icons.view_agenda,
    Icons.view_array,
    Icons.view_carousel,
    Icons.view_column,
    Icons.view_day,
    Icons.view_headline,
    Icons.view_list,
    Icons.view_module,
    Icons.view_quilt,
    Icons.view_stream,
    Icons.view_week,
    Icons.remove_red_eye,
    Icons.remove_red_eye_outlined,
    Icons.visibility_off,
    Icons.visibility_off_outlined,
    Icons.zoom_in,
    Icons.zoom_out,
    Icons.aspect_ratio,
    Icons.crop_original,
    Icons.photo_camera,
    Icons.photo_camera_back,
    Icons.photo_camera_front,
    Icons.photo_filter,
    Icons.photo_library,
    Icons.add_photo_alternate,
    Icons.attach_file,
    Icons.attach_money,
    Icons.directions_run,
    Icons.train,
  ],
  'Money': [
    Icons.monetization_on,
    Icons.account_balance,
    Icons.account_balance_wallet,
    Icons.payment,
    Icons.money_off,
    Icons.savings,
    Icons.pie_chart,
    Icons.equalizer,
    Icons.attach_money,
    Icons.euro_symbol,
    Icons.attach_money_sharp,
    Icons.check_circle_outline,
    Icons.check_circle,
    Icons.done,
    Icons.done_all,
    Icons.done_outline,
    Icons.money_off_rounded,
    Icons.payments,
    Icons.payments_outlined,
    Icons.receipt,
    Icons.receipt_outlined,
    Icons.shopping_bag,
    Icons.shopping_bag_outlined,
    Icons.shopping_basket_outlined,
    Icons.shopping_basket_rounded,
    Icons.shopping_cart,
    Icons.shopping_cart_outlined,
    Icons.monetization_on_rounded,
    Icons.monetization_on_outlined,
    Icons.money_sharp,
    Icons.trending_down_rounded,
    Icons.trending_up_rounded,
    Icons.account_balance_wallet_outlined,
    Icons.account_balance_wallet_sharp,
    Icons.account_balance_outlined,
    Icons.account_balance_sharp,
    Icons.account_box_outlined,
    Icons.account_box_sharp,
    Icons.account_circle_outlined,
    Icons.account_circle_sharp
  ],
  'Relationship': [
    Icons.favorite,
    Icons.favorite_border,
    Icons.favorite_rounded,
    Icons.favorite_outlined,
    Icons.favorite_rounded,
    Icons.sentiment_very_satisfied,
    Icons.sentiment_satisfied,
    Icons.sentiment_satisfied_outlined,
    Icons.mood,
    Icons.thumb_up,
    Icons.thumb_up_outlined,
    Icons.thumb_down,
    Icons.thumb_down_outlined,
    Icons.thumb_down_rounded,
    Icons.family_restroom,
    Icons.people,
    Icons.people_outline,
    Icons.groups,
    Icons.group_outlined,
    Icons.group_sharp,
    Icons.person,
    Icons.person_outline,
    Icons.person_rounded,
    Icons.person_add,
    Icons.person_add_outlined,
    Icons.person_remove,
    Icons.person_remove_outlined,
  ],
  'Negative': [
    Icons.fastfood,
    Icons.local_cafe,
    Icons.local_bar,
    Icons.sentiment_very_dissatisfied,
    Icons.mood_bad,
    Icons.warning,
    Icons.error,
    Icons.error_outline,
    Icons.cancel,
    Icons.clear,
    Icons.delete,
    Icons.remove,
    Icons.remove_circle,
    Icons.remove_circle_outline,
    Icons.remove_red_eye,
    Icons.not_interested,
    Icons.do_not_disturb_off,
    Icons.report,
    Icons.report_problem,
    Icons.error_outline,
    Icons.warning_amber_outlined,
    Icons.error_outline_rounded,
    Icons.delete_forever,
    Icons.delete_sweep,
    Icons.delete_sweep_outlined,
    Icons.clear_all,
    Icons.cancel_schedule_send,
    Icons.backspace_outlined,
    Icons.backspace_rounded,
    Icons.undo,
    Icons.archive,
  ],
  'Emojis': [
    Icons.mood,
    Icons.mood_bad,
    Icons.sentiment_very_dissatisfied,
    Icons.sentiment_dissatisfied,
    Icons.sentiment_neutral,
    Icons.sentiment_satisfied,
    Icons.sentiment_very_satisfied,
    Icons.face,
    Icons.sentiment_very_dissatisfied,
    Icons.sentiment_dissatisfied,
    Icons.sentiment_neutral,
    Icons.sentiment_satisfied,
    Icons.sentiment_very_satisfied,
    Icons.sentiment_satisfied_alt,
    Icons.face_retouching_natural,
    Icons.tag_faces,
    Icons.child_care,
    Icons.emoji_emotions,
    Icons.child_friendly,
    Icons.ac_unit,
    Icons.beach_access,
    Icons.grass,
    Icons.spa,
    Icons.sports_basketball,
    Icons.sports_soccer,
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_railway,
    Icons.directions_run,
    Icons.directions_walk,
    Icons.directions,
    Icons.place,
    Icons.place_outlined,
    Icons.restaurant,
    Icons.emoji_food_beverage,
    Icons.local_cafe,
    Icons.local_dining,
    Icons.local_drink,
    Icons.local_pizza,
    Icons.local_bar,
    Icons.fastfood,
    Icons.food_bank,
    Icons.kitchen,
    Icons.free_breakfast,
    Icons.cake,
    Icons.pie_chart,
    Icons.airline_seat_flat,
    Icons.airline_seat_flat_angled,
    Icons.airline_seat_individual_suite,
    Icons.airline_seat_legroom_extra,
    Icons.airline_seat_legroom_normal,
    Icons.airline_seat_recline_extra,
    Icons.airline_seat_recline_normal,
    Icons.event_seat,
    Icons.weekend,
    Icons.sports_esports,
    Icons.videogame_asset,
    Icons.gamepad,
    Icons.toys,
    Icons.spa,
    Icons.sports_tennis,
    Icons.sports_golf,
    Icons.sports_baseball,
    Icons.sports_cricket,
    Icons.sports_hockey,
    Icons.sports_kabaddi,
    Icons.sports_rugby,
    Icons.sports_soccer,
    Icons.sports_tennis,
    Icons.sports_volleyball,
  ],
};