private PVector cameraPos; //camera position
private float scaleFactor; //zoom scale factor
private AtomModel[][] models; //list of all the models
private int modelsIndexHoriz; //which model the camera is currently viewing
private int modelsIndexVert;
private PVector targetPos; //Position for the camera to move to
private float cameraRotY, cameraRotX; //camera's rotation in X and Y planes
private boolean[] keysPressed;

public void setup()
{
    //Boring init stuff
    size(400, 400, P3D);
    textMode(SHAPE);
    
    scaleFactor = 1.8f;
    
    models = new AtomModel[5][3];
    models[0][0] = new DaltonModel();
    models[1][0] = new ThomsonModel();
    models[2][0] = new RutherfordModel();
    models[2][1] = new RutherfordModel(1, 3);
    models[3][0] = new BohrModel();
    models[4][0] = new QuantumMechanicsModelSOrbital();
    models[4][1] = new QuantumMechanicsModelPOrbital();
    models[4][2] = new QuantumMechanicsModelSOrbital(new PVector(900, height/2 + 140, 700));
    keysPressed = new boolean[512];
    modelsIndexHoriz = 0;
    modelsIndexVert = 0;
    
    AtomModel targetModel = models[modelsIndexHoriz][modelsIndexVert];
    
    targetPos = new PVector(targetModel.position.x, targetModel.position.y, targetModel.position.z);
    cameraPos = targetPos;
    
    cameraRotY = 0;
    cameraRotX = 0;
}

public void draw()
{
    //set background and basic stroke colors
    background(#86A7FF);
    lights();
    stroke(0);        
  
    if(keysPressed['A'] && cameraRotY+PI/60 < PI/6)
        cameraRotY+=PI/60;
    if(keysPressed['D'] && cameraRotY-PI/60 > -PI/6)
        cameraRotY-=PI/60;
    if(keysPressed['S'] && cameraRotX+PI/60 < PI/6)
        cameraRotX+=PI/60;
    if(keysPressed['W'] && cameraRotX-PI/60 > -PI/6)
        cameraRotX-=PI/60;

    pushMatrix();
    
    translate(width / 2, height / 2);
    //rotate based on camera rotation
    rotateY(cameraRotY);
    rotateX(cameraRotX);
    //scale based on zoom   
    scale(scaleFactor);

    //move camera according to target position using fake interpolation :(
    cameraPos.x += (targetPos.x - cameraPos.x) / 10;
    cameraPos.y += (targetPos.y - cameraPos.y) / 10;
    cameraPos.z += (targetPos.z - cameraPos.z) / 5;
    translate(-cameraPos.x, -cameraPos.y, -cameraPos.z);
 
    //draw all the models
    for (int i = 0; i < models.length; i++)
    { 
        for(int j = 0; j < models[0].length; j++) //<>//
        {
            if(models[i][j] == null || models[i][j].position.dist(cameraPos) > 250)
                continue;
            models[i][j].drawModel();
        }
    }
    popMatrix();
       
    fill(0);
    //framerate debugger. ****REMOVE****
    text((int)frameRate, 12, 15);
}

public void keyPressed(KeyEvent e)
{
    keysPressed[e.getKeyCode()] = true;
    if (e.getKeyCode() == LEFT && modelsIndexHoriz > 0 && models[modelsIndexHoriz-1][modelsIndexVert] != null)
        modelsIndexHoriz--;
    if (e.getKeyCode() == RIGHT && modelsIndexHoriz < models.length - 1 && models[modelsIndexHoriz+1][modelsIndexVert] != null)
        modelsIndexHoriz++;
    if (e.getKeyCode() == UP && modelsIndexVert > 0 && models[modelsIndexHoriz][modelsIndexVert-1] != null)
        modelsIndexVert--;
    if (e.getKeyCode() == DOWN && modelsIndexVert < models[0].length - 1 && models[modelsIndexHoriz][modelsIndexVert+1] != null)
        modelsIndexVert++;
    if (e.getKeyCode() == 'R')
    {
        cameraRotX = 0;
        cameraRotY = 0; 
    }

    AtomModel targetModel = models[modelsIndexHoriz][modelsIndexVert];
    if(targetModel != null)
        targetPos = targetModel.getPosition();
}

public void keyReleased(KeyEvent e)
{
    keysPressed[e.getKeyCode()] = false;
}

public void mouseWheel(MouseEvent event)
{
    scaleFactor += event.getCount()/60f;
    if(scaleFactor <= 1.8)
        scaleFactor = 1.8;
    if(scaleFactor >= 9)
        scaleFactor = 9;
}