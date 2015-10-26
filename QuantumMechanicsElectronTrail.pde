public class QuantumMechanicsElectronTrail extends Particle
{
    public QuantumMechanicsElectronTrail(PVector position, PVector velocity)
    {
        super(position, velocity);
    }

    @Override
    public void drawParticle()
    {
        stroke(0);
        strokeWeight(2);
        point(getPosition().x, getPosition().y, getPosition().z); 
        strokeWeight(1);
    }
}