void selectionSortRightToLeft(List<int> arr, bool ascending) {
  int n = arr.length;
  for (int i = n - 1; i > 0; i--) {
    int selectedIndex = i;
    for (int j = i - 1; j >= 0; j--) {
      if ((ascending && arr[j] > arr[selectedIndex]) || (!ascending && arr[j] < arr[selectedIndex])) {
        selectedIndex = j;
      }
    }
    // Swap arr[i] dengan arr[selectedIndex]
    int temp = arr[i];
    arr[i] = arr[selectedIndex];
    arr[selectedIndex] = temp;
  }
}

void main() {
  List<int> arr = [8, 4, 3, 7, 6, 5, 2];
  print("Array awal: ${arr}");
  
  // Ascending
  List<int> ascendingArr = List.from(arr);
  selectionSortRightToLeft(ascendingArr, true);
  print("Ascending: ${ascendingArr}");
  
  // Descending
  List<int> descendingArr = List.from(arr);
  selectionSortRightToLeft(descendingArr, false);
  print("Descending: ${descendingArr}");
}
