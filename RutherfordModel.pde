public class RutherfordModel extends AtomModel
{
    private ArrayList<Particle> nucleusParticles;
    private ArrayList<Particle> orbitalParticles;
    
    private final int NUM_PROTONS = 3;
    private final int NUM_NEUTRONS = 3;
    private final int NUM_ELECTRONS = 3;
    
    public RutherfordModel()
    {
         super("Rutherford Model", 25, new PVector(500, height / 2));  
         nucleusParticles = new ArrayList<Particle>();
         orbitalParticles = new ArrayList<Particle>();
         generateNucleus();
         for(int i = 0; i < NUM_ELECTRONS; i++)
             orbitalParticles.add(new RutherfordElectron(-PI/2 + 2*PI/NUM_ELECTRONS*i));
    }
    
    public void drawModel()
    {
        pushMatrix();
        translate(getPosition().x, getPosition().y);
        for(Particle p : nucleusParticles)
           p.drawParticle();
        for(Particle p : orbitalParticles)
            p.drawParticle();      
        fill(0);
        textSize(15);
        textAlign(CENTER);
        text(getName(), 0, 30 + 15);
        popMatrix();
    }
    
    private void generateNucleus()
    {
        float angle = 0;
        for(int i = 0; i < NUM_NEUTRONS + NUM_PROTONS; i++)
        {
            PVector neutronPos = new PVector(3*cos(angle), 3*sin(angle));
            PVector neutronVel = new PVector(0, 0);
            RutherfordNeutron neutron = new RutherfordNeutron(neutronPos, neutronVel, 3);
            nucleusParticles.add(neutron);
            angle += 2*PI/NUM_NEUTRONS/2;
            
            PVector protonPos = new PVector(3*cos(angle), 3*sin(angle));
            PVector protonVel = new PVector(0, 0);
            RutherfordProton proton = new RutherfordProton(protonPos, protonVel, 3);
            nucleusParticles.add(proton);
            angle += 2*PI/NUM_PROTONS/2;
        }
    }
}