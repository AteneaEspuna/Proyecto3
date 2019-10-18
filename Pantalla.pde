
class Pantalla {
  /** ATRIBUTOS **/
  int idPantalla;     //Indica la pantalla en la que se encuentra
  boolean limpiar;
  /** METODOS **/

  //Constructor
  Pantalla(){
    idPantalla = 0;
    limpiar = true;
  }//Pantalla

  void cambiarPantalla(int pantalla) {
    idPantalla = pantalla;
    limpiar = true;
  }//cambiarPantalla

  void dibujarPantalla() {
    switch(idPantalla){
      case 0:
        inicio();             //Nombre del juego
        break;
      case 1:
        instrucciones();      //Instrucciones
        break;
      case 2:
        dibujo();             //Dibujo
        break;
      case 3:
        fin();                //Conclucion del juego
        break;
      default:
    }
  }//dibujarPantalla

  //Muestra el nombre del programa
  void inicio(){
    //background(255);
    if(limpiar) {
      background(255);
      limpiar = false;
    }

    float x = random(0,width);
    float y = random(0,height);
    float w = random(20,50);
    color c = color( random(0,255), random(0,255), random(0,255), 128);

    fill(c);
    noStroke();

    ellipse(x,y,w,w);

    textSize(30+iteraciones*0.01);
    fill((int)100*sin(iteraciones),(int)100*sin(iteraciones),(int)100*cos(iteraciones));
    text("¡EL CAOS MUAJAJAJA!",230-iteraciones*0.065,135+iteraciones*0.01); //título.
    textSize(20);
    fill(0,(int)100*sin(iteraciones*10),(int)100*sin(iteraciones*10));
    text("Pulsa la barra de espacio para continuar",435,475); //Instrucciones.
  }//inicio

  //Le muestra al usuario las instrucciones del programa
  void instrucciones(){
    if(limpiar) {
      background(0);
      limpiar = false;
    }

    pushMatrix();
    //translate(x,y);
    rotate(iteraciones*PI/180);
    float x = random(-100,width);
    float y = random(-100,height);
    float w = random(10,100);
    noFill();
    stroke(255, 255, 255,100);
    rect(x, y, w, w);
    popMatrix();

    //Texto de Inicio
    fill(255);
    textSize(22);
    text("Descripción:", 50, 100);
    textSize(20);
    text(" - En este programa podras agregar diferentes figuras a la pantalla que tu vayas",50,130);
    text("seleccionando y tambien las puedes ir eliminando. Las figuras formaran una",75,150);
    text("imagen caotica que se guardara al finalizar.", 75, 170);
    textSize(22);
    text("Controles:", 50, 200);
    textSize(20);
    text("Cambiar entre figuras:", 50, 230);
    text(" * Circulo:",  80, 260);text("Pulsa 1", 220, 260);
    text(" * Cuadrado:", 80, 290);text("Pulsa 2", 220, 290);
    text(" * Triangulo:",80, 320);text("Pulsa 3", 220, 320);
    text(" * Estrella:", 80, 350);text("Pulsa 4", 220, 350);

    text("Agregar Figura:",  370, 230);
    text(" * Clic Izquierdo",380, 260);

    text("Borrar Figura:", 590, 230);
    text(" * Clic Derecho", 600, 260);

    text("Terminar:", 370, 300);
    text(" * Pulsa T / t", 390, 330);

    text("Guardar Imagen:", 590, 300);
    text(" * Pulsa G / g", 600, 330);

    text("Pantalla de Inicio:", 370, 370);
    text(" * Pulsa I / i", 390, 400);
    text("Precione espacio para comenzar", 500, 475);
  }//instrucciones

  //Se van agregando figuras que se van moviendo en el canvas
  void dibujo(){
    if(limpiar) {
      background(200);
      limpiar = false;
    }
    //Dibuja limites
    suelo.display();
    techo.display();
    izquierda.display();
    derecha.display();

    //Recorre la lista de figuras
    for (int i = figuras.size()-1; i >= 0; i--) {
      Figura f = figuras.get(i);
      //Dibuja las figuras en la pantalla
      f.display();
    }

    //Recorre la lista de cuadrados
    for (int i = cuadrados.size()-1; i >= 0; i--) {
      Cuadrado c = cuadrados.get(i);
      //Dibuja las figuras en la pantalla
      c.display();
    }

    //Recorre la lista de triangulos
    for (int i = triangulos.size()-1; i >= 0; i--) {
      Triangulo t = triangulos.get(i);
      //Dibuja las figuras en la pantalla
      t.display();
    }

    //Recorre la lista de estrellas
    for (int i = estrellas.size()-1; i >= 0; i--) {
      Estrella e = estrellas.get(i);
      //Dibuja las figuras en la pantalla
      e.display();
    }

    tipoFigura();
  }//dibujo

  //Muestra el resultado de la obra
  void fin(){
    if(limpiar) {
      //background(0);
      for (int i = figuras.size()-1; i >= 0; i--) {
        Figura f = figuras.get(i);
        //Si una figura esta cerca del mouse cuando se preciona clic derecho
        //se elimina y luego la remueve de la lista
        f.killBody();
        figuras.remove(i);
      }
      for (int i = cuadrados.size()-1; i >= 0; i--) {
        Cuadrado c = cuadrados.get(i);
        //Si una figura esta cerca del mouse cuando se preciona clic derecho
        //se elimina y luego la remueve de la lista
        c.killBody();
        cuadrados.remove(i);
      }
      for (int i = triangulos.size()-1; i >= 0; i--) {
        Triangulo t = triangulos.get(i);
        //Si una figura esta cerca del mouse cuando se preciona clic derecho
        //se elimina y luego la remueve de la lista
        t.killBody();
        triangulos.remove(i);
      }
      for (int i = estrellas.size()-1; i >= 0; i--) {
        Estrella e = estrellas.get(i);
        //Si una figura esta cerca del mouse cuando se preciona clic derecho
        //se elimina y luego la remueve de la lista
        e.killBody();
        estrellas.remove(i);
      }
      limpiar = false;
    }

    tipoFigura();
  }//fin

  void tipoFigura(){
    pushMatrix();
    translate(45,45);
    stroke(0);
    strokeWeight(0);
    fill(255,255,255,30);
    rect(0,0,80,80);
    fill(0);

    switch(tipoFigura){
      case 0:
        ellipse(0,0,30,30);
      break;
      case 1:
        rect(0,0,30,30);
      break;
      case 2:
        triangle(-17,-17,0,17,17,-17);
      break;
      case 3:
        //triangle(-17,-10,0,17,17,-10);
        //triangle(17,10,0,-17,-17,10);
        float angle = TWO_PI / 5;
        float halfAngle = angle/2.0;
        beginShape();
        for (float a = 0; a < TWO_PI; a += angle) {
          float sx = 0 + cos(a) * 25;
          float sy = 0 + sin(a) * 25;
          vertex(sx, sy);
          sx = 0 + cos(a+halfAngle) * 10;
          sy = 0 + sin(a+halfAngle) * 10;
          vertex(sx, sy);
        }
        endShape(CLOSE);
      break;
      case 4:
        textSize(17);
        fill(0,80);
        text("¿Guardar?",-40,0);
      break;
      default:
    }
    popMatrix();
  }

}//Pantalla
