import java.sql.SQLOutput;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

public class LinkedList<T extends Comparable<T>> implements Iterable<T> {
    private Node<T> first, last;
    private int size;

    public LinkedList() {
        first = null;
        last = null;
        size = 0;
    }

    public boolean add(T element) {
        if (element == null) return false;

        Node<T> newNode = new Node<>(element);

        if (size == 0)
            first = newNode;
        else
            last.setNext(newNode);

        last = newNode;
        size++;

        return true;
    }

    public String toString() {
        String ret = "[";
        Node<T> ptr = first;
        for (int i = 0; i < size; i++) {
            ret += ptr.getData().toString() + ", ";
            ptr = ptr.getNext();
        }

        return size == 0 ? ret + "]" : ret.substring(0, ret.length() - 2) + "]";
    }

    @Override
    public Iterator<T> iterator() {
        return new LinkedListIterator();
    }

    // TODO implement me!
    private class LinkedListIterator implements Iterator<T> {
        Node<T> ptr = first;

        @Override
        public boolean hasNext() {
            if (ptr == null) {
                return false;
            } else {
                return true;
            }

        }

        @Override
        public T next() {
            if (hasNext()) {
                T temp = ptr.getData();
                ptr = ptr.getNext();
                return temp;
            } else {
                throw new NoSuchElementException("index out of bounds friend");
            }

        }


    }

    public static int[] xify(LinkedList<Integer> x) {
        LinkedList<Integer> xCopy = x;
        int length = 0;
        Iterator newiterator = xCopy.iterator();
        while (newiterator.hasNext()) {
            length += (int) newiterator.next();
        }

        int[] extend = new int[length];
        Iterator newiterator1 = x.iterator();
        try {
            int count = 0;
            while (newiterator1.hasNext()) {
                int number = (int) newiterator1.next();
                for (int i = 0; i < number; i++) {
                    extend[count] = number;
                    count++;
                }
            }
        } catch (NoSuchElementException p) {
            p.printStackTrace();
        }
        return extend;
    }

    public static LinkedList<Integer> countingSort(LinkedList<Integer> lst) {
        int k = 0;
        LinkedList<Integer> lstCopy = lst;
        Iterator newiterator = lstCopy.iterator();
        while (newiterator.hasNext()) {
            if ((int) newiterator.next() > k) {
                k = (int) newiterator.next();
            }
        }
        int[] counts = new int[k + 1];

        Iterator newiterator1 = lst.iterator();
        while (newiterator1.hasNext()) {
            int x = (int) newiterator1.next();
            counts[x] = counts[x] + 1;

        }

        LinkedList<Integer> ret = new LinkedList<Integer>();
        for (int i = 0; i < counts.length; i++) {
            int temp = counts[i];
            while (temp > 0) {
                ret.add(i);
                temp--;
            }
        }
        return ret;

    }

    public void reverse() {
        Node<T> previous = null;
        Node<T> current = this.first;
        Node<T> next = first.getNext();

        while (next != null) {
            current.setNext(previous);
            previous = current;
            current = next;
            next = current.getNext();
        }
        current.setNext(previous);
        Node<T> temp = first;
        first = last;
        last = temp;


    }

}

   /* public void removeEvery(int n) {
        Iterator newiterator1 = this.iterator();

        Node<T> previous = this.first;
        Node<T> current = previous.getNext();
        Node<T> next = current.getNext();

        while (newiterator1.hasNext()) {

            for (int i = 1; i <= n; i++) {
                if (previous == null || current == null || next == null){
                    break;
                if (i == n){
                    //
                    //current = next;
                    //next = next.getNext();
                } else {
                    }
                    previous = current;
                    current = next;
                    next = next.getNext();
                }
            }
        }
    }

    public List<LinkedList<T>> extractGroupsOf(int n){


    }


    public static void main(String[] args){
        /*LinkedList newlist = new LinkedList();
        newlist.add("shoe");
        newlist.add("potato");
        newlist.add("GeRmAnY");
        newlist.add("bubonic plague");

        Iterator newiterator = newlist.iterator();
        try {

            System.out.println(newiterator.next());
            System.out.println(newiterator.next());
            System.out.println(newiterator.next());
            System.out.println(newiterator.next());


            LinkedList newlist2 = new LinkedList();
            newlist2.add(4);
            newlist2.add(2);
            newlist2.add(3);
            for (int i = 0; i < xify(newlist2).length; i++) {
                System.out.print(xify(newlist2)[i]);
            }
            System.out.println("");
            LinkedList newlist3 = new LinkedList();
            newlist3.add(1);
            newlist3.add(5);
            newlist3.add(7);
            newlist3.add(7);
            newlist3.add(2);
            newlist3.add(7);
            newlist3.add(5);
            System.out.println(countingSort(newlist3));

            LinkedList newlist34 = new LinkedList();
            newlist34.add(1);
            newlist34.add(2);
            newlist34.add(3);
            newlist34.add(4);
            newlist34.add(5);
            newlist34.reverse();
            System.out.println(newlist34);

        }

        catch(NoSuchElementException x){
            x.printStackTrace();
        }*/
   /*

        LinkedList newlist3 = new LinkedList();
        newlist3.add(1);
        newlist3.add(2);
        newlist3.add(3);
        newlist3.add(4);
        newlist3.add(5);
        newlist3.add(6);
        newlist3.add(7);
        newlist3.removeEvery(2);
        System.out.println(newlist3);

    }


}*/