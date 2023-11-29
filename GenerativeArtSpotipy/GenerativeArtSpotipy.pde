// We run the sketch once, to generate one artwork from our playlist
// This saves and the sketch closes

// Importing the Libaries
import netP5.*;
import oscP5.*;

// Creating our library variables
OscP5 oscP5;
NetAddress myRemoteLocation;

// Init variables for incoming Data
int age;
float tempo;
float loudness;

// Mapped Data
float Mloudness;
//float Mtempo;

// Select a Colour Palette
color[] palette60s = {#d34619, #f1aa3d, #7b8d32};
color[] palette80s = {#ba88bc, #f5e12b, #5ac0c8};
color[] palette00s = {#447ec1, #ea4d7b, #4cb05c};
int c1, c2, c3;

void setup() {

  size(1000, 1000, P2D);
  pixelDensity(1);
  frameRate(3);

  stroke(0);
  strokeWeight(2);
  ellipseMode(CORNER);
  rectMode(CORNER);


  oscP5 = new OscP5(this, 7771); // Start listening for incoming messages
  myRemoteLocation = new NetAddress("10.106.32.14", 7771);  // Speak to this
}

void draw() {

  c1 = int(random(palette00s.length));
  c2 = int(random(palette80s.length));
  c3 = int(random(palette60s.length));

  // 1. COLOUR
  if (age >= 69 && age <= 95) {
    background(palette60s[c3]);
  } else if (age >= 43 && age <= 68) {
    background(palette80s[c2]);
  } else if (age >= 25 && age <= 42) {
    background(palette00s[c1]);
  } else {
    background(0);
  }


  Mloudness = map(loudness, -30, 30, 10, 100);
  int spacing = int(Mloudness);
 

  for (int x = 0; x < width; x = x+spacing) {
    for (int y = 0; y < height; y = y+spacing) {

      if (age >= 69 && age <= 95) {
        fill(palette60s[c3]);

        if (tempo < 120) {
          ellipse(x, y, Mloudness, Mloudness);
        } else if (tempo >= 120) {
          rect(x, y, Mloudness, Mloudness);
        }
      }

      if (age >= 43 && age <= 68) {
        fill(palette80s[c2]);

        if (tempo < 120) {
          ellipse(x, y, Mloudness, Mloudness);
        } else if (tempo >= 120) {
          rect(x, y, Mloudness, Mloudness);
        }
      }

      if (age >= 25 && age <= 42) {
        fill(palette00s[c1]);
        if (tempo <120) {
          ellipse(x, y, Mloudness, Mloudness);
        } else if (tempo >= 120) {
          rect(x, y, Mloudness, Mloudness);
        }
      }
    }
  }

  //render();
}


void oscEvent(OscMessage theOscMessage) {
  age = theOscMessage.get(0).intValue();
  tempo = theOscMessage.get(1).floatValue();
  loudness = theOscMessage.get(2).floatValue();
   //Mtempo = map(tempo, 110, 120, 0, 1);

  println("Age = " + age, "Loudness = " + loudness, "Tempo= " + tempo);
}


//void render() {
// save and export the artwork here
//}
