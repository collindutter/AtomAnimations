public class BohrModel extends AtomModel
{
    private ArrayList<Particle> nucleusParticles; //array to hold the protons and nuetrons in nucleus
    private ArrayList<Particle> orbitalParticles; //array to hold the oribiting electrons

    private int numProtons = 1;
    private int numNeutrons = 1;
    private int numElectrons = 1;

    public BohrModel()
    {
        super("Bohr Model", 25, new PVector(700, height / 2));
        nucleusParticles = new ArrayList<Particle>();
        orbitalParticles = new ArrayList<Particle>();
        generateNucleus();
        for (int i = 1; i <= numElectrons; i++)
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
        
        for(int i = 2; i < 4; i++)
        {
            //draw the orbit ring
            noFill();
            stroke(1);
            ellipse(0, 0, 30*i, 30*i);
        }
            
        popMatrix();
    }

    /**
     *Generates a nucleus for the atom model
     */
    private void generateNucleus()
    {    
        int radius = 3;
        //generate the neutrons for the model
        for (int i = 0; i < numNeutrons; i++)
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
        for (int i = 0; i < numProtons; i++)
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