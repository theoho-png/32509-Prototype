class Platform
{
  public final float PLATFORM_HEIGHT = 25;
  public float platformWidth;
  public float x, y;
  
  public Platform(float x, float y, float platformWidth){this.platformWidth = platformWidth;this.x = x;this.y = y;}
  private void display(){noStroke();fill(#3d5a80);rectMode(CORNER);rect(x--, y, platformWidth, PLATFORM_HEIGHT);}
  public void setX(float x){this.x = x;}
}
