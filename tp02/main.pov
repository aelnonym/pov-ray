// Exemplo de arquivo de descricao de cena para POV-ray
// Last edited on 2017-05-07 20:10:09 by stolfilocal

#macro tabuleiro(colunas, fileiras)
  union {
  #declare i = 2;
    #while (i < colunas)
      #declare j = 2;
      #while (j < fileiras)
        #if(mod(i + j, 13) = 0)
          object { hyperdama translate < 2*i + 1,2*j + 1,0 > }
          
        #else
          #if(mod(i + j, 8) = 0)
            object { hyperpeao translate < 2*i + 1,2*j + 1,0 > }
          #end
        #end
        #declare j = j + 1;
      #end
      #declare i = i + 1;
    #end
  
  }
#end

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

#declare tx_epsilon = 
  texture{
    pigment{ color rgb < 0.10, 0.80, 1.00 > }
    finish{ diffuse 0.8 ambient 0.1 specular 0.5 roughness 0.005 }
  }

// ======================================================================
// DESCRI��O DA CENA 

#declare raio = 2.000;

// Partes da cena:
  
#declare bolinha = 
  sphere{ < 0,0,0 >, 0.60 }
 
#declare bolota = 
  sphere{ < 0,0,0 >, 1.50 }
 
#declare bola =
  sphere{
    < 0.00, 0.00, 0.00 >, raio 
    texture{ tx_louco }
  }
  
#declare pino = 
  cylinder{
    < -2.00, +2.00, -1.00 >,
    < +2.00, -2.00, +1.00 >,
    0.75
    texture{ tx_fosca }
  }
  
#declare furo = 
  cylinder{
    < -1.00, -2.00, -2.00 >,
    < +1.00, +2.00, +2.00 >,
    0.75*raio
    texture{ tx_fosca }
  }

#declare chao = 
  box{ <-20,-20,-1>, <+20,+20,0> }

#declare memes = 
  box{ <0, 0, 1>, <2,2,3> }

#declare hyperdama = 
  union {
    cone {
      <0, 0, 0>, 1.0    // Center and radius of one end
      <0, 0, 4>, 0    // Center and radius of other end
      texture { tx_eks }
    }
    cone {
      <0, 0, 6>, 0.5    // Center and radius of one end
      <0, 0, 4>, 0    // Center and radius of other end
      texture { tx_eks scale 4 }
    }
    sphere {
      < 0.00, 0.00, 7.00 >, 1.0 
      texture{ tx_eks }
    }
  }

#declare hyperpeao = 
  union {
    cone {
      <0, 0, 0>, 1.0    // Center and radius of one end
      <0, 0, 4>, 0    // Center and radius of other end
      texture { tx_epsilon }
    }
    sphere {
      < 0.00, 0.00, 5.00 >, 1.0 
      texture{ tx_epsilon }
    }
    cone {
      <0, 0, 6>, 0.5    // Center and radius of one end
      <0, 0, 8>, 0    // Center and radius of other end
      texture { tx_epsilon scale 4 }
    }
  }


#include "eixos.inc"

// Aqui est� a cena, finalmente:

union{
  object{ eixos(3.00) }
  object{ tabuleiro(10, 10) }
  object{ chao  translate < 10,10,0 > texture{ tx_xadrez } }




}

#include "camlight.inc"
#declare centro_cena = < 0.00, 0.00, 1.00 >;
#declare raio_cena = 30.0;
#declare dir_camera = < 14.00, 7.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
