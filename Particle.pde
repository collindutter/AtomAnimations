public abstract class Particle
{
    private PVector position; //position of particle relative to atom
    private PVector velocity; //velocity of particle relative to container
    private int radius; //radius of particle

    public Particle(PVector position, PVector velocity)
    {
        this.position = position;
        this.velocity = velocity;
        radius = 5;
    }

    /**
     *Draws the particle
     */
    public abstract void drawParticle();

    //GETTERS AND SETTERS
    public PVector getPosition()
    {
        return position;
    }
    
    public void setPosition(PVector position)
    {
        this.position = position;
    }
    
    public PVector getVelocity()
    {
        return velocity;
    }
    
    public void setVelocity(PVector velocity)
    {
        this.velocity = velocity;
    } 
    public int getRadius()
    {
        return radius;
    }
}