private PVector cameraPos; //camera position
private float scaleFactor; //zoom scale factor
private AtomModel[][] models; //list of all the models
private int modelsIndexHoriz; //which model the camera is currently viewing
private int modelsIndexVert;
private PVector targetPos; //Position for the camera to move to
private float cameraRotY, cameraRotX; //camera's rotation in X and Y planes

public void setup()
{
    //Boring init stuff
    size(400, 400, P3D);
    textMode(SHAPE);
    
    scaleFactor = 1.8f;
    
    models = new AtomModel[5][2];
    models[0][0] = new DaltonModel();
    models[1][0] = new ThomsonModel();
    models[2][0] = new RutherfordModel();
    models[2][1] = new RutherfordModel(1, 1, 1);
    models[3][0] = new BohrModel();
    models[4][0] = new QuantumMechanicsModel();
    models[4][1] = new QuantumMechanicsModelPOrbital();
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

    pushMatrix();
    //scale based on zoom   
    translate(width / 2, height / 2);
    //rotateY(cameraRotY);
    //rotateX(cameraRotX);
    scale(scaleFactor);

    //move camera according to target position using fake interpolation :(
    cameraPos.x += (targetPos.x - cameraPos.x) / 15;
    cameraPos.y += (targetPos.y - cameraPos.y) / 15;
    cameraPos.z += (targetPos.z - cameraPos.z) / 15;
    translate(-cameraPos.x, -cameraPos.y, -cameraPos.z);
    
    //camera(cameraPos.x, cameraPos.y, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
    

    //draw all the models
    for (int i = 0; i < models.length; i++)
    {
        models[i][0].drawModel();
        if(models[i][1] != null)
            models[i][1].drawModel();
    }
    
    fill(#86A7FF, .85*cameraPos.z);
    translate(0, 0, 300);
    rect(0, 0, 1200, 400);

    popMatrix();
       
    
    //framerate debugger. ****REMOVE****
    text((int)frameRate, 12, 15);
}

public void keyPressed(KeyEvent e)
{
    if (e.getKeyCode() == LEFT && modelsIndexHoriz > 0)
    {
        modelsIndexHoriz--;
        if(models[modelsIndexHoriz][modelsIndexVert] == null)
            modelsIndexVert = 1 - modelsIndexVert;
    }
    if (e.getKeyCode() == RIGHT && modelsIndexHoriz < models.length - 1)
    {
        modelsIndexHoriz++;
        if(models[modelsIndexHoriz][modelsIndexVert] == null)
            modelsIndexVert = 1 - modelsIndexVert;
    }
    if (e.getKeyCode() == UP && modelsIndexVert > 0)
        modelsIndexVert--;
    if (e.getKeyCode() == DOWN && modelsIndexVert < 1)
        modelsIndexVert++;
    if (e.getKeyCode() == 'A')
        cameraRotY += PI/6;
    if (e.getKeyCode() == 'D')
        cameraRotY -= PI/6;
    if (e.getKeyCode() == 'W')
        cameraRotX -= PI/6;
    if (e.getKeyCode() == 'S')
        cameraRotX += PI/6;
    if (e.getKeyCode() == 'R')
        setup();

    AtomModel targetModel = models[modelsIndexHoriz][modelsIndexVert];
    if(targetModel != null)
        targetPos = targetModel.getPosition();
}

public void mouseWheel(MouseEvent event)
{
    scaleFactor += event.getCount()/60f;
    if(scaleFactor <= 1.8)
        scaleFactor = 1.8;
    if(scaleFactor >= 9)
        scaleFactor = 9;
}