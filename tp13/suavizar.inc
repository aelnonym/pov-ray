#macro suavizar_retalho(A, B)
    // pp é uma array de 4 indices com todos os retalhos
    // r0, s0 indices do primeiro retalho
    // r1, s1 segundo
    // exige-se que 
    // r0 = r1 e s0 + 1 = s1
    // s0 = s1 e r0 + 1 = r1
    #local i = 0;
    #while (i < 4)
        #local p1 = (A[i][2] + B[i][1])/2;
        // #local p2 = (A[i][2] + B[i][1])/2;
        // #local p3 = (A[i][2] + B[i][1])/2;
        // #local p4 = (A[i][2] + B[i][1])/2;
        #declare A[i][3] = p1;
        #declare B[i][0] = p1;
        #local i = i + 1;
    #end
#end

#macro suavizar_retalho_lado(A, B)
    // pp é uma array de 4 indices com todos os retalhos
    // r0, s0 indices do primeiro retalho
    // r1, s1 segundo
    // exige-se que 
    // r0 = r1 e s0 + 1 = s1
    // s0 = s1 e r0 + 1 = r1
    #local i = 0;
    #while (i < 4)
        #local p1 = (A[2][i] + B[1][i])/2;
        // #local p2 = (A[i][2] + B[i][1])/2;
        // #local p3 = (A[i][2] + B[i][1])/2;
        // #local p4 = (A[i][2] + B[i][1])/2;
        #declare A[3][i] = p1;
        #declare B[0][i] = p1;
        #local i = i + 1;
    #end
#end
