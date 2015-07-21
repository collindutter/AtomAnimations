private class ThomsonModel extends AtomModel
{
    private ArrayList<Particle> particles;

    public ThomsonModel()
    {
        super("Thomson Model", 25);
        protons = new ArrayList<Particle>();
        for(int i = 0; i < 10; i++)
            protons.add(new Electron(new PVector(random(-getRadius() + 6, getRadius() - 6), random(-getRadius() + 6, getRadius() - 6))));
    }

    /**
     * draws the Thomson model of the atom
     *
     * @param centerX x coordinate to center the atom upon
     * @param centerY y coordinate to center the atom upon
     */
    public void draw(float centerX, float centerY)
    {
        pushMatrix();
        translate(centerX, centerY);
        fill(205, 103, 204);
        ellipse(0, 0, getRadius() * 2, getRadius() * 2);

        for(Particle p : particles)
            p.drawParticle();

        fill(0);
        textSize(15);
        textAlign(CENTER);
        text(getName(), 0, getRadius() + 15);
        popMatrix();
    }
}