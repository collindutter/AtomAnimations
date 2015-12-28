public class QuantumMechanicsElectronTrail extends Particle
{
    public float rotation;
    public int axis;
    
    public QuantumMechanicsElectronTrail(PVector position, PVector velocity, float rotation, int axis)
    {
        super(position, velocity);
        this.rotation = rotation;
        this.axis = axis;
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