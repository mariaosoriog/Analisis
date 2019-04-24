/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.util.LinkedList;

/**
 *
 * @author Danii
 */
public class GestionLenguaje {

    /**
     * Constructor sin parametrizar
     */
    public GestionLenguaje() {

    }

    /**
     * Metodo definicionDeVariables realiza la declaracion de variables en JAVA
     * a partir de los parametros que ingresan.
     *
     * @param tipo: Tipo de variable.
     * @param id: Nombre de la variable.
     * @param multivar: Nombre de las otras variables de la misma
     * caracteristica.
     * @return retorna el codigo de la variable con la sintaxis de java.
     */
    public String definicionDeVariables(String tipo, String id, String multivar) {
        StringBuilder code = new StringBuilder();
        int[] indexArray;
        if (!tipo.isEmpty() && !id.isEmpty()) {
            indexArray = checkArrayIndex(tipo);
            if (indexArray.length == 0) {
                code.append(tipo);
                code.append(" ");
                code.append(id);
                code.append(multivar);
                code.append(";\n");
            } else {
                String newType = tipo.substring(0, tipo.indexOf("["));
                code.append(newType);
                code.append(" ");
                for (int i = 0; i < indexArray.length; i++) {
                    code.append("[]");
                }
                for (String idName : (id + "" + multivar).split(",")) {

                    if (idName.equals(id)) {
                        code.append(" ");
                    } else {
                        code.append(",");
                    }

                    code.append(idName);
                    code.append("= new ");
                    code.append(newType);
                    for (int i = 0; i < indexArray.length; i++) {
                        code.append("[");
                        code.append(indexArray[i]);
                        code.append("]");
                    }

                }
                code.append(";\n");

            }

        }

        return code.toString();
    }

    /**
     * Metodo checkArrayIndex valida si el tipo de variable es un Array.
     *
     * @param tipo :Tipo de variable en Pseudocodigo a pasar a java.
     * @return array[0] si el tipo no es un vector y array[n] si el tipo de es
     * un vector de n dimensiones.
     */
    private int[] checkArrayIndex(String tipo) {
        LinkedList<Integer> indexArray = new LinkedList<>();
        int[] sizeArrays = new int[0];
        if (tipo.contains("[") || tipo.contains("]")) {
            String indices = tipo.substring(tipo.indexOf("[") + 1, tipo.length() - 1);
            for (String dato : indices.split(",")) {
                indexArray.add(Integer.parseInt(dato));
            }
            if (indexArray.size() > 0) {
                sizeArrays = new int[indexArray.size()];
                for (int i = 0; i < indexArray.size(); i++) {
                    sizeArrays[i] = indexArray.get(i);
                }
            }
        }
        return sizeArrays;
    }

    /**
     * Metodo asignacionDeVariables recibe un id, una posición, un valor y
     * retorna el respectivo codigo en java para realizar este analisis.
     *
     * @param id :Id de la variable a asignar
     * @param posArray :En caso de ser un array se debe indicar que posicion del
     * array se va a almacenar
     * @param valor :Valor a almacenar en la variable
     * @return sentencia con la sintaxis de java para realizar la respectiva
     * asignacion
     */
    public String asignacionDeVariables(String id, String posArray, String valor) {
        StringBuilder code = new StringBuilder();
        if (!id.isEmpty() && !valor.isEmpty()) {
            code.append(id);
            code.append(" ");
            code.append(posArray);
            code.append(" = ");
            code.append(valor.replace(";\n", ""));
            code.append(";\n");
        }
        return code.toString();
    }

    /**
     * Metodo llamadoMetodos genera el codigo respectivo para crear invocar un
     * metodo desde java
     *
     * @param id :identificador del metodo
     * @param parametros :parametros de entrada
     * @return el codigo en java para invocar el metodo
     */
    public String llamadoMetodos(String id, String parametros) {
        StringBuilder code = new StringBuilder();
        if (!id.equals("")) {
            code.append(id);
            code.append(" (");
            code.append(parametros);
            code.append(");\n");
        }
        return code.toString();
    }

    /**
     * Metodo mainBuilder se encarga de definir la estructura main en el
     * programa principal
     *
     * @param mainOperations :Operaciones que se realizan en la main
     * @param methods :Funciones o procedimientos que pueden interactuar en la
     * main
     * @return estructura main escrita en java, con las instrucciones que esta
     * contiene
     */
    public String mainBuilder(String mainOperations, String methods) {
        StringBuilder mainCode = new StringBuilder();
        mainCode.append("public static void main(String []args){\n");
        mainCode.append(mainOperations);
        mainCode.append("}\n");
        mainCode.append(methods);
        return mainCode.toString();
    }

    /**
     * Metodo functionBuilder se encarga de definir la estructura de la funcion
     *
     * @param tipo :Tipo de retorno de la funcion
     * @param nombre :Identificador de la funcion
     * @param parametros :Parametros para la funcion
     * @param operations :Operaciones en la funcion
     * @param returnInfo :dato o variable a retornar
     * @return retorna la estructura de codigo en java
     */
    public String functionBuilder(String tipo, String nombre, String parametros, String operations, String returnInfo) {
        StringBuilder code = new StringBuilder();
        if (!tipo.isEmpty() && !nombre.isEmpty() && !returnInfo.isEmpty()) {
            code.append("public static ");
            code.append(tipo);
            code.append(" ");
            code.append(nombre);
            code.append(" (");
            code.append(parametros);
            code.append("){\n");
            code.append(operations);
            code.append("return ");
            code.append(returnInfo);
            code.append(";\n}\n");
        }
        return code.toString();
    }

