public class QuantumMechanicsElectronTrail extends Particle
{
    public QuantumMechanicsElectronTrail(PVector position, PVector velocity)
    {
        super(position, velocity);
    }

    @Override
    public void drawParticle()
    {
        fill(0);
        stroke(0);
        point(getPosition().x, getPosition().y, getPosition().z); 
    }
}