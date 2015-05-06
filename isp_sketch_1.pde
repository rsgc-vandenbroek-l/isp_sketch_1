// May 4, 2015, Class 25 //<>//
// Luke Vanden Broek

// player circle variables
int y = 250;
int x= 200;
// font and time variables
PFont font;
int initialTime;
int interval=1000;
int score=0;
// compuer circle variables
int value=200;
float yM= random (500);
float xM=1000;
float yM2=random(2);
float xM2=.75;
// menu item variables
boolean menu=true;
boolean aPortrait=true;
boolean bPortrait=true;
// obstacle variables
int xa = 1000;
float inSpace=random (75, 100);
float ya= random (-400, 0);
float y2a= ya+400+inSpace;
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
}

void draw()
{ 
  text("The Game", 375, 100);
  rect(100, 150, 300, 300);
  rect (600, 150, 300, 300);
  if (!menu) {
    background (230, 100, 100);
    // up command
    if (!aPortrait) {
      ellipse(x, y, 100, 100);
    } else if (!bPortrait) {
      ellipse(x, y, 50, 50);
    }
    // score
    if (millis() - initialTime > interval)
    {
      score++;
      initialTime = millis();
    }
    fill (360);
    text(score, 50, 50);
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
    // computer circle
    fill (value);
    ellipse (xM, yM, 50, 50); // coordinates for computer circle starting at random x position and y position of 0
    yM=yM+yM2; // moves computer circle down at random speed between 2 and 0
    xM=xM-xM2;
    // cursor appearence
    fill (100, 100, 100); // makes next ellipse green
    noCursor(); // hides the normal cursor
    ellipse (mouseX, mouseY, 25, 25); // puts ellipse where mouse cursor would usually be
    if (yM>500||xM<0) {
      yM=random (250);
      xM=1000;
      xM2=xM2+1;
      score=score-50; // score goes down by 20
    }
    if (y>500||y<0) {
      y=250;
      yM=random (250);
      xM=1000;
      xM2=.75;
      score=0; // score resets
      xa=1000;
    }
    // Change the horizontal position
    xa=xa-4;
    // Draw the rectangles on screen
    rect(xa, ya, 100, 400);// draws first rect
    rect(xa, y2a, 100, 400);// draws second rect with space in between
    if (xa<0) {
      inSpace= random(75, 100);
      xa=1000;// respawns at 1000
      ya=random (-400, 0);// resets height of top rect
      y2a=ya+400+inSpace;
    }
    
  }
}


void mouseClicked() {
  // aPortrait selected
  if (mouseX>100&&mouseY>150&&mouseX<400&&mouseY<550)
  {    
    if (menu) {
      menu = true;
      aPortrait=true;
    }
  }
  // otherwise make it false
  else if (aPortrait) {
    menu = false;
    bPortrait=false;
  }

  // bPortrait selected
  if (mouseX>600&&mouseX<900&&mouseY>150&&mouseY<550)
  {    
    if (menu) {
      menu = true;
      bPortrait=true;
    }
  }
  // otherwise make it true
  else if (bPortrait) {
    menu = false;
    aPortrait=false;
  }

  // computer circle clicked
  if (mouseX >xM-25 && mouseX<xM+25 && mouseY>yM-25 && mouseY<yM+25) // shows where mouse must click to start animation
  {  
    yM=random(250);
    xM=1000;
    xM2=xM2+1; // speeds up each time
    score=score+5; // causes score to increase by 5
    if (value == 200) { // color must be 200 to work
      value = 0; // color changes to 0 when clicked
    } else {
      value = 200; // colour reverts to 200 when clicked on again
    }
  }
}
