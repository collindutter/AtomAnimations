public class QuantumMechanicsElectron extends Particle
{
    public QuantumMechanicsElectron(PVector position, PVector velocity)
    {
        super(position, velocity);
    }

    @Override
    public void drawParticle()
    {
        //draw the electron
        noStroke();
        fill(204, 254, 255);
        pushMatrix();
        translate(getPosition().x, getPosition().y, getPosition().z);
        sphere(getRadius());
        translate(-getPosition().x, -getPosition().y, -getPosition().z);
        popMatrix();
    }
}