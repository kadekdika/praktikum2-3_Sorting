void main() {
  List<num> data = List.generate(10, (index) => (index + 1).toDouble());
  print('Data awal:');
  printData(data);

  DateTime startTimeAsc = DateTime.now();
  quickSort(data, 0, data.length - 1);
  Duration elapsedTimeAsc = DateTime.now().difference(startTimeAsc);
  print('Data setelah Quick Sort Ascending:');
  printData(data);
  print('Waktu Ascending: ${elapsedTimeAsc.inMilliseconds} ms\n');

  List<num> dataDescending = List.from(data); 
  DateTime startTimeDesc = DateTime.now();
  quickSortDescending(dataDescending, 0, dataDescending.length - 1);
  Duration elapsedTimeDesc = DateTime.now().difference(startTimeDesc);
  print('Data setelah Quick Sort Descending:');
  printData(dataDescending);
  print('Waktu Descending: ${elapsedTimeDesc.inMilliseconds} ms');
}

void quickSort<T extends Comparable<T>>(List<T> arr, int p, int r) {
  if (p < r) {
    int q = partition(arr, p, r);
    quickSort(arr, p, q);
    quickSort(arr, q + 1, r);
  }
}

void quickSortDescending<T extends Comparable<T>>(List<T> arr, int p, int r) {
  if (p < r) {
    int q = partitionDescending(arr, p, r);
    quickSortDescending(arr, p, q);
    quickSortDescending(arr, q + 1, r);
  }
}

int partition<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int i = p, j = r;
  T pivot = arr[p];

  while (i <= j) {
    while (pivot.compareTo(arr[j]) < 0) j--;
    while (pivot.compareTo(arr[i]) > 0) i++;
    if (i < j) {
      T temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      j--;
      i++;
    } else {
      return j;
    }
  }
  return j;
}

int partitionDescending<T extends Comparable<T>>(List<T> arr, int p, int r) {
  int i = p, j = r;
  T pivot = arr[p];

  while (i <= j) {
    while (pivot.compareTo(arr[j]) > 0) j--; 
    while (pivot.compareTo(arr[i]) < 0) i++; 
    if (i < j) {
      T temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      j--;
      i++;
    } else {
      return j;
    }
  }
  return j;
}

void printData<T>(List<T> data) {
  print(data.join(', '));
}
