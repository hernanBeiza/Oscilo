import cc.arduino.*;
import org.firmata.*;

import processing.serial.*;

ArrayList datos;

PFont fontTitulo;
PFont fontEjes;

Grilla miGrilla;

Serial port; //Nombre del puerto serie
float valor = 0;
Arduino arduino;

void setup(){
  size(600,600);
  frameRate(10);
  background(0);
  //Comunicación Serial
  //Visualiza los puertos serie disponibles en la consola de abajo
  //println(Serial.list()); 
  //port = new Serial(this, Serial.list()[1], 57600); 
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  arduino.digitalWrite(13, Arduino.HIGH);

  //Título
  fontTitulo = loadFont("SansSerif-30.vlw");
  fontEjes = loadFont("SansSerif-14.vlw");

  textFont(fontTitulo, 1);
  text("Osciloscopio by Fran", 10, 30);

  miGrilla = new Grilla(100,100);

  /*
  int[][] myArray = {  {236, 189, 189,   0},
                     {236,  80, 189, 189},
                     {236,   0, 189,  80},
                     {236, 189, 189,  80}  };
                     
  int posX = 0;
  int posY = 0;
  int ancho = 30;
  for (int i = 0; i < myArray.length; i++) {
    for(int j = 0; j<myArray[i].length; j++){
      //println(myArray[i][j]);
      fill(myArray[i][j]);
      rect(posX,posY,ancho,ancho);
      posX+=ancho;
    }
    posX = 0;
    posY+=ancho;    
  }
  */
  //Datos capturados de Arduino
  datos = new ArrayList();
  /*
  println("Simulación desordenada");
  for(int i = 0;i<10;i++){
    int voltage = floor(random(-5,5));
    datos.add(voltage);
    int posY;
    if(voltage>=0){
      //println("+");
      posY = (int)map(voltage,0,5,0,200);        
    } else {
      //println("-");
      posY = (int)map(voltage,-5,0,400,200);        
    }
    println(voltage+ " " + posY);
  }
  println("Simulación ordenada");
  for(int i = -5;i<6;i++){
    int voltage = i;
    int posY;
    if(voltage>=0){
      //println("+");
      posY = (int)map(voltage,0,5,0,200);        
    } else {
      //println("-");
      posY = (int)map(voltage,-5,0,400,200);        
    }
    println(voltage+ " " + posY);
  }
  */
  //println(datos);
}

void draw(){
  //saveFrame("frames/####.tif");
  // Recibir datos del Arduino 
  // Si hay algún dato disponible en el puerto
  /*
  if(port.available() > 0) {
     valor = port.read();
     println("Arduino pote " + valor);
   } else {
     println("Puerto no disponible");
   }
   */
  valor = arduino.analogRead(5);
  println((int)valor);
  datos.add((int)valor);
  //println("draw");
  background(0);
  //Grilla
  //int voltage = floor(random(-5,5));
  //datos.add(voltage);  
  //Graficar
  miGrilla.draw();   
  if(datos.size()>0){   
    miGrilla.graficarDatos(datos);
  }
  /*
  if(datos.size()>0){   
    for(int i = 0;i<datos.size();i++){
      //println(datos.get(i));
      int valorPote = (int)datos.get(i);
      println(valorPote);
      int valor = (int)map(valorPote,0,1023,-5,5);
      println(valor);
      miGrilla.graficar(i,valor);  
    }
  }
  //Eliminar  
  if(datos.size()>10){
    datos.remove(0);
  }
  */
  
}