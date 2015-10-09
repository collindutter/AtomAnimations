private class ThomsonModel extends AtomModel
{
    private ArrayList<Particle> particles;

    private int numElectrons = 5;
    private int numProtons = 5;

    public ThomsonModel()
    {
        super("Thomson Model", 45, new PVector(300, height / 2));
        particles = new ArrayList<Particle>();

        //place the electrons in the models
        for (int i = 0; i < numElectrons; i++)
        {
            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;

            PVector elecPos = new PVector(x*(getRadius()-12), y*(getRadius()-12), z*(getRadius()-12));
            PVector elecVel = new PVector(random(-.5f, .5f), random(-.5f, .5f), random(-.5f, .5f));  
            particles.add(new ThomsonElectron(this, elecPos, elecVel));
        }
        
        //place the protons in the models
        for (int i = 0; i < numProtons; i++)
        {
            float u = random(-1.0, 1.0);
            float theta = random(0, 2*PI);
            float x = sqrt(1-u*u)*cos(theta);
            float y = sqrt(1-u*u)*sin(theta);
            float z = u;

            PVector protPos = new PVector(x*(getRadius()-12), y*(getRadius()-12), z*(getRadius()-12));
            PVector protVel = new PVector(0, 0, 0);  
            particles.add(new ThomsonProton(this, protPos, protVel));
        }
    }

    @Override
    public void drawModel()
    {
        super.drawModel();
        pushMatrix();
        translate(getPosition().x, getPosition().y);

        //draw the particles
        for (Particle p : particles)
            p.drawParticle();

        //draw the model
        noStroke();
        fill(205, 103, 204, 128);
        rotateX(-PI/6);
        sphere(getRadius());
        rotateX(PI/6);
        
        popMatrix();
    }
}