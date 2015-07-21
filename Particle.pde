public abstract class Particle
{
    private PVector position;
    private PVector velocity;

    public Particle(PVector position)
    {
        this.position = position;
    }
    
    public abstract void drawParticle();
}