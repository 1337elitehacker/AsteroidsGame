SpaceShip bob;
ArrayList <Asteroid> rocky;
Star [] galaxy = new Star[500];




ArrayList <Bullet> shot;
public void setup()
{
 //your code here
size(400,400);
 for (int j = 0; j < galaxy.length; j++) {galaxy[j] = new Star();}
 bob = new SpaceShip();
 
 shot = new ArrayList <Bullet>();
 rocky = new ArrayList <Asteroid>();
 for (int i = 0; i< 12; i++) {rocky.add(i, new Asteroid());}
}
public void draw()
{
 //your code here
 background(0);
 for (int j = 0; j <galaxy.length; j++) {galaxy[j].show();}
 for (int i = 0; i < 12; i++)
 {
  rocky.get(i).show();
  rocky.get(i).move();
 }
 for (int k = 0; k < shot.size(); k++)
 {
  fill(255,255,20);
  stroke(255,255,20);
  shot.get(k).show();
  shot.get(k).move();
 }
 for (int i = 0; i< 12; i++)
 {
  if (dist(bob.getX(), bob.getY(), rocky.get(i).getX(), rocky.get(i).getY()) < 35)
  {
   rocky.remove(i);
   rocky.add(0, new Asteroid());
    
  }
  for (int k =0; k < shot.size();k++)
  {
   if (dist(shot.get(k).getX(), shot.get(k).getY(), rocky.get(i).getX(), rocky.get(i).getY()) < 20)
   {
     rocky.remove(i);
     rocky.add(0, new Asteroid());
     shot.remove(k);
     break;
   }
  }
 }
 bob.show();
 bob.move();
}
public void keyPressed()
{
 if (key == 'p') //hyperspace
 {
  bob.setX((int)(Math.random()*800));
  bob.setY((int)(Math.random()*800));
  bob.setDirectionX(0.0);
  bob.setDirectionY(0.0);
  bob.setPointDirection((int)(Math.random()*360));
 }
 if (key == 'a')  {
 bob.rotate(-15);
 }
 if (key == 's')  {
 bob.rotate(15);
 }
 if (key == 'w')  {
 bob.accelerate(0.5);
 }
}
public void mousePressed()
{
 {
  shot.add(new Bullet(bob));
 }
}
class Star
{
 private int myX, myY;
 public Star()
 {
  myX = (int)(Math.random() *900);
  myY = (int)(Math.random()* 900);
 }
  public void show()
  {
   fill(200,200,200);
   ellipse(myX,myY,5,5);
  }
}
class SpaceShip extends Floater
{
 //your code here
 public SpaceShip()
 {
  corners = 4;
  xCorners = new int[corners];
  yCorners = new int[corners];
 xCorners[0]= -4;
  yCorners[0]= -4;
  xCorners[1]=  8;
  yCorners[1]=  -2;
  xCorners[2]=  -9;
  yCorners[2]= 9;
  xCorners[3]= -1;
  yCorners[3]= -2;
  myColor = color(200,200,200);
  myCenterX = 100;
  myCenterY = (int)(Math.random()*600);
  myDirectionX = 0.0;
  myDirectionY = 0.0;
  myPointDirection = 0;
 }
 public void setX(int x){myCenterX = x;}
 public int getX() {return (int)myCenterX;}
 public void setY(int y){myCenterY = y;}
 public int getY() {return (int)myCenterY;}
 public void setDirectionX(double x) {myDirectionX = x;}
 public double getDirectionX() {return myDirectionX;}
 public void setDirectionY(double y) {myDirectionY = y;}
 public double getDirectionY() {return myDirectionY;}
 public void setPointDirection(int degrees) {myPointDirection = degrees;}
 public double getPointDirection() {return myPointDirection;}
}
class Asteroid extends Floater
{
 private int asteroidX;
 private int asteroidY;
 private int speedRotate;
  public Asteroid()
 {
  asteroidX = (int)(Math.random()*800);
  asteroidY = (int)(Math.random()*800);
  speedRotate = (int)((Math.random()*14)-7);
  corners = 8;
  xCorners = new int[corners];
  yCorners = new int[corners];
    xCorners[0] = -11;
  yCorners[0] = -8;
  xCorners[1] = 7;
  yCorners[1] = -8;
  xCorners[2] = 13;
  yCorners[2] = 0;
  xCorners[3] = 6;
  yCorners[3] = 10;
  xCorners[4] = -11;
  yCorners[4] = -8;
  xCorners[5] = -5;
  yCorners[5] = 0;
  myColor = color(255,200,200);
  myCenterX = (int)(Math.random()*800);
  myCenterY = (int)(Math.random()*800);
  myDirectionX =(int)(Math.random()*4)-1;
  myDirectionY = (int)(Math.random()*4)-1;
  myPointDirection = (int)(Math.random()*360);
 }
  public void move()
  {
   rotate(speedRotate);
   super.move();
  }
 public void setX(int x){myCenterX = x;}
 public int getX() {return (int)myCenterX;}
 public void setY(int y){myCenterY = y;}
 public int getY() {return (int)myCenterY;}
 public void setDirectionX(double x) {myDirectionX = x;}
 public double getDirectionX() {return myDirectionX;}
 public void setDirectionY(double y) {myDirectionY = y;}
 public double getDirectionY() {return myDirectionY;}
 public void setPointDirection(int degrees) {myPointDirection = degrees;}
 public double getPointDirection() {return myPointDirection;}
}
class Bullet extends Floater
{
 private double dRadians;
 public Bullet(SpaceShip bob)
 {
  myPointDirection = (int)(bob.getPointDirection());
  dRadians = myPointDirection*(Math.PI/180);
  myCenterX = (int)(bob.getX());
  myCenterY = (int)(bob.getY());
  myDirectionX = 5 * Math.cos(dRadians) + bob.getDirectionX();
  myDirectionY = 5 * Math.sin(dRadians) + bob.getDirectionY();
  myColor = color((int)200,(int)200,(int)200);
 }
 public void setX(int x){myCenterX = x;}
 public int getX() {return (int)myCenterX;}
 public void setY(int y){myCenterY = y;}
 public int getY() {return (int)myCenterY;}
 public void setDirectionX(double x) {myDirectionX = x;}
 public double getDirectionX() {return myDirectionX;}
 public void setDirectionY(double y) {myDirectionY = y;}
 public double getDirectionY() {return myDirectionY;}
 public void setPointDirection(int degrees) {myPointDirection = degrees;}
 public double getPointDirection() {return myPointDirection;}
  public void show()
 {  fill(200,200,200);
  ellipse((int)myCenterX, (int)myCenterY,5,5);
 }
 public void move()
 {
  myCenterX += myDirectionX;
  myCenterY += myDirectionY;
 }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class
{  
 protected int corners;  //the number of corners, a triangular floater has 3  
 protected int[] xCorners;  
 protected int[] yCorners;
 protected int myColor;
 protected double myCenterX, myCenterY; //holds center coordinates  
 protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel  
 protected double myPointDirection; //holds current direction the ship is pointing in degrees  
 abstract public void setX(int x);
 abstract public int getX();  
 abstract public void setY(int y);  
 abstract public int getY();  
 abstract public void setDirectionX(double x);  
 abstract public double getDirectionX();  
 abstract public void setDirectionY(double y);  
 abstract public double getDirectionY();  
 abstract public void setPointDirection(int degrees);  
 abstract public double getPointDirection();
 //Accelerates the floater in the direction it is pointing (myPointDirection)  
 public void accelerate (double dAmount)
 {        
  //convert the current direction the floater is pointing to radians  
  double dRadians =myPointDirection*(Math.PI/180);   
  //change coordinates of direction of travel  
  myDirectionX += ((dAmount) * Math.cos(dRadians));  
  myDirectionY += ((dAmount) * Math.sin(dRadians));     
 }  
 public void rotate (int nDegreesOfRotation)  
 {   
  //rotates the floater by a given number of degrees  
  myPointDirection+=nDegreesOfRotation;  
 }  
 public void move ()   //move the floater in the current direction of travel
 {    
  //change the x and y coordinates by myDirectionX and myDirectionY     
  myCenterX += myDirectionX;  
  myCenterY += myDirectionY;   
  //wrap around screen  
  if(myCenterX >width)
  {   
   myCenterX = 0;  
  }  
  else if (myCenterX<0)
  {   
   myCenterX = width;  
  }  
  if(myCenterY >height)
  {  
   myCenterY = 0;
  }
  else if (myCenterY < 0)
  {   
   myCenterY = height;  
  }  
 }  
 public void show ()  //Draws the floater at the current position
 {           
  fill(myColor);  
  stroke(myColor);  
  //convert degrees to radians for sin and cos       
  double dRadians = myPointDirection*(Math.PI/180);               
  int xRotatedTranslated, yRotatedTranslated;  
  beginShape();       
  for(int nI = 0; nI < corners; nI++)  
  {   
   //rotate and translate the coordinates of the floater using current direction
   xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);   
   yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);    
   vertex(xRotatedTranslated,yRotatedTranslated);  
  }  
  endShape(CLOSE);
 }  
}




