private class ThomasElectron extends Particle
{
    private AtomModel container;

    public ThomasElectron(AtomModel container, PVector position, PVector velocity)
    {
        super(position, velocity);
        this.container = container;
    }

    @Override
    public void drawParticle()
    {
        //move the electrons
        getPosition().add(getVelocity());

        //check and handle collisions
        if (getPosition().mag() + getRadius() >= container.getRadius()-1)
        {
            PVector position = new PVector(getPosition().x, getPosition().y, getPosition().z);
            PVector velocity = new PVector(getVelocity().x, getVelocity().y, getVelocity().z);
            PVector normal = position.mult(-1).normalize();
            PVector reflect = velocity.sub(normal.mult(2 * velocity.dot(normal)));
            setVelocity(reflect);
        }

        //draw the electrons
        noStroke();
        fill(204, 254, 255);
        translate(getPosition().x, getPosition().y, getPosition().z);
        sphere(getRadius());
        stroke(0);
        translate(-getPosition().x, -getPosition().y, -getPosition().z);
    }
}