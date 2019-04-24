/*------------  1ra Area: Codigo de Usuario ---------*/
//------> Paquetes,importaciones
package ProyectoCompilador.Compilador.Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

/*------------  2da Area: Opciones y Declaraciones ---------*/
%%
%{
    //----> Codigo de usuario en sintaxis java
    public static LinkedList<TError> TablaEL = new LinkedList<TError>();
    public static LinkedList<Symbol> TablaSy = new LinkedList<Symbol>(); 
%}

//-------> Directivas
%public 
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//------> Expresiones Regulares
numero = [0-9]+
char = '[a-zA-Z]'|'[0-9]'
string = \"([a-zA-Z]|[0-9]|\s)+ \"
id = [A-Za-z][A-Za-z0-9]*
bool = True|False
numberfloat = ([0-9]+,[0-9]+)
comentario = %(.)*%
//------> Estados

%%
/*------------  3raa Area: Reglas Lexicas ---------*/
//-----> Palabras reservadas
<YYINITIAL> "program"               { /* System.out.println("Reconocio "+yytext()+" program"); */  return new Symbol(Simbolos.tprogram, yycolumn, yyline, yytext()); }
<YYINITIAL> "main"                  { /* System.out.println("Reconocio "+yytext()+" principal"); */  return new Symbol(Simbolos.tprincipal, yycolumn, yyline, yytext()); }
<YYINITIAL> "var"                   { /* System.out.println("Reconocio "+yytext()+" var"); */  return new Symbol(Simbolos.tvar, yycolumn, yyline, yytext()); }
<YYINITIAL> "boolean"               { /* System.out.println("Reconocio "+yytext()+" ty boolean"); */  return new Symbol(Simbolos.tboolean, yycolumn, yyline, yytext()); }
<YYINITIAL> "int"                   { /* System.out.println("Reconocio "+yytext()+" ty int"); */  return new Symbol(Simbolos.tint, yycolumn, yyline, yytext()); }
<YYINITIAL> "float"                 { /* System.out.println("Reconocio "+yytext()+" ty float"); */  return new Symbol(Simbolos.tfloat, yycolumn, yyline, yytext()); }
<YYINITIAL> "char"                  { /* System.out.println("Reconocio "+yytext()+" ty char"); */  return new Symbol(Simbolos.tchar, yycolumn, yyline, yytext()); }
<YYINITIAL> "string"                { /* System.out.println("Reconocio "+yytext()+" ty string"); */  return new Symbol(Simbolos.tstring, yycolumn, yyline, yytext()); }
<YYINITIAL> "if"                    { /* System.out.println("Reconocio "+yytext()+" t if"); */  return new Symbol(Simbolos.tif, yycolumn, yyline, yytext()); }
<YYINITIAL> "then"                  { /* System.out.println("Reconocio "+yytext()+" t then"); */  return new Symbol(Simbolos.tthen, yycolumn, yyline, yytext()); }
<YYINITIAL> "else"                  { /* System.out.println("Reconocio "+yytext()+" t else"); */  return new Symbol(Simbolos.telse, yycolumn, yyline, yytext()); }
<YYINITIAL> "endif"                 { /* System.out.println("Reconocio "+yytext()+" t endif"); */  return new Symbol(Simbolos.tendif, yycolumn, yyline, yytext()); }
<YYINITIAL> "case"                  { /* System.out.println("Reconocio "+yytext()+" t case"); */  return new Symbol(Simbolos.tcase, yycolumn, yyline, yytext()); }
<YYINITIAL> "of"                    { /* System.out.println("Reconocio "+yytext()+" t of"); */  return new Symbol(Simbolos.tof, yycolumn, yyline, yytext()); }
<YYINITIAL> "endcase"               { /* System.out.println("Reconocio "+yytext()+" t endcase"); */  return new Symbol(Simbolos.tendcase, yycolumn, yyline, yytext()); }
<YYINITIAL> "default"               { /* System.out.println("Reconocio "+yytext()+" t default"); */  return new Symbol(Simbolos.tdefault, yycolumn, yyline, yytext()); }
<YYINITIAL> "not"                   { /* System.out.println("Reconocio "+yytext()+" t not"); */  return new Symbol(Simbolos.tnot, yycolumn, yyline, yytext()); }
<YYINITIAL> "break"                 { /* System.out.println("Reconocio "+yytext()+" t break"); */  return new Symbol(Simbolos.tbreak, yycolumn, yyline, yytext()); }
<YYINITIAL> "for"                   { /* System.out.println("Reconocio "+yytext()+" t for"); */  return new Symbol(Simbolos.tfor, yycolumn, yyline, yytext()); }
<YYINITIAL> "do"                    { /* System.out.println("Reconocio "+yytext()+" t do"); */  return new Symbol(Simbolos.tdo, yycolumn, yyline, yytext()); }
<YYINITIAL> "endfor"                { /* System.out.println("Reconocio "+yytext()+" t endfor"); */  return new Symbol(Simbolos.tendfor, yycolumn, yyline, yytext()); }
<YYINITIAL> "to"                    { /* System.out.println("Reconocio "+yytext()+" t to"); */  return new Symbol(Simbolos.tto, yycolumn, yyline, yytext()); }
<YYINITIAL> "downto"                { /* System.out.println("Reconocio "+yytext()+" t downto"); */  return new Symbol(Simbolos.tdownto, yycolumn, yyline, yytext()); }
<YYINITIAL> "inc"                   { /* System.out.println("Reconocio "+yytext()+" t inc"); */  return new Symbol(Simbolos.tinc, yycolumn, yyline, yytext()); }
<YYINITIAL> "while"                 { /* System.out.println("Reconocio "+yytext()+" t while"); */  return new Symbol(Simbolos.twhile, yycolumn, yyline, yytext()); }
<YYINITIAL> "endwhile"              { /* System.out.println("Reconocio "+yytext()+" t endwhile"); */  return new Symbol(Simbolos.tendwhile, yycolumn, yyline, yytext()); }
<YYINITIAL> "repeat"                { /* System.out.println("Reconocio "+yytext()+" t repeat"); */  return new Symbol(Simbolos.trepeat, yycolumn, yyline, yytext()); }
<YYINITIAL> "until"                 { /* System.out.println("Reconocio "+yytext()+" t until"); */  return new Symbol(Simbolos.tuntil, yycolumn, yyline, yytext()); }
<YYINITIAL> "function"              { /* System.out.println("Reconocio "+yytext()+" t function"); */  return new Symbol(Simbolos.tfunction, yycolumn, yyline, yytext()); }
<YYINITIAL> "return"                { /* System.out.println("Reconocio "+yytext()+" t return"); */  return new Symbol(Simbolos.treturn, yycolumn, yyline, yytext()); }
<YYINITIAL> "in"                    { /* System.out.println("Reconocio "+yytext()+" t in"); */  return new Symbol(Simbolos.tentrada, yycolumn, yyline, yytext()); }
<YYINITIAL> "out"                   { /* System.out.println("Reconocio "+yytext()+" t out"); */  return new Symbol(Simbolos.tsalida, yycolumn, yyline, yytext()); }
<YYINITIAL> "inout"                 { /* System.out.println("Reconocio "+yytext()+" t inout"); */  return new Symbol(Simbolos.tentradasalida, yycolumn, yyline, yytext()); }
<YYINITIAL> "procedure"             { /* System.out.println("Reconocio "+yytext()+" t procedure"); */  return new Symbol(Simbolos.tprocedure, yycolumn, yyline, yytext()); }
<YYINITIAL> "call"                  { /* System.out.println("Reconocio "+yytext()+" t call"); */  return new Symbol(Simbolos.tcall, yycolumn, yyline, yytext()); }



