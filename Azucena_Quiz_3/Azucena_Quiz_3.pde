void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  //X position (Gaussian) 
  float gaussianX = randomGaussian();
  float spreadFunc = width/6;
  float meanX = 0;
  float x = spreadFunc * gaussianX + meanX;

  //Y position (Random)
  float y = random(-height/2, height/2);

  //Circle Size (Gaussian)
  float gaussianSize = randomGaussian();
  float sizeFunc = 10;
  float sizeMean = 25;
  float circleSize = sizeFunc * gaussianSize + sizeMean;

  //Color Randomizer
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float a = random(10, 100);

  fill(r, g, b, a);
  noStroke();

  circle(x, y, circleSize);
}
