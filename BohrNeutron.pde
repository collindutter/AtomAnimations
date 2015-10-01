public class BohrNeutron extends Particle
{
    public BohrNeutron(PVector position, PVector velocity, int radius)
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