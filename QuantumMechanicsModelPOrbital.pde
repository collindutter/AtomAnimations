public class QuantumMechanicsModelPOrbital extends AtomModel
{
    private ArrayList<QuantumMechanicsElectronTrail> electronTrails;
    private ArrayList<QuantumMechanicsElectron> orbitElectrons;
   
    
    private int numNeutrons = 3;
    private int numProtons = 3;
    private int numElectrons = 1;
    private int currentAxis; 

    
    public QuantumMechanicsModelPOrbital()
    {
        super("Quantum Mechanics Model\nP Orbital", 9, new PVector(900, height / 2, 700), 1f);
        electronTrails = new ArrayList<QuantumMechanicsElectronTrail>();
        orbitElectrons = new ArrayList<QuantumMechanicsElectron>();
        orbitElectrons.add(new QuantumMechanicsElectron(new PVector(0, 0, 0), new PVector(0, 0, 0)));
      
    }
    
    @Override
    public void drawModel()
    {
        super.drawModel();
        pushMatrix(); 
        
        pushMatrix();
        translate(getPosition().x, getPosition().y, getPosition().z);
        fill(205, 103, 204);
        noStroke();
        
        sphere(getRadius());
        popMatrix();
        translate(getPosition().x-75, getPosition().y, getPosition().z+50);
        
        
        if(frameCount % 7 == 0)
        {   
            if(electronTrails.size() == 300){
                electronTrails = new ArrayList();
                orbitElectrons = new ArrayList();
                currentAxis = 0;
                orbitElectrons.add(new QuantumMechanicsElectron(new PVector(0, 0, 0), new PVector(0, 0, 0), currentAxis));
                
            }
            if(electronTrails.size() == 100 || electronTrails.size() == 200){
                currentAxis++;
                orbitElectrons.add(new QuantumMechanicsElectron(new PVector(0, 0, 0), new PVector(0, 0, 0), currentAxis));
                for(int i = 0; i < orbitElectrons.size(); i++)
                    println(orbitElectrons.get(i).drawColor);
                println();
            }
         
            
            float u = random(-1.0, 1.0);
            float theta1 = random(-PI/4, PI/4);
            float theta2 = random(3*PI/4, 5*PI/4);
            float theta = random(0, 1) > .5 ? theta1 : theta2; 
            
            float r = getRadius()*cos(2*theta);
            float x = r*cos(theta);
            float y = r*sin(theta);
         
            PVector elecPos = new PVector(x*5, y*5, 0);
            PVector elecVel = new PVector(0, 0, 0);
        
            QuantumMechanicsElectronTrail electronTrail = new QuantumMechanicsElectronTrail(elecPos, elecVel, random(0, 2*PI), currentAxis);
            electronTrails.add(electronTrail);  
            
            orbitElectrons.get(currentAxis).setPosition(elecPos);
            if(currentAxis == 1)
                orbitElectrons.get(currentAxis-1).setPosition(electronTrails.get((int)random(0, 100)).getPosition());
            if(currentAxis == 2){
                orbitElectrons.get(currentAxis-1).setPosition(electronTrails.get((int)random(100, 200)).getPosition());
                orbitElectrons.get(currentAxis-2).setPosition(electronTrails.get((int)random(0, 100)).getPosition());
            }
                        
            
        }
        
        for(int i = 0; i < electronTrails.size(); i++){
            QuantumMechanicsElectronTrail trail = electronTrails.get(i);
            pushMatrix();
            
            if(trail.axis == 0){
                pushMatrix();
                rotateX(trail.rotation);
                trail.drawParticle();
                if(i == electronTrails.size()-1)
                    orbitElectrons.get(trail.axis).drawParticle();
                popMatrix();
            }
            else if(trail.axis == 1){
                pushMatrix();
                rotateY(PI/2);
                rotateX(trail.rotation);
                trail.drawParticle();
                if(i == electronTrails.size()-1)
                    orbitElectrons.get(trail.axis).drawParticle();
                popMatrix();
                
                pushMatrix();
                rotateX(trail.rotation);
                if(i == electronTrails.size()-1)
                    orbitElectrons.get(trail.axis-1).drawParticle();
                popMatrix();
            }
            else if(trail.axis == 2){
                pushMatrix();
                rotateZ(PI/2);
                rotateX(trail.rotation);
                trail.drawParticle();
                if(i == electronTrails.size()-1)
                    orbitElectrons.get(trail.axis).drawParticle();
                popMatrix();
                
                pushMatrix();
                rotateY(PI/2);
                rotateX(trail.rotation-1);
                if(i == electronTrails.size()-1)
                    orbitElectrons.get(trail.axis-1).drawParticle();
                popMatrix();
                
                pushMatrix();
                rotateX(trail.rotation-2);
                if(i == electronTrails.size()-1)
                    orbitElectrons.get(trail.axis-2).drawParticle();
                popMatrix();
            }
           
            
            
            popMatrix();
             
        }

        
             
             
             
           
           
        popMatrix();
    }
}