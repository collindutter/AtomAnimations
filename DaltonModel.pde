public class DaltonModel extends AtomModel
{
    public DaltonModel()
    {
        super("Dalton Model", 45, new PVector(100, height / 2));
    }

    @Override
    public void drawModel()
    {
        pushMatrix();
        translate(getPosition().x, getPosition().y);
        
        //draw the model
        fill(205, 103, 204);
        noStroke();
        sphere(getRadius());
        
        //draw the text
        textSize(15);
        textAlign(CENTER);
        fill(0);
        text(getName(), 0, getRadius() + 15);
        
        popMatrix();
    }    
}