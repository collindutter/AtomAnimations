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
    private ThomsonModel thomsonModel;

    public AtomAnimation()
    {
        cameraX = 0;
        cameraY = 0;
        scaleFactor = 1;
        daltonModel = new DaltonModel();
        thomsonModel = new ThomsonModel();
    }

    public void setup()
    {
        size(400, 400);
    }

    public void draw()
    {
        //set background and basic stroke colors
        background(255);
        stroke(0);

        pushMatrix();
        //scale based on zoom
        translate(width / 2, height / 2);
        scale(scaleFactor);
        translate(-width / 2, -height / 2);


        //draw the dalton model
        thomsonModel.draw(width / 2, height / 2);

        popMatrix();
    }


    public void mouseWheel(MouseEvent e)
    {
        scaleFactor = constrain(scaleFactor + e.getCount(), 1.0f, 7.0f);
    }


    private class AtomModel
    {
        private String name;
        private int radius;

        public AtomModel(String name, int radius)
        {
            this.name = name;
            this.radius = radius;
        }

        public String getName(){return name;}
        public int getRadius(){return radius;}
    }

    private class DaltonModel extends AtomModel
    {
        public DaltonModel()
        {
            super("Dalton Model", 25);
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
            ellipse(0, 0, getRadius() * 2, getRadius() * 2);
            fill(0);
            textSize(15);
            textAlign(CENTER);
            text(getName(), 0, getRadius() + 15);
            popMatrix();
        }
    }

    private class ThomsonModel extends AtomModel
    {
        public ThomsonModel()
        {
            super("Thomson Model", 25);
        }

        /**
         * draws the Thomson model of the atom
         *
         * @param centerX x coordinate to center the atom upon
         * @param centerY y coordinate to center the atom upon
         */
        public void draw(float centerX, float centerY)
        {
            pushMatrix();
            translate(centerX, centerY);
            fill(205, 103, 204);
            ellipse(0, 0, getRadius() * 2, getRadius() * 2);
            fill(0);
            textSize(15);
            textAlign(CENTER);
            text(getName(), 0, getRadius() + 15);
            popMatrix();
        }
    }
}
