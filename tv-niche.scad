wallWidth = 410;
wallHeight = 300;
wallDepth = 5;
mainFrameDepth = 10;

module wall(){
    color("white") cube([wallWidth,wallDepth, wallHeight]);
}

module mainFrame(){
    translate([0, wallDepth, 0]){
        color("white") cube([wallWidth,mainFrameDepth, wallHeight]);
    }
}

stageWidth = 180;
stageHeight = 105;
stageDepth = 7;

module stage(){ 
    stageLeft = (wallWidth - stageWidth) / 2;
    stageUp = (wallHeight - stageHeight) / 2;
    stageOut = mainFrameDepth + mainFrameDepth;
    translate([stageLeft,stageOut,stageUp]){
        color("grey") cube([stageWidth, stageDepth, stageHeight]);
    }
}

mainHoleWidth = 115;
mainHoleHeight = 60;
mainHoleDepth = mainFrameDepth + stageDepth;

module mainHole(){
    translate([0, wallDepth, 0]){
        color("white") cube([mainHoleWidth,mainFrameDepth, mainHoleHeight]);
    }
}

module baseSpeaker(){
    color("black") cube([17,10, 43.3]);
}

module rightSpeaker(){
    translate([50,mainFrameDepth,50]) baseSpeaker();
}

module outObjects(){
    union(){
        wall();
        mainFrame();
        stage();
    }
}

module inObjects(){
    union(){
        rightSpeaker();
    }
}

module all(){
    difference(){
        outObjects();
        inObjects();
    }
}

all();
// wall();
// mainFrame();
// rightSpeaker();
// stage();

