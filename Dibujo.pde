//Librerias
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
import processing.sound.*;

SoundFile sonido;

//box2D
Box2DProcessing box2d;
//Declaracion de pantallas
Pantalla pantallas;
//Declaracion de los muros
Muro suelo;
Muro techo;
Muro izquierda;
Muro derecha;
//Arregllos de las figuras
ArrayList<Figura> figuras;
ArrayList<Cuadrado> cuadrados;
ArrayList<Triangulo> triangulos;
ArrayList<Estrella> estrellas;

//Variables
int tipoFigura;
int iteraciones;

void setup(){
  size(850,480);
   sonido = new SoundFile(this, "sonido.mp3");
   sonido.play();
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0,-4);
  // Turn on collision listening!
  box2d.listenForCollisions();
  //Se llama al constructor de pantallas crear la pamtalla inicializandola
  //con la primera pantalla
  pantallas = new Pantalla();
  //Se llama al constructor de los muros
  suelo = new Muro(width/2, height-5, width, 10);
  techo = new Muro(width/2, 0, width-5, 10);
  izquierda = new Muro(0, height/2, 10, height);
  derecha = new Muro(width-5, height/2, 10, height);

  println(height);
  //Crea las listas de figuras
  figuras = new ArrayList<Figura>();
  cuadrados = new ArrayList<Cuadrado>();
  triangulos = new ArrayList<Triangulo>();
  estrellas = new ArrayList<Estrella>();

  tipoFigura = 0;
  iteraciones = 0;
}

void draw(){
  //background(255);

  // We must always step through time!
  box2d.step();
  pantallas.dibujarPantalla();
  println(pantallas.idPantalla);
  iteraciones++;

}
