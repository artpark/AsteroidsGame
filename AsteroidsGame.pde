private boolean up = false, down = false, left = false, right = false, space = false;
private SpaceShip ship;
private Star[] star = new Star[100];
private ArrayList <Asteroid> a1;
private ArrayList <Bullet> b1;
public void setup() 
{
  size(500, 500);
  ship = new SpaceShip();
  a1 = new ArrayList <Asteroid>();
  b1 = new ArrayList <Bullet>();
  for (int i=0; i<star.length; i++)
  {
    star[i] = new Star();
  }
  for (int i=0; i<7; i++)
  {
    a1.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  ship.show();
  ship.move();
  for (int i=0; i<b1.size (); i++)
  {
    b1.get(i).show();
    b1.get(i).move();
    if (b1.get(i).getX() > width-5 || b1.get(i).getX() < 5 || b1.get(i).getY() > height-5 || b1.get(i).getY() < 5)
    {
      b1.remove(i);
    }
  }
  for (int i=0; i<star.length; i++)
  {
    star[i].show();
  }
  for (int i=0; i<a1.size (); i++)
  {
    a1.get(i).show();
    a1.get(i).move();
    if (dist(a1.get(i).getX(), a1.get(i).getY(), ship.getX(), ship.getY()) < 20)
    {
      a1.remove(i);
      break;
    }
    for (int a=0; a<b1.size (); a++)
    {
      if (dist(a1.get(i).getX(), a1.get(i).getY(), b1.get(a).getX(), b1.get(a).getY()) < 10)
      {
        a1.remove(i);
        b1.remove(a);
        break;
      }
    }
  }

  if (left)
  {
    ship.rotate(-10);
  }
  if (right)
  {
    ship.rotate(10);
  }
  if (up)
  {
    ship.accelerate(0.06);
  }
  if (space)
  {
    if (b1.size() < 10) {
      b1.add(new Bullet(ship));
    }
  }
}

public void keyPressed()
{
  if (key == 'h')
  {
    ship.setX((int)(Math.random()*500));
    ship.setY((int)(Math.random()*500));
    ship.setDirectionX(0);
    ship.setDirectionY(0);
  }
  if (keyCode == UP) {
    up = true;
  }
  if (keyCode == LEFT) {
    left = true;
  }
  if (keyCode == RIGHT) {
    right = true;
  }
  if (key == ' ') {
    space = true;
  }
  if (key == 'r')
  {
    ship = new SpaceShip();
    a1 = new ArrayList <Asteroid>();
    b1 = new ArrayList <Bullet>();
    for (int i=0; i<star.length; i++)
    {
      star[i] = new Star();
    }
    for (int i=0; i<7; i++)
    {
      a1.add(new Asteroid());
    }
  }
}

public void keyReleased()
{
  if (keyCode == UP) {
    up = false;
  }
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if (key == ' ') {
    space = false;
  }
}

class SpaceShip extends Floater  
{   
  public SpaceShip() {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    xCorners[3] = -2;
    yCorners[3] = 0;
    myColor = color(255, 255, 255);
    myCenterX = (width)/2;
    myCenterY = (height)/2;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }

  public void setX(int x) { 
    myCenterX = x;
  }  
  public int getX() { 
    return (int) myCenterX;
  } 
  public void setY(int y) { 
    myCenterY = y;
  }   
  public int getY() { 
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }   
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  }
}

class Asteroid extends Floater
{
  int myRspeed;
  public Asteroid()
  {
    myRspeed = (int)(Math.random()*17)-8;
    corners = 6;
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
    yCorners[4] = 8;
    xCorners[5] = -5;
    yCorners[5] = 0;
    myColor = color(255, 255, 255);
    myCenterX = Math.random()*500;
    myCenterY = Math.random()*500;
    myDirectionX = (Math.random()*7)-3;
    myDirectionY = (Math.random()*7)-3;
    myPointDirection = Math.random()*(Math.PI*2);
  }

  public void move()
  {
    rotate(myRspeed);
    super.move();
  }

  public void show()
  {
    if ((Math.random()*8) > 7.5)
    {
      myColor = color(255, 0, 0);
    } else
    {
      myColor = color(255);
    }
    super.show();
  }

  public void setX(int x) { 
    myCenterX = x;
  }  
  public int getX() { 
    return (int) myCenterX;
  } 
  public void setY(int y) { 
    myCenterY = y;
  }   
  public int getY() { 
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }   
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
  }
}

class Star
{
  protected int myX, myY, mySize, myOpacity; 
  public Star()
  {
    myX = (int)(Math.random()*(width));
    myY = (int)(Math.random()*(height));
    mySize = (int)(Math.random()*4)+1;
    myOpacity = (int)(255 - (Math.random()*50));
  }
  public void show()
  {
    fill(255, 255, 255, myOpacity);
    ellipse(myX, myY, mySize, mySize);
  }
}

class Bullet extends Floater
{
  public Bullet(SpaceShip ship)
  {
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myPointDirection = ship.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + myDirectionX;
    myDirectionY = 5 * Math.sin(dRadians) + myDirectionY;
    myColor = color(255, 0, 0);
  }
  public void show()
  {
    if ((Math.random()*5) > 4.5)
    {
      myColor = color(255, 255, 0);
    } else
    {
      myColor = color(255);
    }
    ellipse((int)myCenterX, (int)myCenterY, 10, 10);
  }

  public void setX(int x) { 
    myCenterX = x;
  }  
  public int getX() { 
    return (int) myCenterX;
  } 
  public void setY(int y) { 
    myCenterY = y;
  }   
  public int getY() { 
    return (int)myCenterY;
  }   
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }   
  public double getDirectionX() {
    return myDirectionX;
  }   
  public void setDirectionY(double y) {
    myDirectionY = y;
  }   
  public double getDirectionY() {
    return myDirectionY;
  }   
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }   
  public double getPointDirection() {
    return myPointDirection;
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
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
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
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 

