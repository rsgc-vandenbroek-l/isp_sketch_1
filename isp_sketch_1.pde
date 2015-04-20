// April 20, 2015, Class 21
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
float xM=1000;
float yM=0;

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
  } else {
    fill (360);
  }
  // Loop and draw all the circles
  int circle=0;
  while (circle< x.length) {// while circle is less than 5...
    ellipse (x[circle], y, 50, 50);
    circle= circle +1;
  }
  // mousecommand
  fill (value);
  ellipse (xM, yM, 50, 50);
  yM=yM+.5;
  xM=xM-1;
  // cursor appearence
  fill (100, 100, 100);
  noCursor();
  ellipse (mouseX, mouseY, 25, 25);
}

void mouseClicked() {
  if (mouseX >xM-25 && mouseX<xM+25 && mouseY>yM-25 && mouseY<yM+25)
  {  
    if (value == 200) {
      value = 0;
      score=score+1;
    } else {
      value = 200;
    }
  }
}
