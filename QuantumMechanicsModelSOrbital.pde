public class QuantumMechanicsModelSOrbital extends AtomModel
{
    private ArrayList<Particle> nucleusParticles; //array to hold the oribiting electrons
    private ArrayList<QuantumMechanicsElectronTrail> electronTrails;
    private QuantumMechanicsElectron electron;

    private int numNeutrons = 3;
    private int numProtons = 3;
    private int numElectrons = 1;
    
    public QuantumMechanicsModelSOrbital()
    {
        super("Quantum Mechanics Model\nS Orbital", 40, new PVector(900, height / 2));
        nucleusParticles = new ArrayList<Particle>();
        electronTrails = new ArrayList<QuantumMechanicsElectronTrail>();
        electron = new QuantumMechanicsElectron(new PVector(0, 0, 0), new PVector(0, 0, 0));
        generateNucleus();
        
    }
    
    public QuantumMechanicsModelSOrbital(PVector position)
    {
        super("", 40, position);
        nucleusParticles = new ArrayList<Particle>();
        electronTrails = new ArrayList<QuantumMechanicsElectronTrail>();
        electron = new QuantumMechanicsElectron(new PVector(0, 0, 0), new PVector(0, 0, 0));
    }
   
    @Override
    public void drawModel()
    {
        super.drawModel();
        pushMatrix(); 
        translate(getPosition().x, getPosition().y, getPosition().z);
        
        for(Particle nucleusParticle : nucleusParticles)
           nucleusParticle.drawParticle();
            
        if(electronTrails.size() == 500)
            electronTrails = new ArrayList();
        if(frameCount % 20 == 0)
        {   
            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;

            PVector elecPos = new PVector(x*getRadius(), y*getRadius(), z*getRadius());
            PVector elecVel = new PVector(0, 0, 0);
            
            QuantumMechanicsElectronTrail electronTrail = new QuantumMechanicsElectronTrail(elecPos, elecVel, 0, 0);
            electronTrails.add(electronTrail);   
            
            electron.setPosition(elecPos);
            
        }
        for(QuantumMechanicsElectronTrail trail : electronTrails)
            trail.drawParticle();
        electron.drawParticle();
            
        //fill(0, 0, 0, 30);
        //noStroke();
        //rotateX(-PI/6);
        //sphere(getRadius());
        //rotateX(PI/6);
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
            QuantumMechanicsNeutron neutron = new QuantumMechanicsNeutron(neutronPos, neutronVel);
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
            QuantumMechanicsProton proton = new QuantumMechanicsProton(protonPos, protonVel);
            nucleusParticles.add(proton);
        }
    }
}