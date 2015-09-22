public class QuantumMechanicsModel extends AtomModel
{
    public QuantumMechanicsModel()
    {
        super("Quantum Mechanics Model", 25, new PVector(900, height / 2));
    }
    
    @Override
    public void drawModel()
    {
       pushMatrix(); 
       translate(getPosition().x, getPosition().y);
       fill(0);
       textSize(15);
       textAlign(CENTER);
       text(getName(), 0, getRadius() + 15);
       popMatrix();
    }
}