Walker[] walkers = new Walker[100];

void setup()
{
  size(1280, 720);

  //SPAWN
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    //RANDOM POSITION
    walkers[i].position = new PVector(random(width), random(height));
    
    //RANDOM SCALE
    walkers[i].scale = random(10, 50);
  }
}

void draw()
{
  background(80);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }
}
