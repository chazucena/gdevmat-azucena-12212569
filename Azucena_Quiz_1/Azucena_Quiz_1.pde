int globalVariable = 100;
int time = 10;
float amplitude = 45;
float frequency = 0.05;

//USE W,A,S,D TO ADJUST FREQUENCY AND AMPLITUDE

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan (PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

void draw()
{
  background(0);
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawSineWaveFunction();
  keyInput();
  
  time++;
}

void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for(int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}


//2. f(x) = -5x + 30 process
void drawLinearFunction()
{
  color purple = color (128, 0, 128);
  fill(purple);
  noStroke();
  for(int x = -200; x <= 200; x++)
  {
    circle(x, -5 * x + 30, 5);
  }
}


//1. f(x) = x^2 - 15x - 3 process
void drawQuadraticFunction()
{
  color yellow = color (255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for(float x = -300; x <= 300; x+=0.1f)
  {
    circle(x, (float)Math.pow(x, 2) + (x * 15) - 3, 5);
  }
}


//3. Sine Wave Function 
void drawSineWaveFunction()
{
  color green = color (0, 255, 0);
  fill(green);
  stroke(green);
  
  for(float x = -300; x <= 300; x += 1)
  {
    float y = amplitude * sin(frequency * (x + time));
    circle(x, y, 5);
  }
  
}

//Amplitude and Frequency Key Bindings
void keyInput()
{
  float ampChange = 1;
  float freqChange = 0.001;
  
  if (keyPressed)
  {
    if (key == 'w' || key == 'W')
      amplitude += ampChange;
      
    if (key == 's' || key == 'S')
      amplitude -= ampChange;
      
    if (key == 'd' || key == 'D')
      frequency += freqChange;
      
    if (key == 'a' || key == 'A')
      frequency -= freqChange;
  }

}
