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

#declare LATA = array[4][4] {
    {<0, -1, 0>, <0, -0.6, 0>, <0, -0.4, 0.5>, <0, 0, 1.5>},
    {<3, -1, 0>, <3, -0.6, 0.5>, <3, -0.4, 1.5>, <3, 0, 2>},
    {<6, -1, 0>, <6, -0.6, 0.5>, <6, -0.4, 1.5>, <6, 0, 2>},
    {<9, -1, 0>, <9, -0.6, 0>, <9, -0.4, 0.5>, <9, 0, 1.5>}
};

#declare FRENTE = array[4][4] {
    {<0, 0, 1.5>, <0, 3, 2.5>, <0, 6, 2.5>, <0, 9, 3>},
    {<3, 0, 2>, <3, 3, 3.5>, <3, 6, 3.5>, <3, 9, 3>},
    {<6, 0, 2>, <6, 3, 3.5>, <6, 6, 3.5>, <6, 9, 3>},
    {<9, 0, 1.5>, <9, 3, 2.5>, <9, 6, 2.5>, <9, 9, 3>}
};

#declare VIDRO = array[4][4] {
    {<0, 9, 3>, <0, 9.3, 5>, <0, 9.6, 8>, <0, 10, 10>},
    {<3, 9, 3>, <3, 9.3, 5>, <3, 9.6, 8>, <3, 10, 10>},
    {<6, 9, 3>, <6, 9.3, 5>, <6, 9.6, 8>, <6, 10, 10>},
    {<9, 9, 3>, <9, 9.3, 5>, <9, 9.6, 8>, <9, 10, 10>}
};

#declare CAPO = array[4][4] {
    {<0, 10, 10>, <0, 13, 10>, <0, 16, 10>, <0, 19, 10>},
    {<3, 10, 10>, <3, 13, 10>, <3, 16, 10>, <3, 19, 10>},
    {<6, 10, 10>, <6, 13, 10>, <6, 16, 10>, <6, 19, 10>},
    {<9, 10, 10>, <9, 13, 10>, <9, 16, 10>, <9, 19, 10>}
};

#declare VIDRO_TRAS = array[4][4] {
    {<0, 19, 10>, <0, 19.3, 8>, <0, 20.6, 4>, <0, 21, 3>},
    {<3, 19, 10>, <3, 19.3, 8>, <3, 20.6, 4>, <3, 21, 3>},
    {<6, 19, 10>, <6, 19.3, 8>, <6, 20.6, 4>, <6, 21, 3>},
    {<9, 19, 10>, <9, 19.3, 8>, <9, 20.6, 4>, <9, 21, 3>}
};

#declare TRAS = array[4][4] {
    {<0, 21, 3>, <0, 21.3, 1>, <0, 22, 1>, <0, 23, 1>},
    {<3, 21, 3>, <3, 21.3, 1>, <3, 22, 1>, <3, 23, 1>},
    {<6, 21, 3>, <6, 21.3, 1>, <6, 22, 1>, <6, 23, 1>},
    {<9, 21, 3>, <9, 21.3, 1>, <9, 22, 1>, <9, 23, 1>}
};

// P e Q matrizes [n][4]
// ao inves de devolver o resultado colocar em R

// Matrizes
#include "retalho-simples.inc"
#include "eixos.inc"

union{
    // #local girar = clock*3;
    retalho(CAPO, 0, tx_b1, tx_b4)
    retalho(VIDRO, 0, tx_b1, tx_b3)
    retalho(FRENTE, 0, tx_b1, tx_b1)
    retalho(VIDRO_TRAS, 0, tx_b1, tx_b2)
    retalho(TRAS, 0, tx_b1, tx_b5)
    eixos(20)
}

#include "camlight.inc"
#declare centro_cena = < 0.00, 5.00, 10.00 >;
#declare raio_cena = 50.0;
#declare dir_camera = < -4.00, 3.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
