// Exemplo de arquivo de descricao de cena para POV-ray
// Last edited on 2017-05-07 20:10:09 by stolfilocal

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
    pigment{ checker color rgb < 0.10, 0.32, 0.60 >, color rgb < 1.00, 0.97, 0.90 > }
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

#include "eixos.inc"

// Aqui est� a cena, finalmente:

union{
  object{ eixos(3.00) }

  object{ chao  translate < 0,0,0 > texture{ tx_xadrez } }
  object{ memes texture {tx_louco} }
  object{ memes  translate < 0,0,3 > texture{ tx_louco } }
  object{ memes  translate < 0,3,0 > texture{ tx_louco } }
  object{ memes  translate < 3,0,0 > texture{ tx_louco } }

  object{ memes  translate < 3,0,3 > texture{ tx_louco } }
  object{ memes  translate < 0,3,3 > texture{ tx_louco } }
  object{ memes  translate < 3,3,3 > texture{ tx_louco } }
  object{ memes  translate < 3,3,0 > texture{ tx_louco } }

  object{ bola translate <1.5, 1.5, 10> texture {tx_louco}}

  //object{ bolota  translate < -2,+1,+3 > texture{ tx_espelho } }
  //object{ bolinha translate < +5,+4,+2 > texture{ tx_vidro } interior { ior 1.01 } }

  // difference{ 
  //   union{
  //     object{ bola } 
  //     object{ pino }
  //   }
  //   object{ furo }
  // }
}

#include "camlight.inc"
#declare centro_cena = < 0.00, 0.00, 1.00 >;
#declare raio_cena = 20.0;
#declare dir_camera = < 14.00, 7.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
