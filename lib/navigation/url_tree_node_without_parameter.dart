import 'custom_route.dart';
import 'url_tree_node.dart';

class UrlTreeNodeWithoutParameter extends UrlTreeNode {
  UrlTreeNodeWithoutParameter({required String pattern, required handler}) : super(pattern: pattern, handler: handler);

  @override
  void handleParams(String pathSegment, CustomRouteBuilder routeBuilder) {}
}
