package exercise07;

import java.util.Scanner;

public class Exercise07 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Digite sua idade: ");
        int idade = sc.nextInt();

        if (idade >= 16) {
            System.out.println("Pode votar.");
        } else {
            System.out.println("Não pode votar.");
        }

        sc.close();
    }
}
