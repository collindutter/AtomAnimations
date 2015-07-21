/**
 * @author Collin Dutter Section 16
 * @version 7/16/15
 */

import processing.core.*;
import processing.event.KeyEvent;
import processing.event.MouseEvent;

import java.util.ArrayList;

public class AtomAnimation extends PApplet
{
    private float cameraX, cameraY;
    private float scaleFactor;
    private DaltonModel daltonModel;
    private ThomsonModel thomsonModel;
    private boolean[] keysPressed;

    public AtomAnimation()
    {
        cameraX = 0;
        cameraY = 0;
        scaleFactor = 1;
        daltonModel = new DaltonModel();
        thomsonModel = new ThomsonModel();
        keysPressed = new boolean[256];
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

        //debugging camera controls
        if(keysPressed[87])
            cameraY--;
        if(keysPressed[65])
            cameraX--;
        if(keysPressed[83])
            cameraY++;
        if(keysPressed[68])
            cameraX++;
        translate(-cameraX, -cameraY);

        //draw the thomson model
        thomsonModel.draw(100, height / 2);
        //draw the dalton model
        daltonModel.draw(width / 2 + 100, height / 2);

        popMatrix();
    }


    public void mouseWheel(MouseEvent e)
    {
        scaleFactor = constrain(scaleFactor + e.getCount(), 1.0f, 7.0f);
    }

    public void keyPressed(KeyEvent e)
    {
        keysPressed[e.getKeyCode()] = true;
    }

    public void keyReleased(KeyEvent e)
    {
        keysPressed[e.getKeyCode()] = false;
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
        private ArrayList<Proton> protons;

        public ThomsonModel()
        {
            super("Thomson Model", 25);
            protons = new ArrayList<Proton>();
            for(int i = 0; i < 10; i++)
                protons.add(new Proton(new PVector(random(-getRadius() + 6, getRadius() - 6), random(-getRadius() + 6, getRadius() - 6))));
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

            for(Proton p : protons)
                p.draw();

            fill(0);
            textSize(15);
            textAlign(CENTER);
            text(getName(), 0, getRadius() + 15);
            popMatrix();
        }


        private class Proton
        {
            private PVector position;
            private PVector velocity;

            public Proton(PVector position)
            {
                this.position = position;
                velocity = new PVector(random(-.5f, .5f), random(-.5f, .5f));
            }

            public void draw()
            {
                noStroke();
                fill(204, 254, 255);
                ellipse(position.x, position.y, 6, 6);
                stroke(1);

                position.add(velocity);

                if(position.mag() + 3 >= getRadius())
                {
                    //bump it in a bit
                    position.sub(new PVector(position.x*.02f, position.y*.02f));

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

        private class Electron
        {
            private float positionX, positionY;

            public void draw()
            {

            }
        }
    }
}
