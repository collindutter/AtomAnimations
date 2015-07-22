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
        stroke(249, 192, 160);
        //vertical line
        line(getPosition().x, getPosition().y + getRadius(), getPosition().x, getPosition().y - getRadius());
        //horizontal line
        line(getPosition().x - getRadius(), getPosition().y, getPosition().x + getRadius(), getPosition().y);
        stroke(1);

        getPosition().add(getVelocity());

        if(getPosition().mag() + getRadius() >= container.getRadius())
        {
            //bump it back just a bit
            getPosition().sub(new PVector(getPosition().x * .02, getPosition().y * .02));
            
            float tempX = getVelocity().x;
            getVelocity().x = -getVelocity().y;
            getVelocity().y = tempX;
            
            /*experimental fancy bounces
            //bump it in a bit
            getPosition().sub(new PVector(getPosition().x * .02f, getPosition().y * .02f));

            //choose a bounce angle
            float ang = (float)(Math.toRadians(random(90, 270)));
            //bounce
            float oldX = getVelocity().x;
            float oldY = getVelocity().y;
            getVelocity().x = (float)(Math.cos(ang)) * oldX - (float)(Math.sin(ang)) * oldY;
            getVelocity().y = (float)(Math.sin(ang)) * oldX + (float)(Math.cos(ang)) * oldY;
            */
        }
    }   
}