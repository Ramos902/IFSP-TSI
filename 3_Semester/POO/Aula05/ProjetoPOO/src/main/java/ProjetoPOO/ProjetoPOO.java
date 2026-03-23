package ProjetoPOO;

import ProjetoPOO.Entities.MyClass;
import java.util.Scanner;

public class ProjetoPOO {

    public static void main(String[] args) {
        MyClass mycalc = new MyClass();
        Scanner sc = new Scanner(System.in);

        System.out.println("Num1: ");
        double num1 = sc.nextDouble(); 
        System.out.println("Num2: ");
        double num2 = sc.nextDouble();

        System.out.println(mycalc.Sum(num1, num2));
        System.out.println(mycalc.Sub(num1, num2));
        System.out.println(mycalc.Mult(num1, num2));
        System.out.println(mycalc.Div(num1, num2));
    
    }

}
