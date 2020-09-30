

class GamePlay
{
  
  public Player p;
  public ArrayList<Platform> platforms = new ArrayList<Platform>();
  
  GamePlay(float pSpawnX, float pSpawnY){p = new Player(pSpawnX, pSpawnY);}
  
  void display(){p.display();platformDetection();outOfFrame();}
  void platformSetup(float x, float y, float w){platforms.add(new Platform(x, y, w));}
  void platformDetection()
  {
    for (int i = 0; i < platforms.size(); ++i)
    {collisions(p,platforms.get(i));p.checkPlatforms();platforms.get(i).display();}
    p.checkBoundaries();
  }
  
  void outOfFrame()
  {
    for (int i = 0; i < platforms.size(); ++i)
    {
      if (platforms.get(i).x <= -platforms.get(i).platformWidth)
        platforms.get(i).setX(SCREEN_WIDTH);
    }
  }
  
  public void collisions(Player player, Platform platforms)
  {
    float x = (player.x+player.CHARACTER_WIDTH/2) - (platforms.x + platforms.platformWidth/2);
    float y = (player.y+player.characterHeight/2) - (platforms.y + platforms.PLATFORM_HEIGHT/2);
  
    float combinedHalfWidths = player.CHARACTER_WIDTH/2 + platforms.platformWidth/2;
    float combinedHalfHeights = player.characterHeight/2 + platforms.PLATFORM_HEIGHT/2;
  
    if (abs(x) < combinedHalfWidths) //using abs so negatives value will not affect if else
    {
      if (abs(y) < combinedHalfHeights)
      {
        if (combinedHalfWidths - abs(x) >= combinedHalfHeights - abs(y))
        {
          if (y > 0){player.collisionSide = "top";player.y += combinedHalfHeights - abs(y);}
          else{player.collisionSide = "bottom";player.y -= combinedHalfHeights - abs(y);}
        }
        else
        {
          if (x > 0){player.collisionSide = "left";player.x += combinedHalfWidths - abs(x);}
          else{player.collisionSide = "right";player.x -= combinedHalfWidths - abs(x);}
        }
      }
    }
    else{player.collisionSide = "none";}
  }
  



}
