// Exemplo de arquivo de descricao de cena para POV-ray
// Last edited on 2017-05-07 20:10:09 by stolfilocal

#declare roleta1 = seed(15);
#declare limites = 140;

// ======================================================================
// CORES E TEXTURAS

background{ color rgb < 0.1, 0.1, 0.1 > }

#declare tx_plastico = 
  texture{
    pigment{ color rgb < 0.10, 0.80, 1.00 > }
    finish{ diffuse 0.8 ambient 0.1 specular 0.5 roughness 0.005 }
  }

#declare tx_fosca = 
  texture{
    pigment{ color rgb < 1.00, 0.80, 0.10 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_espelho = 
  texture{
    pigment{ color rgb < 1.00, 0.85, 0.30 > }
    finish{ diffuse 0.2 reflection 0.7*< 1.00, 0.85, 0.30 > ambient 0.1 }
  }

#declare tx_vidro = 
  texture{
    pigment{ color rgb < 0.85, 0.95, 1.00 > filter 0.70 }
    finish{ diffuse 0.03 reflection 0.25 ambient 0.02 specular 0.25 roughness 0.005 }
  }


#declare tx_xadrez =
  texture{
    pigment{ checker color rgb < 0.10, 0.12, 0.14 >, color rgb < 1.00, 0.97, 0.90 > }
    finish{ diffuse 0.9 ambient 0.1 }
    scale 2.0
  }

// Nova textura 

#declare tx_louco = 
  texture{
    pigment{ checker color rgb < 0.9, 0.9, 0.9 >, color rgb < 0.0, 0.6, 0.9 > }
    finish{ diffuse 0.9 reflection 0.01 ambient 0.1 specular 0.1 roughness 0.01 }
    scale 0.3
  }

#declare tx_eks = 
  texture{
    pigment{ color rgb < 0.80, 0.10, 1.00 > }
    finish{ diffuse 0.8 ambient 0.1 specular 0.5 roughness 0.005 }
  }

#declare tx_buruu = 
  texture{
    pigment{ color rgb < 0.00, 0.10, 1.00 > }
    finish{ diffuse 0.8 ambient 0.1 specular 0.5 roughness 0.005 }
  }

#declare tx_epsilon = 
  texture{
    pigment{ color rgb < 0.10, 0.80, 1.00 > }
    finish{ diffuse 0.8 ambient 0.1 specular 0.5 roughness 0.005 }
  }

#declare tx_grama = 
  texture{
    pigment{ color rgb <0.75,1,0>}
    normal { bumps 0.50 scale 0.10}
  }


// ======================================================================
// Gradual COlors

#declare tx_b1 = 
  texture{
    pigment{ color rgb < 0.00, 0.00, 1.00 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_b2 = 
  texture{
    pigment{ color rgb < 0.05, 0.05, 0.90 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_b3 = 
  texture{
    pigment{ color rgb < 0.10, 0.10, 0.80 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_b4 = 
  texture{
    pigment{ color rgb < 0.15, 0.15, 0.75 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_b5 = 
  texture{
    pigment{ color rgb < 0.15, 0.15, 0.60 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare boleta1 =
	sphere {
		< 0, 0,  0>, 0.25 // Near lower left corner
		 texture{ tx_b1 }
	}
#declare boleta2 =
sphere {
  < 0, 0,  0>, 0.25 // Near lower left corner
    texture{ tx_b2 }
}
#declare boleta3 =
sphere {
  < 0, 0,  0>, 0.25 // Near lower left corner
    texture{ tx_b3 }
}
#declare boleta4 =
sphere {
  < 0, 0,  0>, 0.25 // Near lower left corner
    texture{ tx_b4 }
}
#declare boleta5 =
sphere {
  < 0, 0,  0>, 0.25 // Near lower left corner
    texture{ tx_b5 }
}

// ======================================================================

#declare bolinhaRosa =
	sphere {
		< 0, 0,  0>, 0.25 // Near lower left corner
		 texture{ tx_eks }
	}

#declare bolinhaVerde =
	sphere {
		< 0, 0,  0>, 0.30 // Near lower left corner
		 texture{ tx_grama }
	}

#declare bolinhaAzul =
	sphere {
		< 0, 0,  0>, 0.20 // Near lower left corner
		 texture{ tx_buruu }
	}

#declare boletassa =
	sphere {
		< 0, 0,  0>, 0.40 // Near lower left corner
		 texture{ tx_louco }
	}

#declare P = array[10][4] {
    {<0, 0, 0>, <0, 5, 0>, <0, 5, 5>, <0, 0, 5>},
    {<0, 0, 0>, <5, 0, 0>, <5, 5, 0>, <0, 5, 0>},
    {<0, 0, 0>, <0, 0, 5>, <5, 0, 5>, <5, 0, 0>},
    {<5, 0, 5>, <5, 5, 5>, <5, 5, 0>, <5, 0, 0>},
    {<5, 5, 0>, <5, 5, 5>, <5, 0, 0>, <5, 0, 5>},
    {<5, 0, 0>, <5, 0, 5>, <5, 5, 5>, <5, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>}
};


#declare RS = array[6][4] {
    {<0, -30, 0>, <-5, -30, 0>, <-5, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <5, 0, 0>, <5, 15, 0>, <0, 15, 0>},
    {<0, 15, 0>, <-30, 15, 0>, <-30, -15, 0>, <0, -15, 0>},
    {<0, -15, 0>, <30, -15, 0>, <30, 15, 0>, <0, 15, 0>}
    {<0, 15, 0>, <-5, 15, 0>, <-5, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <5, 0, 0>, <5, -30, 0>, <0, -30, 0>},
};

#declare ZRS = array[6][4] {
    {<0, -30, 0>, <-5, -30, 5>, <-5, 0, 5>, <0, 0, 0>},
    {<0, 0, 0>, <5, 0, -5>, <5, 15, 5>, <0, 15, 5>},
    {<0, 15, 5>, <-30, 15, 0>, <-30, -15, 0>, <0, -15, -5>},
    {<0, -15, -5>, <30, -15, 0>, <30, 15, 0>, <0, 15, -5>}
    {<0, 15, -5>, <-5, 15, 0>, <-5, 0, 0>, <0, 0, 5>},
    {<0, 0, 5>, <5, 0, -5>, <5, -30, -5>, <0, -30, 0>},
};

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

#macro curvar(n, vetor, i)
    union{
        #declare j = 0;
        #declare p = 1/n;
        //#declare l = n;
        #while(j < n)
            object{ bolinha translate interp3(vetor[i][0], vetor[i][1], vetor[i][2], vetor[i][3], 0, n, j)  }
            #declare j = j + p;
        #end
    }
#end

#macro curvarTX(n, vetor, i, TX)
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


#macro skeleton(vetor, i, raio)
    union{
        cylinder {vetor[i][0], vetor[i][1], raio}
        cylinder {vetor[i][1], vetor[i][2], raio}
        cylinder {vetor[i][2], vetor[i][3], raio}
        texture{tx_epsilon}
    }
#end

#macro suavizar(P, N, i)
    // suaviza a juntaentre o arco i e o arco j =  mod(i+1, N)
    #local j = mod(i+1, N);
    #local vv = (P[j][1] - P[i][2])/2;
    #declare P[i][2] = P[i][3] - vv;
    #declare P[j][1] = P[j][0] + vv;
#end

// P matriz, n numero de elementos, m quantidade de bolinhas
#macro noh(P, N, M)
  #declare i = 0; 
  #while(i < N)
      curvar(M, P, i)
      skeleton(P, i, 0.01)
      #declare i = i + 1;
  #end
#end

// P matriz, n numero de elementos, m quantidade de bolinhas
#macro nohTX(P, N, M, TX)
  #declare i = 0; 
  #while(i < N)
      curvarTX(M, P, i, TX)
      // skeleton(P, i, 0.01)
      #declare i = i + 1;
  #end
#end

// P e Q matrizes [n][4]
// ao inves de devolver o resultado colocar em R
#macro interpola1matriz(P, Q, N, c0, c1, cc, R)
  #declare i = 0;
  #while(i < N)
    #declare k = 0;
    #while(k < 4)
      #declare R[i][k] = interp1(P[i][k], Q[i][k], c0, c1, cc);
      #declare k = k + 1;
    #end
    #declare i = i + 1;
  #end
#end

#macro curvarMatrizTX(n, P, Q, i, TX, R)
        #declare j = 0;
        #declare p = 1/n;
        //#declare l = n;
        #while(j < n)
            interpola1matriz(P, Q, n, 0, n, j, R)
            object{ nohTX(R, n, 60, TX) }
            // object{ TX translate interpola1matriz(P, Q, n, 0, n, j, R)  }
            #declare j = j + p;
        #end
  
#end

// DESCRI��O DA CENA 
// Partes da cena:

#include "eixos.inc"

#declare R = array[6][4] {
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>},
    {<0, 0, 0>, <0, 0, 0>, <0, 0, 0>, <0, 0, 0>}
};

// Aqui esta a cena, finalmente:

union{
  object{eixos(3.00)}
  // nohTX(P, 3, 50, bolinhaAzul)
  // suavizar(P, 10, 0);
  // suavizar(P, 10, 1);
  // suavizar(P, 10, 2);
  // suavizar(P, 10, 3);
  // suavizar(P, 10, 4);

  // suavizar(P, 10, 5);
  // nohTX(RS, 6, 50, bolinhaRosa)
  // suavizar(RS, 6, 0)
  // suavizar(RS, 6, 1)
  // suavizar(RS, 6, 2)
  // suavizar(RS, 6, 3)
  // suavizar(RS, 6, 4)
  // suavizar(RS, 6, 5)
  // nohTX(RS, 6, 50, bolinhaVerde)
  suavizar(ZRS, 6, 0)
  suavizar(ZRS, 6, 1)
  suavizar(ZRS, 6, 2)
  suavizar(ZRS, 6, 3)
  suavizar(ZRS, 6, 4)
  suavizar(ZRS, 6, 5)
  // nohTX(ZRS, 6, 50, boletassa)

  interpola1matriz(RS, ZRS, 6, 0, 5, 0, R)
  nohTX(R, 6, 50, boleta1)
  interpola1matriz(RS, ZRS, 6, 0, 5, 1, R)
  nohTX(R, 6, 50, boleta2)
  interpola1matriz(RS, ZRS, 6, 0, 5, 2, R)
  nohTX(R, 6, 50, boleta3)
  interpola1matriz(RS, ZRS, 6, 0, 5, 3, R)
  nohTX(R, 6, 50, boleta4)
  interpola1matriz(RS, ZRS, 6, 0, 5, 4, R)
  nohTX(R, 6, 50, boleta5)
  interpola1matriz(RS, ZRS, 6, 0, 5, 5, R)
  nohTX(R, 6, 50, boletassa)

  // interpola1matriz(P, RS, 6, 0, 5, 0, R)
  // nohTX(R, 6, 50, boleta1)
  // interpola1matriz(P, RS, 6, 0, 5, 1, R)
  // nohTX(R, 6, 50, boleta2)
  // interpola1matriz(P, RS, 6, 0, 5, 2, R)
  // nohTX(R, 6, 50, boleta3)
  // interpola1matriz(P, RS, 6, 0, 5, 3, R)
  // nohTX(R, 6, 50, boleta4)
  // interpola1matriz(P, RS, 6, 0, 5, 4, R)
  // nohTX(R, 6, 50, boleta5)
  // interpola1matriz(P, RS, 6, 0, 5, 5, R)
  // nohTX(R, 6, 50, boletassa)
  // curvarMatrizTX(6, P, RS, 0, bolinhaVerde, R)
  // object{curvar(50, P, 0)}
  // skeleton(P, 0, 0.01)
  // object{curvar(50, P, 1)}
  // skeleton(P, 1, 0.01)
  // object{curvar(50, P, 2)}
  // skeleton(P, 2, 0.01)
  // object{curvar(50, P, 3)}
  // skeleton(P, 3, 0.01)
  // object{curvar(50, P, 4)}
  // skeleton(P, 4, 0.01)
  // object{curvar(50, P, 5)}
  // skeleton(P, 5, 0.01)

}

#include "camlight.inc"
#declare centro_cena = < 0.00, 0.00, 1.00 >;
#declare raio_cena = 30.0;
#declare dir_camera = < 4.00, 3.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
