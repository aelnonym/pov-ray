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

#macro skeleton(vetor, j, i, raio)
    union{
        cylinder {vetor[j][i][0], vetor[j][i][1], raio}
        cylinder {vetor[j][i][1], vetor[j][i][2], raio}
        cylinder {vetor[j][i][2], vetor[j][i][3], raio}
        texture{tx_epsilon}
    }
#end

#macro nohTX(P, N, M, TX)
  #declare i = 0; 
  #while(i < N)
      curvarTXANTIGO(M, P, i, TX)
      // skeleton(P, i, 0.01)
      #declare i = i + 1;
  #end
#end

#macro suavizar(P, N, k, i)
    #local j = mod(i+1, N);
    #local vv = (P[k][j][1] - P[k][i][2])/2;
    #declare P[k][i][2] = P[k][i][3] - vv;
    #declare P[k][j][1] = P[k][j][0] + vv;
#end

#macro interpola1matriz(M, a, b, N, c0, c1, cc, R)
  #declare i = 0;
  #while(i < N)
    #declare k = 0;
    #while(k < 4)
      #debug concat("!! A = ", str(a, 0, 0), "\n")
      #declare R[i][k] = interp1(M[a][i][k], M[b][i][k], c0, c1, cc);
      #declare k = k + 1;
    #end
    #declare i = i + 1;
  #end
#end

// Aula de Hoje

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
    i
#end