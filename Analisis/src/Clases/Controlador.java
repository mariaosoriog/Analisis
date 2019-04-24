package Clases;


import Clases.Archivos;
import ventanas.Inicio;
import ventanas.Juego;
import ventanas.Seguimiento;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Danii
 */
public class Controlador {
    
    public static void main(String[] args) {
        visualizarInicio();
    }
    
    public static void visualizarInicio(){
        new Inicio().setVisible(true);
    }
    
    public static void visualizarSeguimiento(){
        new Seguimiento().setVisible(true);
    }
    
    public static void visualizarJuego(){
        new Juego().setVisible(true);
    }
    
    public static String cargarCodigoArchivo(String ruta){
        String codigo = Archivos.leerArchivo(ruta);
        return codigo;
    }
    
    public static void escribirArchivoCodigo(String ruta, String nombre, String codigo){
        Archivos.escribirArchivo(codigo);
    }
}
