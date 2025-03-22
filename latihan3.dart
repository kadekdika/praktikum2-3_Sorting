void insertionSortRightToLeft(List<int> arr, bool ascending) {
  int n = arr.length;
  for (int i = n - 2; i >= 0; i--) {
    int key = arr[i];
    int j = i + 1;

    while (j < n &&
        ((ascending && arr[j] < key) || (!ascending && arr[j] > key))) {
      arr[j - 1] = arr[j];
      j++;
    }
    arr[j - 1] = key;
  }
}

void main() {
  List<int> arr = [8, 4, 3, 7, 6, 5, 2];
  print("Array awal:  $arr");

  List<int> ascendingArr = List.from(arr);
  insertionSortRightToLeft(ascendingArr, true);
  print("Ascending: $ascendingArr");

  List<int> descendingArr = List.from(arr);
  insertionSortRightToLeft(descendingArr, false);
  print("Descending: $descendingArr");
}
