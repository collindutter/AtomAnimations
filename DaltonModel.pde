public class DaltonModel extends AtomModel
{
    public DaltonModel()
    {
        super("Dalton Model", 45, new PVector(100, height / 2));
    }

    @Override
    public void drawModel()
    {
        super.drawModel();
        pushMatrix();
        translate(getPosition().x, getPosition().y);

        //draw the model
        fill(205, 103, 204);
        noStroke();
        sphere(getRadius());

        
        
        popMatrix();
    }
}