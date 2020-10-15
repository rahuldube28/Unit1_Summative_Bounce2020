import processing.sound.*;//sound library
rotateCross rotateCross=new rotateCross();//Cross class
Rain[] rains = new Rain[1000];//Rain class
int scene=0;
PImage Rocket;
PImage Umbrella;
boolean deploy;
SoundFile sound;
int x;
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
PImage BikeBoy;
void setup()
{
  size(800, 800);
  rectMode(CENTER);
  for (int i = 0; i < 1000; i++) 
  { 
    rains[i] = new Rain();
  }
  imageMode(CENTER);
  //images
  Rocket=loadImage("Rocket 2.png");
  Taxi=loadImage("Taxi.png");
  rTaxi=loadImage("Taxi copy.png");
  BikeBoy=loadImage("Boy on Bike.png");
  Umbrella=loadImage("Deploy.png");
  //loading sound files
  sound = new SoundFile(this, "rain-03.wav");
  sound.loop();
}


void draw()
{
  if (scene==0)
  {
    sound.amp(0);
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
    text("If you see red screen, you died. Press 0 to try again and press 2 to advance. ", 350, 380);
  }
  
  if (scene==1)
  {
    sound.amp(0);
    background(255, 0, 0);
  }
  
  if (scene==2)
  {
    background(1);
    sound.amp(0.1);
    //Rain Array
    for (int i = 0; i < 1000; i++) 
    {
      rains[i].down();
      rains[i].create();
    }
    //sidewalk
    stroke(1);
    fill(204, 207, 209);
    rect(400, 775, 820, 50);
    //BikeBoy Image
    image(BikeBoy, 48.5+x, 750);
    if (x>width)
    {
      scene=3;
    }
    //deploy Umbrella
    if (deploy)
    {
      image(Umbrella, 65+x, 700);
    }
    fill(255, 255, 255);

    text("It's raining! Press 'u' to deploy your umbrella and 'd' to move to the right.", 100, 750);
  }
  if (scene==3)
  {
    background(1);
    sound.stop();
    text("I hope you enjoyed it!",400,400);
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
  if (key=='d')
  {
    x+=2;
  }
  if (key=='u')
  {
    deploy=true;
  }
}
