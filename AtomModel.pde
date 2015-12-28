public abstract class AtomModel
{
    private String name; //Name of the model
    private int radius; //Radius of the model
    private PVector position; //It's position in the world
    private float scale;

    public AtomModel(String name, int radius, PVector position)
    {
        this.name = name;
        this.radius = radius;
        this.position = position;
        this.scale = 1.6f;
    }
    public AtomModel(String name, int radius, PVector position, float scale)
    {
        this.name = name;
        this.radius = radius;
        this.position = position;
        this.scale = scale;
    }

    /**
     *Draws the atom model
     */
    public void drawModel()
    {
        fill(0);
        textSize(15);
        textAlign(CENTER);
        text(getName(), position.x, height/2 + 60, getPosition().z);
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
    public float getScale()
    {
         return scale;   
    }
}