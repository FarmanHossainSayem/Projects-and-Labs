import processing.sound.*;
import gifAnimation.*;

ArrayList<Particle> particles;
ArrayList<Bullet> bullets;
ArrayList<Missile> missiles;
ArrayList<Boss> bosses;
ArrayList<FCoin> coins;
ArrayList<DragonBullet> fireballs;
//ArrayList<Monster> monsters;
Monster[] monsters;
Monster[] monsters1;
PImage video, video1, video2, gameover;
// all PImages about interface
Mario mario;
PImage img_background;
Gif brick, mario1, coin, dragon, dragon1;
PFont zigBlack, proLight, FOO;
Coin coin1, coin2, coin3, coin4;
SoundFile mariosound;
SoundFile mariosound1;
SoundFile mario_jump;
SoundFile mario_bs;
// Plates in the interface
Brick starwar, plane, birdgame, ballgame;
Laser laser;
PImage rocket3, rocket_image, rocket2;
Gif rocket1;
Bullet bullet;
Rocket rocket;
Rocket small_rocket;
Dragon dragonboss;
float starwar_score = 40;
int monsters_amount=10, monsters_amount1=30;
int starwar_stage = -1;
//@todo plane game
Gif jet_image, f_jet, boss_img, plane_img, background, tressure, tank, basement;
Jet jet;
Figure figure;
float bossScore;
Plane[] planes;
FCoin fcoin;
F_jet f1, f2;
color blue = color (0, 0, 255);

int stage = 0; // 0. interface 1. starwar 2. planegame 3. flappy bird 4. ballgame
// Flappy Bird
PImage bird, front, back, wall;
int game, birdscore, highscore, x, y, steep; // game for front and back; x,y, to draw and steep to determine  the bird position; 
int wallx[] = new int[50];
int wally[] = new int[50];
//background
float speed;
boolean gamestate = true;
Background[] balls = new Background[1000];
//ballgame
SoundFile point;
PImage img;
Paddle pad1;
Paddle pad2;
Ball ball;
int leftscore= 0;
int rightscore= 0;
Gif animated_ball;


