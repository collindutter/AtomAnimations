public class ThomasProton extends Particle
{
    private AtomModel container;
    
    public ThomasProton(AtomModel container, PVector position, PVector velocity)
    {
        super(position, velocity, 3);
        this.container = container;
    }

    @Override
    public void drawParticle()
    {
        stroke(249, 192, 160, 127);
        //vertical line
        line(getPosition().x, getPosition().y + getRadius(), getPosition().x, getPosition().y - getRadius());
        //horizontal line
        line(getPosition().x - getRadius(), getPosition().y, getPosition().x + getRadius(), getPosition().y);
        stroke(1);
 
    }   
}
