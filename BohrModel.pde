public class BohrModel extends AtomModel
{
    private ArrayList<Particle> nucleusParticles; //array to hold the protons and nuetrons in nucleus
    private ArrayList<Particle> orbitalParticles; //array to hold the oribiting electrons

    private final int NUM_PROTONS = 3;
    private final int NUM_NEUTRONS = 3;
    private final int NUM_ELECTRONS = 3;

    public BohrModel()
    {
        super("Bohr Model", 25, new PVector(700, height / 2));
        nucleusParticles = new ArrayList<Particle>();
        orbitalParticles = new ArrayList<Particle>();
        generateNucleus();
        for (int i = 1; i <= NUM_ELECTRONS; i++)
            orbitalParticles.add(new BohrElectron(i*15));
    }

    @Override
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
        int radius = 3;
        //generate the neutrons for the model
        for (int i = 0; i < NUM_NEUTRONS; i++)
        {
            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;

            PVector neutronPos = new PVector(x*radius, y*radius, z*radius);
            PVector neutronVel = new PVector(0, 0);
            BohrNeutron neutron = new BohrNeutron(neutronPos, neutronVel, 3);
            nucleusParticles.add(neutron);
        }

        //generate the protons for the model
        for (int i = 0; i < NUM_PROTONS; i++)
        {

            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;

            PVector protonPos = new PVector(x*radius, y*radius, z*radius);
            PVector protonVel = new PVector(0, 0);
            BohrProton proton = new BohrProton(protonPos, protonVel, 3);
            nucleusParticles.add(proton);
        }
    }
}