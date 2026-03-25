class Walker
{
  PVector position;
  float scale;
  float r, g, b, a;

  Walker()
  {
    position = new PVector();
    scale = 50;
  }

  Walker(float x, float y, float scale)
  {
    position = new PVector(x, y);
    this.scale = scale;
  }

  void render()
  {
    fill(r, g, b, a);
    circle(position.x, position.y, scale);
  }

  void setColor(float r, float g, float b, float a)
  {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }
}
