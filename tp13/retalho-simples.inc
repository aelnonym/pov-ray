// Last edited on 2017-04-24 15:54:56 by stolfilocal

#macro retalho_barra(p,q,r,txg)
  // Cria uma barra de {p} para {q} com raio {r}; omite se {p} muito perto de {q}.
  #if ((r > 0) & (vlength(p - q) > 0.01*r))
    cylinder{p,q,r texture{txg}}
  #end
#end

#macro retalho (p,rad,txg,txr)
  // Cria um retalho de Bezier com pontos de controle {p[0..3,0..3]}
  // com textura {txr} (mapeada por XYZ).
  // Se {rad} é positivo, também mostra a grade de pontos de controle,
  // com barras de raio {rad} e textura {txg}.

  union{
    #local r = rad; // Raio das varetas.
    #local R = 2*r; // Raio das bolas.

    // O retalho propriamente dito:
    bicubic_patch{
      type 1 u_steps 3 v_steps 3
      p[3][0],p[3][1],p[3][2],p[3][3],
      p[2][0],p[2][1],p[2][2],p[2][3],
      p[1][0],p[1][1],p[1][2],p[1][3],
      p[0][0],p[0][1],p[0][2],p[0][3]
      texture {txr}
    }

    #if (rad > 0)
      // Bolas da grade de controle
      sphere{p[0][0],R texture{txg}}
      sphere{p[0][1],R texture{txg}}
      sphere{p[0][2],R texture{txg}}
      sphere{p[0][3],R texture{txg}}
      
      sphere{p[1][0],R texture{txg}}
      sphere{p[1][1],R texture{txg}}
      sphere{p[1][2],R texture{txg}}
      sphere{p[1][3],R texture{txg}}
      
      sphere{p[2][0],R texture{txg}}
      sphere{p[2][1],R texture{txg}}
      sphere{p[2][2],R texture{txg}}
      sphere{p[2][3],R texture{txg}}
      
      sphere{p[3][0],R texture{txg}}
      sphere{p[3][1],R texture{txg}}
      sphere{p[3][2],R texture{txg}}
      sphere{p[3][3],R texture{txg}}

      // Barras da grade de controle
      retalho_barra(p[0][0],p[0][1],r,txg)
      retalho_barra(p[0][1],p[0][2],r,txg)
      retalho_barra(p[0][2],p[0][3],r,txg)

      retalho_barra(p[0][0],p[1][0],r,txg)
      retalho_barra(p[0][1],p[1][1],r,txg)
      retalho_barra(p[0][2],p[1][2],r,txg)

      retalho_barra(p[0][3],p[1][3],r,txg)
      retalho_barra(p[1][0],p[1][1],r,txg)
      retalho_barra(p[1][1],p[1][2],r,txg)

      retalho_barra(p[1][2],p[1][3],r,txg)
      retalho_barra(p[1][0],p[2][0],r,txg)
      retalho_barra(p[1][1],p[2][1],r,txg)
      

      retalho_barra(p[1][2],p[2][2],r,txg)
      retalho_barra(p[1][3],p[2][3],r,txg)
      retalho_barra(p[2][0],p[2][1],r,txg)

      retalho_barra(p[2][1],p[2][2],r,txg)
      retalho_barra(p[2][2],p[2][3],r,txg)
      retalho_barra(p[2][0],p[3][0],r,txg)

      retalho_barra(p[2][1],p[3][1],r,txg)
      retalho_barra(p[2][2],p[3][2],r,txg)
      retalho_barra(p[2][3],p[3][3],r,txg)

      retalho_barra(p[3][0],p[3][1],r,txg)
      retalho_barra(p[3][1],p[3][2],r,txg)
      retalho_barra(p[3][2],p[3][3],r,txg)
    #end

  }

#end


