package Clases;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Danii
 */
public class Archivos {

    public static String leerArchivo(String ruta) {
        StringBuilder datos = new StringBuilder();
        try {
            BufferedReader bf = new BufferedReader(new FileReader(ruta));
            String linea;
            while ((linea = bf.readLine()) != null) {
                datos.append(linea);
                datos.append("\n");
            }

        } catch (FileNotFoundException e) {
        } catch (IOException ex) {
            Logger.getLogger(Archivos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos.toString();
    }

    public static void escribirArchivo(String datos) {
        FileWriter fichero = null;
        PrintWriter pw = null;
        try {
            fichero = new FileWriter("D:/Code.java");
            pw = new PrintWriter(fichero);

            for (String linea : datos.split("\n")) {
                pw.println(linea);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Nuevamente aprovechamos el finally para 
                // asegurarnos que se cierra el fichero.
                if (null != fichero) {
                    fichero.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }

}
