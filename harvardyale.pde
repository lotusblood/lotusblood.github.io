/* @pjs font="jersey.ttf"; */
/* @pjs font="keyboard.ttf"; */
PFont font;
PFont font2;

void setup() {
  size(500,500);
  smooth();
  noStroke();
  String[] fontList = PFont.list();
  println(fontList);
  font = createFont("JerseyM54",48);
  font2 = createFont("AvenirNext-Medium",20);
  noiseDetail(4);
}

float a = 0;
float s = TWO_PI/120;

void draw() {
  doLines();
  a+=s;  
  textFont(font, 48);
  textAlign(CENTER);
  text("HY PREGAME", width/2, height/2);
  textFont(font2, 20);
  text("58 mansfield st", width/2, 275);
  text("9:30 - 11:30ish", width/2, 295);
  text("BYOB + friends", width/2, 315);
}

void doLines() {
  background(186,12,47);
   for(int j=50;j<450;j+=25) {
     for(int i=50;i<450;i++) {
      if(j!=50 && j!=440) { //grid
      float step = sin(a)*(sin((450-i)*PI/400.0));
       float swing = j+step*(180.0*noise(a+i/300.0, a+j/300.0,a/10.0)-90.0);
       float dx = randomC()/2;
       float dy = randomC()/2;
       float x = i+dx;
       float y = swing+dy;
       fill(255,150-150*sqrt(sq(dx)+sq(dy))); // pencil effect
       ellipse(x,y,2,2);
    }
  }
 }

}

//pseudo
float randomC() {
  float r = random(0,1);
  float ang = sin(TWO_PI*random(0,1));
  return r*ang;
}