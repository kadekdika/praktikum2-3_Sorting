void main() {
  List<num> data = List.generate(10, (index) => (index + 1).toDouble());
  print('Data awal:');
  printData(data);

  List<num> mergeAsc = List.from(data);
  DateTime startTimeAsc = DateTime.now();
  mergeSortWithFlag(mergeAsc, 0, mergeAsc.length - 1, true);
  Duration elapsedTimeAsc = DateTime.now().difference(startTimeAsc);
  print('\nData setelah Merge Sort Ascending:');
  printData(mergeAsc);
  print('Waktu Merge Sort Ascending: ${elapsedTimeAsc.inMilliseconds} ms\n');

  List<num> mergeDesc = List.from(data);
  DateTime startTimeDesc = DateTime.now();
  mergeSortWithFlag(mergeDesc, 0, mergeDesc.length - 1, false);
  Duration elapsedTimeDesc = DateTime.now().difference(startTimeDesc);
  print('\nData setelah Merge Sort Descending:');
  printData(mergeDesc);
  print('Waktu Merge Sort Descending: ${elapsedTimeDesc.inMilliseconds} ms');
}

void mergeSortWithFlag<T extends Comparable<T>>(List<T> arr, int l, int r, bool ascending) {
  if (l < r) {
    int med = (l + r) ~/ 2;
    mergeSortWithFlag(arr, l, med, ascending);
    mergeSortWithFlag(arr, med + 1, r, ascending);
    mergeWithFlag(arr, l, med, r, ascending);
  }
}

void mergeWithFlag<T extends Comparable<T>>(List<T> arr, int left, int median, int right, bool ascending) {
  List<T?> temp = List.filled(arr.length, null);
  int kiri1 = left, kanan1 = median;
  int kiri2 = median + 1, kanan2 = right;
  int i = left;

  while (kiri1 <= kanan1 && kiri2 <= kanan2) {
    if ((ascending && arr[kiri1].compareTo(arr[kiri2]) <= 0) || 
        (!ascending && arr[kiri1].compareTo(arr[kiri2]) >= 0)) {
      temp[i] = arr[kiri1];
      kiri1++;
    } else {
      temp[i] = arr[kiri2];
      kiri2++;
    }
    i++;
  }

  while (kiri1 <= kanan1) temp[i++] = arr[kiri1++];
  while (kiri2 <= kanan2) temp[i++] = arr[kiri2++];

  for (int j = left; j <= right; j++) {
    arr[j] = temp[j]!;
  }
}

void printData<T>(List<T> data) {
  print(data.join(', '));
}