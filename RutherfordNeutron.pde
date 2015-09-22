public class RutherfordNeutron extends Particle
{
    public RutherfordNeutron(PVector position, PVector velocity, int radius)
    {
        super(position, velocity, radius);
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