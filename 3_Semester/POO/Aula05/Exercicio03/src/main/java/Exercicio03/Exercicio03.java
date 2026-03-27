
package Exercicio03;

import Exercicio03.Entities.Produto;


public class Exercicio03 {

    public static void main(String[] args) {
        Produto p = new Produto();
        p.setNome("Geladeira");
        p.setPreco(4300);
        p.setQuantidade(2);

        p.mostrarProduto();
    }
}