    /**
     * Metodo procedureBuilder se encarga de definir la estructura de un
     * procedimiento
     *
     * @param nombre :Identificador de la funcion
     * @param parametros :Parametros para la funcion
     * @param operations :Operaciones en la funcion
     * @return retorna la estructura de codigo en java
     */
    public String procedureBuilder(String nombre, String parametros, String operations) {
        StringBuilder code = new StringBuilder();
        if (!nombre.isEmpty()) {
            code.append("public static void ");
            code.append(nombre);
            code.append(" (");
            code.append(parametros.replace("[6]","[]"));
            code.append("){\n");
            code.append(operations);
            code.append("}\n");
        }
        return code.toString();
    }

    /**
     * Metodo ifProccess se encarga de recibir los parametros necesarios para
     * construir una estructura condicional if else
     *
     * @param condicion :condicion a evaluar
     * @param operations :operaciones si la condicion es verdadera
     * @param elseOperation :operaciones si la condicion es falsa
     * @return estructura de tipo if en sintaxis de java
     */
    public String ifProccess(String condicion, String operations, String elseOperation) {
        StringBuilder code = new StringBuilder();
        if (!condicion.isEmpty()) {
            code.append("if(");
            code.append(condicion);
            code.append("){\n");
            code.append(operations);
            if (!elseOperation.isEmpty()) {
                code.append("}else{\n");
                code.append(elseOperation);
            }
            code.append("}");
        }
        return code.toString();
    }

    /**
     * Metodo casesProccess se encarga de procesar una sentencia Switch y
     * pasarla a la sintaxis de java
     *
     * @param idVariable: variable a evaluar en el sw
     * @param cases: casos a evaluar en el sw
     * @return estructura tipo sw pero en la sintaxis de java
     */
    public String casesProccess(String idVariable, String cases) {
        StringBuilder code = new StringBuilder();
        if (!idVariable.isEmpty() && !cases.isEmpty()) {
            code.append("switch(");
            code.append(idVariable);
            code.append("){\n");
            code.append(cases);
            code.append("}\n");
        }
        return code.toString();
    }

    /**
     * Metodo caseProccess se encarga de realizar la traduccion del case a java
     *
     * @param dato: dato evaluado
     * @param progOperations: procesos a realizar
     * @return retorna un case en formato de java
     */
    public String caseProccess(String dato, String progOperations) {
        StringBuilder code = new StringBuilder();
        if (!dato.isEmpty()) {
            code.append("case ");
            code.append(dato);
            code.append(":\n");
            code.append(progOperations);
            code.append("break;\n");
        }
        return code.toString();
    }

    /**
     * Metodo defaultProccess se encarga de realizar la traduccion del case
     * default a java
     *
     * @param progOperations: procesos a realizar
     * @return retorna un case default en formato de java
     */
    public String defaultProccess(String progOperations) {
        StringBuilder code = new StringBuilder();
        if (!progOperations.isEmpty()) {
            code.append("default:\n");
            code.append(progOperations);
        }
        return code.toString();
    }

    /**
     * Metodo forProccess
     * @param parametros
     * @param operations
     * @return 
     */
    public String forProccess(String parametros, String operations){
        StringBuilder code = new StringBuilder();
        if(!parametros.isEmpty() && !operations.isEmpty()){
            code.append("for(");
            code.append(parametros);
            code.append("){\n");
            code.append(operations);
            code.append("}\n");            
        }
        return code.toString();
    }
    
    /**
     * Metodo forParameterProccess
     * @param asignacion
     * @param limite
     * @param incremento
     * @return 
     */
    public String forParameterProccess(String asignacion, String limite, String incremento){
        StringBuilder code = new StringBuilder();
        if(!asignacion.isEmpty() && !limite.isEmpty()){
            code.append(asignacion.replace("\n", ""));
            String id = asignacion.substring(0, asignacion.indexOf(" "));
            code.append(id);
            code.append(" < ");
            code.append(limite);
            code.append("; ");
            code.append(id);
            if(incremento.isEmpty()){
                code.append("++");
            }else{
                code.append("+=");
                code.append(incremento);
            }
        }
        return code.toString();
    }
    
    /**
     * Metodo forParameterProccess para DOWN TO
     * @param asignacion
     * @param limite
     * @return 
     */
    public String forParameterProccess(String asignacion, String limite){
        StringBuilder code = new StringBuilder();
        if(!asignacion.isEmpty() && !limite.isEmpty()){
            code.append(asignacion.replace("\n", ""));
            String id = asignacion.substring(0, asignacion.indexOf(" "));
            code.append(id);
            code.append(" > ");
            code.append(limite);
            code.append("; ");
            code.append(id);
            code.append("--");
        }
        return code.toString();
    }
    
   /**
    * Metodo whileProccess
    * @param condicion
    * @param operations
    * @return 
    */
    public String whileProccess(String condicion, String operations){
        StringBuilder code = new StringBuilder();
        if(!condicion.isEmpty() && !operations.isEmpty()){
            code.append("while(");
            code.append(condicion);
            code.append("){\n");
            code.append(operations);
            code.append("}\n");
        }
        return code.toString();
    }
    
    /**
     * Metodo repetProccess
     * @param condicion
     * @param operations
     * @return 
     */
    public String repetProccess(String condicion, String operations){
        StringBuilder code = new StringBuilder();
        if(!condicion.isEmpty() && !operations.isEmpty()){
            code.append("do{\n");
            code.append(operations);
            code.append("}while(");
            code.append(condicion);
            code.append(");\n");
        }
        return code.toString();
    }
    
    private String prepararClase(String code){
        StringBuilder cod = new StringBuilder();
        cod.append("public class Code{\n");
        cod.append(code);
        cod.append("}");
        
        return cod.toString();
    }
    public void analizarCodigo(String codigo){
        Controlador.escribirArchivoCodigo("","",prepararClase(codigo));
    }
    
    

}
