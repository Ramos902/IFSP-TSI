package Exercicio01.Entities;

public class Aluno {
    public String nome;
    public double nota1, nota2;

    public void situacao(){
        System.out.println("Nome: " + nome);
        double media = (nota1 + nota2) / 2;
        System.out.printf("Media: %.2f\n", media);
        if(media >= 6)
            System.out.println("Situação: Aprovado");
        else
            System.out.println("Situação: Reprovado");
    } 
}
