public class QuantumMechanicsProton extends Particle
{   
    public QuantumMechanicsProton(PVector position, PVector velocity)
    {
        super(position, velocity);
 
    }

    @Override
    public void drawParticle()
    {
        noStroke();
        fill(#E34545);
        translate(getPosition().x, getPosition().y, getPosition().z);
        sphere(getRadius());
        stroke(0);
        translate(-getPosition().x, -getPosition().y, -getPosition().z);
    }
   
}