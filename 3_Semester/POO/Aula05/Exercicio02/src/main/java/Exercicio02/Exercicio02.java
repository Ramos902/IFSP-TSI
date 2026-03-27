package Exercicio02;

import Entities.Carro;

public class Exercicio02 {

    public static void main(String[] args) {
        Carro c1 = new Carro();

        c1.marca = "Ford";
        c1.modelo = "Ranger";
        c1.litrosGasolina = 40;
        c1.distanciaPercorrida = 300;
        c1.tempoGasto = 1;

        c1.resumo();
    }
}
