class Player
{
  private final float CHARACTER_WIDTH = 100;
  private float characterHeight = CHARACTER_WIDTH;
  PImage player;
  
  public float x, y;
  private float vx = 0;
  private float vy = 0;
  private float accelerationX = 0;
  private float accelerationY = 0;
  private final float SPEED_LIMIT = 5; //speed limit while walking on ground
  private float friction = 20;
  private float gravity = 1;
  private final float JUMP_FORCE = -10; //adjust jumping height
  private boolean onGround = false;
  public String collisionSide = "bottom";
  
  public Player(float x, float y) {this.x = x;this.y = y;}//player = loadImage("stick-man.png");}
  
  public void display()
  {  
    faceDirection();
    gravity();
    jump();
    maxSpeed();
    //image(player, x, y);
    fill(#ee6c4d);
    noStroke();
    rect(x, y, CHARACTER_WIDTH, characterHeight);
    
  }
  
  private void faceDirection()
  {
    if (up)
    {
      accelerationX = 0.1;
      friction = 0.1;
      gravity = 0.3;
    }
    if (down)
    {
      accelerationX = -1;
      friction = 0.1;
      gravity = 0.3;
    }
    if (!down && !up)
    {
      accelerationX = 0;
      friction = 0.1;
      gravity = 0.3;
    }
  }
  
  private void gravity(){if (onGround) {vx *= friction; vx *= 1;} vy += gravity;}
  
  private void jump()
  {
    if (up && onGround)
    {
      vy += JUMP_FORCE;
      onGround = false;
      friction = 0.8;
    }
    vx += accelerationX;
    vy += accelerationY;
  }
  
  private void maxSpeed()
  {
    //limiting the vx and vy to the relative speed limit
    //resetting vx and vy to speed limit if they exceed the amount
    if (vx > SPEED_LIMIT){vx = SPEED_LIMIT; }
    if (vx < -SPEED_LIMIT){vx = -SPEED_LIMIT;}
    if (vy > SPEED_LIMIT * 2){vy = SPEED_LIMIT * 2;}
    x+=vx; y+=vy;
  }
  
  //
  //all functions about platfom and collision with boundaries
  //
  
  public void checkPlatforms()
  {
    //update for platform collisions
    if (collisionSide.equals("bottom") && vy >= 0){onGround = true; vy = -gravity;}
    else if (collisionSide.equals("top") && vy <= 0){vy = 0;}
    else if (collisionSide.equals("right") && vx >= 0){vx = 0;}
    else if (collisionSide.equals("left") && vx <= 0){vx = 0;}
    //if player is not colliding with the bottom, it is falling/jumping
    else if (!collisionSide.equals("bottom") && vy > 0)
    {onGround = false;}
  }
  
  public void checkBoundaries()
  {
    if (x <= 0){x =0;}
    if (x >= width-CHARACTER_WIDTH){x = width-CHARACTER_WIDTH;}
    if (y + characterHeight > height)
    {
      y = height - characterHeight;
      onGround = true;
      vy = -gravity;
    }
  }
  
}
