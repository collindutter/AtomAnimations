private class ThomasElectron extends Particle
{
    private AtomModel container;

    public ThomasElectron(AtomModel container, PVector position, PVector velocity)
    {
        super(position, velocity, 6);
        this.container = container;
    }

    @Override
    public void drawParticle()
    {
        noStroke();
        fill(204, 254, 255);
        translate(getPosition().x, getPosition().y, getPosition().z);
        sphere(getRadius());
        stroke(0);
        translate(-getPosition().x, -getPosition().y, -getPosition().z);
        
        getPosition().add(getVelocity());

        if(getPosition().mag() + getRadius() >= container.getRadius())
        {
            //bump it back just a bit
            getPosition().sub(new PVector(getPosition().x * .02, getPosition().y * .02, getPosition().z * .02));
            setVelocity(new PVector(-getVelocity().x, -getVelocity().y, -getVelocity().z));
        }
        
    }
}