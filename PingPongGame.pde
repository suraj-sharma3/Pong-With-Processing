//import processing.sound.*; // for adding sound to the game

// https://processing.org/reference/libraries/sound/index.html -> link for the documentation of the sound library of processing

// to download & install libraries : go to sketch -> import library -> manage libraries -> search for the library -> install
// to import a library -> go to sketch -> import library -> select the library you want to import

// Requirements : Left Paddle & Right Paddle, Puck (Ball)
// The paddles need to move up & down
// The puck needs to have x & y & also xSpeed & ySpeed
// We need to detect the collisions between the puck & the paddles
// We also need to detect if the puck is going past the paddles
// If the puck goes past the right paddle, the player operating the left paddle gets a score
// If the puck goes past the left paddle, the player operating the right paddle gets a score 
// We would use OOP to create the game

Puck puck; // Declaring or creating a new Puck object

//SoundFile ding;

// Creating the left & right paddles by using the same Paddle class
Paddle left;
Paddle right;

int leftScore = 0;
int rightScore = 0;

void setup(){
  size(1000,700);
  //ding = new SoundFile(this, "C:/Users/Shavit/Desktop/Processing/Ping Pong Game/PingPongGame/ding.mp3");
  puck = new Puck(); // Constructing or Initializing the created puck object
  //left = new Paddle(0); // passing the values for x_ in the constructor which would be taken by x for this paddle & this paddle would be displayed on the left side (x = 0)
  //right = new Paddle(width); // passing the values for x_ in the constructor which would be taken by x for this paddle & this paddle would be displayed on the right side (x = width)
  left = new Paddle(true); // The boolean variable in the constructor is left, that's why for left paddle, it should be true
  right = new Paddle(false); // The boolean variable in the constructor is left, that's why for right paddle, it should be false
}

void draw(){
  background(0);
  
  // puck.checkPaddle(left); // for checking if the puck has hit the left paddle
  puck.checkPaddleRight(right); // for checking if the puck has hit the right paddle, 1 is stored inside dir & it tells that the puck is moving in the positive direction of x which is right
  puck.checkPaddleLeft(left); // for checking if the puck has hit the left paddle, -1 is stored inside dir & it tells that the puck is moving in the negative direction of x which is left
  // Calling the methods on the paddle objects
  left.show();
  right.show();
  
  // These below given update methods are being called continuously, the value of y coordinate of the paddle is being updated always but it is only being updated by adding or subtracting 0 from y unless a key is pressed, bcoz once a key is pressed, the move method is called which updates the value of yChange 
  left.update();
  right.update();
  
  // Calling the methods on the puck objects
  puck.update();
  puck.edges();
  puck.show();
  
  // For displaying the scores of the players
  fill(255); // setting the font color
  textSize(32); // setting the font size
  text(leftScore, 45, 40); // text to be displayed, x & y coordinates for the text
  text(rightScore, width - 64, 40); // text to be displayed, x & y coordinates for the text
}


// For enabling the feature to keep moving the paddle until the key for moving it is pressed & once the key is released, the paddle should stop moving
void keyReleased(){
  left.move(0);
  right.move(0);
}

// For handling the movement of the paddles

void keyPressed(){
  if(key == 'w'){
    left.move(-10); // left paddle moves upward when 'w' is pressed as y value is being decreased by 1
  }  
  else if(key == 'a'){
    left.move(10); // left paddle moves downward when 'a' is pressed as y value is being increased by 1
  }

  if(keyCode == UP){
    right.move(-10); // right paddle moves downward when 'a' is pressed as y value is being decreased by 1
  }  
  else if(keyCode == DOWN){
    right.move(10); // right paddle moves upward when 'w' is pressed as y value is being increased by 1
  }

}
