/*
 * Modified from Frank M. Carrano's
 * Data Structures and Abstractions with Java (3rd Edition)
 */
import java.util.Arrays;
import java.util.Scanner;
import java.io.File;

public class AList<T extends Comparable> {

    private T[] list;
    private int numberOfEntries;

    public AList() {
        list = (T[]) new Comparable[25];
        numberOfEntries = 0;
    }


    public AList<T> slice(int start, int stop) {
        AList<T> list1 = new AList<T>(numberOfEntries);
        for (int i = start; i < (stop); i++) {
            list1.add(list[i]);
        }

        return list1;
    }

    public AList<T> slice(int start, int stop, int step) {
        AList<T> list2 = new AList<T>(numberOfEntries);
        for (int i = start; i < (stop); i = i + step) {
            list2.add(list[i]);
        }

        return list2;
    }

    public void sort(boolean ascending){
        if (ascending == true){
            for(int i = numberOfEntries; i > 0; i--){
                for(int j = 0; j < i-1; j++){
                    if(list[j].compareTo(list[j+1]) > 0){
                        T temp = list[j+1];
                        list[j+1] = list[j];
                        list[j] = temp;
                    }
                }
            }
        }

        else{
            for(int i = numberOfEntries; i > 0; i--){
                for(int j = 0; j < i-1; j++){
                    if(list[j].compareTo(list[j+1]) < 0){
                        T temp = list[j+1];
                        list[j+1] = list[j];
                        list[j] = temp;
                    }
                }
            }
        }
    }


    public AList(int initialCapacity) {
        numberOfEntries = 0;
        T[] tempList = (T[]) new Comparable[initialCapacity];
        list = tempList;
    }

    public void add(T newEntry) {
        ensureCapacity();
        list[numberOfEntries] = newEntry;
        numberOfEntries++;
    }

    public void add(T[] addList) {
        if (addList.length == 0)
            return;
        for (int i = 0; i < addList.length; i++) {
            add(addList[i]);
        }
    }

    public boolean add(int newPosition, T newEntry) {
        if (newPosition > numberOfEntries || newPosition < 0)
            return false;
        ensureCapacity();
        for (int i = numberOfEntries; i > newPosition; i--) {
            list[i] = list[i - 1];
        }
        list[newPosition] = newEntry;
        numberOfEntries++;
        return true;
    }

    public T remove(int givenPosition) {
        if (givenPosition >= numberOfEntries || givenPosition < 0)
            return null;
        T toReturn = list[givenPosition];
        for (int i = givenPosition; i < numberOfEntries - 1; i++) {
            list[i] = list[i + 1];
        }
        list[numberOfEntries - 1] = null;
        numberOfEntries--;
        return toReturn;
    }

    public T get(int item) {
        if (item >= numberOfEntries || item < 0)
            return null;
        return list[item];
    }

    public int getLength() {
        return numberOfEntries;
    }

    public boolean isEmpty() {
        return numberOfEntries == 0;
    }

    public T[] toArray(){
        T[] result = (T[])new Comparable[numberOfEntries];
        for(int index = 0; index < numberOfEntries; index++){
            result[index] = list[index];
        }

        return result;
    }

    private void ensureCapacity(){
        if (numberOfEntries == list.length){
            list = Arrays.copyOf(list, 2 * list.length);
        }
    }

    public boolean contains(T element) {
        for(int i = 0; i < numberOfEntries; i++) {
            if(list[i].equals(element)) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        if(isEmpty())
            return "[]";
        String toReturn = "[";
        for(int i = 0; i < numberOfEntries - 1; i++) {
            toReturn += list[i].toString() + ", ";
        }
        toReturn += list[numberOfEntries - 1].toString() + "]";

        return toReturn;
    }

    public static AList<String> fileToAList(File input) {
        Scanner s;
        try {
            s = new Scanner(input);
        } catch(Exception e) {
            System.out.println("There was an error opening the file");
            return null;
        }
        AList<StringElement> gucciStr = new AList<StringElement>();
        while(s.hasNextLine()){
            String str = s.nextLine();
            int i = str.indexOf(",");
            int number = Integer.parseInt(str.substring(0,i));
            String letter = str.substring(i+1);
            StringElement gucci = new StringElement(number, letter);
            gucciStr.add(gucci);
            }
        gucciStr.sort(true);

        AList<String> gucciStr2 = new AList<String>();

        for (int i = 0; i < gucciStr.getLength(); i++) {
            gucciStr2.add(gucciStr.get(i).toString());
        }


        return gucciStr2;

    }

    public static void main(String args[]) {
        //AList<String> mylist = new AList<String>();
        //mylist.add(new String[]{"a", "b", "c", "x", "p", "f", "g", "h"});

        //System.out.println(mylist.slice(1, 3));

        //System.out.println(mylist.slice(1, 7, 2));


        //System.out.println(fileToAList(new File("input.txt")).toString());

        //mylist.sort(false);
        //System.out.println(mylist.toString());

        //AList<Integer> newlist = new AList<Integer>();
        //newlist.add(new Integer[]{1,2,3,9,8,7});
        //boolean x = newlist.binarySearch(3);
        //boolean y = newlist.binarySearch(5);
        //System.out.println(x);
        //System.out.println(y);

        AList<Integer> first = new AList<Integer>();
        first.add(new Integer[]{1,2,3,4});
        AList<Integer> second = new AList<Integer>();
        second.add(new Integer[]{2,4,6});
        first.intersect(second);
        System.out.println(first.toString());


    }

    public boolean binarySearch(T element){
            this.sort(true);
            int half = this.getLength()/2;
            int temp = (int) this.get(half);
            int previoushalf = 0;
            int amount = this.getLength()/4;
            while (previoushalf != half) {

                if (temp < (int) element) {
                    previoushalf = half;
                    half = half + amount;
                    temp = (int) this.get(half);
                    amount = amount/2;

                }
                else if (temp > (int) element) {
                    previoushalf = half;
                    half = half - amount;
                    temp = (int) this.get(half);
                    amount = amount/2;

                }
                else if (temp == (int) element) {
                    return true;
                }

            }
            return false;
    }

    public void intersect(AList<T> other){
        int index1 = 0;
        int index2 = 0;
        this.sort(true);
        other.sort(true);
        while (index1 < this.getLength()-1 && index2 < other.getLength()-1){
            if ((int) this.get(index1) < (int) other.get(index2)) {
                this.remove(index1);
                index1 ++;

            }

            else if ((int) this.get(index1) > (int) other.get(index2)) {
                index2 ++;

            }

            else if ((int) this.get(index1) == (int) other.get(index2)) {
                index1 ++;
                index2 ++;

            }
        }
    }


}