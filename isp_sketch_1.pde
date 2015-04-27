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
boolean menu=true;
boolean archerPortrait=true;
boolean reaverPortrait=true;
int rXA=100;
int rY=150;
int rXR=600;
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
  text("The Game", 375, 100);
  rect(rXA, rY, 300, 300);
  rect (rXR, rY, 300, 300);
  if (!menu) {
    background (230, 100, 100);
    // player circle
    int circle=0;
    while (circle< x.length) {// while circle is less than 5...

      if (!archerPortrait) {
        ellipse (x[circle], y, 50, 50);
        circle= circle +1;
      }
      if (!reaverPortrait)
      {
        ellipse (x[circle], y, 100, 100);
        circle= circle +1;
      }
      // makes game paused befoe starting
      // score
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
      score=score-20; // score goes down by 20
    }
  }
}


void mouseClicked() {
// archer character selected
  if (mouseX>rXA&&mouseX<rXA+300&&mouseY>rY&&mouseY<rY+300)
  {    
    if (menu) {
      menu = true;
      archerPortrait=true;
    }
  }
  // otherwise make it true
  else {
    menu = false;
    archerPortrait=false;
  }
  // reaver character selected
  if (mouseX>100&&mouseX<400&&mouseY>150&&mouseY<450)
  {    
    if (menu) {
      menu = true;
      archerPortrait=true;
    }
  }
  // otherwise make it true
  else {
    menu = false;
    archerPortrait=false;
  }
  // computer circle clicked
  if (mouseX >r-25 && mouseX<r+25 && mouseY>yM-25 && mouseY<yM+25) // shows where mouse must click to start animation
  {  
    yM=random(250);
    r=1000;
    r3=r3+.1; // speeds up each time
    score=score+5; // causes score to increase by 5
    if (value == 200) { // color must be 200 to work
      value = 0; // color changes to 0 when clicked
    } else {
      value = 200; // colour reverts to 200 when clicked on again
    }
  }
}
