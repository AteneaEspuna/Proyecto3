
class Triangulo extends Figura{

  Triangulo(int x_, int y_, float maxRest, float minRest){
    super(x_,y_,maxRest,minRest);
  }

  //El triangul
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(width/2, height/2);
    rotate(a);
    changeColor(pos.x, pos.y, a);
    fill(r,g,b);
    stroke(0);
    strokeWeight(0);
    triangle(-17,-17,0,17,17,-17);
    popMatrix();
  }//display

}//Cuadrado
