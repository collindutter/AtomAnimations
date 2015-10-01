public class QuantumMechanicsProton extends Particle
{
    private AtomModel container;
    
    public QuantumMechanicsProton(AtomModel container)
    {
        super(new PVector(0, 0, 0), new PVector(0, 0, 0), 3);
        this.container = container;
    }

    @Override
    public void drawParticle()
    { 
        if(frameCount % 60 == 0)
        {
            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;
    
            PVector protonPos = new PVector(x*container.getRadius(), y*container.getRadius(), z*container.getRadius());
            PVector protonVel = new PVector(0, 0);
            setPosition(protonPos);
            setVelocity(protonVel);
        }
        
        noStroke();
        fill(#4560E3);
        translate(getPosition().x, getPosition().y, getPosition().z);
        sphere(getRadius());
        stroke(0);
        translate(-getPosition().x, -getPosition().y, -getPosition().z);
    }
}