//-----> Simbolos
<YYINITIAL> "+"             { /* System.out.println("Reconocio "+yytext()+" mas"); */  return new Symbol(Simbolos.tsuma, yycolumn, yyline, yytext()); }
<YYINITIAL> "-"             { /* System.out.println("Reconocio "+yytext()+" menos"); */  return new Symbol(Simbolos.tresta, yycolumn, yyline, yytext()); }
<YYINITIAL> "*"             { /* System.out.println("Reconocio "+yytext()+" por"); */  return new Symbol(Simbolos.tmultiplicar, yycolumn, yyline, yytext()); }
<YYINITIAL> "/"             { /* System.out.println("Reconocio "+yytext()+" div"); */  return new Symbol(Simbolos.tdivision, yycolumn, yyline, yytext()); }
<YYINITIAL> "{"             { /* System.out.println("Reconocio "+yytext()+" llava"); */  return new Symbol(Simbolos.tllabre, yycolumn, yyline, yytext()); }
<YYINITIAL> "}"             { /* System.out.println("Reconocio "+yytext()+" llavc"); */  return new Symbol(Simbolos.tllcierra, yycolumn, yyline, yytext()); }
<YYINITIAL> "<<"            { /* System.out.println("Reconocio "+yytext()+" asign"); */  return new Symbol(Simbolos.tasignar, yycolumn, yyline, yytext()); }
<YYINITIAL> "<"             { /* System.out.println("Reconocio "+yytext()+" men q"); */  return new Symbol(Simbolos.tmenorque, yycolumn, yyline, yytext()); }
<YYINITIAL> "<="            { /* System.out.println("Reconocio "+yytext()+" men igu"); */  return new Symbol(Simbolos.tmenorigual, yycolumn, yyline, yytext()); }
<YYINITIAL> ">"             { /* System.out.println("Reconocio "+yytext()+" may q"); */  return new Symbol(Simbolos.tmayorque, yycolumn, yyline, yytext()); }
<YYINITIAL> ">="            { /* System.out.println("Reconocio "+yytext()+" may igu"); */  return new Symbol(Simbolos.tmayorigual, yycolumn, yyline, yytext()); }
<YYINITIAL> "<>"            { /* System.out.println("Reconocio "+yytext()+" difernt"); */  return new Symbol(Simbolos.tdiferente, yycolumn, yyline, yytext()); }
<YYINITIAL> "=="            { /* System.out.println("Reconocio "+yytext()+" igual"); */  return new Symbol(Simbolos.tigual, yycolumn, yyline, yytext()); }
<YYINITIAL> ","             { /* System.out.println("Reconocio "+yytext()+" coma"); */  return new Symbol(Simbolos.tcoma, yycolumn, yyline, yytext()); }
<YYINITIAL> "["             { /* System.out.println("Reconocio "+yytext()+" coabre"); */  return new Symbol(Simbolos.tcoabre, yycolumn, yyline, yytext()); }
<YYINITIAL> "]"             { /* System.out.println("Reconocio "+yytext()+" cocierra"); */  return new Symbol(Simbolos.tcocierra, yycolumn, yyline, yytext()); }
<YYINITIAL> ";"             { /* System.out.println("Reconocio "+yytext()+" pcoma"); */  return new Symbol(Simbolos.tpcoma, yycolumn, yyline, yytext()); }
<YYINITIAL> "("             { /* System.out.println("Reconocio "+yytext()+" pabre"); */  return new Symbol(Simbolos.tpabre, yycolumn, yyline, yytext()); }
<YYINITIAL> ")"             { /* System.out.println("Reconocio "+yytext()+" pcierra"); */  return new Symbol(Simbolos.tpcierra, yycolumn, yyline, yytext()); }
<YYINITIAL> ":"             { /* System.out.println("Reconocio "+yytext()+" dpuntos"); */  return new Symbol(Simbolos.tdpuntos, yycolumn, yyline, yytext()); }
<YYINITIAL> "&&"            { /* System.out.println("Reconocio "+yytext()+" and"); */  return new Symbol(Simbolos.tand, yycolumn, yyline, yytext()); }
<YYINITIAL> "||"            { /* System.out.println("Reconocio "+yytext()+" or"); */  return new Symbol(Simbolos.tor, yycolumn, yyline, yytext()); }


