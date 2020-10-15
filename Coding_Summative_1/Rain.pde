class Rain 
{
  float x;
  float y; 
  float z; 
  float longness;
  float speed;


 
  Rain() 
  {
    x  = random(width); 
    y  = random(-1020, -100); 
    longness=10;
    speed  = 3;

  }

  void down() 
  { 
    y = y + speed; 

    if (y > height) 
    { 
      y = random(-200, -100);
    }
  }

  void create() 
  {
    strokeWeight(2); 
    stroke(197, 226, 247);
    line(x,y,x, y+longness); 
  }
}
