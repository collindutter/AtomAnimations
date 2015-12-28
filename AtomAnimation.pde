private PVector cameraPos; //camera position
private float scaleFactor; //zoom scale factor
private AtomModel[][] models; //list of all the models
private int modelsIndexHoriz; //which model the camera is currently viewing
private int modelsIndexVert;
private PVector targetPos; //Position for the camera to move to
private float targetScale; //Scale for the camera to adjust to
private float cameraRotY, cameraRotX; //camera's rotation in X and Y planes
private float targetCameraRotY, targetCameraRotX;
private boolean[] keysPressed;
private int guiOffTime;
private boolean drawGUI;
private int guiOpacity;
private boolean traveling;

public void setup()
{
    //Boring init stuff
    size(400, 400, P3D);
    textMode(SHAPE);
    
    scaleFactor = 1.6f;
    
    models = new AtomModel[5][3];
    models[0][0] = new DaltonModel();
    models[1][0] = new ThomsonModel();
    models[2][0] = new RutherfordModel();
    models[2][1] = new RutherfordModel(1, 3);
    models[3][0] = new BohrModel();
    models[4][0] = new QuantumMechanicsModelSOrbital();
    models[4][1] = new QuantumMechanicsModelPOrbital();
    models[4][2] = new QuantumMechanicsModelSOrbital(new PVector(975, height/2, 650));
    keysPressed = new boolean[512];
    modelsIndexHoriz = 0;
    modelsIndexVert = 0;
    
    AtomModel targetModel = models[modelsIndexHoriz][modelsIndexVert];
    
    targetPos = new PVector(targetModel.position.x, targetModel.position.y, targetModel.position.z);
    cameraPos = targetPos;
    
    targetScale = models[modelsIndexHoriz][modelsIndexVert].getScale();
    
    cameraRotY = 0;
    cameraRotX = 0;
    targetCameraRotX = 0;
    targetCameraRotY = 0;
    
    guiOffTime = 0;
    guiOpacity = 0;
    drawGUI = false;
    traveling = false;
}

public void draw()
{
    //set background and basic stroke colors
    background(#86A7FF);
    lights();
    stroke(0);        
  
    if(keysPressed['A'] && targetCameraRotY+PI/60 < PI/6)
        targetCameraRotY+=PI/60;
    if(keysPressed['D'] && targetCameraRotY-PI/60 > -PI/6)
        targetCameraRotY-=PI/60;
    if(keysPressed['S'] && targetCameraRotX+PI/60 < PI/6)
        targetCameraRotX+=PI/60;
    if(keysPressed['W'] && targetCameraRotX-PI/60 > -PI/6)
        targetCameraRotX-=PI/60;
    noStroke();
    if(frameCount % 60 == 0)
        guiOffTime++;
    if(guiOffTime == 2)
        drawGUI = true;
    if(drawGUI && frameCount % 1 == 0 && guiOpacity < 255)
        guiOpacity += 10;
    if(!drawGUI && frameCount % 1 == 0 && guiOpacity > 0)
        guiOpacity -= 10;

    fill(#E34545, guiOpacity);
    textAlign(LEFT);
    ellipse(15, 15, 15, 15);
    text("Proton", 30, 21);
    
    fill(204, 254, 255, guiOpacity);
    ellipse(15, 35, 15, 15);
    text("Electron", 30, 42);
    
    fill(#4560E3, guiOpacity);
    ellipse(15, 55, 15, 15);
    text("Neutron",30, 62);
    
    textAlign(RIGHT);
    fill(0, guiOpacity);
    text("Camera: WASD", width, 15);
    text("Move: Arrow Keys", width, 29);
    
    
    
    pushMatrix();

    translate(width / 2, height / 2);
    //rotate based on camera rotation
    cameraRotX += (targetCameraRotX - cameraRotX) / 2f;
    cameraRotY += (targetCameraRotY - cameraRotY) / 2f;
    rotateY(cameraRotY);
    rotateX(cameraRotX);
    scale(scaleFactor);
    

    //move camera according to target position using fake interpolation :(
    if(abs(targetPos.dist(cameraPos)) > 30)
        traveling = true;
    else
        traveling = false;
    cameraPos.x += (targetPos.x - cameraPos.x) / 5f;
    cameraPos.y += (targetPos.y - cameraPos.y) / 5f;
    cameraPos.z += (targetPos.z - cameraPos.z) / 20f;
    translate(-cameraPos.x, -cameraPos.y, -cameraPos.z);
    
    scaleFactor += (targetScale - scaleFactor) / 5f;
    //draw all the models
    for (int i = 0; i < models.length; i++)
    { 
        for(int j = 0; j < models[0].length; j++) //<>//
        {
            if(models[i][j] == null || models[i][j].position.dist(cameraPos) > 250)
                continue;
            //if(modelsIndexHoriz == i && modelsIndexVert == j)
            //{
                
            //    translate(models[i][j].position.x, models[i][j].position.y, models[i][j].position.z);
            //    scale(scaleFactor);
            //    translate(-models[i][j].position.x, -models[i][j].position.z, -models[i][j].position.z);
            //} //<>//
            models[i][j].drawModel();  
        }
    }
    popMatrix();
}

public void keyPressed(KeyEvent e)
{
    drawGUI = false;
    guiOffTime = 0;
    if(traveling)
        return;
    keysPressed[e.getKeyCode()] = true;
    if (e.getKeyCode() == LEFT && modelsIndexHoriz > 0 && models[modelsIndexHoriz-1][modelsIndexVert] != null){
        modelsIndexHoriz--;
    }
    if (e.getKeyCode() == RIGHT && modelsIndexHoriz < models.length - 1 && models[modelsIndexHoriz+1][modelsIndexVert] != null){

        modelsIndexHoriz++;
    }
    if (e.getKeyCode() == UP && modelsIndexVert > 0 && models[modelsIndexHoriz][modelsIndexVert-1] != null){
         targetCameraRotX = 0;
        targetCameraRotY = 0; 
        modelsIndexVert--;
    }
    if (e.getKeyCode() == DOWN && modelsIndexVert < models[0].length - 2 && models[modelsIndexHoriz][modelsIndexVert+1] != null){
         targetCameraRotX = 0;
        targetCameraRotY = 0; 
        modelsIndexVert++;
    }
    if (e.getKeyCode() == 'C')
    {
        targetCameraRotX = 0;
        targetCameraRotY = 0; 
    }
    if(e.getKeyCode() == 'R')
        setup();

    AtomModel targetModel = models[modelsIndexHoriz][modelsIndexVert];
    if(targetModel != null){
        targetScale = targetModel.getScale();
        targetPos = targetModel.getPosition();
    }
    
}

public void keyReleased(KeyEvent e)
{
    keysPressed[e.getKeyCode()] = false;
}

public void mouseWheel(MouseEvent event)
{
    targetScale += event.getCount()/60f;
    if(targetScale <= 1.8)
       targetScale = 1.8;
    if(targetScale >= 9)
       targetScale = 9;
}