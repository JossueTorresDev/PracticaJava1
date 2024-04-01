
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Lab6
 */
public class Calculadora_17 {

    //Atributos (Caracteristicas)
    int num1;
    int num2;
    int suma;
    int resta;
    int Multiplicacion;
    int Division;
    //Meotodos (Acciones)
    public void sumar() {
        suma =num1 + num2;
    }

    public void restar() {
        resta =num1 - num2;
    }

    public void Multiplicacion() {
        Multiplicacion = num1 * num2;
    }

    public void Division() {
        Division = num1 / num2;

    }

    public void ingresarDatos() {
        num1 = Integer.parseInt(JOptionPane.showInputDialog("ingresar el primer numero"));
        num2 = Integer.parseInt(JOptionPane.showInputDialog("ingresar el segundo numero"));

    }

    public void mostrarDatos() {
        JOptionPane.showMessageDialog(null, "la suma es: " + suma +
                                            "\n La Resta es: "+resta);
    }
}
