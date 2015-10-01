public class QuantumMechanicsModel extends AtomModel
{
    private QuantumMechanicsProton proton; //proton bouncing around in middle
    private ArrayList<Particle> orbitalParticles; //array to hold the oribiting electrons
    
    public QuantumMechanicsModel()
    {
        super("Quantum Mechanics Model", 25, new PVector(900, height / 2));
        orbitalParticles = new ArrayList<Particle>();
        proton = new QuantumMechanicsProton(this);
        
    }

    @Override
    public void drawModel()
    {
        super.drawModel();
        pushMatrix(); 
        translate(getPosition().x, getPosition().y);
        proton.drawParticle();
        fill(0, 0, 0, 30);
        noStroke();
        rotateX(-PI/6);
        sphere(getRadius());
        rotateX(PI/6);
        popMatrix();
    }
}