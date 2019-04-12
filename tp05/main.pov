//Tp05 by Carlos Robson
// ======================================================================

background{ color rgb < 0.75, 0.80, 0.85 > }

#declare Yellow = rgb<255, 255, 0>;
#declare Black =  rgb < 0.4, 0.4, 0.4 >;

#declare tx_plastico = 
  texture{
    pigment{ color rgb < 0.10, 0.80, 1.00 > }
    finish{ diffuse 0.8 ambient 0.1 specular 0.5 roughness 0.005 }
  }
  
#declare esfera =
	sphere {
		< 0, 0,  0>, 0.25 // Near lower left corner
		 texture{ tx_plastico }
	}
	
  
// ======================================================================
// DESCRIÇÃO DA CENA 

#include "eixos.inc"

object{ eixos(3.00) }

#macro interpola(to, vo, t1, v1, tt )
	#local r = (tt-to)/(t1-to);
	#local s = 1-r;
	#local vv= s*vo+r*v1;
	vv
#end

#macro arcobezier(to, t1, a, b, c, d, tt )
	#local ab = interpola(to, a, t1, b, tt );
	#local bc = interpola(to, b, t1, c, tt );
	#local cd = interpola(to, c, t1, d, tt );	
	#local abc = interpola(to, ab, t1, bc, tt );
	#local bcd = interpola(to, bc, t1, cd, tt );
	#local abcd = interpola(to, abc, t1, bcd, tt );
	abcd
#end
#macro poligonocircular(n)
	union{
		#declare passo = 1/n;
		#declare lado = n/4;
		#declare j = 0;
		#while(j<n)
			#if( j <= lado)
				object { esfera translate arcobezier(0,lado, <0,0,0>,<0,1,-2>, <0,3,-2>,  <0,4,0>, j)}
			#end
			#if( (j > lado) & (j <= 2*lado))
				object { esfera translate arcobezier(lado,2*lado, <0,4,0>, <0,4,2>, <1,0,2>,  <1,0,4>, j)}
			#end
			#if( (j >  2*lado) & (j <= 3*lado))
				object { esfera translate arcobezier(2*lado,3*lado, <1,0,4>, <0,1,6>, <0,3,6>,  <-1,4,4>, j)}
			#end
			#if( (j >  3*lado) & (j <= 4*lado))
				object { esfera translate arcobezier(3*lado,4*lado, <-1,4,4>, <-1,0,2>, <0,4,2>,  <0,0,0>, j)}
			#end
			#declare j=j+passo;
		#end
	}
#end

//n = numero de esferas
#macro quadrado(n)
	union{
		#declare passo = 1/n;
		#declare lado = n/4;
		#declare j = 0;
		#while(j<n)
			#if( j <= lado)
				object { esfera translate interpola(0,<0,0,0>, lado, <4,0,0>, j)}
			#end
			#if( (j > lado) & (j <= 2*lado))
				object { esfera translate interpola(lado,<4,0,0>, 2*lado, <4,4,0>, j) }
			#end
			#if( (j >  2*lado) & (j <= 3*lado))
				object { esfera translate interpola(2*lado,<4,4,0>, 3*lado, <0,4,0>, j) }
			#end
			#if( (j >  3*lado) & (j <= 4*lado))
				object { esfera translate interpola(3*lado,<0,4,0>, 4*lado, <0,0,0>, j) }
			#end
			#declare j=j+passo;
		#end
	}
#end
#macro ampulheta(n)
	union{
		#declare passo = 1/n;
		#declare lado = n/4;
		#declare j = 0;
		#while(j<n)
			#if( j <= lado)
				object { esfera translate interpola(0,<0,0,0>, lado, <4,0,0>, j)}
			#end
			#if( (j > lado) & (j <= 2*lado))
				object { esfera translate interpola(lado,<4,0,0>, 2*lado, <0,4,0>, j) }
			#end
			#if( (j >  2*lado) & (j <= 3*lado))
				object { esfera translate interpola(2*lado,<0,4,0>, 3*lado, <4,4,0>, j) }
			#end
			#if( (j >  3*lado) & (j <= 4*lado))
				object { esfera translate interpola(3*lado,<4,4,0>, 4*lado, <0,0,0>, j) }
			#end
			#declare j=j+passo;
		#end
	}
#end

//object{quadrado(20)}
//object{ampulheta(20)}
object{poligonocircular(20)}

#include "camlight.inc"
#declare centro_cena = < 0.00, 0.00, 1.00 >;
#declare raio_cena = 10.0;
#declare dir_camera = < 14.00, 7.00, 4.00 >;
#declare dist_camera = 5*raio_cena;
#declare intens_luz = 1.20;
camlight(centro_cena, raio_cena, dir_camera, dist_camera , z, intens_luz)
