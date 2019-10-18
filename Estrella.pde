
class Estrella extends Figura{

  Estrella(int x_, int y_, float maxRest, float minRest){
    super(x_,y_,maxRest,minRest);
  }

  //Estrella
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(random(pos.x),pos.y);
    changeColor(pos.x, pos.y, a);
    fill(r,g,b);
    noStroke();
    //triangle(0, 0, radio, radio, radio*2, radio*2)
    float angle = TWO_PI / 5;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a_ = 0; a_ < TWO_PI; a_ += angle) {
      float sx = 0 + cos(a_) * 25;
      float sy = 0 + sin(a_) * 25;
      vertex(sx, sy);
      sx = 0 + cos(a_+halfAngle) * 10;
      sy = 0 + sin(a_+halfAngle) * 10;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    popMatrix();
  }//display

}//Cuadrado
