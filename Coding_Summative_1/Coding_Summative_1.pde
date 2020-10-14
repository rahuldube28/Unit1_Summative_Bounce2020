rotateCross rotateCross=new rotateCross();
Rain Rain=new Rain();
int scene=2;
PImage Rocket;
PImage Taxi;
PImage rTaxi;
PImage Street;
float rocketX;
float rocketY;
float bounceX=random(300, 400);
float bounceY=random(300, 400);
float speed;
float xDir=5;
float yDir=5;
float xObs;
float yObs;
float delay = 0.05;
float distance;
boolean hard;
float x=random(0, 800);
float y=random(-300, -100);
float fallSpeed=0.5;
float wind=3;
void setup()
{
  size(800, 800);
  rectMode(CENTER);
  //for (int i=0; i<Rain.length; i++)
  //{
  //Rain[i].draw();
  //}
  imageMode(CENTER);
  Rocket=loadImage("Rocket 2.png");
  Taxi=loadImage("Taxi.png");
  Street=loadImage("10DowningStreet.jpg");
  rTaxi=loadImage("Taxi copy.png");
}


void draw()
{
  if (scene==0)
  {

    rocketX=mouseX;
    rocketY=mouseY;

    background (255, 255, 255);
    if (hard)
    {
      delay=0.2;
    }
    //rotating cross
    rotateCross.draw();
    //bouncing ball
    bounceX+=xDir;
    bounceY+=yDir;
    ellipse(bounceX, bounceY, 66, 66);
    if (((dist(bounceX, bounceY, mouseX, mouseY))<33))
    {

      scene=1;
    }
    if (bounceX>767)
    {
      xDir=xDir*-1;
    }
    if (bounceY>767)
    {
      yDir=yDir*-1;
    }
    if (bounceX<33)
    {
      xDir=xDir*-1;
    }
    if (bounceY<33)
    {
      yDir=yDir*-1;
    }
    //delayed movement ball
    float targetX = mouseX;
    float dx = targetX - xObs;
    xObs = xObs+ (dx * delay);
    yObs=yObs+10;
    //ball
    ellipse(xObs, yObs, 66, 66);
    if (yObs>800)
    {
      yObs=0;
    }
    fill(1);
    if (((dist(xObs, yObs, mouseX, mouseY))<10))
    {

      scene=1;
    }
    image(Rocket, mouseX, mouseY);
    text("Click and hold while playing if you want a challenge", 400, 400);
    text("If you see red screen, you died. Press 0 to try again and press 2 to advance. ", 400, 380);
    if (scene==1)
    {
      background(255, 0, 0);
    }
  }
  if (scene==2)
  {
    image(Street, 400, 400);
    image(Taxi,200,740);
    image(rTaxi,600,740);
  }
}


void mousePressed()
{
  hard=true;
}
void keyPressed()
{
  if (key == '0')
  {
    scene = 0;
  }
  if (key == '1')
  {
    scene = 1;
  }
  if (key=='2')
  {
    scene=2;
  }
}
