package exercise01;

import java.util.Scanner;

public class Exercise01 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Insira o primeiro número: ");
        int a = sc.nextInt();

        System.out.print("Insira o segundo número: ");
        int b = sc.nextInt();

        System.out.println("Soma: " + (a + b));
        System.out.println("Subtração: " + (a - b));
        System.out.println("Multiplicação: " + (a * b));
        System.out.printf("Divisão: %.2f%n", (double) a / b);

        sc.close();
    }
}
