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
    
    public void drawModel(float centerX, float centerY)
    {
        pushMatrix();
        translate(centerX, centerY);
        for(Particle p : nucleusParticles)
           p.drawParticle();
        for(Particle p : orbitalParticles)
            p.drawParticle();      
        fill(0);
        textSize(15);
        textAlign(CENTER);
        text(getName(), 0, getRadius() + 15);
        popMatrix();
    }
    
    private void generateNucleus()
    {
         //generate the neutrons
         for(int i = 0; i < NUM_NEUTRONS; i++)
         {
            //PVector neutronPos = new PVector(random(0, 1) >= .5f ? random(2, 5) : random(-2, -5), random(0, 1) >= .5f ? random(3, 6) : random(-2, -5));
            PVector neutronPos = new PVector(random(-3, 4), random(-3, 4));
            PVector neutronVel = new PVector(0, 0);
            RutherfordNeutron neutron = new RutherfordNeutron(neutronPos, neutronVel, 3);
            nucleusParticles.add(neutron);
            
            //PVector protonPos = new PVector(random(0, 1) >= .5f ? random(2, 5) : random(-2, -5), random(0, 1) >= .5f ? random(2, 5) : random(-2, -5));
            PVector protonPos = new PVector(random(-3, 4), random(-3, 4));
            PVector protonVel = new PVector(0, 0);
            RutherfordProton proton = new RutherfordProton(protonPos, protonVel, 3);
            nucleusParticles.add(proton);   
         }
    }
    
}