public class Complex3 {

    private double realPart = 0;
    private double imaginaryPart = 0;

    public Complex3(double a, double b) {
        realPart = a;
        imaginaryPart = b;
    }

    // accessor methods

    public void setRealPart(double value) {
        realPart = value;
    }

    public void setImaginaryPart(double value) {
        imaginaryPart = value;
    }

    public double getRealPart() {
        return realPart;
    }

    public double getImaginaryPart() {
        return imaginaryPart;
    }

    // operators

    public void addComplex(Complex3 c) {
        realPart = realPart + c.getRealPart();
        imaginaryPart = imaginaryPart + c.getImaginaryPart();
    }

    public void subtractComplex(Complex3 c) {
        realPart = realPart - c.getRealPart();
        imaginaryPart = imaginaryPart - c.getImaginaryPart();
    }

    public static void main(String[] args){
        Complex3 myComplex1 = new Complex3(3, 4);
        Complex3 myComplex2 = new Complex3(2, 5);

        Complex3 myComplex3 = new Complex3(5, 8);
        Complex3 myComplex4 = new Complex3(6, 9);


        myComplex1.addComplex(myComplex2);
        System.out.println(myComplex1.realPart + " + " + myComplex1.imaginaryPart + "i");
        double actualreal1 = myComplex1.realPart;
        double actualimag1 = myComplex1.imaginaryPart;
        myComplex1.subtractComplex(myComplex2);
        myComplex1.subtractComplex(myComplex2);
        System.out.println(myComplex1.realPart + " + " + myComplex1.imaginaryPart + "i");
        double actualreal2 = myComplex1.realPart;
        double actualimag2 = myComplex1.imaginaryPart;

        myComplex3.addComplex(myComplex4);
        System.out.println(myComplex3.realPart + " + " + myComplex3.imaginaryPart + "i");
        double actualreal3 = myComplex3.realPart;
        double actualimag3 = myComplex3.imaginaryPart;
        myComplex3.subtractComplex(myComplex4);
        myComplex3.subtractComplex(myComplex4);
        System.out.println(myComplex3.realPart + " + " + myComplex3.imaginaryPart + "i");
        double actualreal4 = myComplex3.realPart;
        double actualimag4 = myComplex3.imaginaryPart;

        double expectedreal1 = 5;
        double expectedreal2 = 1;
        double expectedreal3 = 11;
        double expectedreal4 = -1;

        double expectedimag1 = 9;
        double expectedimag2 = -1;
        double expectedimag3 = 17;
        double expectedimag4 = -1;

        boolean result1 = expectedreal1 == actualreal1 && expectedimag1 == actualimag1;
        boolean result2 = expectedreal2 == actualreal2 && expectedimag2 == actualimag2;
        boolean result3 = (expectedreal3 == actualreal3) && (expectedimag3 == actualimag3);
        boolean result4 = expectedreal4 == actualreal4 && expectedimag4 == actualimag4;

        System.out.println("Testadd1: " + result1);
        System.out.println("Testsub1: " + result2);
        System.out.println("Testadd2: " + result3);
        System.out.println("Testsub2: " + result4);



    }

} // Complex3 class
