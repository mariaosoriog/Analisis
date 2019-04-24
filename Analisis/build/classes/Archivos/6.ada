program main {
    if(a > b && b > c) then
        a << b
        if(a > b && b > c) then
            a << c
            if(a > b && b > c) then
                a << b
                if(a > b && b > c) then
                    a << b
                else
                    a << c
                endif
            endif
        else
            a << c
        endif
    else
        a << c
    endif
 }