ArrayList datos;

PFont fontTitulo;
PFont fontEjes;

void setup(){
  size(600,600);
  //Título
  fontTitulo = loadFont("SansSerif-30.vlw");
  fontEjes = loadFont("SansSerif-14.vlw");

  textFont(fontTitulo, 30);
  text("Osciloscopio by Fran", 10, 30);

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
}
/*
void draw(){
  pushMatrix();
  background(0);
  // eje Y
  stroke(255);
  strokeWeight(2);
  line(20,20,20,height-20);
  // eje x
  stroke(255);
  strokeWeight(2);
  line(20,height-20,width-20,height-20);
  // 
  popMatrix();
}
*/
void draw(){
  //Grilla
  background(51);
  
  pushMatrix();
  int cols = 10;
  int rows = 10;
  int[][] grilla = new int[cols][rows];
  int posX = 160;
  int posY = 100;
  int ancho = 40;
  int altoTotal = posY;
  for (int i = 0; i < grilla.length; i++) {
    fill(0);
    stroke(255);
    
    for(int j = 0; j<grilla[i].length; j++){
      //println(myArray[i][j]);
      rect(posX,posY,ancho,ancho);
      posX+=ancho;
    }
    posX = 160;
    posY+=ancho;  
    altoTotal+=ancho;
  }
  
  //Números ejes
  for (int i = 0;i<grilla.length; i++){ 
    //Eje X
    fill(255);
    textFont(fontEjes, 14);
    text(i, posX+ancho*i, posY+40);
    //Eje Y
    text(i,posX-40, altoTotal-ancho*i);
  }
  
  //Simulación gráfica
  datos = new ArrayList();
  for(int i = 1;i<11;i++){
    datos.add(i);
  }
  /* 
  for(int i = 0;i<datos.size();i++){
    int valor = (int)datos.get(i);
    fill(255);
    ellipse(i,valor,10,10);
  }
  */
  
  popMatrix(); 
}