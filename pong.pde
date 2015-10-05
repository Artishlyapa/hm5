import processing.sound.*;
SoundFile file, file2;

int score1;
int score2;

class Ball {
  float xp, yp;
  float xv, yv;
  float r;
  color c;

  Ball() {
    colorMode(HSB, 100);
    c = color(80, 40, 100); 
    xp = 250;
    yp = 250;
    r = 10;
    xv = 3;
    yv = 1;
  }

  void create() {
    noStroke();
    fill(c);
    ellipse(xp, yp, r*2, r*2);
  }

  void step() {
    xp += xv;
    yp += yv;
    if (yp < r || yp > height - r) {
      yv *= -1;
    }
    if (xp == p3.x && xp == p3.x && yp < p3.y + 60 && yp > p3.y) {
      xv *= -1;
      file2.play();
    }
    if (xp > p2.x - r && yp < p2.y + 60 && yp > p2.y) {
      xv *= -1;
      file2.play();
    }
    if (xp < p1.x + r*2 && yp < p1.y + 60 && yp > p1.y) {
      xv *= -1;
      file2.play();
    }
    if (xp > 472) {
      xp = 250;
      yp = 250;
      xv = 3;
      yv = 1;
      file.play();
      score1 +=1;
    }
    if (xp < 28) {
      xp = 250;
      yp = 250;
      xv = 3;
      yv = 1;
      file.play();
      score2 +=1;
    }
  }
}

Ball b;


class Paddle {
  float y, x;
  float vy;
  float sx = 10;
  float sy = 60;
  color c;

  Paddle (float x, float y) {
    this.x = x;
    this.y = y;
    c = color(220, 100, 280);
  }

  void create() {
    noStroke();
    fill(c);
    rect (x, y, sx, sy);
  }

  void move() {
    y += vy;
    if (y < 0 || y > height - sy) {
      vy = 0;
    }
  }
}

Paddle p1, p2, p3;

void setup() {
  size (500, 500);
  colorMode(HSB);
  file = new SoundFile(this, "/Users/sealhatman/Desktop/got-MP3.mp3");
  file2 = new SoundFile(this, "/Users/sealhatman/Desktop/getem-MP3.mp3");
  int x = 20;
  int y = 250;
  p1 = new Paddle(x, y);
  x = 470;
  y = 250;
  p2 = new Paddle(x, y);
  x = 250;
  y = 250;
  p3 = new Paddle(x, y);
  b = new Ball();
}

void draw() {
  background(0);
  p1.create();
  p1.move();
  p2.create();
  p2.move();
  p3.create();
  p3.move();
  p3.y = mouseY;
  b.create();
  b.step();

  textSize(32);
  text("" + score1, 200, 30);
  text("" + score2, 250, 30);
}

void keyPressed() {
  if (key == 'q') {
    p1.vy = -10;
  }
  if (key == 'a') {
    p1.vy = 10;
  }
  if (key == 'o') {
    p2.vy = -10;
  }
  if (key == 'l') {
    p2.vy = 10;
  }
}

void keyReleased() {
  if (key == 'q' && p1.vy < 0) {
    p1.vy = 0;
  }
  if (key == 'a' && p1.vy > 0) {
    p1.vy = 0;
  }
  if (key == 'o' && p2.vy < 0) {
    p2.vy = 0;
  }
  if (key == 'l' && p2.vy > 0) {
    p2.vy = 0;
  }
}
