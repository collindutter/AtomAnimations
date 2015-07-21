public class ThomasProton extends Particle
{
    public ThomasProton(PVector position)
    {
        velocity = new PVector(random(-.5f, .5f), random(-.5f, .5f));
    }

    public void drawParticle()
    {
        noStroke();
        fill(204, 254, 255);
        ellipse(position.x, position.y, 6, 6);
        stroke(1);

        position.add(velocity);

        if(position.mag() + 3 >= getRadius())
        {
            //bump it in a bit
            position.sub(new PVector(position.x * .02f, position.y * .02f));

            //choose a bounce angle
            float ang = (float)(Math.toRadians(random(90, 270)));
            //bounce
            float oldX = velocity.x;
            float oldY = velocity.y;
            velocity.x = (float)(Math.cos(ang)) * oldX - (float)(Math.sin(ang)) * oldY;
            velocity.y = (float)(Math.sin(ang)) * oldX + (float)(Math.cos(ang)) * oldY;
        }
    }   
}