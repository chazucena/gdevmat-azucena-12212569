void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  PVector mouse = mousePos();
  mouse.normalize().mult(500);
  
  //Lightsaber Blade #1
  strokeWeight(15);
  stroke(255, 0, 0);  
  line(0, 0, mouse.x, mouse.y);
  
  strokeWeight(6);
  stroke(255, 255, 255);
  line(0, 0, mouse.x, mouse.y);
  println(mouse.mag());
  
  //Lightsaber Blade #2
  strokeWeight(15);
  stroke(255, 0, 0);
  line(0, 0, -mouse.x, -mouse.y);
  
  strokeWeight(6);
  stroke(255, 255, 255);
  line(0, 0, -mouse.x, -mouse.y);
  println(mouse.mag());
  
  //Lightsaber Handle
  strokeWeight(15);
  stroke(30,30,30);
  line(-mouse.x * 0.1, -mouse.y * 0.1, mouse.x * 0.1, mouse.y * 0.1);

  strokeWeight(10);
  stroke(75, 75, 75);
  line(-mouse.x * 0.1, -mouse.y * 0.1, mouse.x * 0.1, mouse.y * 0.1);

  
}
