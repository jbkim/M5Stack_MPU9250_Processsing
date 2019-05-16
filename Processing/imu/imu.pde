import processing.serial.*;

Serial myPort;

float x=0;
float y=0;
float z=0;

void setup() {
    println(Serial.list());   
    myPort = new Serial(this, Serial.list()[6], 115200); //Change the serial port number 
    myPort.bufferUntil('\n');
    noStroke();
    size(600,600,P3D);    
} 

void draw() {  
    background(0); 
    lights();  

    pushMatrix();  
    fill(0,255,0); 
    translate(width/2,height/2,-100);
    rotateX(radians(y));
    rotateY(radians(x));
    rotateZ(radians(z));
    
    box(200,100,200);
    popMatrix();
}
 
void serialEvent(Serial p) { 
  String inString = myPort.readStringUntil('\n');    
  String[] inStrings = split(inString, ',');
  x=float(inStrings[0]);
  y=float(inStrings[1]);
  z=float(inStrings[2]);  
}
