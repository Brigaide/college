public class Rational {
    public int num = 0;
    public int denom = 0;

    public Rational(int a, int b) {
        num = a;
        denom = b;
    }
    public void setnum (int value) {
        num = value;
    }

    public void setdenom(int value) {
        denom = value;
    }

    public int getnum() {
        return num;
    }

    public int getdenom() {
        return denom;
    }


    public void addRational(Rational r){
        num = (num*r.getdenom())+(r.getnum()*denom);
        denom = denom*r.getdenom();

    }
    public void subRational(Rational r){
        num = (num*r.getdenom())-(r.getnum()*denom);
        denom = denom*r.getdenom();
    }
    public void mulRational(Rational r){
        num = num*r.getnum();
        denom = denom*r.getdenom();
    }
    public void divRational(Rational r){
        num = num*r.getdenom();
        denom = denom*r.getnum();
    }

    public static void main(String[] args){
        Rational myRational1 = new Rational(3, 4);
        Rational myRational2 = new Rational(7, 9);
        myRational1.addRational(myRational2);
        System.out.println(myRational1.num+"/"+myRational1.denom);

        Rational myRational3 = new Rational(3, 4);
        Rational myRational4 = new Rational(7, 9);
        myRational3.subRational(myRational4);
        System.out.println(myRational3.num+"/"+myRational3.denom);

        Rational myRational5 = new Rational(3, 4);
        Rational myRational6 = new Rational(7, 9);
        myRational5.mulRational(myRational6);
        System.out.println(myRational5.num+"/"+myRational5.denom);

        Rational myRational7 = new Rational(3, 4);
        Rational myRational8 = new Rational(7, 9);
        myRational7.divRational(myRational8);
        System.out.println(myRational7.num+"/"+myRational7.denom);
    }


}
