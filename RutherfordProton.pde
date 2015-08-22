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
        translate(getPosition().x, getPosition().y);
        sphere(getRadius());
        stroke(249, 192, 160);
        
        //vertical line
        line(0, getRadius() - 1, 0, - getRadius() + 1);
        //horizontal line
        line(- getRadius() + 1, 0, + getRadius() - 1, 0);
        stroke(0);
        translate(-getPosition().x, -getPosition().y);
    }
}
