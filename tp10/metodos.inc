#macro criaPe(tamanho, textura)
    union{
        sphere {
            <0, 0, 0>, tamanho
        }
        cylinder {
            <0, tamanho, 0>, <0, tamanho+10, 0>, tamanho
        }
        texture{textura}
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
            rotate <0, 0, angulo1> // <x°, y°, z°>
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
            rotate <0, 0, angulo2> // <x°, y°, z°>
            translate <0, (tamanho+10)+(tamanho), 0> // <x, y, z>
        }
    }
#end

#declare tamanhoDedo = 3;
#declare tamanhoUnha = 2;
#declare tamanhoArtDedo = 1;
#declare grossuraDedo = 2;
#declare grossuraArtDedo = 0.5;

// #macro criaDedoDragao(tamanho, textura)
//     union{
//         sphere {
//             <0, 0, 0>, grossuraArtDedo // <x, y, z>, radius
//         }
//         cylinder {
//             <0, tamanhoArtDedo, 0>, <0, tamanhoArtDedo + tamanhoDedo, 0>, grossuraDedo // center of one end, center of other end, radius
//         }
//         sphere {
//             <0, tamanhoArtDedo*2 + tamanhoDedo, 0>, grossuraArtDedo // <x, y, z>, radius
//         }
//         cone {
//             <0, -1, 0>, 1.0 // <x, y, z>, center & radius of one end
//             <0, 1, 0>, 0.25 // <x, y, z>, center & radius of the other end
//         }
//     }
// #end

// #macro criaMaoDragao(tamanho, textura)
//     union{
//         sphere {
//             <0, 0, 0>, tamanho
//         }
//         cylinder {
//             <0, tamanho, 0>, <0, tamanho+10, 0>, 1
//             rotate <0, 0, -45> // <x°, y°, z°>
//         }
//         cylinder {
//             <0, tamanho, 0>, <0, tamanho+10, 0>, 1
//             rotate <120, -45, 0> // <x°, y°, z°>
//         }
//         cylinder {
//             <0, tamanho, 0>, <0, tamanho+10, 0>, 1
//             rotate <0, -45, 0> // <x°, y°, z°>
//         }
//         texture{textura}
//     }

// #end

#macro criaCorpoProvisorio(textura, tamanho)
    box {
        <0, 0, 0>, <4, 10, 4> // <x, y, z> near lower left corner, <x, y, z> far upper right corner
    }
#end