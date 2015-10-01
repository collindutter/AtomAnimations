public class RutherfordModel extends AtomModel
{
    private ArrayList<Particle> nucleusParticles; 
    private ArrayList<Particle> orbitalParticles;

    private final int NUM_PROTONS = 7;
    private final int NUM_NEUTRONS = 7;
    private final int NUM_ELECTRONS = 7;

    public RutherfordModel()
    {
        super("Rutherford Model", 25, new PVector(500, height / 2));  
        nucleusParticles = new ArrayList<Particle>();
        orbitalParticles = new ArrayList<Particle>();
        generateNucleus();
        for (int i = 0; i < NUM_ELECTRONS; i++)
            orbitalParticles.add(new RutherfordElectron(-PI/4+ 2*PI/NUM_ELECTRONS*i));
    }

    public void drawModel()
    {
        super.drawModel();
        pushMatrix();
        translate(getPosition().x, getPosition().y);

        for (Particle p : nucleusParticles)
            p.drawParticle();
        for (Particle p : orbitalParticles)
            p.drawParticle(); 
        popMatrix();
    }

    /**
     *Generates a nucleus for the atom model
     */
    private void generateNucleus()
    {   
        //generate the neutrons
        int radius = 6;
        for (int i = 0; i < NUM_NEUTRONS; i++)
        {
            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;

            PVector neutronPos = new PVector(x*radius, y*radius, z*radius);
            PVector neutronVel = new PVector(0, 0);
            RutherfordNeutron neutron = new RutherfordNeutron(neutronPos, neutronVel, 3);
            nucleusParticles.add(neutron);
        }

        //generate the protons
        for (int i = 0; i < NUM_PROTONS; i++)
        {

            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;

            PVector protonPos = new PVector(x*radius, y*radius, z*radius);
            PVector protonVel = new PVector(0, 0);
            RutherfordProton proton = new RutherfordProton(protonPos, protonVel, 3);
            nucleusParticles.add(proton);
        }
    }
}