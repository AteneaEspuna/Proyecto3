

void mousePressed() {

  switch(pantallas.idPantalla){
    case 0:
    break;
    case 1:
    break;
    case 2:
      //Genera una figura
      if (mousePressed && (mouseButton == LEFT)) {
        switch(tipoFigura){
          case 0:
            figuras.add(new Figura(mouseX,mouseY,0.5,1.5));
          break;
          case 1:
            cuadrados.add(new Cuadrado(mouseX,mouseY,0.9,1.1));
          break;
          case 2:
            triangulos.add(new Triangulo(mouseX,mouseY,0.1,0.8));
          break;
          case 3:
            estrellas.add(new Estrella(mouseX,mouseY,0.9,1.5));
          break;
          default:
        }
      }
      //Elimina la figura
      if (mousePressed && (mouseButton == RIGHT)) {
        switch(tipoFigura){
          case 0:
            //Recorre todas las figuras
            for (int i = figuras.size()-1; i >= 0; i--) {
              Figura f = figuras.get(i);
              //Si una figura esta cerca del mouse cuando se preciona clic derecho
              //se elimina y luego la remueve de la lista
              if (f.done()) {
                figuras.remove(i);
              }
            }
          break;
          case 1:
            //Recorre todas las figuras
            for (int i = cuadrados.size()-1; i >= 0; i--) {
              Figura c = cuadrados.get(i);
              //Si una figura esta cerca del mouse cuando se preciona clic derecho
              //se elimina y luego la remueve de la lista
              if (c.done()) {
                cuadrados.remove(i);
              }
            }
          break;
          case 2:
            //Recorre todas las figuras
            for (int i = triangulos.size()-1; i >= 0; i--) {
              Figura t = triangulos.get(i);
              //Si una figura esta cerca del mouse cuando se preciona clic derecho
              //se elimina y luego la remueve de la lista
              if (t.done()) {
                triangulos.remove(i);
              }
            }
          break;
          case 3:
            //Recorre todas las figuras
            for (int i = estrellas.size()-1; i >= 0; i--) {
              Figura e = estrellas.get(i);
              //Si una figura esta cerca del mouse cuando se preciona clic derecho
              //se elimina y luego la remueve de la lista
              if (e.done()) {
                estrellas.remove(i);
              }
            }
          break;
          default:
        }
      }
    break;
    case 3:
    break;
  }

}//mousePressed


void keyPressed() {

  switch(pantallas.idPantalla){
    case 0:
      //Pasa a la pantalla de juego
      if(key == ' '){
        pantallas.cambiarPantalla(1);
      }
    break;
    case 1:
      //Pasa a la pantalla de juego
      if(key == ' '){
        pantallas.cambiarPantalla(2);
      }
    break;
    case 2:
      switch(key) {
        case '1':
          tipoFigura = 0;
        break;
        case '2':
          tipoFigura = 1;
        break;
        case '3':
          tipoFigura = 2;
        break;
        case '4':
          tipoFigura = 3;
        break;
        case 'T':
        case 't':
          tipoFigura = 4;
          pantallas.cambiarPantalla(3);
        break;
        default:
      }
    break;
    case 3:
      if(key == 'G' || key == 'g') save("imagen.jpg");
      if(key == 'I' || key == 'i') {
        tipoFigura = 0;
        iteraciones = 0;
        pantallas.cambiarPantalla(0);
      }
    break;
  }

}
