import '02-counter_view_model.dart';
import '02-user_view_model.dart';
import 'package:provider/provider.dart';


List<SingleChildCloneableWidget> initproviders = [
  ChangeNotifierProvider(create: (ctx) => FHCounterViewModel(),),
  ChangeNotifierProvider(create: (ctx) => FHUserViewModel(UserInfo("我是昵称",18,"nan")))
];