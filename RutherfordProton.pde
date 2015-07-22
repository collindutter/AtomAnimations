public class RutherfordProton extends Particle
{
    public RutherfordProton(PVector position, PVector velocity, int radius)
    {
        super(position, velocity, radius);
    }
    
    @Override
    public void drawParticle()
    {
        fill(#E34545);
        noStroke();
        ellipse(getPosition().x, getPosition().y, getRadius()*2, getRadius()*2);
        stroke(249, 192, 160);
        //vertical line
        line(getPosition().x, getPosition().y + getRadius() - 1, getPosition().x, getPosition().y - getRadius() + 1);
        //horizontal line
        line(getPosition().x - getRadius() + 1, getPosition().y, getPosition().x + getRadius() - 1, getPosition().y);
        stroke(0);
    }
}