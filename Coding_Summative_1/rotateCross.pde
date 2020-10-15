class rotateCross
{
  float obstacleSize;
  float rotation;
  float rotationSpeed;
  float initialX;
  float posY;
  PImage crossy;

  rotateCross ()
  {
    obstacleSize=random (30, 50);
    rotation=millis()/rotationSpeed;
    rotationSpeed=300.0;
    initialX=random(94, 706);
    posY=400;
    //crossy=loadImage("Cross Obstacle copy.png");
  }
  void draw()
  {
    imageMode(CENTER);
    background (255, 255, 255);
   // for (int i=0; i<9; i++)
    {
      crossy=loadImage("Cross Obstacle copy.png");
      posY=posY+random(3,6);
      pushMatrix();
      translate(initialX, posY); 
      rotate(millis()/600.0);
      image(crossy, 0, 0);
      popMatrix();
      if (posY>800)
      {
        posY=0;
        initialX=random(94, 706);
      }
    }

    //the "if you touch you loose part"
    if (dist(initialX, posY, mouseX, mouseY)<47.25)
    {
      scene=1;
    }
  }
}
