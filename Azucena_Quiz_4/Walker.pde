public class Walker
{
  float x, y;

  //position noise
  float tx = 0;
  float ty = 10000;

  //size noise
  float ts = 20000;

  //color noise
  float tr = 30000;
  float tg = 40000;
  float tb = 50000;

  void render()
  {
    float size = map(noise(ts), 0, 1, 5, 150);

    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = map(noise(tb), 0, 1, 0, 255);

    fill(r, g, b);
    noStroke();
    circle(x, y, size);
  }

  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);

    tx += 0.01;
    ty += 0.01;

    ts += 0.01;

    tr += 0.01;
    tg += 0.01;
    tb += 0.01;
  }
}
