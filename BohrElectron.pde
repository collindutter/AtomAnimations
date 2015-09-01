public class BohrElectron extends Particle
{
    private float orbitAngle;//angular position of particle
    private float orbitRadius;//radius of particle from center of atom
    private float angularVel;//velocity at which particle moves
    
    public BohrElectron(float orbitRadius)
    {
        super(new PVector(0, 0), new PVector(0, 0), 3);
        orbitAngle = random(0, 2 * PI);
        this.orbitRadius = orbitRadius;
        angularVel = random(.05, .1);
    }
    
    public void drawParticle()
    {
       orbitAngle += angularVel;
       float x = orbitRadius*cos(orbitAngle);
       float y = orbitRadius*sin(orbitAngle);
       setPosition(new PVector(x, y));
       
       noFill();
       stroke(1);
       println(orbitRadius);
       ellipse(0, 0, orbitRadius*2, orbitRadius*2);
       
       noStroke();
       fill(204, 254, 255);
       pushMatrix();
       translate(getPosition().x, getPosition().y);
       sphere(getRadius());
       translate(-getPosition().x, -getPosition().y);
       popMatrix();
    }
}