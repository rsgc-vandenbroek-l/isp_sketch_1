// April 2, 2015, Class 16
// Luke Vanden Broek

// font and time
PFont font;
int initialTime;
int interval=1000;
int score=0;


void setup()
{
// background
size (1000,500);
colorMode (HSB,360,100,100);
background (230,94,99);
// font
textSize(50);
font=createFont("Arial",0);
initialTime=millis();
}

void draw()
{
background (230,100,100);
  if (millis() - initialTime > interval)
  {
    score++;
    initialTime = millis();
  }

  text(score, 50, 50);
}
