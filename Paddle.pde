// We'll create a class Paddle for craeting the left & right paddles for the game 

// The paddle is a rectangle, & there are different ways to draw a rectangle : 1) top left corner, width & height
//2) top left corner, bottom right corner & 3) centre of the rectangle, width & height (We'll go with this)

class Paddle{
  float x;
  float y = height / 2; // paddle has to be in the middle 
  float w = 10;
  float h = 100;
  
  float yChange = 0;
  
  /*
  Paddle(float x_){ // Constructor of Paddle class
    x = x_; // this is equivalent to this.x = x_ (Java) or self.x = x_ (Python)
  }
  */
  
  Paddle(boolean left){ // Constructor of Paddle class
    if(left){
      x = w / 2 + 10; // as x is the x coordinate of the centre of the rectangle so if it's w/2, for the left paddle, from the centre the paddle would have w/2 on both sides which would make the paddle "w" pixels wide
    }
    else{
      x = width - w / 2 - 10; // for the right paddle, if x = width - w/2, that simply means x would be at a point from which on both sides w/2 would be taken & the paddle would become "w" pixels wide
    }
    // for the right paddle, if we take x at the width, half of the right paddle would go outside the window
    
    // +10 & -10 have been put to create some gap between the paddles & the edges of the window
  }
  
  
  void update(){ // for updating the value of the y coordinate of the centre of the paddle by yChange
    y += yChange;
    y = constrain(y, h/2, height - h/2); // constrain the y co-ordinate value of the centre of the paddle in between h/2 & height - h/2, this line of code for preventing the paddles from moving outside the window vertically
  
  }
  
  // Function to move the paddles
  void move(float steps){ // the paddle would be moved by the number of steps that is provided to this function
    yChange = steps; // sets the value by which y coordinate of the centre of the paddle should change to move it
  
  }
  
  
  // Function to display the paddles
  void show(){
    fill(255);
    rectMode(CENTER);
    rect(x, y, w, h); // drawing the rectangle with the properties defined above
  
  }



}
