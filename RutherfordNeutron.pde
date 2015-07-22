public class RutherfordNeutron extends Particle
{
    public RutherfordNeutron(PVector position, PVector velocity, int radius)
    {
        super(position, velocity, radius);
    }
    
    @Override
    public void drawParticle()
    {
        fill(#4560E3);
        ellipse(getPosition().x, getPosition().y, getRadius()*2, getRadius()*2);
    }
}