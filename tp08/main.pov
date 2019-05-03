// Exemplo de arquivo de descricao de cena para POV-ray
// Last edited on 2017-05-07 20:10:09 by stolfilocal

#declare roleta1 = seed(15);
#declare limites = 140;
// ======================================================================
// CORES E TEXTURAS
#include "style.inc"

// Matrizes
#include "matriz2.inc"


background{ color rgb < 0.1, 0.1, 0.1 > }



// P e Q matrizes [n][4]
// ao inves de devolver o resultado colocar em R

// Matrizes
#include "metodos.inc"

union{
  suavizar(grandeMatriz, 6, 1, 0)
  suavizar(grandeMatriz, 6, 1, 1)
  suavizar(grandeMatriz, 6, 1, 2)
  suavizar(grandeMatriz, 6, 1, 3)
  suavizar(grandeMatriz, 6, 1, 4)
  suavizar(grandeMatriz, 6, 1, 5)

  #local frame = busca_tempo(clock, 3, tk);

  #if(clock <= 0.5)
    interpola1matriz(grandeMatriz, frame, frame+1, 6, 0, 5, clock * 5, R)
    nohTX(R, 6, 50, boletaIn)
  #else
    interpola1matriz(grandeMatriz, frame, frame+1, 6, 0, 5, clock * 5, R)
    nohTX(R, 6, 50, boletaOut)
  #end

}

#include "camlight.inc"
#declare centro_cena = < 0.00, 0.00, 1.00 >;
#declare raio_cena = 30.0;
#declare dir_camera = < 4.00, 3.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
