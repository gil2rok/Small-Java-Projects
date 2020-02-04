import java.io.*;
import java.util.*;
String str = "64630 11735 14216 99233 14470 4978 73429 38120 51135 67060";
//64630 11735 14216 99233 14470 4978 73429 38120 51135 67060


void setup() {
  String strLen = initString(str);
  String[] stringArr = {strLen, str};
  //System.out.print("Original String Arr: ");
  //printArrString(stringArr);
  thing(stringArr);
}

public void thing(String[] args) {
  /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
  int[] arr = init(args);
  //System.out.print("Initialized Int Arr: ");
  //printArr(arr);

  int len = 1;
  String arrElements = args[1];
  for (int i = 0; i < arrElements.length() - 1; i++) {
    String tempString = arrElements.substring(i, i+1);
    if (tempString.equals(" ") == true)
      len++;
  }

  arr = arrIncreasingOrder(len, arr);
  //System.out.print("Increasing Order Arr: ");
  //printArr(arr);

  double meanTemp = mean(len, arr);
  double medianTemp = median(len, arr); 
  double modeTemp = mode(len, arr);

  double mean = round(meanTemp, 1);
  double median = round(medianTemp, 1);
  double mode = round(modeTemp, 1);

  //System.out.println("Mean: " + mean);
  //System.out.println("Median: " + median);
  //System.out.println("Mode: " + mode);

  System.out.println(mean);
  System.out.println(median);
  System.out.println(mode);
}

public static void printArr(int[] arr) {
  for (int i = 0; i < arr.length; i++) {
    System.out.print("[" + arr[i] + "]");
  }
  System.out.println();
}

public static void printArrString(String[] arr) {
  for (int i = 0; i < arr.length; i++) {
    System.out.print("[" + arr[i] + "]");
  }
  System.out.println();
}

public static double round(double value, int precision) {
    int scale = (int) Math.pow(10, precision);
    return (double) Math.round(value * scale) / scale;
  }

public static int[] init(String[] args) {
  String arrElements = args[1];

  int len = 1;
  for (int i = 0; i < arrElements.length() - 1; i++) {
    String tempString = arrElements.substring(i, i+1);
    if (tempString.equals(" ") == true)
      len++;
  }

  int[] arr = new int[len];
  String tempVal = "";
  int indexCounter = 0;

  for (int i = 0; i < arrElements.length() - 1; i++) {
    String tempString = arrElements.substring(i, i+1);
    if (tempString.equals(" ") == false)
      tempVal = tempVal + tempString;
    else if (tempString.equals(" ") == true) {
      arr[indexCounter] = Integer.parseInt(tempVal);
      tempVal = "";
      indexCounter++;
    }

    if (i == arrElements.length() - 2) {
      int indexCounter2 = 0;
      int stopRepeating = 0;
      for (int j = arrElements.length() - 1; j > 0; j--) {
        String tempString2 = arrElements.substring(j, j+1);
        if (tempString2.equals(" ") && stopRepeating == 0) {
          indexCounter2 = j;
          stopRepeating++;
        }
      }
      String temp3 = arrElements.substring(indexCounter2 + 1);
      arr[len - 1] = Integer.parseInt(temp3);
    }
  }
  return arr;
}

public static String initString(String str) {
  String tempVal = "";
  int indexCounter = 0;
  String result = "";

  for (int i = 0; i < str.length() - 1; i++) {
    String tempString = str.substring(i, i+1);
    if (tempString.equals(" ") == false)
      tempVal = tempVal + tempString;
    else if (tempString.equals(" ") == true) {
      result += tempVal;
      tempVal = "";
      indexCounter++;
    }
    if (i == str.length() - 2) {
      int indexCounter2 = 0;
      int stopRepeating = 0;
      for (int j = str.length() - 2; j > 0; j--) {
        String tempString2 = str.substring(j, j+1);
        if (tempString2.equals(" ") && stopRepeating == 0) {
          indexCounter2 = j;
          stopRepeating++;
        }
      }
      result += str.substring(indexCounter2 + 1);
    }
  }
  int len = result.length();
  String strLen = String.valueOf(len);
  return strLen;
}

public static double mean(int len, int[] arr) {
  double sum = 0;
  for (int i = 0; i < len; i++) {
    sum += arr[i]; //finding sum of all numbers in the array
  }
  double mean = sum/len;
  return mean;
}

public static int[] arrIncreasingOrder(int len, int[] arr) {
  //putting the numbers in order from min to max
  for (int i = 0; i < len - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < len; j++) {
      //System.out.println("I: " + i + " J: " +j);
      if (arr[j] < arr[minIndex])
        minIndex = j;
    }
    int temp = arr[i];
    arr[i] = arr[minIndex];
    arr[minIndex] = temp;
  }
  return arr;
}

public static double median(int len, int[] arr) {
  double median = -1;
  if (len % 2 == 0) {
    double sumOfMidTwo = arr[len/2 - 1] + arr[len/2];
    median = sumOfMidTwo/2;
  } else if (len % 2 == 1) {
    median = arr[len/2];
  }
  return median;
}

public static double mode(int len, int[] arr) {
  //counting how many times a number appears
  ArrayList<Integer> modeCounter = new ArrayList<Integer>();
  for (int i = 0; i < 100001; i++)
    modeCounter.add(i, -1);
  for (int i = 0; i < arr.length; i++) {
    int temp = arr[i];
    Integer val = modeCounter.get(temp) + 1;
    modeCounter.set(temp, val);
  }

  //finding the max value
  double max = modeCounter.get(0);
  double actualVal = -1;
  double mode = 1;
  for (int i = 0; i < modeCounter.size(); i++) {
    if (modeCounter.get(i) != -1) {
      if (max < modeCounter.get(i)) {
        max = modeCounter.get(i);
        actualVal = i;
      }
      mode = actualVal;
    }
  }
  return mode;
}
