int numParticles = 100;    // Number of particles
Particle[] particles = new Particle[numParticles]; // Array of particles
OddballParticle oddball;   // One oddball particle

void setup() {
  size(1000, 1000);        // Set the canvas size
  background(0);           // Set background to black
  
  // Initialize the regular particles
  for (int i = 0; i < numParticles; i++) {
    particles[i] = new Particle();
  }
  
  // Initialize the oddball particle
  oddball = new OddballParticle();
}

void draw() {
  background(0);           // Clear the background in each frame
  
  // Move and display each regular particle
  for (int i = 0; i < numParticles; i++) {
    particles[i].move();
    particles[i].display();
  }
  
  // Move and display the oddball particle
  oddball.move();
  oddball.display();
}

// Particle class
class Particle {
  float x, y;               // Position
  float speed, angle;       // Speed and angle of movement
  color c;                  // Color of the particle

  // Constructor to initialize a particle with random speed and angle
  Particle() {
    x = width / 2;          // Start from the center of the canvas
    y = height / 2;
    speed = random(1, 3);   // Random speed between 1 and 3
    angle = random(TWO_PI); // Random angle in radians
    c = color(255, 0, 0);   // Set color to red
  }

  // Move function to update position based on angle and speed
  void move() {
    x += cos(angle) * speed;
    y += sin(angle) * speed;

    // Wrap particles around the edges
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }

  // Display the particle
  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, 5, 5); // Draw as a small circle
  }
}

// OddballParticle class that extends Particle
class OddballParticle extends Particle {
  
  // Constructor for the oddball particle
  OddballParticle() {
    super();
    c = color(0, 0, 255);   // Set color to blue for the oddball
  }

  // Override move function to move inversely or conversely
  void move() {
    x -= cos(angle) * speed; // Move in the opposite direction
    y -= sin(angle) * speed;

    // Wrap the oddball around the edges
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }
}
