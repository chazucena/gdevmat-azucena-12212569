public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;

  public Walker()
  {
    position = new PVector();
    scale = 50;
  }

  public void update()
  {
    //Direction toward mouse
    PVector mouse = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(mouse, this.position);

    direction.normalize();
    //Scale acceleration
    direction.mult(0.2);
    this.acceleration = direction;
    this.velocity.add(this.acceleration);
    this.velocity.limit(this.velocityLimit);
    this.position.add(this.velocity);
  }

  public void render()
  {
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    if (this.position.x > width)
    {
      this.position.x = 0;
    }
    else if (this.position.x < 0)
    {
      this.position.x = width;
    }
    
    if (this.position.y > height)
    {
      this.position.y = 0;
    }
    else if (this.position.y < 0)
    {
      this.position.y = height;
    }
  }
}
