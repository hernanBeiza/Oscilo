class Grilla{
  
  int x;
  int y;
  
  PShape path;
  boolean pathDraw = false;
  
  Grilla(int posX, int posY){
    println("Grilla");  
    this.x = posX;
    this.y = posY;  
    
    // Create the shape
    this.crearLinea();
  }
  
  private void crearLinea(){
    path = createShape();
    path.beginShape();
    // Set fill and stroke
    path.noFill();
    path.stroke(255,255,0);
    path.strokeWeight(2);
  }
  
  void draw(){
    translate(this.x,this.y);
    pushMatrix();
      fill(0,255,0);
      rect(0,0,400,400);

      int cols = 10;
      int rows = 10;
      int[][] grilla = new int[cols][rows];
      int posX = 0;
      int posY = 0;
      int ancho = 40;
      int altoTotal = posY;
      for (int i = 0; i < grilla.length; i++) {
        fill(0);
        stroke(0,255,0);
      
        for(int j = 0; j<grilla[i].length; j++){
          //println(myArray[i][j]);
          rect(posX,posY,ancho,ancho);
          posX+=ancho;
        }
        posX = 0;
        posY+=ancho;  
        altoTotal+=ancho;
      }
      // Línea del centro
      pushMatrix();
        stroke(255,0,0);
        line(0,200,400,200);
      popMatrix();
    
      //Números ejes
      /*
      for (int i = 0;i<grilla.length; i++){ 
        //Eje X
        fill(255);
        textFont(fontEjes, 14);
        text(i, posX+ancho*i, posY+40);
        //Eje Y
        text(i,posX-40, altoTotal-ancho*i);
      }
      */
    
  
    popMatrix(); 
      
  }
  
  private void graficar(int tiempo, int voltage){
    //println("Grilla: graficar");
    pushMatrix();
      stroke(0,255,0);
      fill(0,255,0);
      int posX = tiempo*40;
      int posY;
      if(voltage>0){
        //println("+");
        posY = (int)map(voltage,0,5,200,0);   
      } else if(voltage==0){
        posY = 200;
      } else {
        //println("-");
        posY = (int)map(voltage,-5,0,400,200);        
      }
      //println("posY " + posY);
      ellipse(posX,posY,10,10); 
      if(pathDraw){  
        path.vertex(posX,posY);
        shape(path);
      }
    popMatrix();  
  }
  void graficarDatos(ArrayList datos){    
    // Crear
    for(int i = 0;i<datos.size();i++){
      //println(datos.get(i));
      int valorPote = (int)datos.get(i);
      //println(valorPote);
      int valor = (int)map(valorPote,0,1023,-5,5);
      //println(valor);
      this.graficar(i,valor);  
    }
    // Eliminar  
    if(datos.size()>10){
      datos.remove(0);
      this.crearLinea();
    }
    if(datos.size()>=10){
      pathDraw = true;
    }
    
  }
  
}