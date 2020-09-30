import processing.video.*;

boolean up = false, down = false, left = false, right = false;
final int SCREEN_WIDTH = 1920, SCREEN_HEIGHT= 1000;

PImage arrive;
Movie movie;
GamePlay game = new GamePlay(600,50);

void setup()
{
  arrive = loadImage("train.png");
  movie = new Movie(this, "train.mov");
  movie.play();
  platformSetup();
}

void settings(){size(SCREEN_WIDTH,SCREEN_HEIGHT);}

void draw()
{
  if (movie.time()>= 20.0)
    end();
   else
    {image(movie, 0,0);game.display();}
}

void movieEvent(Movie m){m.read();}

void platformSetup()
{
  game.platformSetup(53,276, 300);
  game.platformSetup(462, 256,190);
  game.platformSetup(764,632,500);
  game.platformSetup(1452,926,300);
  game.platformSetup(1776,808,200);
  game.platformSetup(1300,582,400);
  game.platformSetup(690,403,200);
}

void end()
{
  noStroke();fill(0,0,0, 10);rectMode(CORNER);rect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
  image(arrive, 0, 0); 

}

void keyReleased()
{switch (keyCode){case UP: up = false; break; case DOWN: down = false; break;}}

void keyPressed() //checking for keypress and assign directions
{ switch (keyCode){case UP: up = true; break; case DOWN: down = true; break;}}
