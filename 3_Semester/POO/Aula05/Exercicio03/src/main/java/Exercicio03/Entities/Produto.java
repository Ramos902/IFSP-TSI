package Exercicio03.Entities;
public class Produto {
    String nome;
    double preco;
    int quantidade;
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public double getPreco() {
        return preco;
    }
    public void setPreco(double preco) {
        this.preco = preco;
    }
    public int getQuantidade() {
        return quantidade;
    }
    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    public void mostrarProduto(){
        System.out.println("Produto: "+ nome 
                            + "\nPreco: " + preco 
                            + "\nQuantidade: " + quantidade);
    }
}
