
class ObjectUtils {

 static List<List<T>> getGroupedDataByProperty<T>(List<T> data, String Function(T) propertySelector) {
  if (data == null || data.isEmpty) {
    return [];
  }

  Map<String, List<T>> groupedData = {};

  for (var item in data) {
    var propertyValue = propertySelector(item);
    if (groupedData.containsKey(propertyValue)) {
      groupedData[propertyValue]!.add(item);
    } else {
      groupedData[propertyValue] = [item];
    }
  }

  return groupedData.values.toList();
}

}