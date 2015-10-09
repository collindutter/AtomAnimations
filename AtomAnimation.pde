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
    
    scaleFactor = 1.0f;
    
    models = new AtomModel[5][2];
    models[0][0] = new DaltonModel();
    models[1][0] = new ThomsonModel();
    models[2][0] = new RutherfordModel();
    models[2][1] = new RutherfordModel(1, 1, 1);
    models[3][0] = new BohrModel();
    models[4][0] = new QuantumMechanicsModel();
    modelsIndexHoriz = 0;
    modelsIndexVert = 0;
    
    targetPos = new PVector(models[modelsIndexHoriz][modelsIndexVert].position.x, models[modelsIndexHoriz][modelsIndexVert].position.y);
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
    rotateY(cameraRotY);
    rotateX(cameraRotX);
    scale(scaleFactor);

    //move camera according to target position using fake interpolation :(
    cameraPos.x += (targetPos.x - cameraPos.x) / 15;
    cameraPos.y += (targetPos.y - cameraPos.y) / 15;
    translate(-cameraPos.x, -cameraPos.y);

    //draw all the models
    for (int i = 0; i < models.length; i++){
        models[i][0].drawModel();
        if(models[i][1] != null)
            models[i][1].drawModel();
    }

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