package exercise04;

import java.util.Scanner;

public class Exercise04 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Digite a base: ");
        double base = sc.nextDouble();

        System.out.print("Digite a altura: ");
        double altura = sc.nextDouble();

        double area = base * altura;
        double perimetro = 2 * (base + altura);

        System.out.printf("Área: %.2f%n", area);
        System.out.printf("Perímetro: %.2f%n", perimetro);

        sc.close();
    }
}
