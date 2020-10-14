class Rain
{
float x=random(0,800);
float y=random(-200,0);
float fallSpeed=2;
float wind=map(0,800,mouseX,1,5);

void draw()
{
  for (int i=0; i<300;i++)
  {
  stroke(197, 226, 247);
  strokeWeight(3);
  line(x,y,x+wind,y);
    y+=fallSpeed;
  x+=wind;
  }
}
}
