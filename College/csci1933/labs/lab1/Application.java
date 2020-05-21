public class Application{

  public static void main(String[] args){
    String firstname;
    String lastname;
    String fullname;

    System.out.println("Hello world!");

    int currentyear = 2018;
    int yearborn = 1999;

    firstname = "Hello";
    lastname = "World";
    fullname = "Hello World";


    int difference = currentyear - yearborn;
    difference = difference * 365;
    System.out.println(difference);

    System.out.println("My first name is -" + firstname);
    System.out.println("My last name is -" + lastname);
    System.out.println("My full name is -" + fullname);

    System.out.println(fullname + "The number of days between " + yearborn + " and " + currentyear + " is " + difference);

    BankAccount myAccount = new BankAccount("Java", "CSCI1933 rules!", 100.50);

    myAccount.setPassword("CSCI1933 rules!", "cool");

    myAccount.deposit("cool", 100.50);

    System.out.println("My account’s balance is: " + myAccount.balance);

  }

}
