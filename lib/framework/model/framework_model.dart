class FileStreamModel
{
    String fileName = "";
    Stream? fileStream = null;
}

class BaseSearchCriteria {
    int? page;
    int? pageSize;
    String? keyword;
    String? sortBy;
    bool? sortAscending;
}

class Status {
  int? id;
  String type;
  Status({required this.id, required this.type});
}