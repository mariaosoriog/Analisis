program main { 
    var int [6;1] w;

    w[0] << 5
    w[1] << 10
    w[2] << 12
    w[3] << 13
    w[4] << 15
    w[5] << 18
    
    call sumas(w);
}

procedure sumas( in int[6;1] x ){
    
    var int num;
    for (num << 0 to 6) do
        x[num] << 1
    endfor
}