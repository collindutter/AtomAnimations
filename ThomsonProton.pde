private class ThomsonProton extends Particle
{
    public ThomsonProton(AtomModel container, PVector position, PVector velocity)
    {
        super(position, velocity);
    }

    @Override
    public void drawParticle()
    {
        //draw the electrons
        noStroke();
        fill(#E34545);
        translate(getPosition().x, getPosition().y, getPosition().z);
        sphere(getRadius());
        stroke(0);
        translate(-getPosition().x, -getPosition().y, -getPosition().z);
    }
}