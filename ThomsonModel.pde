private class ThomsonModel extends AtomModel
{
    private ArrayList<Particle> particles;
   
    private final int NUM_ELECTRONS = 5;
    
    public ThomsonModel()
    {
        super("Thomson Model", 45, new PVector(300, height / 2));
        particles = new ArrayList<Particle>();
        
        //place the electrons in the models
        for(int i = 0; i < NUM_ELECTRONS; i++)
        {
            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;
           
            PVector elecPos = new PVector(x*(getRadius()-12), y*(getRadius()-12), z*(getRadius()-12));
            PVector elecVel = new PVector(random(-.5f, .5f), random(-.5f, .5f), random(-.5f, .5f));  
            particles.add(new ThomasElectron(this, elecPos, elecVel));
        }
    }

    @Override
    public void drawModel()
    {
        pushMatrix();
        translate(getPosition().x, getPosition().y);
        
        //draw the particles
        for(Particle p : particles)
            p.drawParticle();
        
        //draw the model
        noStroke();
        fill(205, 103, 204, 128);
        sphere(getRadius());
       
        //draw the text
        fill(0);
        textSize(15);
        textAlign(CENTER);
        text(getName(), 0, getRadius() + 15);
        popMatrix();
    }
}