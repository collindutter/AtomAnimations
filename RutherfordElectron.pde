public class RutherfordElectron extends Particle
{
    private float orbitAngle;//angular position of particle
    private float orbitRadius;//radius of particle from center of atom
    private float angularVel;//velocity at which particle moves
    private float orbitRotation;//angle at which the orbit occurs
    private float rotOffset;
    
    public RutherfordElectron(float orbitRotation)
    {
        super(new PVector(0, 0), new PVector(0, 0), 3);
        orbitAngle = random(0, 2 * PI);
        orbitRadius = 30;
        angularVel = random(.05, .1);
        this.orbitRotation = orbitRotation;
        rotOffset = random(-PI/6, PI/6);
        println(degrees(orbitRotation));
    }
    
    public void drawParticle()
    {
       orbitAngle += angularVel;
       float x = orbitRadius*cos(orbitAngle);
       float y = orbitRadius/3f*sin(orbitAngle);

       setPosition(new PVector(x, y));
       rotateY(PI/2);
       rotateX(orbitRotation);
       rotateY(PI/4);
       noFill();
       ellipse(0, 0, orbitRadius*2, orbitRadius*2/3f);
       
       noStroke();
       fill(204, 254, 255);
       translate(getPosition().x, getPosition().y);
       sphere(getRadius());
       stroke(0);
       translate(-getPosition().x, -getPosition().y);
       rotateY(-PI/4);
       rotateX(-orbitRotation);
       rotateY(-PI/2);
       
       //rotateY(-orbitRotation);
       
       
    }
}