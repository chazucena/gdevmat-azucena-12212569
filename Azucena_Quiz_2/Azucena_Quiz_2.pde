void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

Walker myWalker = new Walker();
Walker xWalker = new Walker();

void draw()
{
  //Random Walker 
  myWalker.randomWalk();
  myWalker.render();
  
  //Biased Random Walker
  xWalker.randomWalkBiased();
  xWalker.render();
}
