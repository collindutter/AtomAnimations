public class QuantumMechanicsElectron extends Particle
{
    public color drawColor;
    public QuantumMechanicsElectron(PVector position, PVector velocity)
    {
        super(position, velocity);
        drawColor = color(204, 254, 255);
    }
    public QuantumMechanicsElectron(PVector position, PVector velocity, int colorNumber)
    {
        this(position, velocity);
        if(colorNumber == 0)
            drawColor = color(204, 254, 255);
        else if(colorNumber == 1)
            drawColor = color(204, 254, 0);
        else if(colorNumber == 2)
            drawColor = color(0, 254, 255);
    }

    @Override
    public void drawParticle()
    {
        //draw the electron
        noStroke();
        fill(drawColor);
        
        translate(getPosition().x, getPosition().y, getPosition().z);
        sphere(getRadius());
        translate(-getPosition().x, -getPosition().y, -getPosition().z);
       
    }
}