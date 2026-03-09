package exercise09;

import java.util.Scanner;

public class Exercise09 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Digite a primeira nota: ");
        double nota1 = sc.nextDouble();

        System.out.print("Digite a segunda nota: ");
        double nota2 = sc.nextDouble();

        System.out.print("Digite a terceira nota: ");
        double nota3 = sc.nextDouble();

        double media = (nota1 + nota2 + nota3) / 3;

        System.out.printf("Média: %.2f%n", media);

        if (media >= 9) {
            System.out.println("Média: Excelente");
        } else if (media >= 7) {
            System.out.println("Média: Bom");
        } else if (media >= 6) {
            System.out.println("Média: Regular");
        } else {
            System.out.println("Média: Reprovado");
        }

        sc.close();
    }
}
