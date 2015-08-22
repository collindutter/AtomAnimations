private class ThomsonModel extends AtomModel
{
    private ArrayList<Particle> particles;
   
    private final int NUM_ELECTRONS = 1;
    
    public ThomsonModel()
    {
        super("Thomson Model", 45, new PVector(300, height / 2));
        particles = new ArrayList<Particle>();
        
        for(int i = 0; i < NUM_ELECTRONS; i++)
        {
            PVector elecPos = new PVector(random(-getRadius() + 6, getRadius() - 6), random(-getRadius() + 6, getRadius() - 6), random(-getRadius() + 6, getRadius() - 6));
            PVector elecVel = new PVector(random(-.5f, .5f), random(-.5f, .5f), random(-.5f, .5f));   
            particles.add(new ThomasElectron(this, elecPos, elecVel));
        }
    }

    /**
     * draws the Thomson model of the atom
     *
     * @param centerX x coordinate to center the atom upon
     * @param centerY y coordinate to center the atom upon
     */
    @Override
    public void drawModel()
    {
        pushMatrix();
        
        translate(getPosition().x, getPosition().y);
        stroke(0);
        ellipse(0,0, getRadius()*2, getRadius()*2);
        //sphere(getRadius());
        
        for(Particle p : particles)
            p.drawParticle();

        fill(0);
        textSize(15);
        textAlign(CENTER);
        text(getName(), 0, getRadius() + 15);
        popMatrix();
    }
}
