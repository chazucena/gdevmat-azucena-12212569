Walker w = new Walker();
Walker blackhole;
Walker[] walkers = new Walker[100];

// Reset control
boolean resetCondition = false;
int resetTimer = 0;

void setup()
{
  size(1920, 1080, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  spawnBlackHole();

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = createGaussianWalker();
  }
}

void draw()
{
  background(0);

  //DRAW BLACKHOLE
  blackhole.render();

  boolean absorbParts = true;

  for (int i = 0; i < walkers.length; i++)
  {
    Walker walker = walkers[i];

    if (walker == null) continue;

    absorbParts = false;

    //DIRECTION TO BLACKHOLE
    PVector correctionDirection = PVector.sub(blackhole.position, walker.position);
    float dist = correctionDirection.mag();

    correctionDirection.normalize();

    float strength = 10.0;
    correctionDirection.mult(strength);

    //MOVE PARTICLES
    walker.position.add(correctionDirection);

    walker.render();

    //DESPAWN AFTER PARTICLES ABSORBED
    if (dist < blackhole.scale * 0.4)
    {
      walkers[i] = null;
    }
  }

  //CONDITION WHEN ALL PARTICLES CONSUMED
  if (absorbParts && !resetCondition)
  {
    resetCondition = true;
    resetTimer = frameCount;
  }

  //RESPAWN DELAY
  if (resetCondition && frameCount - resetTimer > 60)
  {
    respawnSystem();
    resetCondition = false;
  }
}

//SPAWN BLACKHOLE
void spawnBlackHole()
{
  float x = random(Window.left, Window.right);
  float y = random(Window.bottom, Window.top);

  //BLACKHOLE SIZE & COLOR
  blackhole = new Walker(x, y, 50);
  blackhole.setColor(255, 255, 255, 255);
}


//RESPAWN BLACKHOLE
void respawnSystem()
{
  spawnBlackHole();

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = createGaussianWalker();
  }
}


//GAUSSIAN WALKER
Walker createGaussianWalker()
{
  float gaussianX = randomGaussian();
  float spreadX = width / 6;
  float x = spreadX * gaussianX;

  float y = random(Window.bottom, Window.top);

  float gaussianSize = randomGaussian();
  float size = 10 * gaussianSize + 25;

  Walker w = new Walker(x, y, size);
  w.setColor(random(255), random(255), random(255), random(50, 150));

  return w;
}
