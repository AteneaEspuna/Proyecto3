
class Figura {
  /** ATRIBUTOS **/
  //Posicion
  int x;          //Posicion de la figura en X
  int y;          //Posicion de la figura en X
  int angulo;     //Angulo de rotacion
  //Color en RGB y alfa para transparencia
  int r;
  int g;
  int b;
  int alfa;
  //Box2D
  Body body;                //Cuerpo para poder ver si hay una colicion
  float radio;                  //Radio que tendra el cuerpo
  boolean delete = false;   //Sirve para indicar si se conserva o se borra el objeto


  /** METODOS **/
  //Constructor
  Figura (int x_, int y_, float minRest, float maxRest){
    x = x_;
    y = y_;
    radio = 15;
    makeBody(x, y, radio, minRest, maxRest);
    body.setUserData(this);
  }//Figura


  //Destruye la Figura
  void killBody() {
    box2d.destroyBody(body);
  }//killBody

  //Indica que el objero se debe destruir
  void delete() {
    delete = true;
  }//delete

  //Cambia el color de la semilla
  void changeColor(float x_,float y_,float angulo_) {
    r = (int)(125*(sin(x_)+1));
    g = (int)(125*(cos(y_)+1));;
    b = (int)(125*(sin(x_ - y_)+1));;
    alfa = (int)angulo_;
  }//changeColor

  //Indica si la Figura se debe eliminar o no
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (mouseX < pos.x+20 && mouseX > pos.x-20 && mouseY < pos.y+20 && mouseY > pos.y-20) {
      killBody();
      return true;
    }
    return false;
  }

  // círculo
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    changeColor(pos.x, pos.y, a);
    fill(r,g,b);
    stroke(0);
    strokeWeight(0);
    ellipse(0, 0, radio*2, radio*2);
    //Genera una linea que permite ver la rotacion
    //line(0, 0, radio, 0);
    popMatrix();
  }//display

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r, float minRest, float maxRest) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.001;
    fd.restitution = random(minRest,maxRest);

    // Attach fixture to body
    body.createFixture(fd);
    body.setAngularVelocity(random(-10, 10));
  }//makeBody

}//Figura
