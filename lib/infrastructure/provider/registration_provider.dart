import 'package:pet_adoption_app/infrastructure/provider/homeProvider/homeProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeProvider(ref));