void setup() {
  //combustion particles at the bottom of the rocket
  size(1200, 600);
  back= loadImage("FlappyBird/back1.png");
  front= loadImage("FlappyBird/front.jpg");
  bird= loadImage("FlappyBird/bird.png");
  wall= loadImage("FlappyBird/wall.png");
  front.resize(width, height);
  back.resize(width, height);
  game = 1; 
  birdscore = 0; 
  highscore = 0;
  particles= new ArrayList<Particle>();
  monsters = new Monster[monsters_amount];
  monsters1 = new Monster[monsters_amount1];
  bullets = new ArrayList<Bullet>();
  zigBlack = loadFont("Ziggurat-Black-12.vlw");
  proLight = createFont("SourceCodePro-Light.otf", 34);
  FOO = createFont("FOO.TTF", 23);
  mariosound = new SoundFile(this, "Mario/mario2.wav");
  mariosound1 = new SoundFile(this, "Mario/mario3.wav");
  mario_jump = new SoundFile(this, "Mario/mario4.wav");
  mario_bs = new SoundFile(this, "Mario/mario.wav");
  rocket = new Rocket(width/2, height/2);
  //the bottom that could enter the spcae war game
  starwar = new Brick(227, 325);
  plane = new Brick(427, 325);
  birdgame = new Brick(627, 325);
  ballgame = new Brick(827, 325);
  coin1 = new Coin(227+14, 325);
  coin2 = new Coin(427+14, 325);
  coin3 = new Coin(627+14, 325);
  coin4 = new Coin(827+14, 325);
  //Mario in interface
  img_background = loadImage("Mario/background.jpeg");
  img_background.resize(width, height);
  gameover =loadImage("Starwar/gameover.jpeg");
  gameover.resize(width, height);
  rocket2 = loadImage("Starwar/rocket2.png");
  rocket3 = loadImage("Starwar/rocket.png");
  dragon = new Gif(this, "Mario/dragon.gif");
  dragon.play();
  dragon1 = new Gif(this, "Mario/dragon1.gif");
  dragon1.play();
  rocket1 = new Gif(this, "Starwar/rocket1.gif");
  rocket1.play();
  tank=new Gif(this, "Plane/tank.gif");
  tank.play();
  basement=new Gif(this, "Plane/basement.gif");
  basement.play();
  coin = new Gif(this, "Mario/coin.gif");
  coin.play();
  brick = new Gif(this, "Mario/brick.gif");
  brick.play();
  mario1 = new Gif(this, "Mario/1.gif");
  mario1.play();
  f_jet=new Gif(this, "Plane/f_jet.gif");
  f_jet.play();
  boss_img=new Gif(this, "Plane/boss_image.gif");
  boss_img.play();
  plane_img=new Gif(this, "Plane/c_plane.gif");
  plane_img.play();
  background=new Gif(this, "Plane/background3.gif");
  background.play();
  tressure= new Gif(this, "Plane/tressure.gif");
  tressure.play();
  animated_ball=new Gif(this, "ballgame/animated_ball.gif");
  animated_ball.play();
  mario = new Mario(100, 0);
  //b1=loadImage("bottom.jpeg");
  //b1.resize(150, 50);
  //the background of space war game that changed with time
  video = loadImage("Starwar/universe1.jpeg");
  video.resize(width, height);
  video1 = loadImage("Starwar/universe2.jpeg");
  video1.resize(width, height);
  video2 = loadImage("Starwar/universe3.png");
  video2.resize(width, height);
  //the image of little monsters
  //monster = loadImage("monster.png");
  dragonboss = new Dragon(width/2, 180);
  //the score of the rocket game that shows on the top of space war game
  //all the colors that included in the combustion particles 
  // plane game
  jet=new Jet(0, random(height)); 
  figure=new Figure(width/2, height-30);
  jet_image=new Gif(this, "Plane/jet.gif");
  jet_image.play();
  missiles=new ArrayList<Missile>();
  bosses=new ArrayList<Boss>();
  coins=new ArrayList<FCoin>();
  fireballs = new ArrayList<DragonBullet>();
  planes=new Plane[10];
  bossScore=0;
  //ballgame
  point = new SoundFile(this, "ballgame/point.mp3");
  img = loadImage ("ballgame/space.png");
  img.resize(width, height);
  pad1= new Paddle(1);
  pad2 = new Paddle(2);
  ball=new Ball();
  for (int i=0; i<monsters.length; i++) {
    monsters[i]=new Monster(random(0, width), 0);
  }
  for (int i=0; i<monsters1.length; i++) {
    monsters1[i]=new Monster(random(0, width), 0);
  }
  if (stage == 0) {
    mario_bs.play();
  } 
  for (int i=0; i<planes.length; i++) {
    planes[i]=new Plane(width, random(height));
  }
  for (int i = 0; i <balls.length; i++) // array to reset if the ball goes of the screen 
    balls[i]= new Background();
}


