private class ThomasElectron extends Particle
{
    private AtomModel container;

    public ThomasElectron(AtomModel container, PVector position, PVector velocity)
    {
        super(position, velocity, 3);
        this.container = container;
    }

    @Override
    public void drawParticle()
    {
        noStroke();
        fill(204, 254, 255);
        translate(getPosition().x, getPosition().y);
        sphere(getRadius()*2);
        stroke(0);
        translate(-getPosition().x, -getPosition().y);
        
        getPosition().add(getVelocity());

        if(getPosition().mag() + getRadius() >= container.getRadius())
        {
            //bump it back just a bit
            getPosition().sub(new PVector(getPosition().x * .02, getPosition().y * .02));
            
            //flippity flop them velocities
            float tempX = getVelocity().x;
            getVelocity().x = -getVelocity().y;
            getVelocity().y = tempX;
        }
        
    }
}
