/**
 * @author Collin Dutter Section 16
 * @version 7/16/15
 */

import processing.core.*;
import processing.event.MouseEvent;

public class AtomAnimation extends PApplet
{
    private float cameraX, cameraY;
    private float scaleFactor;
    private DaltonModel daltonModel;

    public AtomAnimation()
    {
        cameraX = 0;
        cameraY = 0;
        scaleFactor = 1;
        daltonModel = new DaltonModel();
    }

    public void setup()
    {
        size(400, 400);
    }

    public void draw()
    {
        background(255);
        stroke(0);
        pushMatrix();
        translate(width / 2, height / 2);
        scale(scaleFactor);
        translate(-width / 2, -height / 2);
        daltonModel.draw(width / 2, height / 2);
        popMatrix();
    }


    public void mouseWheel(MouseEvent e)
    {
        scaleFactor = constrain(scaleFactor + e.getCount(), 1.0f, 7.0f);
    }


    private class DaltonModel
    {
        private String name;
        private int radius;

        public DaltonModel()
        {
            name = "Dalton Model";
            radius = 25;
        }

        /**
         * draws the Dalton model of the atom
         *
         * @param centerX x coordinate to center the atom upon
         * @param centerY y coordinate to center the atom upon
         */
        public void draw(float centerX, float centerY)
        {
            pushMatrix();
            translate(centerX, centerY);
            fill(205, 103, 204);
            ellipse(0, 0, radius * 2, radius * 2);
            textSize(15);
            textAlign(CENTER);
            text(name, 0, radius + 15);
            popMatrix();
        }
    }
}
