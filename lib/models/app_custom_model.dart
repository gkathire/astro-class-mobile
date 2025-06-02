import 'package:astro_mobile/api/generated/code/filmicall.swagger.dart';

class HomeScreenCategoryItemMenuModel {
  String categoryMenuIcon;
  int categoryMenuTypeId;
  String categoryMenuLabel;
  HomeScreenCategoryItemMenuModel({
    required this.categoryMenuLabel,
    required this.categoryMenuIcon,
    required this.categoryMenuTypeId,
  });
}

class HomeScreenCategoryMenuModel {
  List<HomeScreenCategoryItemMenuModel> homeScreenCategoryItems;
  String categorySectionTitle;
  HomeScreenCategoryMenuModel(
      {required this.homeScreenCategoryItems,
      required this.categorySectionTitle});
}

class FileAttachmentFolderContainerModel {
  List<FileAttachmentFolderContainerModel> folders;
  List<FileAttachmentModel> files;
  int? parentFolderId;
  String? parentFolderName;
  int? currentFolderId;
  String currentFolderName;
  FileAttachmentFolderContainerModel({
    required this.folders,
    required this.files,
    required this.parentFolderId,
    required this.parentFolderName,
    required this.currentFolderId,
    required this.currentFolderName,
  });
}
