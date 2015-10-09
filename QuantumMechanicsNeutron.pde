public class QuantumMechanicsNeutron extends Particle
{
    public QuantumMechanicsNeutron(PVector position, PVector velocity)
    {
        super(position, velocity);
    }

    @Override
    public void drawParticle()
    {
        noStroke();
        fill(#4560E3);
        translate(getPosition().x, getPosition().y, getPosition().z);
        sphere(getRadius());
        stroke(0);
        translate(-getPosition().x, -getPosition().y, -getPosition().z);
    }
}