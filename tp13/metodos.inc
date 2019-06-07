#macro criaPe(tamanho, textura)
    union{
        union{
            sphere {
                <0, 0, 0>, tamanho
            }
            // cylinder {
            //     <0, tamanho, 0>, <0, tamanho+10, 0>, tamanho
            // }
        texture{textura}
        }
        object{criaMaoDragao(tamanho, textura)}
    }
#end

#macro criaCanela(tamanho, textura, angulo1)
    union{
        union{
            sphere {
                <0, 0, 0>, tamanho
            } 
            cylinder {
                <0, tamanho, 0>, <0, tamanho+10, 0>, tamanho
            }
            texture{textura}
        }
        object{
            criaPe(tamanho, textura)
            rotate angulo1 //<0, 0, angulo1> // <x°, y°, z°>
            translate <0, (tamanho+10)+(tamanho), 0> // <x, y, z>
        }
    }
#end

#macro criaPerna(tamanho, textura, angulo1, angulo2)
    union{
        union{
            sphere {
                <0, 0, 0>, tamanho
            }
            cylinder {
                <0, tamanho, 0>, <0, tamanho+10, 0>, tamanho
            }
            texture{textura}
        }
        object{
            criaCanela(tamanho, textura, angulo1)
            rotate angulo2 //<0, 0, angulo2> // <x°, y°, z°>
            translate <0, (tamanho+10)+(tamanho), 0> // <x, y, z>
        }
    }
#end

#declare tamanhoDedo = 5;
#declare tamanhoUnha = 2;
#declare tamanhoArtDedo = 1;
#declare grossuraDedo = 1;
#declare grossuraArtDedo = 1;

#macro criaDedoDragao(tamanho, textura)
    union{
        sphere {
            <0, 0, 0>, grossuraArtDedo // <x, y, z>, radius
        }
        cylinder {
            <0, tamanhoArtDedo, 0>, <0, tamanhoArtDedo + tamanhoDedo, 0>, grossuraDedo // center of one end, center of other end, radius
        }
        sphere {
            <0, tamanhoArtDedo*2 + tamanhoDedo, 0>, grossuraArtDedo // <x, y, z>, radius
        }
        cone {
            <0, tamanhoArtDedo*2 + tamanhoDedo, 0>, 1.0 // <x, y, z>, center & radius of one end
            <0, tamanhoArtDedo*2 + tamanhoDedo + tamanhoUnha, 0>, 0.25 // <x, y, z>, center & radius of the other end
        }
        rotate <0, 45, 180> // <x°, y°, z°>
    }
#end

#macro criaMaoDragao(tamanho, textura)
    union{
    union{
        sphere {
            <0, 0, 0>, tamanho
        }
        // cylinder {
        //     <0, tamanho, 0>, <0, tamanho+10, 0>, 1
        //     rotate <0, 0, -45> // <x°, y°, z°>
        // }
        // cylinder {
        //     <0, tamanho, 0>, <0, tamanho+10, 0>, 1
        //     rotate <120, -45, 0> // <x°, y°, z°>
        // }
        // cylinder {
        //     <0, tamanho, 0>, <0, tamanho+10, 0>, 1
        //     rotate <0, -45, 0> // <x°, y°, z°>
        // }
        texture{textura}
    }
    object{criaDedoDragao(tamanho,textura)
        rotate <0, 0, -45> // <x°, y°, z°>
        }
    object{criaDedoDragao(tamanho,textura)
        rotate <120, -45, 0> // <x°, y°, z°>
        }
    object{criaDedoDragao(tamanho,textura)
        rotate <0, -45, 0> // <x°, y°, z°>
        }
    }
    texture{textura}

#end

#macro criaCorpoProvisorio(textura, tamanho)
    box {
        <0, 0, 0>, <4, 10, 4> // <x, y, z> near lower left corner, <x, y, z> far upper right corner
    }
#end

#macro interp1(P1, P2, T1, T2, T)
   (P1+(T1+T/(T2-T1))*(P2-P1))
#end