void draw() {
  //code which could control the character in the interface to move
  if (coin1.check()) {
    stage = 1;
    mariosound1.play();
    mario.restart();
  } else if (coin2.check()) {
    stage = 2;
    mariosound1.play();
    mario.restart();
  } else if (coin3.check()) {
    stage = 3;
    mariosound1.play();
    mario.restart();
  } else if (coin4.check()) {
    stage = 4;
    mariosound1.play();
    mario.restart();
  }
  if (stage == 0) {
    background(img_background);
    image(mario1, 847, 47, 30, 30);
    textFont(FOO);
    fill(255, 0, 0);
    textSize(30);
    text("Weclome to CMSC141!", width/2 - 175, 75);
    imageMode(CENTER);
    image(dragon, 180, 120, 400, 320);
    imageMode(CORNER);
    mario.run();
    coin1.run();
    starwar.run();
    coin2.run();
    plane.run();
    coin3.run();
    birdgame.run();
    coin4.run();
    ballgame.run();
    hello(1100, 50);
  } else if (stage == 2) {
    image(background, 0, 0, width, height);
    image(basement, 100, height-100, 200, 100);
    jet.run();
    image(jet_image, jet.location.x-55, jet.location.y-75, jet.j_width+120, jet.j_height+120);
    figure.run();
    image(tank, figure.location.x-20, figure.location.y-20, figure.f_width+50, figure.f_height+40);
    launch();
    flyback();
    checkCollision();
    follow_jet();
    boss_appear();
    coin_run();
    checkPicking();
  } else if (stage == 1) {
    if (starwar_score > 10 && gamestate && starwar_score <= 50) {
      starwar_stage = 1;
    } else if (starwar_score > 50 && gamestate) {
      starwar_stage = 2;
    }
    stroke(0, 0, 255);
    change_background();
    textFont(proLight);
    fill(255);
    textSize(30);    
    text("Score = " + starwar_score, 50, 100);
    monster_apply();
    particles_apply();
    rocket.run();

    //if (keyPressed) {
    //  if (key == 'x') {
    //    rect(rocket.location.x, rocket.location.y - 170, 5, -500);
    //  }
    //}
    //println(rocket.velocity);
    for (int i = 0; i <= 10; i++) {
      particles.add(new Particle(rocket.location.x, rocket.location.y - 110));
    }

    for (int i = 0; i <= 10; i++) {
      particles.add(new Particle(rocket.location.x + 20, rocket.location.y - 110));
    }
    if (!gamestate) {
      image(gameover, 0, 0);
      textSize(30);    
      text("Press R to Continue", width/2, 550);
    }
  } else if (stage == 3) {
    //imageMode(CENTER);
    //image(back, width/2, height/2);
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    for (int i = 0; i <balls.length; i++) {// array to reset if the ball goes of the screen 
      balls[i].generate();
      balls[i].display();
    }
    popMatrix();
    if (game == 0) {
      imageMode(CENTER);
      //x-=10;
      steep +=1;
      y += steep;
      //if (x == -1800) x = 0;
      for (int i = 0; i < 2; i++) {
        image(wall, wallx[i], wally[i] - (wall.height/2+100));
        image(wall, wallx[i], wally[i] + (wall.height/2+100));
        if (wallx[i] < 0) {
          wally[i] = (int)random(200, height-200);
          wallx[i] = width;
        }
        if (wallx[i] == width/2) {
          highscore = max(++birdscore, highscore);
          //birdscore++;
          
        }
        if (y>height||y<0||(abs(width/2-wallx[i])<25 && abs(y-wally[i])>100)) {
          game=1;
        }
        wallx[i] -= 6;
      }
      image(bird, width/2, y);
      fill(255);
      textSize(40); 
      text("Score: "+birdscore, 10, 40);
    } else {
      imageMode(CENTER);
      image(front, width/2, height/2);
      text("High Score: "+ highscore, 50, 130);
    }
    imageMode(CORNER);
  } else if (stage == 4) {
    background(img);
    pad1.display();
    pad2.display();
    ball.display();
    image(animated_ball, ball.ball_x-ball.ball_r, ball.ball_y-ball.ball_r, ball.ball_r*2, ball.ball_r*2);
    fill(255);
    textSize(32);
    text(leftscore, 50, 40);
    text(rightscore, width-50, 40);
    if (ball.rectIsOnCircle(pad1) || ball.rectIsOnCircle(pad2) ) {
      ball.ball_y_step = -1*ball.ball_y_step;
    }
    if (ball.checkUp()) {
      pad1.shorten();
    }
    if (ball.checkDown()) {
      pad2.shorten();
    }
    if (pad1.paddle_w==0) {
      text("pad2 win the game", 100, 100);
    }
    if (pad2.paddle_w==0) {
      text("pad1 win the game", 100, 100);
    }
  }
}

void keyPressed() {
  if (key == 'q') {
    stage = 0;
    mario_bs.play();
  }
  if (stage == 0) {
    mario.keyPressed();
  } else if (stage == 1) {
    if (key == 'r') {
      gamestate = true;
      starwar_score = 0;
    }
    rocket.keyPressed();
    if (key == ' ') {
      bullets.add(new Bullet(rocket.location.x + 8, rocket.location.y - 170));
      if (starwar_stage == 1 || starwar_stage == 2) {
        bullets.add(new Specialbullet(rocket.location.x +8 - 39, rocket.location.y - 180));
        bullets.add(new Specialbullet(rocket.location.x +8 + 39, rocket.location.y - 180));
      }
    }
  } else if (stage == 2) {
    jet.keyPressed();
    figure.keyPressed();
    if (key==' ') {
      missiles.add(new Missile(jet.location.x+40, jet.location.y));
      if (jet.jet_score>10) {
        missiles.add(new Missile(jet.location.x+40, jet.location.y-20));
        missiles.add(new Missile(jet.location.x+40, jet.location.y+30));
      }
    }
  } else if (stage==4) {
    if (key == ' ') ball.reset();
    pad1.keyPressed();
    pad2.keyPressed();
  }
}

void keyReleased() {
  if (stage == 0) {
    mario.reset();
    frameRate(60);
  } else if (stage == 1) {
    rocket.reset();
  } else if (stage == 2) {
    jet.keyReleased();
    figure.keyReleased();
  } else if (stage == 4) {
    pad1.keyReleased();
    pad2.keyReleased();
  }
}

void mousePressed() {
  if (stage == 3) {
    steep = -15;
    if (game == 1) {
      wallx[0] = 600;
      wally[0] = y = height/2;
      wallx[1] = 900;
      wally[1] = 500;
      x = 0;
      game = 0;
      birdscore = 0;
    }
  }
}

