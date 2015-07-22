float cameraX, cameraY;
float scaleFactor;
DaltonModel daltonModel;
ThomsonModel thomsonModel;
RutherfordModel rutherfordModel;
boolean[] keysPressed;
AtomModel[] models;
int modelsIndex;
PVector targetPos;

public void setup()
{
    size(400, 400);
    scaleFactor = 1;
    models = new AtomModel[3];
    models[0] = new DaltonModel();
    models[1] = new ThomsonModel();
    models[2] = new RutherfordModel();
    keysPressed = new boolean[256];
    modelsIndex = 2;
    targetPos = new PVector(models[modelsIndex].position.x, models[modelsIndex].position.y);
    cameraX = targetPos.x;
    cameraY = targetPos.y;
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
    
    cameraX += (targetPos.x - cameraX) / 15;
    cameraY += (targetPos.y - cameraY) / 15;
    translate(-cameraX, -cameraY);

    for(int i = 0; i < models.length; i++)
        models[i].drawModel(models[i].position.x, height/2);
    
    popMatrix();
}

public void mouseWheel(MouseEvent e)
{
    scaleFactor = constrain(scaleFactor + e.getCount(), 1.0f, 7.0f);
}

public void keyPressed(KeyEvent e)
{
    modelsIndex = (modelsIndex < models.length - 1  ? modelsIndex+1 : 0);
    targetPos = new PVector(models[modelsIndex].position.x, models[modelsIndex].position.y);
}

public void keyReleased(KeyEvent e)
{
    keysPressed[e.getKeyCode()] = false;
}