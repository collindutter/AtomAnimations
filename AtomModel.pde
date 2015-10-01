public abstract class AtomModel
{
    private String name; //Name of the model
    private int radius; //Radius of the model
    private PVector position; //It's position in the world


    public AtomModel(String name, int radius, PVector position)
    {
        this.name = name;
        this.radius = radius;
        this.position = position;
    }

    /**
     *Draws the atom model
     */
    public void drawModel()
    {
        fill(0);
        textSize(15);
        textAlign(CENTER);
        text(getName(), position.x, 260);
    }
    
    //GETTERS AND SETTERS
    public String getName()
    {
        return name;
    }
    public PVector getPosition()
    {
        return position;
    }
    public int getRadius()
    {
        return radius;
    }
}