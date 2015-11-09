public class QuantumMechanicsModelPOrbital extends AtomModel
{
    private ArrayList<QuantumMechanicsElectronTrail> electronTrails;
    private QuantumMechanicsElectron electron;
   
    
    private int numNeutrons = 3;
    private int numProtons = 3;
    private int numElectrons = 1;
    
    public QuantumMechanicsModelPOrbital()
    {
        super("Quantum Mechanics Model\nP Orbital", 9, new PVector(900, height / 2, 700));
        electronTrails = new ArrayList<QuantumMechanicsElectronTrail>();
        electron = new QuantumMechanicsElectron(new PVector(0, 0, 0), new PVector(0, 0, 0));
      
    }
    
    @Override
    public void drawModel()
    {
        super.drawModel();
        pushMatrix(); 
        translate(getPosition().x, getPosition().y, getPosition().z);

            
        if(electronTrails.size() == 500)
            electronTrails = new ArrayList();
        if(frameCount % 20 == 0)
        {   
            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
           
            float r = getRadius()*cos(2*theta);
            //float x = (r-(r*random(0, 1)))*cos(theta);
            //float y = (r-(r*random(0, 1)))*sin(theta);
            float x = r*cos(theta);
            float y = r*sin(theta);
            float z = 0;

            PVector elecPos = new PVector(x*5, y*5, z*5);
            PVector elecVel = new PVector(0, 0, 0);
            
            QuantumMechanicsElectronTrail electronTrail = new QuantumMechanicsElectronTrail(elecPos, elecVel);
            electronTrails.add(electronTrail);  
            
            electron.setPosition(elecPos);
            
        }
        for(QuantumMechanicsElectronTrail trail : electronTrails)
            trail.drawParticle();
        electron.drawParticle();
           
        popMatrix();
    }
}