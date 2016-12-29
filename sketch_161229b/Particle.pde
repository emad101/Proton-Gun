class Particle {
  //Mass and Charge set by particle, normalized values.
  int parCharge;
  int parMass;
  //PVectors
  PVector par_pos = new PVector(0, 0, 0);//The displacement from (0,0)
  PVector par_acc = new PVector(0, 0, 0);//Acceleration of particle
  PVector par_vel = new PVector(0, 0, 0);//Velocity of particle
  PVector elefield = new PVector(0, 0, 0);//Strenght of Electric Field
  
  //Sets received values by Proton_Gun to particle's position and velocity vectors.
  Particle(int _x, int _y, int _z, int _velx, int _vely, int _velz){
    par_pos.x = _x;
    par_pos.y = _y;
    par_pos.z = _z;
    par_vel.x = _velx;
    par_vel.y = _vely;
    par_vel.z = _velz;
  }
  
  /* Draws the Particle.
   * 0 = Electron
   * 1 = Proton
   * Moves plain to where particle is and draws a shpere. 
   */
  void drawParticle(int typeOfParticle){
    pushMatrix();
    translate(par_pos.x, par_pos.y, par_pos.z);
    noStroke();
    switch (typeOfParticle){
      case 0: fill(0,0,225);  sphere(2);  break;
      case 1: fill(255,0,0);  sphere(5);  break;
    }
    popMatrix();
  }
  
  /* Preforms calculations.
   * Uses the following equation to determine the position of the particle:
   * - Force Applied = Magnetic Force (as there is no other Force acting upon the particle)
   * - m * a = q * E
   * - a = (q * E) / m
   * - Add accleration to velocity.
   * - Add velocity to position.
   */
  void calculations(float _radius, double _elecField, boolean _posNegX, int _parCharge, int _parMass){
    elefield.x = (float) _elecField;
    if(_radius+150 > par_pos.x){
      if (_posNegX == false) elefield.x *= -1;
      elefield.mult(_parCharge); // q*E
      elefield.div(_parMass); // E/m
      par_acc = elefield; // a = E
      par_vel.add(par_acc);
    }
    par_pos.add(par_vel);
  }
  
  //Get x pos
  public int getPar_x(){
    return (int) par_pos.x;
  }
  
  //get y pos
  public int getPar_y(){
    return (int) par_pos.y;
  }
  
  public int getPar_Velx(){
    return (int) par_vel.x; 
  }
  
  public int getPar_Vely(){
    return (int) par_vel.y;
  }
}