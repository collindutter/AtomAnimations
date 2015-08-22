public class DaltonModel extends AtomModel
{
    public DaltonModel()
    {
        super("Dalton Model", 45, new PVector(100, height / 2));
    }

    /**
     * draws the Dalton model of the atom
     *
     * @param centerX x coordinate to center the atom upon
     * @param centerY y coordinate to center the atom upon
     */
    @Override
    public void drawModel()
    {
        pushMatrix();
        translate(getPosition().x, getPosition().y);
        fill(205, 103, 204);
        noStroke();
        sphere(getRadius());
        textSize(15);
        textAlign(CENTER);
        fill(0);
        text(getName(), 0, getRadius() + 15);
        popMatrix();
    }    
}
