public class DaltonModel extends AtomModel
{
    public DaltonModel()
    {
        super("Dalton Model", 25, new PVector(100, height / 2));
    }

    /**
     * draws the Dalton model of the atom
     *
     * @param centerX x coordinate to center the atom upon
     * @param centerY y coordinate to center the atom upon
     */
    @Override
    public void drawModel(float centerX, float centerY)
    {
        pushMatrix();
        translate(centerX, centerY);
        fill(205, 103, 204);
        ellipse(0, 0, getRadius() * 2, getRadius() * 2);
        fill(0);
        textSize(15);
        textAlign(CENTER);
        text(getName(), 0, getRadius() + 15);
        popMatrix();
    }    
}