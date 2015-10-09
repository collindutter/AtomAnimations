public class QuantumMechanicsElectron extends Particle
{
    public QuantumMechanicsElectron(PVector position, PVector velocity)
    {
        super(position, velocity);
    }

    @Override
    public void drawParticle()
    {
        fill(0);
        noSmooth();
        point(getPosition().x, getPosition().y, getPosition().z);
        smooth();
 
    }
}