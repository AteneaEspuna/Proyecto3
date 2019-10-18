
class Cuadrado extends Figura{

  Cuadrado(int x_, int y_, float maxRest, float minRest){
    super(x_,y_,maxRest,minRest);
  }

  //Muestra cuadro
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.y/2,pos.x/2);
    changeColor(pos.x, pos.y,a);
    noStroke();
    fill(r,g,b);
    rect(0,0,radio*2,radio*2);
    popMatrix();
  }//display

}//Cuadrado
