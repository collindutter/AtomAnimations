/**
 * @author Collin Dutter Section 16
 * @version 7/16/15
 */

import processing.core.*;

public class AtomAnimation extends PApplet
{
    public void setup()
    {
        size(400, 400);
        background(0);
    }

    public void draw()
    {
        stroke(255);
        if(mousePressed)
        {
            line(mouseX, mouseY, pmouseX, pmouseY);
        }
    }
}