//-------> Simbolos ER
<YYINITIAL> {numero}            { /* System.out.println("Reconocio "+yytext()+" num"); */  return new Symbol(Simbolos.tdnumber, yycolumn, yyline, yytext()); }
<YYINITIAL> {numberfloat}       { /* System.out.println("Reconocio "+yytext()+" numFloat"); */  return new Symbol(Simbolos.tdnumberfloat, yycolumn, yyline, yytext()); }
<YYINITIAL> {char}              { /* System.out.println("Reconocio "+yytext()+" char"); */  return new Symbol(Simbolos.tdchar, yycolumn, yyline, yytext()); }
<YYINITIAL> {string}            { /* System.out.println("Reconocio "+yytext()+" string"); */  return new Symbol(Simbolos.tdstring, yycolumn, yyline, yytext()); }
<YYINITIAL> {bool}              { /* System.out.println("Reconocio "+yytext()+" boolean"); */  return new Symbol(Simbolos.tdboolean, yycolumn, yyline, yytext()); }
<YYINITIAL> {comentario}        { /* System.out.println("Reconocio "+yytext()+" comment"); */  return new Symbol(Simbolos.tdcomentario, yycolumn, yyline, yytext()); }
<YYINITIAL> {id}                { /* System.out.println("Reconocio "+yytext()+" id"); */ return new Symbol(Simbolos.tid, yycolumn, yyline, yytext()); }
//------> Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}

//------> Errores Lexicos
.                       { System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          TablaEL.add(datos);}