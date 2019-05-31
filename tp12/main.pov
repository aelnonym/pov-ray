// Exemplo de arquivo de descricao de cena para POV-ray
// Last edited on 2017-05-07 20:10:09 by stolfilocal

#declare roleta1 = seed(15);
#declare limites = 140;
// ======================================================================
// CORES E TEXTURAS
#include "style.inc"

// Matrizes
#include "matriz.inc"


background{ color rgb < 0.1, 0.1, 0.1 > }



// P e Q matrizes [n][4]
// ao inves de devolver o resultado colocar em R

// Matrizes
#include "metodos.inc"
#include "eixos.inc"

union{
    #local frame = busca_tempo(clock, 3, tk);

   // #if(clock <= 0.5)
        interpola_quadros1(MatrizQ, frame, frame+1, tk[frame], tk[frame+1], clock, MatrizA, 6, 2)
        criaDagrao(MatrizA, tx_buruu, tx_epsilon, tx_louco)
//     #else
//         interpola_quadros1(MatrizQ, frame, frame+1, tk[frame], tk[frame+1], clock, MatrizA, 6, 2)
//         criaDagrao(MatrizA, tx_louco, tx_epsilon, tx_buruu)
//     #end
    eixos(20)
}

#include "camlight.inc"
#declare centro_cena = < 0.00, 5.00, -10.00 >;
#declare raio_cena = 50.0;
#declare dir_camera = < 4.00, 3.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
