// April 20, 2015, Class 21
// Luke Vanden Broek

// player circle variables
int y = 250;
int [] x= new int [1];
// font and time variables
PFont font;
int initialTime;
int interval=1000;
int score=0;
// compuer circle variables
int value=200;
float yM= random (500);
float r=1000;
float r2=random(2);
float r3=.75;

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
        y=y-5; // moves player circle up when up is clicked
      }
    }
  } else { 
    y=y+5; // moves player circle down when up released
  } 
  // space command
  if (keyPressed) {
    if (key == ' ') {
      fill(0);
      y=y+5; // turns player circle black when space is clicked, however forces
    }
  } else {
    fill (360); // returns player circle to white when space is released
  }
  // player circle
  int circle=0;
  while (circle< x.length) {// while circle is less than 5...
    ellipse (x[circle], y, 50, 50);
    circle= circle +1;
  }
  // computer circle
  fill (value);
  ellipse (r, yM, 50, 50); // coordinates for computer circle starting at random x position and y position of 0
  yM=yM+r2; // moves computer circle down at random speed between 2 and 0
  r=r-r3;
  // cursor appearence
  fill (100, 100, 100); // makes next ellipse green
  noCursor(); // hides the normal cursor
  ellipse (mouseX, mouseY, 25, 25); // puts ellipse where mouse cursor would usually be
  if (yM>500||r<0) {
    yM=random (250);
    r=1000;
    score=score-5; // score goes down by 5
  }
}

void mouseClicked() {
  // computer circle clicked
  if (mouseX >r-25 && mouseX<r+25 && mouseY>yM-25 && mouseY<yM+25) // shows where mouse must click to start animation
  {  
    yM=random(250);
    r=1000;
    r3=r3+.1; // speeds up each time
    if (value == 200) { // color must be 200 to work
      value = 0; // color changes to 0 when clicked
      score=score+3; // causes score to increase by 3
    } else {
      value = 200; // colour reverts to 200 when clicked on again
    }
  }
}
