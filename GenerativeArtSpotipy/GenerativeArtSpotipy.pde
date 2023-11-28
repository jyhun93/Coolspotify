// We run the sketch once, to generate one artwork from our playlist
// This saves and the sketch closes

// Importing the Libaries
import netP5.*;
import oscP5.*;

// Creating our library variables
OscP5 oscP5;
NetAddress myRemoteLocation;

// Initializing variables for incoming Data
int age; // affect: COLOR
float tempo; // affect: SHAPE
float loudness; // affect: SCALE
//float Nloudness;


// We can create different colour palettes to set the tone based on age
color[] paletteYoung = {#C0C0C0, #9370DB, #FF0000};
color[] paletteMiddle = {#48D1CC, #ADFF2F, #FFFACD};
color[] paletteOlder = {#9400D3, #BA55D3, #FFEBCD};
int c1, c2, c3;

void setup() {

  size(1000, 1000, P2D);
  pixelDensity(1);
  frameRate(1);

  oscP5 = new OscP5(this, 7771); // Start listening for incoming messages
  myRemoteLocation = new NetAddress("10.106.33.118", 7771);  // Speak to this
}

void draw() {

  c1 = int(random(paletteYoung.length));
  c2 = int(random(paletteMiddle.length));
  c3 = int(random(paletteOlder.length));

  // 1. COLOUR

  if (age >= 69 && age <= 95) {
    background(paletteOlder[c3]);
  }

  if (age >= 43 && age <= 68) {
    background(paletteMiddle[c2]);
  }

  if (age >= 25 && age <= 42) {
    background(paletteYoung[c1]);
  }

  float scale = 40;
  int spacing = 40;

  for (int x = 0; x < width; x = x+spacing) {
    for (int y = 0; y < height; y = y+spacing) {


      noStroke();
      fill(0);

      // 3. SHAPE
      ellipseMode(CORNER);
      ellipse(x, y, scale, scale);


      //render();
    }
  }
}


void oscEvent(OscMessage theOscMessage) {
  age = theOscMessage.get(0).intValue();
  tempo = theOscMessage.get(1).floatValue();
  loudness = theOscMessage.get(2).floatValue();
  
   //Nloudness = map(loudness, -11, 11, 0, 1);


  println("Age = " + age, "Tempo = " + tempo, "Loudness = " + loudness);
}




//void render() {
// save and export the artwork here
//}`