#macro interp3(A0, A1, A2, A3, T0, T3, TT)
    #local A01 = interp1(A0, A1, T0, T3, TT);
    #local A12 = interp1(A1, A2, T0, T3, TT);
    #local A23 = interp1(A2, A3, T0, T3, TT);

    #local A012 = interp1(A01, A12, T0, T3, TT);
    #local A123 = interp1(A12, A23, T0, T3, TT);

    #local A0123 = interp1(A012, A123, T0, T3, TT);
    A0123
#end

#macro interpola_quadros1(Q, k0, k1, c0, c1, cc, A, NP, NA)
    #declare i = 0;
    #while(i < NP)
        #declare k = 0;
        #while(k < NA)
            // #debug
            #declare A[i][k] = interp1(Q[k0][i][k], Q[k1][i][k], c0, c1, cc);
            #declare k = k + 1;
        #end
        #declare i = i + 1;
    #end
#end



// #macro interpola_quadros(NP, NA, Q, k0,t0, k1, t1, tt, A)

// #end

#macro busca_tempo(clk, m, tk)
    #local ikk = 0;
    #local i = 0;
    #while(ikk = 0)
        #if(tk[i] <= clk & clk <= tk[i+1])
          #local ikk = 1;
        #else
          #local i = i + 1;
        #end
    #end
    ikk
#end

#macro nohTX(P, N, M, TX)
  #declare i = 0; 
  #while(i < N)
      curvarTXANTIGO(M, P, i, TX)
      #declare i = i + 1;
  #end
#end

#macro suavizar(P, N, k, i)
    #local j = mod(i+1, N);
    #local vv = (P[k][j][1] - P[k][i][2])/2;
    #declare P[k][i][2] = P[k][i][3] - vv;
    #declare P[k][j][1] = P[k][j][0] + vv;
#end

#macro curvarTX(n, vetor, k, i, TX)
    union{
        #declare j = 0;
        #declare p = 1/n;
        //#declare l = n;
        #while(j < n)
            object{ TX translate interp3(vetor[k][i][0], vetor[k][i][1], vetor[k][i][2], vetor[k][i][3], 0, n, j)  }
            #declare j = j + p;
        #end
    }
#end

#macro curvarTXANTIGO(n, vetor, i, TX)
    union{
        #declare j = 0;
        #declare p = 1/n;
        //#declare l = n;
        #while(j < n)
            object{ TX translate interp3(vetor[i][0], vetor[i][1], vetor[i][2], vetor[i][3], 0, n, j)  }
            #declare j = j + p;
        #end
    }
#end

#macro criaDagrao(A, textura1, textura2, textura3)
    union{
        union{
        box {
            <0, 0, 0>, <4, 20, 4> // <x, y, z> near lower left corner, <x, y, z> far upper right corner
        } texture{textura3}
        }
        object{ criaPerna(2, textura1, A[0][0], A[0][1]) 
                scale <-1.0, 1.0, 1.0> // <x, y, z>
                rotate <-90, 0, 0> // <x°, y°, z°>
                translate <0, 0, 2> // <x, y, z>
        }
        object{ criaPerna(2, textura1, A[1][0], A[1][1]) 
                rotate <-90, 0, 0> // <x°, y°, z°>
                translate <4, 0, 2> // <x, y, z>
        }
        object{ criaPerna(2, textura2, A[2][0], A[2][1])

                scale <-1.0, 1.0, 1.0> // <x, y, z>
                rotate <-90, 0, 0> // <x°, y°, z°>
                translate <0, 10, 2> // <x, y, z>
        }
        object{ criaPerna(2, textura2, A[3][0], A[3][1])
                rotate <-90, 0, 0> // <x°, y°, z°>
                translate <4, 10, 2> // <x, y, z>
        }
        object{ criaPerna(2, textura3, A[4][0], A[4][1])

                scale <-1.0, 1.0, 1.0> // <x, y, z>
                rotate <-90, 0, 0> // <x°, y°, z°>
                translate <0, 20, 2> // <x, y, z>
        }
        object{ criaPerna(2, textura3, A[5][0], A[5][1])
                rotate <-90, 0, 0> // <x°, y°, z°>
                translate <4, 20, 2> // <x, y, z>
        }
    }
#end