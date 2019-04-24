program main {
    var float a,b,c,d,e,g,f;
    var int h;
    var string aa;
    var char ac;
    var boolean [3;2;6] bb,cc,dd,ee;
    %Este comentario es para ver como queda hecho en java jajajajajaja%
    a << 2,5
    b << 3,0
    bb [0][0][0] << True
    aa << "Hola mundo"
    ac << 'y'
    c << 2,5 + 3,5 / 9,2
    h << 2
    call metodo ("a";5;a);
    call metodo2 ();

    if(a > b && b > c) then
        a << b
    else
        a << c
    endif

    case h of
        1 : 
            a << b 
        break
        2 : 
            b << c 
        break
        3 : 
            a << c 
        break
        default: 
            %No se utilizo ninguno% break
    endcase

    var int num;
    for (num << 0 to 100) do
        var int num2;
        for (num2 << 0 to 100 inc(2)) do
            var int num3;
            for (num3 << 10 downto 0) do
                a << b
            endfor
        endfor
    endfor

    while ( a > b ) do
        a << b
    endwhile 

    repeat
        a << b
    until ( a > b )

    h << call metodo("a";5;a);
}

int function metodo(in string nombre, in int valor, in float datos){
    var int resultado;
    resultado << 5
    return resultado
}

procedure metodo2(){
    var int resultado;
    resultado << 5
}