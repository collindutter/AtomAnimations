public class RutherfordElectronRing extends RutherfordElectron{
    private float orbitRadius; //radius of ring from center of atom
    private float orbitRotation; //angle at which the orbit occurs
    

    public RutherfordElectronRing(float orbitRotation)
    {
        super(orbitRotation);
        orbitRadius = 45;
        this.orbitRotation = orbitRotation;
    }

    @Override
    public void drawParticle()
    {
        //flip it around some axis
        rotateY(PI/2);
        rotateX(orbitRotation);
        rotateY(PI/3);

        //draw orbit ring
        noFill();
        stroke(0);
        ellipse(0, 0, orbitRadius*2, orbitRadius*2/3f);

        //unflip it around some axis
        rotateY(-PI/3);
        rotateX(-orbitRotation);
        rotateY(-PI/2);
    }
}