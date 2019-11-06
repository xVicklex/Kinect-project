class Orb
{
  int Size;
  int X;
  int Y;
  int Xdirection;
  int Ydirection;

  Orb()
  {
    Size = 20;
    X = width;
    Y = (int)random(0, height);
    Xdirection = -1;
    Ydirection = (int)random(-4, 4);
  }

  void draw()
  {
    ellipse( X, Y, Size, Size);
    X = X + Xdirection;
    Y = Y + Ydirection;

    if (Y<0)
    {
      ResetOrb();;
    }
    if (Y>height)
    {
     ResetOrb();
    }

    if (X>width)
    {
      
      ResetOrb();
    }
    if (X<0)
    {
      ResetOrb();
    }
  }








  void ResetOrb()
  {
    int Side = (int)random(1, 5 );

    if (Side == 1)
    {
      X = 0;
      Y = (int)random(0, height);
      Xdirection = (int)random(3, 8);
      Ydirection = (int)random(-8, 8);
    }

    if (Side == 2)
    {
      Y = height;
      X = (int)random(0, width);
      Ydirection = (int)random(-3, -8);
      Xdirection = (int)random(-8, 8);
    }

    if (Side == 3)
    {
      Y = (int)random(0, height);
      X = width;
      Ydirection = (int)random(-8, 8);
      Xdirection = (int)random(-8, -3);
    }

    if (Side == 4)
    {
      Y = 0;
      X = (int)random(0, width);
      Ydirection = (int)random(8, 8);
      Xdirection = (int)random(-3, -8);
    }
  }
}
