Walker[] walkers = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();

    // Mass 1 to 10
    walkers[i].mass = i + 1;

    // Scale based on mass
    walkers[i].scale = walkers[i].mass * 15;
    // Position
    walkers[i].position = new PVector(-500, 200);

    // Color Randomizer
    walkers[i].col = color(random(255), random(255), random(255));
  }
}

void draw()
{
  background(80);

  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];
    w.applyForce(wind);
    w.applyForce(gravity);

    w.update();

    // Newton's 3rd Law Bounce on Edge
    w.checkEdges();
    w.render();
  }
}
