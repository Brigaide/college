
public class StringElement implements Comparable<StringElement> {
    private String s;
    private int number;

    public String toString() {
        return this.s;
    }

    public StringElement(int x, String y){
        this.number = x;
        this.s = y;
    }

    public int compareTo(StringElement other){
        if (this.number > other.number){
            return 1;
        }
        else if (this.number == other.number){
            return 0;
        }
        else{
            return -1;
        }
    }

}