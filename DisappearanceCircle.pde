
//DisappearanceCircle

int x[] = new int [20];//円の中心ｘ座標
int y[] = new int [20];//円の中心ｙ座標
int z[] = new int [20];//円の半径
int speedX[] = new int [20];//速度
int speedY[] = new int [20];//速度
color[]c=new color[20];//色

void setup() {
  size(700, 500);
  smooth();
  colorMode(RGB, 100);
  ellipseMode(RADIUS);

  for ( int i = 0; i < x.length; i++ ) { //数値の決定
    x[i] = int( random(50, 450) );
    y[i] = int( random(50, 450) );
    z[i] = int( random(10, 40) );
    speedX[i] = (int)random(1, 5) ;
    speedY[i] = (int) random(1, 5) ;
    c[i]= color(random(255), random(255), random(225));
  }
}

void draw() {
  background(0);
  for ( int i = 0; i < x.length; i++ ) {
    stroke(c[i]);
    fill(c[i]);//色
    ellipse(x[i], y[i], z[i], z[i]);//円
  }

  for ( int j = 0; j < x.length; j++ ) {
    if ( x[j]+z[j] > width || x[j]-z[j] < 0 ) {//縦横の速度
      speedX[j] = -speedX[j];
    }
    if ( y[j]+z[j] > height || y[j]-z[j] < 0 ) {
      speedY[j] = -speedY[j];
    }
  }

  for ( int k = 0; k < x.length; k++ ) {
    x[k] += speedX[k];
    y[k] += speedY[k];
  }

  for ( int m = 0; m < x.length; m++ ) {//小さい円を消す
    for ( int n = 0; n < 20; n++ ) {
      if ( dist(x[m], y[m], x[n], y[n]) < z[m]+z[n] ) {
        if ( z[m] > z[n] ) {
          z[n] = 0;
        } 
        if ( z[n] > z[m] ) {
          z[m] = 0;
        }
      }
    }
  }
}
