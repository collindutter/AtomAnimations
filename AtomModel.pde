public abstract class AtomModel
{
    private String name;
    private int radius;
    private PVector position;
   

    public AtomModel(String name, int radius, PVector position)
    {
        this.name = name;
        this.radius = radius;
        this.position = position;
    }

    public abstract void drawModel();

    public String getName(){return name;}
    public PVector getPosition(){return position;}
    public int getRadius(){return radius;}
    
}
