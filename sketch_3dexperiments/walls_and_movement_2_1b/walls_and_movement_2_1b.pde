import java.awt.Robot;

//color pallette
color black = #000000;
color white = #FFFFFF;

//Map variables
int gridSize;
PImage map;

//Robot for mouse control
Robot rbt;

//camera variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera faces
float upx, upy, upz; //tilt axis

//keyboard variables
boolean wkey, akey, dkey, skey;

//rotation variables
float leftRightAngle, upDownAngle;

void setup() {
  try {
    rbt = new Robot();
  }
  catch (Exception e) {
  }


  focusy = height/2;
  focusz = height/2 - 100;

  upx = 0;
  upy = 1;
  upz = 0;

  //initialize map
  map = loadImage("map.png");
  gridSize = 100;
}

void draw() {
  //lights();

  //camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);


  //drawAxis();
  //drawFloor(-2000, 2000, height, 100);
  //drawFloor(-2000, 2000, 0, 100);
  drawMap();
}

void drawMap() {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c != white) {
        pushMatrix();
        fill(c);
        stroke(100);
        translate(x*gridSize, height/2, y*gridSize);
        box(gridSize, height, gridSize);
        popMatrix();
      }
    }
  }
}
