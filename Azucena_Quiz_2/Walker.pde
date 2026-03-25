class Walker
{
  float x;
  float y;
  
  //3. Change Random Color
  void render()
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float a = random(50,100);
    
    fill(r,g,b,a);
    noStroke();
    
    circle(x, y, 30);
  }
  
  //1. Random Walk 8-Directions
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0) y -= 10;        //UP RNG
    else if (rng == 1) y += 10;   //DOWN RNG
    else if (rng == 2) x -= 10;   //LEFT RNG
    else if (rng == 3) x += 10;   //RIGHT RNG
    else if (rng == 4) { x += 10; y -= 10; } //UP-RIGHT
    else if (rng == 5) { x -= 10; y -= 10; } //UP-LEFT
    else if (rng == 6) { x += 10; y += 10; } //DOWN-RIGHT
    else if (rng == 7) { x -= 10; y += 10; } //DOWN-LEFT
  }
  
  //2. randomWalkBiased RNG FUnction
  void randomWalkBiased()
  {
    float rng = random(1);
    
    if (rng < 0.4)
    {
      x += 10; //40% right
    }
    else if (rng < 0.6)
    {
      x -= 10; //20% left
    }
    else if (rng < 0.8)
    {
      y -= 10; //20% up
    }
    else
    {
      y += 10; //20% down
    }
  }
}
