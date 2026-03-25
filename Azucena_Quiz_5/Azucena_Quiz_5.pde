void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector position = new PVector();
PVector speed = new PVector(5, 8);

void draw()
{
  background(255);
  moveAndBounce();
  
  fill(182, 52, 100);
  circle(position.x, position.y, 50);
}

void moveAndBounce()
{
  //Move
  position.add(speed);

  //Bounce horizontally
  if (position.x > Window.right || position.x < Window.left)
  {
    speed.x *= -1;
  }

  //Bounce vertically
  if (position.y > Window.top || position.y < Window.bottom)
  {
    speed.y *= -1;
  }
}
