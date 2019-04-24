/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProyectoCompilador.Compilador.Clases;

import java.util.Arrays;
import java.util.LinkedList;

/**
 *
 * @author Danii
 */
public class Analizador {
    
    private LinkedList<String> lineas;
    private String codigo;

    public Analizador() {
        this.codigo = "";
        this.lineas = new LinkedList<>();
    }

    public Analizador(String codigo) {
        this.codigo = codigo;
        this.lineas = new LinkedList<>();
    }
    
    public void procesarCodigo(){
        for(String linea :(this.codigo.split("\n"))){
            this.lineas.add(linea);
        }
    }

    /**
     * @return the lineas
     */
    public LinkedList<String> getLineas() {
        return lineas;
    }
    
    
    
    
    
    
}
