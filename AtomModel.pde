public abstract class AtomModel
{
    private String name;
    private int radius;
    private PVector position;
    
    protected final int NUM_PROTONS = 1;
    protected final int NUM_NEUTRONS = 0;
    protected final int NUM_ELECTRONS = 1;

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
