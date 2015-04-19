// April 10, 2015, Class 18
// Luke Vanden Broek

// moving circle
int y = 250;
int [] x= new int [1];
// font and time
PFont font;
int initialTime;
int interval=1000;
int score=0;
// mouse circle
int value=200;

void setup()
{
  // background
  size (1000, 500);
  colorMode (HSB, 360, 100, 100);
  background (230, 94, 99);
  // font
  textSize(50);
  font=createFont("Arial", 0); 
  initialTime=millis();
  // player shape movement
  int counter= 1;
  x[0]=200;
  while (counter<x.length) {// while counter is less than 50...
    x[counter] =x[counter-1]+10;
    counter=counter +1;
  }
}

void draw()
{
  // score
  background (230, 100, 100);
  if (millis() - initialTime > interval)
  {
    score++;
    initialTime = millis();
  }
  fill (360);
  text(score, 50, 50);
  // up command
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == UP)
      {
        y=y-5;
      }
    }
  } else { 
    y=y+5;
  }    
  // space command
  if (keyPressed) {
    if (key == ' ') {
      fill(0);
      y=y+5;
    }
  } else if (keyPressed== true) {
  } else {
    fill (360);
    y=y+5;
  }
  // Loop and draw all the circles
  int circle=0;
  while (circle< x.length) {// while circle is less than 5...
    ellipse (x[circle], y, 50, 50);
    circle= circle +1;
  }
  // mousecommand
  fill (value);
  ellipse (250, 50, 50, 50);
}

void mouseClicked() {
  if (mouseX >225 && mouseX<275 && mouseY>25 && mouseY<75)
  {  
    if (value == 200) {
      value = 0;
    } else {
      value = 200;
    }
  }
}
