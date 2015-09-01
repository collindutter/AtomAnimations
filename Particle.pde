public abstract class Particle
{
    private PVector position;
    private PVector velocity;
    private int radius;

    public Particle(PVector position, PVector velocity, int radius)
    {
        this.position = position;
        this.velocity = velocity;
        this.radius = radius;
    }
    
    public abstract void drawParticle();
    
    public PVector getPosition(){return position;}
    public void setPosition(PVector position){this.position = position;}
    public PVector getVelocity(){return velocity;}
    public void setVelocity(PVector velocity){this.velocity = velocity;}
    public int getRadius(){return radius;}
}