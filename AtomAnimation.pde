float cameraX, cameraY;
float scaleFactor;
DaltonModel daltonModel;
ThomsonModel thomsonModel;
boolean[] keysPressed;

public void setup()
{
    size(400, 400);
    cameraX = 0;
    cameraY = 0;
    scaleFactor = 1;
    daltonModel = new DaltonModel();
    thomsonModel = new ThomsonModel();
    keysPressed = new boolean[256];
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

    //draw the dalton model
    daltonModel.draw(100, height / 2);
    //draw the thomson model
    thomsonModel.draw(300, height / 2);
    

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