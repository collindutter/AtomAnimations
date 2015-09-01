public class RutherfordElectron extends Particle
{
    private float orbitAngle;//angular position of particle
    private float orbitRadius;//radius of particle from center of atom
    private float angularVel;//velocity at which particle moves
    private float orbitRotation;//angle at which the orbit occurs
    
    public RutherfordElectron(float orbitRotation)
    {
        super(new PVector(0, 0), new PVector(0, 0), 3);
        orbitAngle = random(0, 2 * PI);
        orbitRadius = 30;
        angularVel = random(.05, .1);
        this.orbitRotation = orbitRotation;
    }
    
    public void drawParticle()
    {
       orbitAngle += angularVel;
       float x = orbitRadius*cos(orbitAngle)*cos(orbitRotation) - orbitRadius/3f*sin(orbitAngle)*sin(orbitRotation);
       float y = orbitRadius*cos(orbitAngle)*sin(orbitRotation) + orbitRadius/3f*sin(orbitAngle)*cos(orbitRotation);
       setPosition(new PVector(x, y));
       
       pushMatrix();
       rotate(orbitRotation);
       noFill();
       ellipse(0, 0, orbitRadius*2, orbitRadius*2/3f);
       popMatrix();
       
       noStroke();
       fill(204, 254, 255);
       translate(getPosition().x, getPosition().y);
       sphere(getRadius());
       translate(-getPosition().x, -getPosition().y);
       stroke(0);
       line(getPosition().x - getRadius() + 1, getPosition().y, getPosition().x + getRadius() - 1, getPosition().y);
       
    }
}