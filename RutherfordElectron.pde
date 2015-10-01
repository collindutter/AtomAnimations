public class RutherfordElectron extends Particle
{
    private float orbitAngle; //angular position of particle
    private float orbitRadius; //radius of particle from center of atom
    private float angularVel; //velocity at which particle moves
    private float orbitRotation; //angle at which the orbit occurs

    public RutherfordElectron(float orbitRotation)
    {
        super(new PVector(0, 0), new PVector(0, 0));
        orbitAngle = random(0, 2 * PI);
        orbitRadius = 45;
        angularVel = random(.05, .1);
        this.orbitRotation = orbitRotation;
    }

    @Override
    public void drawParticle()
    {
        //math for the basic particle rotation
        orbitAngle += angularVel;
        float x = orbitRadius*cos(orbitAngle);
        float y = orbitRadius/3f*sin(orbitAngle);
        setPosition(new PVector(x, y));

        //flip it around some axis
        rotateY(PI/2);
        rotateX(orbitRotation);
        rotateY(PI/3);

        //draw orbit ring
        noFill();
        ellipse(0, 0, orbitRadius*2, orbitRadius*2/3f);

        //draw electron
        noStroke();
        fill(204, 254, 255);
        translate(getPosition().x, getPosition().y);
        sphere(getRadius());
        stroke(0);
        translate(-getPosition().x, -getPosition().y);

        //unflip it around some axis
        rotateY(-PI/3);
        rotateX(-orbitRotation);
        rotateY(-PI/2);
    }
}