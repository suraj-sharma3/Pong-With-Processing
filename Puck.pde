// Here we create a class for creating a puck object, consider a class as just a template that is used to create a thing

class Puck{
  float x = width / 2;
  float y = height / 2;
  
  float xSpeed;
  float ySpeed;
  
  float r = 12; // radius of the puck
  
  Puck(){ // whenever the puck object is created the reset() method would be automatically called
    reset();
  }
  
  void checkPaddleLeft(Paddle p){ // Paddle p is for detecting with which paddle (left or right), the puck has collided, dir is for checking the direction from which the puck is coming
    if(y < p.y + p.h/2 && y > p.y - p.h/2 && x - r < p.x + p.w/2){ // checking if the paddle's y position is in between the top & bottom edge of the window
     // checking if the puck is moving in the left direction and if the puck has hit the left paddle
        if(x > p.x){
          xSpeed *= -1;
        }    
    }
  }
  
  void checkPaddleRight(Paddle p){ // Paddle p is for detecting with which paddle (left or right), the puck has collided, dir is for checking the direction from which the puck is coming
    if(y < p.y + p.h/2 && y > p.y - p.h/2 && x + r > p.x - p.w/2){ // checking if the paddle's y position is in between the top & bottom edge of the window
     // checking if the puck is moving in the right direction and if the puck has hit the right paddle
        if(x < p.x){
          xSpeed *= -1;
        }    
    }
  }   
  
  
  
  
  
  
  
  // Function to update the position of the puck
  void update(){
    x = x + xSpeed;
    y = y + ySpeed;
  
  }
  
  
  // Function that resets the puck back to the centre of the screen
  void reset(){
    x = width / 2;
    y = height / 2;
    
    float angle = random(- PI/4, PI/4); // pick a random angle between -45 & +45 degrees, this is for making the puck move in random directions whenever it hits the paddles
    xSpeed = 5 * cos(angle); 
    ySpeed = 5 * sin(angle);
    // the puck would move at the same speed but always in random directions
    
    if(random(1) < 0.5){ // take a number from 0 to 1 & check if it is less than 0.5, just making the ball go in either directions 50 % of the time
      xSpeed *= -1;
    }
  
  }
  
  // Function to handle the case when the puck hits the edges
  void edges(){
    if (y < 0 || y > height){ // if the puck is above the window or if it is below the window
      ySpeed *= -1;
    }
    
    if(x - r > width){ // if the puck passes the right paddle, the left paddle gets a point
      //ding.play(); // sound gets played whenever someone gets a point
      leftScore++; // the score of the left paddle increases
      reset(); // The ball is reset to the centre of the window
    }
    
    if(x + r < 0){ // if the puck passes the left paddle, the right paddle gets a point
      //ding.play(); // sound gets played whenever someone gets a point
      rightScore++; // the score of the right paddle increases
      reset(); // The ball is reset to the centre of the window
    }
  }
  
  // Function to display the puck
  void show(){
    fill(255);
    ellipse(x, y, r*2, r*2);
  }

}
