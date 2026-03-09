package exercise06;

import java.util.Scanner;

public class Exercise06 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Digite o valor da compra: ");
        double valor = sc.nextDouble();

        if (valor >= 100) {
            double desconto = valor * 0.10;
            double valorFinal = valor - desconto;
            System.out.printf("Desconto de 10%%: R$ %.2f%n", desconto);
            System.out.printf("Valor final: R$ %.2f%n", valorFinal);
        } else {
            System.out.println("Sem desconto.");
            System.out.printf("Valor final: R$ %.2f%n", valor);
        }

        sc.close();
    }
}