void hello(float x, float y) {
  fill(255, 234, 0);
  stroke(0);
  strokeWeight(1);
  ellipse(x, y, 50, 50);  // head
  noFill();
  fill(0, 191, 255);
  noStroke();
  fill(255);
  stroke(0);
  strokeWeight(1);
  ellipse(x - 7, y - 5, 15, 15);
  ellipse(x + 7, y - 5, 15, 15);
  noFill();
  arc(x, y - 7, 50, 50, 0.47, 2.51);// happymouth
  float mx = (mario.location.x-700)/130;
  fill(0);
  ellipse(x - 7 +mx, 48, 3, 3);
  ellipse(x + 7 +mx, 48, 3, 3);
}

//check whether the monster touched on the rocket
boolean rectIsOnCircle(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
  float DeltaX = cx - max(rx, min(cx, rx + rw));
  float DeltaY = cy - max(ry, min(cy, ry + rh));
  return (DeltaX * DeltaX + DeltaY * DeltaY) < (cr * cr);
}

void monster_apply() {
  if (starwar_stage == 0) {
    for (int i=0; i<monsters.length; i++) {
      Monster mon = monsters[i];
      mon.run();
      //if the monsters touch the rocket, it will be erased from the screen same as in array list
      if (rectIsOnCircle(rocket.location.x-rocket.r_width/2, rocket.location.y-rocket.r_height, rocket.r_width, rocket.r_height, mon.location.x, mon.location.y, mon.m_width)) {
        monsters[i]=new Monster(random(0, width), 0);
        starwar_score++;
      }

      if (mon.location.y>height) {
        monsters[i]=new Monster(random(0, width), 0);
      }
    }
  } else if (starwar_stage == 1) {
    for (int i = 0; i < monsters1.length; i++) {
      Monster mon = monsters1[i];
      mon.run();
      //if the monsters touch the rocket, it will be erased from the screen same as in array list
      if (rectIsOnCircle(rocket.location.x - rocket.r_width/2, rocket.location.y - rocket.r_height, rocket.r_width, rocket.r_height, mon.location.x, mon.location.y, mon.m_width)) {
        monsters1[i]=new Monster(random(0, width), 0);
        gamestate = false;
      }
      if (mon.location.y>height) {
        monsters1[i]=new Monster(random(0, width), 0);
      }
    }
  } else if (starwar_stage == 2) {
    dragonboss.display();
    dragonboss.update();
    dragonboss.checkboundary();
    fireball();
    if (rectIsOnCircle(rocket.location.x-rocket.r_width/2, rocket.location.y-rocket.r_height/2, rocket.r_width, rocket.r_height, dragonboss.location.x, dragonboss.location.y, 60)) {
      gamestate = false;
    }
  }
}

