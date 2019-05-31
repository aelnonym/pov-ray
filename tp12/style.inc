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

#declare tx_buruu = 
  texture{
    pigment{ color rgb < 0.00, 0.10, 1.00 > }
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
// Gradual COlors

#declare tx_b1 = 
  texture{
    pigment{ color rgb < 0.00, 0.00, 1.00 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_b2 = 
  texture{
    pigment{ color rgb < 0.05, 0.05, 0.90 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_b3 = 
  texture{
    pigment{ color rgb < 0.10, 0.10, 0.80 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_b4 = 
  texture{
    pigment{ color rgb < 0.15, 0.15, 0.75 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare tx_b5 = 
  texture{
    pigment{ color rgb < 0.15, 0.15, 0.60 > }
    finish{ diffuse 0.9 ambient 0.1 }
  }

#declare boleta1 =
	sphere {
		< 0, 0,  0>, 0.25 // Near lower left corner
		 texture{ tx_b1 }
	}
#declare boleta2 =
sphere {
  < 0, 0,  0>, 0.25 // Near lower left corner
    texture{ tx_b2 }
}
#declare boleta3 =
sphere {
  < 0, 0,  0>, 0.25 // Near lower left corner
    texture{ tx_b3 }
}
#declare boleta4 =
sphere {
  < 0, 0,  0>, 0.25 // Near lower left corner
    texture{ tx_b4 }
}
#declare boleta5 =
sphere {
  < 0, 0,  0>, 0.25 // Near lower left corner
    texture{ tx_b5 }
}

#declare boletaIn =
sphere {
  < 0, 0,  0>, clock*2 // Near lower left corner
    texture{ tx_grama }
}
#declare boletaOut =
sphere {
  < 0, 0,  0>, clock*2 // Near lower left corner
    texture{ tx_louco }
}

// ======================================================================

#declare bolinhaRosa =
	sphere {
		< 0, 0,  0>, 0.25 // Near lower left corner
		 texture{ tx_eks }
	}

#declare bolinhaVerde =
	sphere {
		< 0, 0,  0>, 0.30 // Near lower left corner
		 texture{ tx_grama }
	}

#declare bolinhaAzul =
	sphere {
		< 0, 0,  0>, 0.20 // Near lower left corner
		 texture{ tx_buruu }
	}

#declare boletassa =
	sphere {
		< 0, 0,  0>, 0.40 // Near lower left corner
		 texture{ tx_louco }
	}