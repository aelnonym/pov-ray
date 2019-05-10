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
#include "eixos.inc"

union{
    // object{
    //   criaPerna(2, tx_plastico, 0, 0)
    //   rotate <-90, 0, 0> // <x°, y°, z°>
    //   translate <0, 0, 0> // <x, y, z>
    // }
    // object{
    //   criaPerna(2, tx_eks, 45, 45)
    //   rotate <-90, 0, 0> // <x°, y°, z°>
    //   translate <0, 0, 0> // <x, y, z>
    // }
    // object{
    //   criaPerna(2, tx_buruu, 30, 30)
    //   rotate <-90, 0, 0> // <x°, y°, z°>
    //   translate <0, 0, 0> // <x, y, z>
    // }
    // object{
    //   criaPerna(2, tx_louco, 120, 120)
    //   rotate <-90, 0, 0> // <x°, y°, z°>
    //   translate <5, 0, 5> // <x, y, z>
    // }
    // object{
    //   //criaMao(2, tx_louco)
    // }
    object{
        box {
        <0, 0, 0>, <5, 20, 4> // <x, y, z> near lower left corner, <x, y, z> far upper right corner
        }
        texture{tx_louco}
    }
    object{ criaPerna(2, tx_eks, 30, -30) 
                translate <0, 0, 2> // <x, y, z>
                rotate <-90, 0, 0> // <x°, y°, z°>
    }
    object{ criaPerna(2, tx_eks, 30, -30) 
            translate <4, 0, 2> // <x, y, z>
            rotate <-90, 0, 0> // <x°, y°, z°>
    }
    object{ criaPerna(2, tx_buruu, 30, -30) 
            translate <0, 10, 2> // <x, y, z>
            rotate <-90, 0, 0> // <x°, y°, z°>
    }
    object{ criaPerna(2, tx_buruu, 30, -30) 
            translate <4, 10, 2> // <x, y, z>
            rotate <-90, 0, 0> // <x°, y°, z°>
    }
    object{ criaPerna(2, tx_epsilon, 30, -30) 
            translate <0, 20, 2> // <x, y, z>
            rotate <-90, 0, 0> // <x°, y°, z°>
    }
    object{ criaPerna(2, tx_epsilon, 30, -30) 
            translate <4, 20, 2> // <x, y, z>
            rotate <-90, 0, 0> // <x°, y°, z°>
    }
    eixos(20)
}

#include "camlight.inc"
#declare centro_cena = < 0.00, 0.00, 1.00 >;
#declare raio_cena = 50.0;
#declare dir_camera = < 4.00, 3.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
