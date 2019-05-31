def geraMatriz(tam, tam_x, tam_y):
    for i in range(0, tam):
        print("{")
        geraLinha(4, i * 3, i * 3, i * 3, 5)
        print("},")

def geraLinha(tam, val_x, val_y, val_z, dist):
    for i in range(0, tam):
        print("<" + str(val_x + i * dist) + ", " + str(val_y + i * dist) + ", " + str(val_z + i * dist) + ">, ", end='')  

a_ini = [0, 0, 0]
a_fim = [15, 0, 0]
b_ini = [0, 15, 0]
b_fim = [15, 15, 0]

c = [[]]

def geraMalha(a_ini, a_fim, b_ini, b_fim):
    partes = 4
    salto = (b_ini - a_ini)/partes
    for i in range(0, 4):
        for j in range(0, 4):
            print("[" + str(i) + "|" + str(j) + "]", end='')
        print("")
    
    