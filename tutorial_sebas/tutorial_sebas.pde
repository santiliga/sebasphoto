Pelota obstaculo;
Ball[] balls = new Ball[10];

void setup()
{
  size(640, 500);
  background(0);
  obstaculo = new Pelota(100, mouseY, 10, 45);
  for ( int i = 0; i < balls.length; i++)
  {
    float x = random(width);
    float y = random(height);
    int d = 15;
    balls[i] = new Ball(x, y, d);
  }
}

void draw()
{
  background(0);
  fill(255);
  obstaculo.display();
  for (int i = 0; i < balls.length; i++)
  {
    balls[i].mover();
    balls[i].display();
  }
}


class Ball
{
  float diametro;
  float x;
  float y;
  float speed;
  Ball(float TempX, float TempY, float TempD)
  {
    x = TempX;
    y = TempY;
    diametro = TempD;
    speed = 5;
  }
  void display()
  {
    stroke(0);
    ellipse(x, y, diametro, diametro);
    fill(255);
  }
  void mover()
  {
    x += speed;

    if (x > width || x < 0)
    {
      speed *= -1;
    }
    if (x < obstaculo.x && x + diametro/2 > obstaculo.x && y + diametro/2 > mouseY && y - diametro/2 < mouseY + obstaculo.Pelotaheight)
    {
      speed = -abs(speed);
    }
    if (x > obstaculo.x && (x - diametro/2) < (obstaculo.x + obstaculo.Pelotawidth) && y + diametro/2 > mouseY && y - diametro/2 < mouseY + obstaculo.Pelotaheight)
    {
      speed = abs(speed);
    }
  }
}

class Pelota
{
  float Pelotaheight;
  float Pelotawidth;
  float x;
  float y;
  Pelota(float pX, float pY, float pW, float pH)
  {
    x = pX;
    y = pY;
    Pelotawidth = pW;
    Pelotaheight = pH;
  }
  void display()
  {
    stroke(0);
    rect(x, mouseY, Pelotawidth, Pelotaheight);
    fill(255);
  }
}

