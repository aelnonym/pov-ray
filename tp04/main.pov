// Exemplo de arquivo de descricao de cena para POV-ray
// Last edited on 2017-05-07 20:10:09 by stolfilocal

#declare roleta1 = seed(15);
#declare limites = 140;

#macro criaCaminho(circulos, raio)
    #declare i = circulos;
    #declare passo = (2*pi*raio)/circulos;
    union{
      #while(i != 0)
        sphere{<21*sin(passo*i), 21*cos(passo*i), 0>, raio
          texture {tx_grama}
        }
        #declare i = i - 1;
      #end
    }

#end

#macro criaPizza(circulos, raio, tam)
    #declare i = circulos;
    #declare passo = (2*pi*raio)/(circulos);
    union{
      #while(i > (3*circulos)/4)
        sphere{<tam*sin(passo*i), tam*cos(passo*i), 0>, raio
          texture {tx_grama}
        }
        #declare i = i - 1;
      #end
    }

#end

#macro criaQuadrado(circulos, raio)
    #declare i = 0;
    #declare passo = circulos/4;
    #declare varx = 0;
    #declare vary = 0;
    union{
      #while(i <= circulos)
        #if(i <= circulos/4)
          #declare varx = varx + passo;
        #else
          #if(i <= (2*circulos)/4)
            #declare vary = vary + passo;
          #else
            #if(i <= (3*circulos)/4)
              #declare varx = varx - passo;
            #else
              #declare vary = vary - passo;
            #end
          #end
        #end
        
        sphere{<varx, vary, 0>, raio
          texture {tx_grama}
        }
        #declare i = i + 1;
      #end
    }

#end

#macro criaPista(circulos, raio)
    #declare i = 0;
    #declare passo = circulos/8;
    #declare espaco = 20;
    #declare umQuarto = raio*pi/2;
    #declare umMeio = raio*pi;
    #declare add = passo/espaco;
    #declare varx = 0;
    #declare vary = 0;
    union{
    #while(i < circulos)
      #switch(int(i/passo))
        #case(0) // reto pra cima
        #declare vary = vary + add;
        #break
        #case(1) // curva a direita
        #declare varx = varx + add*sin(mod(i, passo) * umQuarto*raio); 
        #declare vary = vary + add*cos(mod(i, passo) * umQuarto*raio);
        #break
        #case(2)// reto direita
        #declare varx = varx + add;
        #break
        #case(3) // curva pra cima
        #declare varx = varx + sin(mod(i, passo) * umMeio*raio);
        #declare vary = vary + cos(mod(i, passo) * umMeio*raio);
        #break
        #case(4)
        #declare varx = varx - add;
        #break
        #case(5)
        #declare varx = varx + sin(mod(i, passo) * umQuarto*raio); 
        #declare vary = vary + cos(mod(i, passo) * umQuarto*raio);
        #break
        #case(6)
        #declare vary = vary - add;
        #break
        #case(7)
        #declare varx = varx + sin(mod(i, passo) * umMeio*raio);
        #declare vary = vary + cos(mod(i, passo) * umMeio*raio);
        #break
      #end
        
      sphere{<varx, vary, 0>, raio
         texture {tx_grama}
      }
      #declare i = i + 1;
    #end
    }

#end

#macro criaDomo(raizin)
        difference{
        sphere{ < 0,0,0 >, raizin
        texture{ tx_grama }
        }
        box{ <0-raizin,  0-raizin, 0>, <raizin,raizin,0-raizin> 
        texture{ tx_grama }
        }
      }
#end

#macro criaCorredor(inicio, fim)
      cylinder {
        inicio,  fim, 1    // Center and radius of other end
        texture { tx_eks }
      }
#end

#macro criaTudo(numero)
  #declare domos = array[numero];
  #declare i = 0;
  union{
  union{
  #while(i < numero)
    #declare posx = int(limites * rand(roleta1));
    #declare posy = int(limites * rand(roleta1));
    #declare posz = int(limites * rand(roleta1));
    #declare tam = int(1 + 7.0 * rand(roleta1));

    #declare domos[i] = <posx, posy, posz>;
    object { criaDomo(tam) translate<posx, posy, posz>}


  #declare i = i + 1;
  #end
  }

  union{
  #while(i != 0)
    #declare primeiro = int(numero * rand(roleta1));
    #declare segundo = int(numero * rand(roleta1));
    #while(primeiro = segundo)
      #declare segundo = int(numero * rand(roleta1));
    #end
    object { criaCorredor(domos[primeiro], domos[segundo]) }
    #declare i = i - 1;
  #end
  }
  }
  

#end

// ======================================================================
// CORES E TEXTURAS

background{ color rgb < 0.39, 0.26, 0.12 > }

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
// DESCRI��O DA CENA 
// Partes da cena:

#include "eixos.inc"

// Aqui est� a cena, finalmente:

union{
  object{ eixos(3.00) }
  //object{ chao  translate < 10,10,0 > texture{ tx_grama } }
  //object{ criaTudo(60) }
  //object{ criaCorredor(<1,1,1>, <8,8,8>)}
  //object {criaDomo(6)}
  //object{criaCaminho(50, 3)}
  //object{criaQuadrado(20, 3)}
  object{criaPista(300, 2)}

}

#include "camlight.inc"
#declare centro_cena = < 0.00, 0.00, 1.00 >;
#declare raio_cena = 400.0;
#declare dir_camera = < 4.00, 3.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
