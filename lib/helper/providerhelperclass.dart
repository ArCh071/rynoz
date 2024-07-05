import 'package:rynoz/helper/extension.dart';

abstract class ProviderHelperClass {
  LoaderState loaderState = LoaderState.loaded;
  void updateLoadState(LoaderState state);
}