void particles_apply() {
  ArrayList<Bullet> remove=new ArrayList<Bullet>();
  for (Bullet bu : bullets) {
    bu.update();
    bu.display();
    if (bu.checkOut()) {
      remove.add(bu);
    }
    if (starwar_stage == 0) {
      for (int x = 0; x < monsters.length; x++) {
        Monster m = monsters[x];
        if (rectIsOnCircle(bu.location.x-bu.b_width/2, bu.location.y-bullet.b_height/2, bu.b_width, bu.b_height, m.location.x, m.location.y, m.m_width/2)) {
          monsters[x]=new Monster(random(0, width), 0);
          starwar_score++;
          remove.add(bu);
        }
      }
    } else if (starwar_stage == 1) {
      for (int x=0; x<monsters1.length; x++) {
        Monster m=monsters1[x];
        if (rectIsOnCircle(bu.location.x-bu.b_width/2, bu.location.y-bu.b_height/2, bu.b_width, bu.b_height, m.location.x, m.location.y, m.m_width/2)) {
          remove.add(bu);
          monsters1[x]=new Monster(random(0, width), 0);
          starwar_score++;
        }
      }
    } else if (starwar_stage == 2) { 
      if (rectIsOnCircle(bu.location.x-bu.b_width/2, bu.location.y-bu.b_height/2, bu.b_width, bu.b_height, dragonboss.location.x, dragonboss.location.y, 60)) {
        remove.add(bu);
        dragonboss.lifeSpan--;
      }
      if (dragonboss.lifeSpan == 0) {
        stage = 0;
        dragonboss.lifeSpan = 50;
        starwar_score = 0;
      }
    }
  }
  for (Bullet bu : remove) {
    bullets.remove(bu);
  }



  for (int i=0; i<particles.size(); i++) {
    Particle p=particles.get(i);
    p.color_create();
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}

void change_background() {
  if (starwar_stage == 0) {
    background(video);
  } else if (starwar_stage == 1) {
    background(video1);
  } else {
    background(video2);
  }
}

void launch() {
  for (int i=0; i<missiles.size(); i++) {
    Missile m=missiles.get(i);
    m.run();
    if (m.checkOut()) {
      missiles.remove(i);
    }
  }
}

void flyback() {
  for (int i=0; i<planes.length; i++) {
    planes[i].run();
    image(plane_img, planes[i].location.x-65, planes[i].location.y-50, planes[i].p_size+120, planes[i].p_size+60);
    if (planes[i].checkOut()) {
      planes[i]=new Plane(width, random(height));
    }
  }
}
void checkCollision() {
  ArrayList<Missile> remove=new ArrayList<Missile>();
  for (int i=0; i<missiles.size(); i++) {
    for (int x=0; x<planes.length; x++) {
      Missile mi=missiles.get(i);
      if (planes[x].checkOut()) {
        jet.jet_score--;
      }
      if (rectIsOnCircle(mi.location.x, mi.location.y, mi.m_width, mi.m_height, planes[x].location.x, planes[x].location.y, planes[x].p_size)) {
        remove.add(mi);
        planes[x]=new Plane(width, random(height));
        jet.jet_score++;
      }
    }
  }
  for (Missile r : remove) {
    missiles.remove(r);
  }
}

void follow_jet() {
  if (jet.jet_score>10) {
    f1=new F_jet(jet.location.x, jet.location.y+20);
    f2=new F_jet(jet.location.x, jet.location.y-40);
    f1.run();
    f2.run();
    image(f_jet, jet.location.x, jet.location.y+20, f1.f_width+30, f1.f_height+30);
    image(f_jet, jet.location.x, jet.location.y-40, f1.f_width+30, f1.f_height+30);
  }
  text(jet.jet_score, 100, 100);
}

void fireball() {
  if (frameCount%100==0) {
    fireballs.add(new DragonBullet(dragonboss.location.x - 125, dragonboss.location.y - 125));
  }
  for (DragonBullet fireball : fireballs) {
    fireball.display();
    fireball.update();
    if (fireball.checkOut()) {
      fireballs.remove(fireball);
    }
    if (rectIsOnCircle(rocket.location.x -20, rocket.location.y - 170, rocket.r_width, rocket.r_height, fireball.location.x-fireball.w/2, fireball.location.y-fireball.h/2, 20)) {
      gamestate = false;
    }
  }
}
void boss_appear() {
  if (frameCount%500==0) {
    bosses.add(new Boss((width), random(height)));
  }
  for (Boss b : bosses) {
    b.run();
    image(boss_img, b.location.x-40, b.location.y-40, b.b_size+50, b.b_size+50);
  }
  ArrayList<Boss> remove_boss=new ArrayList<Boss>();
  ArrayList<Missile> remove_missile=new ArrayList<Missile>();
  for (Missile mi : missiles) {
    for (Boss bo : bosses) {
      if (rectIsOnCircle(mi.location.x, mi.location.y, mi.m_width, mi.m_height, bo.location.x, bo.location.y, bo.b_size)) {
        bo.lifeSpan--;
        bossScore++;
        remove_missile.add(mi);
      }
      if (bo.isDead()) {
        remove_boss.add(bo);
        coins.add(new FCoin(bo.location.x, bo.location.y, bo.velocity.x));
      }
    }
  }
  for (Boss r : remove_boss) {
    bosses.remove(r);
  }
  for (Missile r : remove_missile) {
    missiles.remove(r);
  }
}
void checkPicking() {
  ArrayList<FCoin> r_coin=new ArrayList<FCoin>();
  println(r_coin.size());
  text("your score of beating bosses is :  "+bossScore, 200, 200 );

  for (FCoin c : coins) {
    if (rectIsOnCircle(figure.location.x, figure.location.y, figure.f_width, figure.f_height, c.location.x, c.location.y, c.c_size)) {
      r_coin.add(c);
    }
  }
  for (FCoin fcoin : r_coin) {
    coins.remove(fcoin);
  }
}

void coin_run() {
  for (FCoin c : coins) {
    c.update();
    c.checkOut();
    c.display();
    image(tressure, c.location.x-10, c.location.y-10, c.c_size+10, c.c_size+10);
  }
}
