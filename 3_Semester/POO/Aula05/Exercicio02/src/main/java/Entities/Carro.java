package Entities;

public class Carro {
    public String marca;
    public String modelo;
    public double distanciaPercorrida;
    public double tempoGasto;
    public double litrosGasolina;

    public double calcularVelocidadeMedia(){
        return distanciaPercorrida / tempoGasto;
    }
    public double calcularConsumoMedio() {
        return distanciaPercorrida / litrosGasolina;
    }
    public void resumo(){
        System.out.println("Marca: " + marca);
        System.out.println("Modelo: " + modelo);
        System.out.println("Velocidade Média: " + calcularVelocidadeMedia());
        System.out.println("Consumo Médio: " + calcularConsumoMedio());
    }
}
