public class GPA {
    public static void main(String args[]) {
        double credit=0;
        double temp=0;
        double GPA=0;
        double creditTotal=0;
        for (int i = 0; i < args.length; i += 2) {
            if (args[i].equals("a")) {
                  temp = 4;
            }
            else if (args[i].equals("a-")) {
                  temp = 3.667;
            }
            else if(args[i].equals("b+")) {
                  temp = 3.333;
            }
            else if(args[i].equals("b")) {
                  temp = 3;
            }
            else if(args[i].equals("b-")) {
                  temp = 2.667;
            }
            else if(args[i].equals("c+")) {
                  temp = 2.333;
            }
            else if(args[i].equals("c")) {
                  temp = 2;
            }
            else if(args[i].equals("c-")) {
                  temp = 1.667;
            }
            else if(args[i].equals("d+")) {
                  temp = 1.333;
            }
            else if(args[i].equals("d")) {
                  temp = 1;
            }
            else if(args[i].equals("f")) {
                  temp = 0;
            }
            if(args[i+1].equals("4")){
                  credit = 4;
            }
            else if(args[i+1].equals("3")){
                  credit = 3;
            }
            else if(args[i+1].equals("2")){
                  credit = 2;
            }
            else if(args[i+1].equals("1")){
                  credit = 1;
            }
            GPA+=(credit*temp);
            creditTotal+=credit;
        }
        GPA=GPA/creditTotal;
        System.out.println(GPA);
    }
}
