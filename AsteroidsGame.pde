SpaceShip ship;
ArrayList <Asteroid> blob;
Stars [] star;
Bullet [] shoot;//your variable declarations here
public void setup() 
{
  size(600,600);
   ship= new SpaceShip();
   blob =new ArrayList <Asteroid>();
   star= new Stars[400];
   shoot = new Bullet[10];
   for(int i=0; i<star.length;i++)
   {
    star[i] =new Stars(); 
  }
  for(int i=0; i<30;i++)
   {
    blob.add(new Asteroid()) ;
  }
  for (int i=0; i<shoot.length;i++)
  {
    shoot[i]= new Bullet();
  }
}
public void draw() 
{
  background(0);
  ship.show();
  ship.move(); 
 
  for(int i=0; i<star.length;i++)
   {
    star[i].show();
    
  } 
  for (int i=0; i<blob.size(); i++)
  {
    blob.get(i).show();
    blob.get(i).move();
    if(dist(ship.getX(),ship.getY(),blob.get(i).getX(),blob.get(i).getY())<20)
        {blob.remove(i);}
  }
}
public void keyPressed()
{
  if (keyCode == UP)
    {
      ship.accelerate(0.2);
    }
    else if(keyCode == DOWN)
    {
      ship.accelerate(-0.2);
    }
    else if(keyCode==RIGHT)
    {
      ship.rotate(20);
    }
    else if (keyCode == LEFT)
    {
      ship.rotate(-20);
    }
    if (key == ' ')
    {
      ship.setX((int)(Math.random()*600));
      ship.setY((int)(Math.random()*600));
      ship.setDirectionX(0);
      ship.setDirectionY(0);
      ship.setPointDirection((int)(Math.random()*360));
    }
}
class Stars
{
  private int x,y;
  public Stars()
  {
    x=(int)(Math.random()*600);
    y=(int)(Math.random()*600);
  }
  public void show()
  {
    fill(255);
    ellipse(x,y,1,1);
  }
class Bullet extends Floater
{
  Bullet (SpaceShip theShip)
  {
    
  }
}
}
class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners=3;
    xCorners= new int[corners];
    yCorners= new int[corners];
    xCorners[0]= -8;
    yCorners[0]=-8;
    xCorners[1]= 16;
    yCorners[1]=0;
    xCorners[2]= -8;
    yCorners[2]=8;
    myColor=181;
    myCenterX=300;
    myCenterY=300;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=270;
  }
   public void setX(int x) {myCenterX = x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y) {myCenterY=y;}  
   public int getY() {return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX() {return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;} 
   public double getDirectionY() {return myDirectionY;}   
   public void setPointDirection(int degrees) {myPointDirection=degrees;} 
   public double getPointDirection(){return myPointDirection;}
}
class Asteroid extends Floater
{
  private int rotateA;
  public Asteroid()
  {
    if(Math.random() <.5)
    {
      rotateA= -1;
    }
    else 
    {
      rotateA=1;
    }
    corners =9;
    xCorners=new int [corners];
    yCorners=new int[corners];
    xCorners[0]=0;
    yCorners[0]=-20;
     xCorners[1]=13;
    yCorners[1]=-13;
     xCorners[2]=12;
    yCorners[2]=0;
     xCorners[3]=15;
    yCorners[3]=8;
     xCorners[4]=0;
    yCorners[4]=17;
     xCorners[5]=-20;
    yCorners[5]=10;
     xCorners[6]=-20;
    yCorners[6]=-4;
    xCorners[7]=-16;
    yCorners[7]=-12;
    xCorners[8]=-10;
    yCorners[8]=-18;
    myColor=176;
    myCenterX=Math.random()*600;
    myCenterY=Math.random()*600;
    myDirectionX=(Math.random()*6)-3;
    myDirectionY=(Math.random()*6)-3;
    myPointDirection=270;
  }
  public void move()
  {
    rotate(rotateA);
    super.move();
    
  }
  public void show()
  {
    noStroke();
    fill(77,myColor,225);
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
   public void setX(int x) {myCenterX = x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y) {myCenterY=y;}  
   public int getY() {return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
  public double getDirectionX() {return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;} 
   public double getDirectionY() {return myDirectionY;}   
   public void setPointDirection(int degrees) {myPointDirection=degrees;} 
   public double getPointDirection(){return myPointDirection;}

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
    fill(253,myColor,110);   
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

