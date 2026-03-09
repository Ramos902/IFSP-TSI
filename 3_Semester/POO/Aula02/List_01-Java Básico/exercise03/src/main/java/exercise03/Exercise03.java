package exercise03;

import java.util.Scanner;

public class Exercise03 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Digite a temperatura em Celsius: ");
        double celsius = sc.nextDouble();

        double fahrenheit = (celsius * 9.0 / 5) + 32;

        System.out.printf("Temperatura em Fahrenheit: %.2f%n", fahrenheit);

        sc.close();
    }
}
