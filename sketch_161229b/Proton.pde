//Proton Class
class Proton extends Particle{
  //Normalized charge and mass.
  Proton(int _x, int _y, int _z, int _velx, int _vely, int _velz){
    super(_x, _y, _z, _velx, _vely, _velz);
    parCharge = 1;
    parMass = 50;
  }
  /* Runs calculations and passes along variables needed.
   * Draws particle when any of the following is true:
   *  -Particle is to the left of the two right plates.
   *  -Particle is in between the slit between the two right plates (in terms of y-axis).
   *  -Particle is to the right of the two right plates.
   */  
  void run(int _radius, double _elecField, boolean _posNeg){
    System.out.println("X: " + par_pos.x + " Y: " + par_pos.y + " Z: " + par_pos.z + " MAG: " + par_vel.mag());
    calculations(_radius, _elecField, _posNeg, parCharge, parMass);
    if (par_pos.x < _radius+140 || ((10+(height/2) > par_pos.y && par_pos.y > -10+(height/2))|| par_pos.x > _radius+160)) drawParticle(1);
  }
}