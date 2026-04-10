Walker[] walkers = new Walker[8];

PVector forceRight = new PVector(0.2, 0);

float muLow = 0.01f;
float muHigh = 0.4f;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  initWalkers();
}

void draw()
{
  background(80);

  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];

    // Friction
    float mu = muLow;
    if (w.position.x > 0)
    {
      mu = muHigh;
    }

    PVector friction = w.velocity.copy();
    friction.mult(-1);

    if (friction.mag() > 0)
    {
      friction.normalize();
      friction.mult(mu);
      w.applyForce(friction);
    }
    w.applyForce(forceRight);

    w.update();

    w.checkEdges();

    w.render();
  }
}

// MouseClick Reset
void mousePressed()
{
  initWalkers();
}

void initWalkers()
{
  int nWalkers = walkers.length;

  for (int i = 0; i < nWalkers; i++)
  {
    walkers[i] = new Walker();
    // increasing mass
    walkers[i].mass = i + 1;
    // scale based on mass
    walkers[i].scale = walkers[i].mass * 15;
    // position Y (top to bottom)
    float posY = 2 * (Window.windowHeight / (float)nWalkers) * (i - (nWalkers / 2.0));
    walkers[i].position = new PVector(Window.left, posY);
    // random color
    walkers[i].col = color(random(255), random(255), random(255));
  }
}
