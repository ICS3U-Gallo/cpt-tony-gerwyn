PImage sun, panels, flask, settings, soundOn, soundOff, cityBackground, cityRoads, arrowRight, arrowLeft, woodPanelVertical, woodPanelHorizontal, exitButtonDark, exitButtonLight;
PImage sunflowerPic, peashooterPic, wallnutPic, chomperPic, repeaterPic, icepeaPic;
PImage growing1, growing2;
PImage sunflowerFloor, sunflowerSold;
PImage peashooterFloor, peashooterSold;
PImage wallnutFloor, wallnutSold;
PImage chomperFloor, chomperSold;
PImage repeaterFloor, repeaterSold;
PImage icepeaFloor, icepeaSold;
PImage crazyDave;

float money = 100;
float CPS = 0;
boolean screenClickable = true;
boolean researchScreen = false;
color loanButtonColor = color(#8A4500);
int lives = 3;
boolean dialogueAdd;

//Tutorial
boolean tutorialScreen = true;
int dialogue = 1;

//Research checker
boolean wallnutResearch = false;
boolean chomperResearch = false;
boolean repeaterResearch = false;
boolean icepeaResearch = false;

boolean sunflowerTier1 = false;
boolean sunflowerTier2 = false;
boolean sunflowerTier3 = false;
boolean peashooterTier1 = false;
boolean peashooterTier2 = false;
boolean peashooterTier3 = false;
boolean wallnutTier1 = false;
boolean wallnutTier2 = false;
boolean wallnutTier3 = false;
boolean chomperTier1 = false;
boolean chomperTier2 = false;
boolean chomperTier3 = false;
boolean repeaterTier1 = false;
boolean repeaterTier2 = false;
boolean repeaterTier3 = false;
boolean icepeaTier1 = false;
boolean icepeaTier2 = false;
boolean icepeaTier3 = false;

float wallnutResearchCost = 1000;
float chomperResearchCost = 5000;
float repeaterResearchCost = 20000;
float icepeaResearchCost = 40000;

float sunflowerTier1Cost = 5000;
float sunflowerTier2Cost = 7000;
float sunflowerTier3Cost = 8500;
float peashooterTier1Cost = 7500;
float peashooterTier2Cost = 8000;
float peashooterTier3Cost = 9000;
float wallnutTier1Cost = 8500;
float wallnutTier2Cost = 9000;
float wallnutTier3Cost = 10000;
float chomperTier1Cost = 13000;
float chomperTier2Cost = 15000;
float chomperTier3Cost = 18500;
float repeaterTier1Cost = 20000;
float repeaterTier2Cost = 25000;
float repeaterTier3Cost = 35000;
float icepeaTier1Cost = 30000;
float icepeaTier2Cost = 40000;
float icepeaTier3Cost = 50000;

color[] researchColor;
//Choosing floor
boolean seedClicked = false;

//Seed checker
boolean sunflower = false;
boolean peashooter = false;
boolean wallnut = false;
boolean chomper = false;
boolean repeater = false;
boolean icepea = false;

//Seed grower
int[] sunflowerClicks;
int[] peashooterClicks;
int[] wallnutClicks;
int[] chomperClicks;
int[] repeaterClicks;
int[] icepeaClicks;

//Seed planter
boolean[] sunflowerPlanted;
boolean[] peashooterPlanted;
boolean[] wallnutPlanted;
boolean[] chomperPlanted;
boolean[] repeaterPlanted;
boolean[] icepeaPlanted;

//Floor bought
boolean[] floorBought;

//arrows for floors
boolean[] arrows;

//Floor checker
boolean[] floorFull;

//Building
float buildingY = 530;
float buildingH = 238;
int buildingFloorsBought = 0;

//Cookie
float sunX = 374;
float sunY = -20;
float sunW = 400;
float sunH = 400;

//Research button
float researchX = 180;
float researchY = 25;
float researchW = 40;
float researchH = 40; 
color researchButtonColor = color(#8A4500);

//Mute button
float muteX = 230;
float muteY = 25;
float muteW = 40;
float muteH = 40;
color muteColor = color(#5C2E00);

//Settings button
float settingsX = 280;
float settingsY = 25;
float settingsW = 40;
float settingsH = 40;
color settingsColor = color(#5C2E00);


//Research exit button
float exit1X = 1248;
float exit1Y = 30;
float exit1W = 50;
float exit1H = 50;

//Planting exit Button
float exit2X = 1308;
float exit2Y = 10;
float exit2W = 50;
float exit2H = 50;

//Building expansion
float buildingExpansionCost = 1000;
int buildingFloors = 2;
color buildingExpansionColour = color(#8A4500);

//Research Division
boolean researchDivisionOwned = false;
float researchDivisionCost = 10000;
color researchDivisionColor = color(#8A4500);

//Sunflower ($400 per minute), formula for money gained per minute: [60 / (seconds it takes) <- clicks] x sellback value
float sunflowerCost = 100;
float sunflowerSellback = 200;
float sunflowerGrowth = 75; //15 sec
color sunflowerColor = color(#8A4500);

//Peashooter ($600 per minute)
float peashooterCost = 200;
float peashooterSellback = 400;
float peashooterGrowth = 100; //20 sec
color peashooterColor = color(#8A4500);

//Wallnut ($625 per minute)
float wallnutCost = 250;
float wallnutSellback = 500;
float wallnutGrowth = 120; //24 sec
color wallnutColor = color(#8A4500);

//Chomper ($642.86 per minute)
float chomperCost = 500;
float chomperSellback = 1100;
float chomperGrowth = 280; // 56 sec
color chomperColor = color(#8A4500);

//Repeater ($661.76 per minute)
float repeaterCost = 1000;
float repeaterSellback = 2500;
float repeaterGrowth = 680; // 136 sec
color repeaterColor = color(#8A4500);

//Icepea ($685.71 per minute)
float icepeaCost = 2000;
float icepeaSellback = 6000;
float icepeaGrowth = 1750; // 350 sec
color icepeaColor = color(#8A4500);


void setup() {
  size(1366,768);
  background(255);
  frameRate(60);
  //Floor bought
  floorBought = new boolean[4];
  
  floorBought[0] = false;
  floorBought[1] = false;
  floorBought[2] = false;
  floorBought[3] = false;
  //Floor checker
  floorFull = new boolean[6];
  
  floorFull[0] = false;
  floorFull[1] = false;
  floorFull[2] = false;
  floorFull[3] = false;
  floorFull[4] = false;
  floorFull[5] = false;
  //Seed grower
  sunflowerClicks = new int[6];
  
  sunflowerClicks[0] = 0;
  sunflowerClicks[1] = 0;
  sunflowerClicks[2] = 0;
  sunflowerClicks[3] = 0;
  sunflowerClicks[4] = 0;
  sunflowerClicks[5] = 0;
  
  peashooterClicks = new int[6];
  
  peashooterClicks[0] = 0;
  peashooterClicks[1] = 0;
  peashooterClicks[2] = 0;
  peashooterClicks[3] = 0;
  peashooterClicks[4] = 0;
  peashooterClicks[5] = 0;
  
  wallnutClicks = new int[6];
  
  wallnutClicks[0] = 0;
  wallnutClicks[1] = 0;
  wallnutClicks[2] = 0;
  wallnutClicks[3] = 0;
  wallnutClicks[4] = 0;
  wallnutClicks[5] = 0;
  
  chomperClicks = new int[6];
  
  chomperClicks[0] = 0;
  chomperClicks[1] = 0;
  chomperClicks[2] = 0;
  chomperClicks[3] = 0;
  chomperClicks[4] = 0;
  chomperClicks[5] = 0;
  
  repeaterClicks = new int[6];
  
  repeaterClicks[0] = 0;
  repeaterClicks[1] = 0;
  repeaterClicks[2] = 0;
  repeaterClicks[3] = 0;
  repeaterClicks[4] = 0;
  repeaterClicks[5] = 0;
  
  icepeaClicks = new int[6];
  
  icepeaClicks[0] = 0;
  icepeaClicks[1] = 0;
  icepeaClicks[2] = 0;
  icepeaClicks[3] = 0;
  icepeaClicks[4] = 0;
  icepeaClicks[5] = 0;
  
  //Seed planter
  sunflowerPlanted = new boolean[6];
  
  sunflowerPlanted[0] = false;
  sunflowerPlanted[1] = false;
  sunflowerPlanted[2] = false;
  sunflowerPlanted[3] = false;
  sunflowerPlanted[4] = false;
  sunflowerPlanted[5] = false;

  peashooterPlanted = new boolean[6];
  
  peashooterPlanted[0] = false;
  peashooterPlanted[1] = false;
  peashooterPlanted[2] = false;
  peashooterPlanted[3] = false;
  peashooterPlanted[4] = false;
  peashooterPlanted[5] = false;

  wallnutPlanted = new boolean[6];
  
  wallnutPlanted[0] = false;
  wallnutPlanted[1] = false;
  wallnutPlanted[2] = false;
  wallnutPlanted[3] = false;
  wallnutPlanted[4] = false;
  wallnutPlanted[5] = false;

  chomperPlanted = new boolean[6];
  
  chomperPlanted[0] = false;
  chomperPlanted[1] = false;
  chomperPlanted[2] = false;
  chomperPlanted[3] = false;
  chomperPlanted[4] = false;
  chomperPlanted[5] = false;

  repeaterPlanted = new boolean[6];
  
  repeaterPlanted[0] = false;
  repeaterPlanted[1] = false;
  repeaterPlanted[2] = false;
  repeaterPlanted[3] = false;
  repeaterPlanted[4] = false;
  repeaterPlanted[5] = false;

  icepeaPlanted = new boolean[6];
  
  icepeaPlanted[0] = false;
  icepeaPlanted[1] = false;
  icepeaPlanted[2] = false;
  icepeaPlanted[3] = false;
  icepeaPlanted[4] = false;
  icepeaPlanted[5] = false;
  
  researchColor = new color[24];
  
  researchColor[0] = color(#5C2E00);
  researchColor[1] = color(#8A4500);    
  researchColor[2] = color(#8A4500);
  researchColor[3] = color(#8A4500);  
  researchColor[4] = color(#5C2E00);
  researchColor[5] = color(#8A4500);
  researchColor[6] = color(#8A4500);
  researchColor[7] = color(#8A4500);    
  researchColor[8] = color(#8A4500);
  researchColor[9] = color(#8A4500);  
  researchColor[10] = color(#8A4500);
  researchColor[11] = color(#8A4500);
  researchColor[12] = color(#8A4500);
  researchColor[13] = color(#8A4500);    
  researchColor[14] = color(#8A4500);
  researchColor[15] = color(#8A4500);  
  researchColor[16] = color(#8A4500);
  researchColor[17] = color(#8A4500);
  researchColor[18] = color(#8A4500);
  researchColor[19] = color(#8A4500);    
  researchColor[20] = color(#8A4500);
  researchColor[21] = color(#8A4500);  
  researchColor[22] = color(#8A4500);
  researchColor[23] = color(#8A4500);
  //image loader
  growing1 = loadImage("growingFloor1.png");
  growing2 = loadImage("growingFloor2.png");
  sunflowerFloor = loadImage("sunflowerFloor.png");
  sunflowerSold = loadImage("sunflowerSold.png");
  peashooterFloor = loadImage("peashooterFloor.png");
  peashooterSold = loadImage("peashooterSold.png");
  wallnutFloor = loadImage("wallnutFloor.png");
  wallnutSold = loadImage("wallnutSold.png");
  chomperFloor = loadImage("chomperFloor.png");
  chomperSold = loadImage("chomperSold.png");
  repeaterFloor = loadImage("repeaterFloor.png");
  repeaterSold = loadImage("repeaterSold.png");
  icepeaFloor = loadImage("icepeaFloor.png");
  icepeaSold = loadImage("icepeaSold.png");
  flask = loadImage("flask.png");
  sun = loadImage("sun.png");
  panels = loadImage("panelBackground.png");
  arrowRight = loadImage("arrowRight.png");
  arrowLeft = loadImage("arrowLeft.png");
  cityBackground = loadImage("cityBackground.png");
  cityRoads = loadImage("cityRoads.png");
  woodPanelVertical = loadImage("woodPanelVertical.png");
  woodPanelHorizontal = loadImage("woodPanelHorizontal.png");
  exitButtonLight = loadImage("exitButtonLight.png");
  exitButtonDark = loadImage("exitButtonDark.png");
  sunflowerPic = loadImage("sunflower.png");
  peashooterPic = loadImage("peashooter.png");
  wallnutPic = loadImage("wallnut.png");
  chomperPic = loadImage("chomper.png");
  repeaterPic = loadImage("repeater.png");
  icepeaPic = loadImage("icepea.png");
  soundOn = loadImage("soundOn.png");
  soundOff = loadImage("soundOff.png");
  settings = loadImage("settings.png");
  crazyDave = loadImage("crazyDave.png");
}


void draw() {
  background(#00A2FF);
  //City background
  image(cityBackground, 0, 0, 1366, 768);
  image(cityRoads, 0, 0, 1366, 768);
  fill(#994C00);
  image(woodPanelVertical, -30, -20, 350, 808);
  fill(255);
  textSize(20);
  text("$" + nf(money, 0, 2), 20, 45 );
  stroke(1);
  
  noStroke();    
  image(sun, sunX, sunY, sunW, sunH);
//Upgrades
  if (sunflowerTier1 == true) {
    sunflowerSellback = 300;
  } else if (sunflowerTier2 == true) {
    sunflowerSellback = 400;
  } else if (sunflowerTier3 == true) {
    sunflowerSellback = 450;
  }
  
  if (peashooterTier1 == true) {
    peashooterSellback = 600;
  } else if (peashooterTier2 == true) {
    peashooterSellback = 700;
  } else if (peashooterTier3 == true) {
    peashooterSellback = 800;
  }
  
  if (wallnutTier1 == true) {
    wallnutSellback = 800;
  } else if (wallnutTier2 == true) {
    wallnutSellback = 900;
  } else if (wallnutTier3 == true) {
    wallnutSellback = 1000;
  }
  
  if (chomperTier1 == true) {
    chomperSellback = 1500;
  } else if (chomperTier2 == true) {
    chomperSellback = 1600;
  } else if (chomperTier3 == true) {
    chomperSellback = 1700;
  }
  
  if (repeaterTier1 == true) {
    repeaterSellback = 3000;
  } else if (repeaterTier2 == true) {
    repeaterSellback = 3100;
  } else if (repeaterTier3 == true) {
    repeaterSellback = 3200;
  }
  
  if (icepeaTier1 == true) {
    icepeaSellback = 6600;
  } else if (icepeaTier2 == true) {
    icepeaSellback = 6700;
  } else if (repeaterTier3 == true) {
    icepeaSellback = 6800;
  }
//arrows for floors
  if (seedClicked == true && floorFull[0] == false) {
    image(arrowRight, 760, 683, 80, 50); 
  }
  
  if (seedClicked == true && floorFull[1] == false) {
    image(arrowRight, 760, 573, 80, 50);
  }
  
  if (seedClicked == true && floorFull[2] == false && floorBought[0] == true) {
    image(arrowRight, 760, 463, 80, 50);
  }
  
  if (seedClicked == true && floorFull[3] == false && floorBought[1] == true) {
    image(arrowRight, 760, 353, 80, 50);
  }
  
  if (seedClicked == true && floorFull[4] == false && floorBought[2] == true) {
    image(arrowRight, 760, 243, 80, 50);
  }
  
  if (seedClicked == true && floorFull[5] == false && floorBought[3] == true) {
    image(arrowRight, 760, 133, 80, 50);
  }
//Building
  fill(#B5B5B5);
  rect(866, buildingY, 500, buildingH);
  fill(#663300);
  image(panels, 880, 548, 475, 100);
  image(panels, 880, 658, 475, 100);
  
  if (buildingFloorsBought <= 1 && buildingFloorsBought != 0) {
    image(panels, 880, 438, 475, 100);
    floorBought[0] = true;
    buildingExpansionCost = 5000;
  } else if (buildingFloorsBought <= 2 && buildingFloorsBought != 0) {
    image(panels, 880, 438, 475, 100);
    image(panels, 880, 328, 475, 100);
    floorBought[1] = true;
    buildingExpansionCost = 40000;
  } else if (buildingFloorsBought <= 3 && buildingFloorsBought != 0) {
    image(panels, 880, 438, 475, 100);
    image(panels, 880, 328, 475, 100);
    image(panels, 880, 218, 475, 100);
    floorBought[2] = true;
    buildingExpansionCost = 100000;
  } else if (buildingFloorsBought <= 4 && buildingFloorsBought != 0) {
    image(panels, 880, 438, 475, 100);
    image(panels, 880, 328, 475, 100);
    image(panels, 880, 218, 475, 100);
    image(panels, 880, 108, 475, 100);
    floorBought[3] = true;
  }

//Floor chooser
//Floor 1
  if (floorFull[0] == true && sunflowerPlanted[0] == true && sunflowerClicks[0] <= 30) {
    image(growing1, 880, 658, 475, 100);
  } else if (floorFull[0] == true && sunflowerPlanted[0] == true && sunflowerClicks[0] > 30 && sunflowerClicks[0] <= 60) {
    image(growing2, 880, 658, 475, 100);
  } else if (floorFull[0] == true && sunflowerPlanted[0] == true && sunflowerClicks[0] > 60 && sunflowerClicks[0] <= 74) {
    image(sunflowerFloor, 880, 658, 475, 100);
  } else if (floorFull[0] == true && sunflowerPlanted[0] == true && sunflowerClicks[0] > 74 && sunflowerClicks[0] <= 75) {
    image(sunflowerSold, 880, 658, 475, 100);
  } else if (floorFull[0] == true && sunflowerPlanted[0] == true && sunflowerClicks[0] > 75) {
    money += sunflowerSellback;
    sunflowerClicks[0] = 0;
    floorFull[0] = false;
    sunflowerPlanted[0] = false;
  }

  if (floorFull[0] == true && peashooterPlanted[0] == true && peashooterClicks[0] <= 40) {
    image(growing1, 880, 658, 475, 100);
  } else if (floorFull[0] == true && peashooterPlanted[0] == true && peashooterClicks[0] > 40 && peashooterClicks[0] <= 75) {
    image(growing2, 880, 658, 475, 100);
  } else if (floorFull[0] == true && peashooterPlanted[0] == true && peashooterClicks[0] > 75 && peashooterClicks[0] <= 99) {
    image(peashooterFloor, 880, 658, 475, 100);
  } else if (floorFull[0] == true && peashooterPlanted[0] == true && peashooterClicks[0] > 99 && peashooterClicks[0] <= 100) {
    image(peashooterSold, 880, 658, 475, 100);
  } else if (floorFull[0] == true && peashooterPlanted[0] == true && peashooterClicks[0] > 100) {
    money += peashooterSellback;
    peashooterClicks[0] = 0;
    floorFull[0] = false;
    peashooterPlanted[0] = false;
  }
  
  if (floorFull[0] == true && wallnutPlanted[0] == true && wallnutClicks[0] <= 50) {
    image(growing1, 880, 658, 475, 100);
  } else if (floorFull[0] == true && wallnutPlanted[0] == true && wallnutClicks[0] > 50 && wallnutClicks[0] <= 80) {
    image(growing2, 880, 658, 475, 100);
  } else if (floorFull[0] == true && wallnutPlanted[0] == true && wallnutClicks[0] > 80 && wallnutClicks[0] <= 99) {
    image(wallnutFloor, 880, 658, 475, 100);
  } else if (floorFull[0] == true && wallnutPlanted[0] == true && wallnutClicks[0] > 119 && wallnutClicks[0] <= 120) {
    image(wallnutSold, 880, 658, 475, 100);
  } else if (floorFull[0] == true && wallnutPlanted[0] == true && wallnutClicks[0] > 120) {
    money += wallnutSellback;
    wallnutClicks[0] = 0;
    floorFull[0] = false;
    wallnutPlanted[0] = false;
  }
  
  if (floorFull[0] == true && chomperPlanted[0] == true && chomperClicks[0] <= 100) {
    image(growing1, 880, 658, 475, 100);
  } else if (floorFull[0] == true && chomperPlanted[0] == true && chomperClicks[0] > 100 && chomperClicks[0] <= 200) {
    image(growing2, 880, 658, 475, 100);
  } else if (floorFull[0] == true && chomperPlanted[0] == true && chomperClicks[0] > 200 && chomperClicks[0] <= 279) {
    image(chomperFloor, 880, 658, 475, 100);
  } else if (floorFull[0] == true && chomperPlanted[0] == true && chomperClicks[0] > 279 && chomperClicks[0] <= 280) {
    image(chomperSold, 880, 658, 475, 100);
  } else if (floorFull[0] == true && chomperPlanted[0] == true && chomperClicks[0] > 280) {
    money += chomperSellback;
    chomperClicks[0] = 0;
    floorFull[0] = false;
    chomperPlanted[0] = false;
  }
  
  if (floorFull[0] == true && repeaterPlanted[0] == true && repeaterClicks[0] <= 100) {
    image(growing1, 880, 658, 475, 100);
  } else if (floorFull[0] == true && repeaterPlanted[0] == true && repeaterClicks[0] > 100 && repeaterClicks[0] <= 200) {
    image(growing2, 880, 658, 475, 100);
  } else if (floorFull[0] == true && repeaterPlanted[0] == true && repeaterClicks[0] > 200 && repeaterClicks[0] <= 279) {
    image(repeaterFloor, 880, 658, 475, 100);
  } else if (floorFull[0] == true && repeaterPlanted[0] == true && repeaterClicks[0] > 279 && repeaterClicks[0] <= 280) {
    image(repeaterSold, 880, 658, 475, 100);
  } else if (floorFull[0] == true && repeaterPlanted[0] == true && repeaterClicks[0] > 280) {
    money += repeaterSellback;
    repeaterClicks[0] = 0;
    floorFull[0] = false;
    repeaterPlanted[0] = false;
  }
  
  if (floorFull[0] == true && icepeaPlanted[0] == true && icepeaClicks[0] <= 100) {
    image(growing1, 880, 658, 475, 100);
  } else if (floorFull[0] == true && icepeaPlanted[0] == true && icepeaClicks[0] > 100 && icepeaClicks[0] <= 200) {
    image(growing2, 880, 658, 475, 100);
  } else if (floorFull[0] == true && icepeaPlanted[0] == true && icepeaClicks[0] > 200 && icepeaClicks[0] <= 279) {
    image(icepeaFloor, 880, 658, 475, 100);
  } else if (floorFull[0] == true && icepeaPlanted[0] == true && icepeaClicks[0] > 279 && icepeaClicks[0] <= 280) {
    image(icepeaSold, 880, 658, 475, 100);
  } else if (floorFull[0] == true && icepeaPlanted[0] == true && icepeaClicks[0] > 280) {
    money += icepeaSellback;
    icepeaClicks[0] = 0;
    floorFull[0] = false;
    icepeaPlanted[0] = false;
  }
  
//Floor 2
  if (floorFull[1] == true && sunflowerPlanted[1] == true && sunflowerClicks[1] <= 30) {
    image(growing1, 880, 548, 475, 100);
  } else if (floorFull[1] == true && sunflowerPlanted[1] == true && sunflowerClicks[1] > 30 && sunflowerClicks[1] <= 60) {
    image(growing2, 880, 548, 475, 100);
  } else if (floorFull[1] == true && sunflowerPlanted[1] == true && sunflowerClicks[1] > 60 && sunflowerClicks[1] <= 74) {
    image(sunflowerFloor, 880, 548, 475, 100);
  } else if (floorFull[1] == true && sunflowerPlanted[1] == true && sunflowerClicks[1] > 74 && sunflowerClicks[1] <= 75) {
    image(sunflowerSold, 880, 548, 475, 100);
  } else if (floorFull[1] == true && sunflowerPlanted[1] == true && sunflowerClicks[1] > 75) {
    money += sunflowerSellback;
    sunflowerClicks[1] = 0;
    floorFull[1] = false;
    sunflowerPlanted[1] = false;
  }

  if (floorFull[1] == true && peashooterPlanted[1] == true && peashooterClicks[1] <= 40) {
    image(growing1, 880, 548, 475, 100);
  } else if (floorFull[1] == true && peashooterPlanted[1] == true && peashooterClicks[1] > 40 && peashooterClicks[1] <= 75) {
    image(growing2, 880, 548, 475, 100);
  } else if (floorFull[1] == true && peashooterPlanted[1] == true && peashooterClicks[1] > 75 && peashooterClicks[1] <= 99) {
    image(peashooterFloor, 880, 548, 475, 100);
  } else if (floorFull[1] == true && peashooterPlanted[1] == true && peashooterClicks[1] > 99 && peashooterClicks[1] <= 100) {
    image(peashooterSold, 880, 548, 475, 100);
  } else if (floorFull[1] == true && peashooterPlanted[1] == true && peashooterClicks[1] > 100) {
    money += peashooterSellback;
    peashooterClicks[1] = 0;
    floorFull[1] = false;
    peashooterPlanted[1] = false;
  }
  
  if (floorFull[1] == true && wallnutPlanted[1] == true && wallnutClicks[1] <= 50) {
    image(growing1, 880, 548, 475, 100);
  } else if (floorFull[1] == true && wallnutPlanted[1] == true && wallnutClicks[1] > 50 && wallnutClicks[1] <= 80) {
    image(growing2, 880, 548, 475, 100);
  } else if (floorFull[1] == true && wallnutPlanted[1] == true && wallnutClicks[1] > 80 && wallnutClicks[1] <= 99) {
    image(wallnutFloor, 880, 548, 475, 100);
  } else if (floorFull[1] == true && wallnutPlanted[1] == true && wallnutClicks[1] > 119 && wallnutClicks[1] <= 120) {
    image(wallnutSold, 880, 548, 475, 100);
  } else if (floorFull[1] == true && wallnutPlanted[1] == true && wallnutClicks[1] > 120) {
    money += wallnutSellback;
    wallnutClicks[1] = 0;
    floorFull[1] = false;
    wallnutPlanted[1] = false;
  }
  
  if (floorFull[1] == true && chomperPlanted[1] == true && chomperClicks[1] <= 100) {
    image(growing1, 880, 548, 475, 100);
  } else if (floorFull[1] == true && chomperPlanted[1] == true && chomperClicks[1] > 100 && chomperClicks[1] <= 200) {
    image(growing2, 880, 548, 475, 100);
  } else if (floorFull[1] == true && chomperPlanted[1] == true && chomperClicks[1] > 200 && chomperClicks[1] <= 279) {
    image(chomperFloor, 880, 548, 475, 100);
  } else if (floorFull[1] == true && chomperPlanted[1] == true && chomperClicks[1] > 279 && chomperClicks[1] <= 280) {
    image(chomperSold, 880, 548, 475, 100);
  } else if (floorFull[1] == true && chomperPlanted[1] == true && chomperClicks[1] > 280) {
    money += chomperSellback;
    chomperClicks[1] = 0;
    floorFull[1] = false;
    chomperPlanted[1] = false;
  }
  
  if (floorFull[1] == true && repeaterPlanted[1] == true && repeaterClicks[1] <= 100) {
    image(growing1, 880, 548, 475, 100);
  } else if (floorFull[1] == true && repeaterPlanted[1] == true && repeaterClicks[1] > 100 && repeaterClicks[1] <= 200) {
    image(growing2, 880, 548, 475, 100);
  } else if (floorFull[1] == true && repeaterPlanted[1] == true && repeaterClicks[1] > 200 && repeaterClicks[1] <= 279) {
    image(repeaterFloor, 880, 548, 475, 100);
  } else if (floorFull[1] == true && repeaterPlanted[1] == true && repeaterClicks[1] > 279 && repeaterClicks[1] <= 280) {
    image(repeaterSold, 880, 548, 475, 100);
  } else if (floorFull[1] == true && repeaterPlanted[1] == true && repeaterClicks[1] > 280) {
    money += repeaterSellback;
    repeaterClicks[1] = 0;
    floorFull[1] = false;
    repeaterPlanted[1] = false;
  }
  
  if (floorFull[1] == true && icepeaPlanted[1] == true && icepeaClicks[1] <= 100) {
    image(growing1, 880, 548, 475, 100);
  } else if (floorFull[1] == true && icepeaPlanted[1] == true && icepeaClicks[1] > 100 && icepeaClicks[1] <= 200) {
    image(growing2, 880, 548, 475, 100);
  } else if (floorFull[1] == true && icepeaPlanted[1] == true && icepeaClicks[1] > 200 && icepeaClicks[1] <= 279) {
    image(icepeaFloor, 880, 548, 475, 100);
  } else if (floorFull[1] == true && icepeaPlanted[1] == true && icepeaClicks[1] > 279 && icepeaClicks[1] <= 280) {
    image(icepeaSold, 880, 548, 475, 100);
  } else if (floorFull[1] == true && icepeaPlanted[1] == true && icepeaClicks[1] > 280) {
    money += icepeaSellback;
    icepeaClicks[1] = 0;
    floorFull[1] = false;
    icepeaPlanted[1] = false;
  }
  
//Floor 3
  if (floorFull[2] == true && sunflowerPlanted[2] == true && sunflowerClicks[2] <= 30 && floorBought[0] == true) {
    image(growing1, 880, 438, 475, 100);
  } else if (floorFull[2] == true && sunflowerPlanted[2] == true && sunflowerClicks[2] > 30 && sunflowerClicks[2] <= 60 && floorBought[0] == true) {
    image(growing2, 880, 438, 475, 100);
  } else if (floorFull[2] == true && sunflowerPlanted[2] == true && sunflowerClicks[2] > 60 && sunflowerClicks[2] <= 74 && floorBought[0] == true) {
    image(sunflowerFloor, 880, 438, 475, 100);
  } else if (floorFull[2] == true && sunflowerPlanted[2] == true && sunflowerClicks[2] > 74 && sunflowerClicks[2] <= 75 && floorBought[0] == true) {
    image(sunflowerSold, 880, 438, 475, 100);
  } else if (floorFull[2] == true && sunflowerPlanted[2] == true && sunflowerClicks[2] > 75) {
    money += sunflowerSellback;
    sunflowerClicks[2] = 0;
    floorFull[2] = false;
    sunflowerPlanted[2] = false;
  }

  if (floorFull[2] == true && peashooterPlanted[2] == true && peashooterClicks[2] <= 40 && floorBought[0] == true) {
    image(growing1, 880, 438, 475, 100);
  } else if (floorFull[2] == true && peashooterPlanted[2] == true && peashooterClicks[2] > 40 && peashooterClicks[2] <= 75 && floorBought[0] == true) {
    image(growing2, 880, 438, 475, 100);
  } else if (floorFull[2] == true && peashooterPlanted[2] == true && peashooterClicks[2] > 75 && peashooterClicks[2] <= 99 && floorBought[0] == true) {
    image(peashooterFloor, 880, 438, 475, 100);
  } else if (floorFull[2] == true && peashooterPlanted[2] == true && peashooterClicks[2] > 99 && peashooterClicks[2] <= 100 && floorBought[0] == true) {
    image(peashooterSold, 880, 438, 475, 100);
  } else if (floorFull[2] == true && peashooterPlanted[2] == true && peashooterClicks[2] > 100 && floorBought[0] == true) {
    money += peashooterSellback;
    peashooterClicks[2] = 0;
    floorFull[2] = false;
    peashooterPlanted[2] = false;
  }
  
  if (floorFull[2] == true && wallnutPlanted[2] == true && wallnutClicks[2] <= 50 && floorBought[0] == true) {
    image(growing1, 880, 438, 475, 100);
  } else if (floorFull[2] == true && wallnutPlanted[2] == true && wallnutClicks[2] > 50 && wallnutClicks[2] <= 80 && floorBought[0] == true) {
    image(growing2, 880, 438, 475, 100);
  } else if (floorFull[2] == true && wallnutPlanted[2] == true && wallnutClicks[2] > 80 && wallnutClicks[2] <= 99 && floorBought[0] == true) {
    image(wallnutFloor, 880, 438, 475, 100);
  } else if (floorFull[2] == true && wallnutPlanted[2] == true && wallnutClicks[2] > 119 && wallnutClicks[2] <= 120 && floorBought[0] == true) {
    image(wallnutSold, 880, 438, 475, 100);
  } else if (floorFull[2] == true && wallnutPlanted[2] == true && wallnutClicks[2] > 120 && floorBought[0] == true) {
    money += wallnutSellback;
    wallnutClicks[2] = 0;
    floorFull[2] = false;
    wallnutPlanted[2] = false;
  }
  
  if (floorFull[2] == true && chomperPlanted[2] == true && chomperClicks[2] <= 100 && floorBought[0] == true) {
    image(growing1, 880, 438, 475, 100);
  } else if (floorFull[2] == true && chomperPlanted[2] == true && chomperClicks[2] > 100 && chomperClicks[2] <= 200 && floorBought[0] == true) {
    image(growing2, 880, 438, 475, 100);
  } else if (floorFull[2] == true && chomperPlanted[2] == true && chomperClicks[2] > 200 && chomperClicks[2] <= 279 && floorBought[0] == true) {
    image(chomperFloor, 880, 438, 475, 100);
  } else if (floorFull[2] == true && chomperPlanted[2] == true && chomperClicks[2] > 279 && chomperClicks[2] <= 280 && floorBought[0] == true) {
    image(chomperSold, 880, 438, 475, 100);
  } else if (floorFull[2] == true && chomperPlanted[2] == true && chomperClicks[2] > 280 && floorBought[0] == true) {
    money += chomperSellback;
    chomperClicks[2] = 0;
    floorFull[2] = false;
    chomperPlanted[2] = false;
  }
  
  if (floorFull[2] == true && repeaterPlanted[2] == true && repeaterClicks[2] <= 100 && floorBought[0] == true) {
    image(growing1, 880, 438, 475, 100);
  } else if (floorFull[2] == true && repeaterPlanted[2] == true && repeaterClicks[2] > 100 && repeaterClicks[2] <= 200 && floorBought[0] == true) {
    image(growing2, 880, 438, 475, 100);
  } else if (floorFull[2] == true && repeaterPlanted[2] == true && repeaterClicks[2] > 200 && repeaterClicks[2] <= 279 && floorBought[0] == true) {
    image(repeaterFloor, 880, 438, 475, 100);
  } else if (floorFull[2] == true && repeaterPlanted[2] == true && repeaterClicks[2] > 279 && repeaterClicks[2] <= 280 && floorBought[0] == true) {
    image(repeaterSold, 880, 438, 475, 100);
  } else if (floorFull[2] == true && repeaterPlanted[2] == true && repeaterClicks[2] > 280 && floorBought[0] == true) {
    money += repeaterSellback;
    repeaterClicks[2] = 0;
    floorFull[2] = false;
    repeaterPlanted[2] = false;
  }
  
  if (floorFull[2] == true && icepeaPlanted[2] == true && icepeaClicks[2] <= 100 && floorBought[0] == true) {
    image(growing1, 880, 438, 475, 100);
  } else if (floorFull[2] == true && icepeaPlanted[2] == true && icepeaClicks[2] > 100 && icepeaClicks[2] <= 200 && floorBought[0] == true) {
    image(growing2, 880, 438, 475, 100);
  } else if (floorFull[2] == true && icepeaPlanted[2] == true && icepeaClicks[2] > 200 && icepeaClicks[2] <= 279 && floorBought[0] == true) {
    image(icepeaFloor, 880, 438, 475, 100);
  } else if (floorFull[2] == true && icepeaPlanted[2] == true && icepeaClicks[2] > 279 && icepeaClicks[2] <= 280 && floorBought[0] == true) {
    image(icepeaSold, 880, 438, 475, 100);
  } else if (floorFull[2] == true && icepeaPlanted[2] == true && icepeaClicks[2] > 280 && floorBought[0] == true) {
    money += icepeaSellback;
    icepeaClicks[2] = 0;
    floorFull[2] = false;
    icepeaPlanted[2] = false;
  }
  
//Floor 4
  if (floorFull[3] == true && sunflowerPlanted[3] == true && sunflowerClicks[3] <= 30 && floorBought[1] == true) {
    image(growing1, 880, 328, 475, 100);
  } else if (floorFull[3] == true && sunflowerPlanted[3] == true && sunflowerClicks[3] > 30 && sunflowerClicks[3] <= 60 && floorBought[1] == true) {
    image(growing2, 880, 328, 475, 100);
  } else if (floorFull[3] == true && sunflowerPlanted[3] == true && sunflowerClicks[3] > 60 && sunflowerClicks[3] <= 74 && floorBought[1] == true) {
    image(sunflowerFloor, 880, 328, 475, 100);
  } else if (floorFull[3] == true && sunflowerPlanted[3] == true && sunflowerClicks[3] > 74 && sunflowerClicks[3] <= 75 && floorBought[1] == true) {
    image(sunflowerSold, 880, 328, 475, 100);
  } else if (floorFull[3] == true && sunflowerPlanted[3] == true && sunflowerClicks[3] > 75) {
    money += sunflowerSellback;
    sunflowerClicks[3] = 0;
    floorFull[3] = false;
    sunflowerPlanted[3] = false;
  }

  if (floorFull[3] == true && peashooterPlanted[3] == true && peashooterClicks[3] <= 40 && floorBought[1] == true) {
    image(growing1, 880, 328, 438, 100);
  } else if (floorFull[3] == true && peashooterPlanted[3] == true && peashooterClicks[3] > 40 && peashooterClicks[3] <= 75 && floorBought[1] == true) {
    image(growing2, 880, 328, 438, 100);
  } else if (floorFull[3] == true && peashooterPlanted[3] == true && peashooterClicks[3] > 75 && peashooterClicks[3] <= 99 && floorBought[1] == true) {
    image(peashooterFloor, 880, 328, 475, 100);
  } else if (floorFull[3] == true && peashooterPlanted[3] == true && peashooterClicks[3] > 99 && peashooterClicks[3] <= 100 && floorBought[1] == true) {
    image(peashooterSold, 880, 328, 475, 100);
  } else if (floorFull[3] == true && peashooterPlanted[3] == true && peashooterClicks[3] > 100 && floorBought[1] == true) {
    money += peashooterSellback;
    peashooterClicks[3] = 0;
    floorFull[3] = false;
    peashooterPlanted[3] = false;
  }
  
  if (floorFull[3] == true && wallnutPlanted[3] == true && wallnutClicks[3] <= 50 && floorBought[1] == true) {
    image(growing1, 880, 328, 475, 100);
  } else if (floorFull[3] == true && wallnutPlanted[3] == true && wallnutClicks[3] > 50 && wallnutClicks[3] <= 80 && floorBought[1] == true) {
    image(growing2, 880, 328, 475, 100);
  } else if (floorFull[3] == true && wallnutPlanted[3] == true && wallnutClicks[3] > 80 && wallnutClicks[3] <= 99 && floorBought[1] == true) {
    image(wallnutFloor, 880, 328, 475, 100);
  } else if (floorFull[3] == true && wallnutPlanted[3] == true && wallnutClicks[3] > 119 && wallnutClicks[3] <= 120 && floorBought[1] == true) {
    image(wallnutSold, 880, 328, 475, 100);
  } else if (floorFull[3] == true && wallnutPlanted[3] == true && wallnutClicks[3] > 120 && floorBought[1] == true) {
    money += wallnutSellback;
    wallnutClicks[3] = 0;
    floorFull[3] = false;
    wallnutPlanted[3] = false;
  }
  
  if (floorFull[3] == true && chomperPlanted[3] == true && chomperClicks[3] <= 100 && floorBought[1] == true) {
    image(growing1, 880, 328, 475, 100);
  } else if (floorFull[3] == true && chomperPlanted[3] == true && chomperClicks[3] > 100 && chomperClicks[3] <= 200 && floorBought[1] == true) {
    image(growing2, 880, 328, 475, 100);
  } else if (floorFull[3] == true && chomperPlanted[3] == true && chomperClicks[3] > 200 && chomperClicks[3] <= 279 && floorBought[1] == true) {
    image(chomperFloor, 880, 328, 475, 100);
  } else if (floorFull[3] == true && chomperPlanted[3] == true && chomperClicks[3] > 279 && chomperClicks[3] <= 280 && floorBought[1] == true) {
    image(chomperSold, 880, 328, 475, 100);
  } else if (floorFull[3] == true && chomperPlanted[3] == true && chomperClicks[3] > 280 && floorBought[1] == true) {
    money += chomperSellback;
    chomperClicks[3] = 0;
    floorFull[3] = false;
    chomperPlanted[3] = false;
  }
  
  if (floorFull[3] == true && repeaterPlanted[3] == true && repeaterClicks[3] <= 100 && floorBought[1] == true) {
    image(growing1, 880, 328, 475, 100);
  } else if (floorFull[3] == true && repeaterPlanted[3] == true && repeaterClicks[3] > 100 && repeaterClicks[3] <= 200 && floorBought[1] == true) {
    image(growing2, 880, 328, 475, 100);
  } else if (floorFull[3] == true && repeaterPlanted[3] == true && repeaterClicks[3] > 200 && repeaterClicks[3] <= 279 && floorBought[1] == true) {
    image(repeaterFloor, 880, 328, 475, 100);
  } else if (floorFull[3] == true && repeaterPlanted[3] == true && repeaterClicks[3] > 279 && repeaterClicks[3] <= 280 && floorBought[1] == true) {
    image(repeaterSold, 880, 328, 475, 100);
  } else if (floorFull[3] == true && repeaterPlanted[3] == true && repeaterClicks[3] > 280 && floorBought[1] == true) {
    money += repeaterSellback;
    repeaterClicks[3] = 0;
    floorFull[3] = false;
    repeaterPlanted[3] = false;
  }
  
  if (floorFull[3] == true && icepeaPlanted[3] == true && icepeaClicks[3] <= 100 && floorBought[1] == true) {
    image(growing1, 880, 328, 475, 100);
  } else if (floorFull[3] == true && icepeaPlanted[3] == true && icepeaClicks[3] > 100 && icepeaClicks[3] <= 200 && floorBought[1] == true) {
    image(growing2, 880, 328, 475, 100);
  } else if (floorFull[3] == true && icepeaPlanted[3] == true && icepeaClicks[3] > 200 && icepeaClicks[3] <= 279 && floorBought[1] == true) {
    image(icepeaFloor, 880, 328, 475, 100);
  } else if (floorFull[3] == true && icepeaPlanted[3] == true && icepeaClicks[3] > 279 && icepeaClicks[3] <= 280 && floorBought[1] == true) {
    image(icepeaSold, 880, 328, 475, 100);
  } else if (floorFull[3] == true && icepeaPlanted[3] == true && icepeaClicks[3] > 280 && floorBought[1] == true) {
    money += icepeaSellback;
    icepeaClicks[3] = 0;
    floorFull[3] = false;
    icepeaPlanted[3] = false;
  }
  
//Floor 5
  if (floorFull[4] == true && sunflowerPlanted[4] == true && sunflowerClicks[4] <= 30 && floorBought[2] == true) {
    image(growing1, 880, 218, 475, 100);
  } else if (floorFull[4] == true && sunflowerPlanted[4] == true && sunflowerClicks[4] > 30 && sunflowerClicks[4] <= 60 && floorBought[2] == true) {
    image(growing2, 880, 218, 475, 100);
  } else if (floorFull[4] == true && sunflowerPlanted[4] == true && sunflowerClicks[4] > 60 && sunflowerClicks[4] <= 74 && floorBought[2] == true) {
    image(sunflowerFloor, 880, 218, 475, 100);
  } else if (floorFull[4] == true && sunflowerPlanted[4] == true && sunflowerClicks[4] > 74 && sunflowerClicks[4] <= 75 && floorBought[2] == true) {
    image(sunflowerSold, 880, 218, 475, 100);
  } else if (floorFull[4] == true && sunflowerPlanted[4] == true && sunflowerClicks[4] > 75) {
    money += sunflowerSellback;
    sunflowerClicks[4] = 0;
    floorFull[4] = false;
    sunflowerPlanted[4] = false;
  }

  if (floorFull[4] == true && peashooterPlanted[4] == true && peashooterClicks[4] <= 40 && floorBought[2] == true) {
    image(growing1, 880, 218, 438, 100);
  } else if (floorFull[4] == true && peashooterPlanted[4] == true && peashooterClicks[4] > 40 && peashooterClicks[4] <= 75 && floorBought[2] == true) {
    image(growing2, 880, 218, 438, 100);
  } else if (floorFull[4] == true && peashooterPlanted[4] == true && peashooterClicks[4] > 75 && peashooterClicks[4] <= 99 && floorBought[2] == true) {
    image(peashooterFloor, 880, 218, 475, 100);
  } else if (floorFull[4] == true && peashooterPlanted[4] == true && peashooterClicks[4] > 99 && peashooterClicks[4] <= 100 && floorBought[2] == true) {
    image(peashooterSold, 880, 218, 475, 100);
  } else if (floorFull[4] == true && peashooterPlanted[4] == true && peashooterClicks[4] > 100 && floorBought[2] == true) {
    money += peashooterSellback;
    peashooterClicks[4] = 0;
    floorFull[4] = false;
    peashooterPlanted[4] = false;
  }
  
  if (floorFull[4] == true && wallnutPlanted[4] == true && wallnutClicks[4] <= 50 && floorBought[2] == true) {
    image(growing1, 880, 218, 475, 100);
  } else if (floorFull[4] == true && wallnutPlanted[4] == true && wallnutClicks[4] > 50 && wallnutClicks[4] <= 80 && floorBought[2] == true) {
    image(growing2, 880, 218, 475, 100);
  } else if (floorFull[4] == true && wallnutPlanted[4] == true && wallnutClicks[4] > 80 && wallnutClicks[4] <= 99 && floorBought[2] == true) {
    image(wallnutFloor, 880, 218, 475, 100);
  } else if (floorFull[4] == true && wallnutPlanted[4] == true && wallnutClicks[4] > 119 && wallnutClicks[4] <= 120 && floorBought[2] == true) {
    image(wallnutSold, 880, 218, 475, 100);
  } else if (floorFull[4] == true && wallnutPlanted[4] == true && wallnutClicks[4] > 120 && floorBought[2] == true) {
    money += wallnutSellback;
    wallnutClicks[4] = 0;
    floorFull[4] = false;
    wallnutPlanted[4] = false;
  }
  
  if (floorFull[4] == true && chomperPlanted[4] == true && chomperClicks[4] <= 100 && floorBought[2] == true) {
    image(growing1, 880, 218, 475, 100);
  } else if (floorFull[4] == true && chomperPlanted[4] == true && chomperClicks[4] > 100 && chomperClicks[4] <= 200 && floorBought[2] == true) {
    image(growing2, 880, 218, 475, 100);
  } else if (floorFull[4] == true && chomperPlanted[4] == true && chomperClicks[4] > 200 && chomperClicks[4] <= 279 && floorBought[2] == true) {
    image(chomperFloor, 880, 218, 475, 100);
  } else if (floorFull[4] == true && chomperPlanted[4] == true && chomperClicks[4] > 279 && chomperClicks[4] <= 280 && floorBought[2] == true) {
    image(chomperSold, 880, 218, 475, 100);
  } else if (floorFull[4] == true && chomperPlanted[4] == true && chomperClicks[4] > 280 && floorBought[2] == true) {
    money += chomperSellback;
    chomperClicks[4] = 0;
    floorFull[4] = false;
    chomperPlanted[4] = false;
  }
  
  if (floorFull[4] == true && repeaterPlanted[4] == true && repeaterClicks[4] <= 100 && floorBought[2] == true) {
    image(growing1, 880, 218, 475, 100);
  } else if (floorFull[4] == true && repeaterPlanted[4] == true && repeaterClicks[4] > 100 && repeaterClicks[4] <= 200 && floorBought[2] == true) {
    image(growing2, 880, 218, 475, 100);
  } else if (floorFull[4] == true && repeaterPlanted[4] == true && repeaterClicks[4] > 200 && repeaterClicks[4] <= 279 && floorBought[2] == true) {
    image(repeaterFloor, 880, 218, 475, 100);
  } else if (floorFull[4] == true && repeaterPlanted[4] == true && repeaterClicks[4] > 279 && repeaterClicks[4] <= 280 && floorBought[2] == true) {
    image(repeaterSold, 880, 218, 475, 100);
  } else if (floorFull[4] == true && repeaterPlanted[4] == true && repeaterClicks[4] > 280 && floorBought[2] == true) {
    money += repeaterSellback;
    repeaterClicks[4] = 0;
    floorFull[4] = false;
    repeaterPlanted[4] = false;
  }
  
  if (floorFull[4] == true && icepeaPlanted[4] == true && icepeaClicks[4] <= 100 && floorBought[2] == true) {
    image(growing1, 880, 218, 475, 100);
  } else if (floorFull[4] == true && icepeaPlanted[4] == true && icepeaClicks[4] > 100 && icepeaClicks[4] <= 200 && floorBought[2] == true) {
    image(growing2, 880, 218, 475, 100);
  } else if (floorFull[4] == true && icepeaPlanted[4] == true && icepeaClicks[4] > 200 && icepeaClicks[4] <= 279 && floorBought[2] == true) {
    image(icepeaFloor, 880, 218, 475, 100);
  } else if (floorFull[4] == true && icepeaPlanted[4] == true && icepeaClicks[4] > 279 && icepeaClicks[4] <= 280 && floorBought[2] == true) {
    image(icepeaSold, 880, 218, 475, 100);
  } else if (floorFull[4] == true && icepeaPlanted[4] == true && icepeaClicks[4] > 280 && floorBought[2] == true) {
    money += icepeaSellback;
    icepeaClicks[4] = 0;
    floorFull[4] = false;
    icepeaPlanted[4] = false;
  }
  textSize(100);
  text(nf(dialogue), 500, 100);
  //Floor 6
  if (floorFull[5] == true && sunflowerPlanted[5] == true && sunflowerClicks[5] <= 30 && floorBought[3] == true) {
    image(growing1, 880, 108, 475, 100);
  } else if (floorFull[5] == true && sunflowerPlanted[5] == true && sunflowerClicks[5] > 30 && sunflowerClicks[5] <= 60 && floorBought[3] == true) {
    image(growing2, 880, 108, 475, 100);
  } else if (floorFull[5] == true && sunflowerPlanted[5] == true && sunflowerClicks[5] > 60 && sunflowerClicks[5] <= 74 && floorBought[3] == true) {
    image(sunflowerFloor, 880, 108, 475, 100);
  } else if (floorFull[5] == true && sunflowerPlanted[5] == true && sunflowerClicks[5] > 74 && sunflowerClicks[5] <= 75 && floorBought[3] == true) {
    image(sunflowerSold, 880, 108, 475, 100);
  } else if (floorFull[5] == true && sunflowerPlanted[5] == true && sunflowerClicks[5] > 75) {
    money += sunflowerSellback;
    sunflowerClicks[5] = 0;
    floorFull[5] = false;
    sunflowerPlanted[5] = false;
  }

  if (floorFull[5] == true && peashooterPlanted[5] == true && peashooterClicks[5] <= 40 && floorBought[3] == true) {
    image(growing1, 880, 108, 438, 100);
  } else if (floorFull[5] == true && peashooterPlanted[5] == true && peashooterClicks[5] > 40 && peashooterClicks[5] <= 75 && floorBought[3] == true) {
    image(growing2, 880, 108, 438, 100);
  } else if (floorFull[5] == true && peashooterPlanted[5] == true && peashooterClicks[5] > 75 && peashooterClicks[5] <= 99 && floorBought[3] == true) {
    image(peashooterFloor, 880, 108, 475, 100);
  } else if (floorFull[5] == true && peashooterPlanted[5] == true && peashooterClicks[5] > 99 && peashooterClicks[5] <= 100 && floorBought[3] == true) {
    image(peashooterSold, 880, 108, 475, 100);
  } else if (floorFull[5] == true && peashooterPlanted[5] == true && peashooterClicks[5] > 100 && floorBought[3] == true) {
    money += peashooterSellback;
    peashooterClicks[5] = 0;
    floorFull[5] = false;
    peashooterPlanted[5] = false;
  }
  
  if (floorFull[5] == true && wallnutPlanted[5] == true && wallnutClicks[5] <= 50 && floorBought[3] == true) {
    image(growing1, 880, 108, 475, 100);
  } else if (floorFull[5] == true && wallnutPlanted[5] == true && wallnutClicks[5] > 50 && wallnutClicks[5] <= 80 && floorBought[3] == true) {
    image(growing2, 880, 108, 475, 100);
  } else if (floorFull[5] == true && wallnutPlanted[5] == true && wallnutClicks[5] > 80 && wallnutClicks[5] <= 99 && floorBought[3] == true) {
    image(wallnutFloor, 880, 108, 475, 100);
  } else if (floorFull[5] == true && wallnutPlanted[5] == true && wallnutClicks[5] > 119 && wallnutClicks[5] <= 120 && floorBought[3] == true) {
    image(wallnutSold, 880, 108, 475, 100);
  } else if (floorFull[5] == true && wallnutPlanted[5] == true && wallnutClicks[5] > 120 && floorBought[3] == true) {
    money += wallnutSellback;
    wallnutClicks[5] = 0;
    floorFull[5] = false;
    wallnutPlanted[5] = false;
  }
  
  if (floorFull[5] == true && chomperPlanted[5] == true && chomperClicks[5] <= 100 && floorBought[3] == true) {
    image(growing1, 880, 108, 475, 100);
  } else if (floorFull[5] == true && chomperPlanted[5] == true && chomperClicks[5] > 100 && chomperClicks[5] <= 200 && floorBought[3] == true) {
    image(growing2, 880, 108, 475, 100);
  } else if (floorFull[5] == true && chomperPlanted[5] == true && chomperClicks[5] > 200 && chomperClicks[5] <= 279 && floorBought[3] == true) {
    image(chomperFloor, 880, 108, 475, 100);
  } else if (floorFull[5] == true && chomperPlanted[5] == true && chomperClicks[5] > 279 && chomperClicks[5] <= 280 && floorBought[3] == true) {
    image(chomperSold, 880, 108, 475, 100);
  } else if (floorFull[5] == true && chomperPlanted[5] == true && chomperClicks[5] > 280 && floorBought[3] == true) {
    money += chomperSellback;
    chomperClicks[5] = 0;
    floorFull[5] = false;
    chomperPlanted[5] = false;
  }
  
  if (floorFull[5] == true && repeaterPlanted[5] == true && repeaterClicks[5] <= 100 && floorBought[3] == true) {
    image(growing1, 880, 108, 475, 100);
  } else if (floorFull[5] == true && repeaterPlanted[5] == true && repeaterClicks[5] > 100 && repeaterClicks[5] <= 200 && floorBought[3] == true) {
    image(growing2, 880, 108, 475, 100);
  } else if (floorFull[5] == true && repeaterPlanted[5] == true && repeaterClicks[5] > 200 && repeaterClicks[5] <= 279 && floorBought[3] == true) {
    image(repeaterFloor, 880, 108, 475, 100);
  } else if (floorFull[5] == true && repeaterPlanted[5] == true && repeaterClicks[5] > 279 && repeaterClicks[5] <= 280 && floorBought[3] == true) {
    image(repeaterSold, 880, 108, 475, 100);
  } else if (floorFull[5] == true && repeaterPlanted[5] == true && repeaterClicks[5] > 280 && floorBought[3] == true) {
    money += repeaterSellback;
    repeaterClicks[5] = 0;
    floorFull[5] = false;
    repeaterPlanted[5] = false;
  }
  
  if (floorFull[5] == true && icepeaPlanted[5] == true && icepeaClicks[5] <= 100 && floorBought[3] == true) {
    image(growing1, 880, 108, 475, 100);
  } else if (floorFull[5] == true && icepeaPlanted[5] == true && icepeaClicks[5] > 100 && icepeaClicks[5] <= 200 && floorBought[3] == true) {
    image(growing2, 880, 108, 475, 100);
  } else if (floorFull[5] == true && icepeaPlanted[5] == true && icepeaClicks[5] > 200 && icepeaClicks[5] <= 279 && floorBought[3] == true) {
    image(icepeaFloor, 880, 108, 475, 100);
  } else if (floorFull[5] == true && icepeaPlanted[5] == true && icepeaClicks[5] > 279 && icepeaClicks[5] <= 280 && floorBought[3] == true) {
    image(icepeaSold, 880, 108, 475, 100);
  } else if (floorFull[5] == true && icepeaPlanted[5] == true && icepeaClicks[5] > 280 && floorBought[3] == true) {
    money += icepeaSellback;
    icepeaClicks[5] = 0;
    floorFull[5] = false;
    icepeaPlanted[5] = false;
  }
  
//Start items --------------------------------------------------------------------------------------------------\\
//Building Expansions
  stroke(1);
  fill(buildingExpansionColour);
  rect(20, 50, 250, 75, 7);
  fill(255);
  noStroke();
  
  if (buildingFloorsBought >= 4) {
    textSize(14);
    text("Max amount of floors bought!", 25, 65);   
  } else {
    textSize(14);
    text("Buy building expansion. (1 floor)", 25, 65);
    text("Price: $" + nf(buildingExpansionCost, 0, 2), 25, 83);
    text("Building floors:", 25, 100);
    text(buildingFloors, 25, 120);
  }

//Research division
  if (researchDivisionOwned == false) {
    stroke(1);
    fill(researchDivisionColor);
    rect(20, 130, 250, 75, 7);
    fill(255);
    noStroke();
  
    textSize(14);
    text("Buy a research centre!", 25, 145);
    text("Price: $" + nf(researchDivisionCost, 0, 2), 25, 163);
  } else {
    stroke(1);
    fill(researchDivisionColor);
    rect(20, 130, 250, 75, 7);
    fill(255);
    noStroke();
  
    textSize(14);
    text("Research division already bought!", 25, 145);
    
    stroke(5);
    fill(researchButtonColor);
    ellipse(researchX, researchY, researchW, researchH);
    noStroke();
    image(flask, 162.5, 4.5, 40, 40);
  }
  
    stroke(5);
    fill(muteColor);
    ellipse(muteX, muteY, muteW, muteH);
    noStroke();
    image(soundOn, 213, 7.5, 35, 35);
    
    stroke(5);
    fill(settingsColor);
    ellipse(settingsX, settingsY, settingsW, settingsH);
    noStroke();
    image(settings, 263, 7.5, 35, 35);
  //Sunflower
  stroke(1);
  fill(sunflowerColor);
  rect(20, 210, 250, 75, 7);
  fill(255);
  noStroke();
  //18
  textSize(14);
  text("Buy sunflower seeds.", 25, 225);
  text("Price: $" + nf(sunflowerCost), 25, 243);
  text("Sellback value: $" + nf(sunflowerSellback), 25, 261);
  text("Growth rate: " + nf(sunflowerGrowth), 25, 279);
  
 
  //Peashooter
  stroke(1);
  fill(peashooterColor);
  rect(20, 290, 250, 75, 7);
  fill(255);
  noStroke();
  
  textSize(14);
  text("Buy peashooter seeds.", 25, 305);
  text("Price: $" + nf(peashooterCost), 25, 323);
  text("Sellback value: $" + nf(peashooterSellback), 25, 341);
  text("Growth rate: " + nf(peashooterGrowth), 25, 359);

  //Wallnut
  stroke(1);
  fill(wallnutColor);
  rect(20, 370, 250, 75, 7);
  fill(255);
  noStroke();
  
  textSize(14);
  text("Buy wallnut seeds.", 25, 385);
  text("Price: $" + nf(wallnutCost), 25, 403);
  text("Sellback value: $" + nf(wallnutSellback), 25, 421);  text("Growth rate: " + nf(wallnutGrowth), 25, 439);
  
  //Chomper
  stroke(1);
  fill(chomperColor);
  rect(20, 450, 250, 75, 7);
  fill(255);
  noStroke();
  
  textSize(14);
  text("Buy chomper seeds.", 25, 465);
  text("Price: $" + nf(chomperCost), 25, 483);
  text("Sellback value: $" + nf(chomperSellback), 25, 501);
  text("Growth rate: " + nf(chomperGrowth), 25, 519);

  //Repeaters
  stroke(1);
  fill(repeaterColor);
  rect(20, 530, 250, 75, 7);
  fill(255);
  noStroke();
  
  textSize(14);
  text("Buy repeater seeds.", 25, 545);
  text("Price: $" + nf(repeaterCost), 25, 563);
  text("Sellback value: $" + nf(repeaterSellback), 25, 581);
  text("Growth rate: " + nf(repeaterGrowth), 25, 599);
  
  //Icepea
  stroke(1);
  fill(icepeaColor);
  rect(20, 610, 250, 75, 7);
  fill(255);
  noStroke();
  
  textSize(14);
  text("Buy icepea seeds.", 25, 625);
  text("Price: $" + nf(icepeaCost), 25, 643);
  text("Sellback value: $" + nf(icepeaSellback), 25, 661);
  text("Growth rate: " + nf(icepeaGrowth), 25, 679);
  
  //All Highlights
  //(mouseX > 20 && mouseX < 20 + 250 && mouseY > 50 && mouseY < 50 + 75)
  //Building
  if (money < buildingExpansionCost && researchScreen == false) {
    buildingExpansionColour = color(#5C2E00);
  } else if (mouseX < 20 && mouseX > 20 + 250 && mouseY < 50 && mouseY > 50 + 75 && money >= buildingExpansionCost || buildingFloorsBought != 4 && researchScreen == false) {
    buildingExpansionColour = color(#8A4500);
  } else if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 50 && mouseY < 50 + 75 && money < buildingExpansionCost || buildingFloorsBought <= 4 && researchScreen == false) {
    buildingExpansionColour = color(#5C2E00);
  } else {
    buildingExpansionColour = color(#8A4500);
  } 
  
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 50 && mouseY < 50 + 75 && money >= buildingExpansionCost && buildingFloorsBought != 4 && researchScreen == false) {
    buildingExpansionColour = color(#BA5D00);
  }
  
  //Research centre
  if (money < researchDivisionCost || researchDivisionOwned == true && researchScreen == false) {
    researchDivisionColor = color(#5C2E00);
  } else {
    researchDivisionColor = color(#8A4500);
  } 
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 130 && mouseY < 130 + 75 && money >= researchDivisionCost && researchDivisionOwned == false) {
    researchDivisionColor =  color(#BA5D00);
  }
  
  //Sunflower
  if(money < sunflowerCost && researchScreen == false) {
    sunflowerColor = color(#5C2E00);
  } else {
    sunflowerColor = color(#8A4500);
  } 
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 210 && mouseY < 210 + 75 && money >= sunflowerCost && researchScreen == false && dialogue != 1) {
    sunflowerColor = color(#BA5D00);
  }
  
  //Peashooter
  if(money < peashooterCost && researchScreen == false) {
    peashooterColor = color(#5C2E00);
  } else {
    peashooterColor = color(#8A4500);
  } 
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 290 && mouseY < 290 + 75 && money >= peashooterCost && researchScreen == false) {
    peashooterColor = color(#BA5D00); 
  }
  
  //Wallnut
  if(money < wallnutCost && researchScreen == false || wallnutResearch == false) {
    wallnutColor = color(#5C2E00);
  } else {
    wallnutColor = color(#8A4500);
  } 
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 370 && mouseY < 370 + 75 && money >= wallnutCost && researchScreen == false && wallnutResearch == true) {
    wallnutColor = color(#BA5D00);
  }
  
  //Chomper
  if(money < chomperCost && researchScreen == false || chomperResearch == false) {
    chomperColor = color(#5C2E00);
  } else {
    chomperColor = color(#8A4500);
  } 
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 450 && mouseY < 450 + 75 && money >= chomperCost && researchScreen == false && chomperResearch == true) {
    chomperColor = color(#BA5D00);
  }
  
  //Repeater
  if(money < repeaterCost && researchScreen == false || repeaterResearch == false) {
    repeaterColor = color(#5C2E00);
  } else {
    repeaterColor = color(#8A4500);
  }
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 530 && mouseY < 530 + 75 && money >= chomperCost && researchScreen == false && repeaterResearch == true) {
    repeaterColor = color(#BA5D00);
  }
  
  //Icepea
  if(money < icepeaCost && researchScreen == false || icepeaResearch == false) {
    icepeaColor = color(#5C2E00);
  } else {
    icepeaColor = color(#8A4500);
  }
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 610 && mouseY < 610 + 75 && money >= chomperCost && researchScreen == false && icepeaResearch == true) {
    icepeaColor = color(#BA5D00);
  }
  
  //Research Button
  if (mouseX > 160 && mouseX < 160 + 40 && mouseY > 5 && mouseY < 5 + 40) {
    researchButtonColor = color(#BA5D00);
  } else {
    researchButtonColor = color(#8A4500);
  }
//End of items --------------------------------------------------------------------------------------------------\\
  
  //Research highlights
  if(sunflowerTier1 == true && researchScreen == true) {
    researchColor[1] = color(#5C2E00);
  } else if (sunflowerTier1 == false && researchScreen == true) {
    researchColor[1] = color(#8A4500);
  }
  if (mouseX > 150 && mouseX < 150 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && researchScreen == true && sunflowerTier1 == false) {
    researchColor[1] = color(#BA5D00);
  }
  
  if(sunflowerTier2 == true && researchScreen == true) {
    researchColor[2] = color(#5C2E00);
  } else if (sunflowerTier2 == false && researchScreen == true) {
    researchColor[2] = color(#8A4500);
  }
  if (mouseX > 150 && mouseX < 150 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && researchScreen == true && sunflowerTier2 == false) {
    researchColor[2] = color(#BA5D00);
  }
  
  if(sunflowerTier3 == true && researchScreen == true) {
    researchColor[3] = color(#5C2E00);
  } else if (sunflowerTier3 == false && researchScreen == true) {
    researchColor[3] = color(#8A4500);
  }
  if (mouseX > 150 && mouseX < 150 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && researchScreen == true && sunflowerTier3 == false) {
    researchColor[3] = color(#BA5D00);
  }
  
  if(peashooterTier1 == true && researchScreen == true) {
    researchColor[5] = color(#5C2E00);
  } else if (peashooterTier1 == false && researchScreen == true) {
    researchColor[5] = color(#8A4500);
  }
  if (mouseX > 330.86 && mouseX < 330.86 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && researchScreen == true && peashooterTier1 == false) {
    researchColor[5] = color(#BA5D00);
  }
  
  if(peashooterTier2 == true && researchScreen == true) {
    researchColor[6] = color(#5C2E00);
  } else if (peashooterTier2 == false && researchScreen == true) {
    researchColor[6] = color(#8A4500);
  }
  if (mouseX > 330.86 && mouseX < 330.86 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && researchScreen == true && peashooterTier2 == false) {
    researchColor[6] = color(#BA5D00);
  }
  
  if(peashooterTier3 == true && researchScreen == true) {
    researchColor[7] = color(#5C2E00);
  } else if (peashooterTier3 == false && researchScreen == true) {
    researchColor[7] = color(#8A4500);
  }
  if (mouseX > 330.86 && mouseX < 330.86 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && researchScreen == true && peashooterTier3 == false) {
    researchColor[7] = color(#BA5D00);
  }
  
  if(wallnutResearch == true && researchScreen == true) {
    researchColor[8] = color(#5C2E00);
  } else if (wallnutResearch == false && researchScreen == true) {
    researchColor[8] = color(#8A4500);
  }
  if (mouseX > 511.72 && mouseX < 511.72 + 170.86 && mouseY > 150 && mouseY < 115 + 150 && researchScreen == true && wallnutResearch == false) {
    researchColor[8] = color(#BA5D00);
  }
  
  if(wallnutTier1 == true && researchScreen == true) {
    researchColor[9] = color(#5C2E00);
  } else if (wallnutTier1 == false && researchScreen == true) {
    researchColor[9] = color(#8A4500);
  }
  if (mouseX > 511.72 && mouseX < 511.72 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && researchScreen == true && wallnutTier1 == false) {
    researchColor[9] = color(#BA5D00);
  }
  
  if(wallnutTier2 == true && researchScreen == true) {
    researchColor[10] = color(#5C2E00);
  } else if (wallnutTier2 == false && researchScreen == true) {
    researchColor[10] = color(#8A4500);
  }
  if (mouseX > 511.72 && mouseX < 511.72 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && researchScreen == true && wallnutTier2 == false) {
    researchColor[10] = color(#BA5D00);
  }
  
  if(wallnutTier3 == true && researchScreen == true) {
    researchColor[11] = color(#5C2E00);
  } else if (wallnutTier3 == false && researchScreen == true) {
    researchColor[11] = color(#8A4500);
  }
  if (mouseX > 511.72 && mouseX < 511.72 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && researchScreen == true && wallnutTier3 == false) {
    researchColor[11] = color(#BA5D00);
  }
  
  if(chomperResearch == true && researchScreen == true) {
    researchColor[12] = color(#5C2E00);
  } else if (wallnutTier3 == false && researchScreen == true) {
    researchColor[12] = color(#8A4500);
  }
  if (mouseX > 692.58 && mouseX < 692.58 + 170.86 && mouseY > 150 && mouseY < 115 + 150 && researchScreen == true && chomperResearch == false) {
    researchColor[12] = color(#BA5D00);
  }
  
  if(chomperTier1 == true && researchScreen == true) {
    researchColor[13] = color(#5C2E00);
  } else if (chomperTier1 == false && researchScreen == true) {
    researchColor[13] = color(#8A4500);
  }
  if (mouseX > 692.58 && mouseX < 692.58 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && researchScreen == true && chomperTier1 == false) {
    researchColor[13] = color(#BA5D00);
  }
  
  if(chomperTier2 == true && researchScreen == true) {
    researchColor[14] = color(#5C2E00);
  } else if (chomperTier2 == false && researchScreen == true) {
    researchColor[14] = color(#8A4500);
  }
  if (mouseX > 692.58 && mouseX < 692.58 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && researchScreen == true && chomperTier2 == false) {
    researchColor[14] = color(#BA5D00);
  }
  
  if(chomperTier3 == true && researchScreen == true) {
    researchColor[15] = color(#5C2E00);
  } else if (chomperTier3 == false && researchScreen == true) {
    researchColor[15] = color(#8A4500);
  }
  if (mouseX > 692.58 && mouseX < 692.58 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && researchScreen == true && chomperTier3 == false) {
    researchColor[15] = color(#BA5D00);
  }
  
  if (repeaterResearch == true && researchScreen == true) {
    researchColor[16] = color(#5C2E00);
  } else if (repeaterResearch == false && researchScreen == true) {
    researchColor[16] = color(#8A4500);
  }
  if (mouseX > 873.44 && mouseX < 873.44 + 170.86 && mouseY > 150 && mouseY < 115 + 150 && researchScreen == true && repeaterResearch == false) {
    researchColor[16] = color(#BA5D00);
  }
  
  if (repeaterTier1 == true && researchScreen == true) {
    researchColor[17] = color(#5C2E00);
  } else if (repeaterTier1 == false && researchScreen == true) {
    researchColor[17] = color(#8A4500);
  }
  if (mouseX > 873.44 && mouseX < 873.44 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && researchScreen == true && repeaterTier1 == false) {
    researchColor[17] = color(#BA5D00);
  }
  
  if (repeaterTier2 == true && researchScreen == true) {
    researchColor[18] = color(#5C2E00);
  } else if (repeaterTier2 == false && researchScreen == true) {
    researchColor[18] = color(#8A4500);
  }
  if (mouseX > 873.44 && mouseX < 873.44 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && researchScreen == true && repeaterTier2 == false) {
    researchColor[18] = color(#BA5D00);
  }
  
  if (repeaterTier3 == true && researchScreen == true) {
    researchColor[19] = color(#5C2E00);
  } else if (repeaterTier2 == false && researchScreen == true) {
    researchColor[19] = color(#8A4500);
  }
   if (mouseX > 873.44 && mouseX < 873.44 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && researchScreen == true && repeaterTier3 == false) {
    researchColor[19] = color(#BA5D00);
  }
  
  if (icepeaResearch == true && researchScreen == true) {
    researchColor[20] = color(#5C2E00);
  } else if (icepeaResearch == true && researchScreen == true) {
    researchColor[20] = color(#8A4500);
  }
  if (mouseX > 1054.3 && mouseX < 1054.3 + 170.86 && mouseY > 150 && mouseY < 115 + 150 && researchScreen == true && icepeaResearch == false) {
    researchColor[20] = color(#BA5D00);
  }
  
  if (icepeaTier1 == true && researchScreen == true) {
    researchColor[21] = color(#5C2E00);
  } else if (icepeaTier1 == true && researchScreen == true) {
    researchColor[21] = color(#8A4500);
  }
  if (mouseX > 1054.3 && mouseX < 1054.3 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && researchScreen == true && icepeaTier1 == false) {
    researchColor[21] = color(#BA5D00);
  }
  
  if (icepeaTier2 == true && researchScreen == true) {
    researchColor[22] = color(#5C2E00);
  } else if (icepeaTier2 == true && researchScreen == true) {
    researchColor[22] = color(#8A4500);
  }
  if (mouseX > 1054.3 && mouseX < 1054.3 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && researchScreen == true && icepeaTier2 == false) {
    researchColor[22] = color(#BA5D00);
  }  
  
  if (icepeaTier3 == true && researchScreen == true) {
    researchColor[23] = color(#5C2E00);
  } else if (icepeaTier3 == true && researchScreen == true) {
    researchColor[23] = color(#8A4500);
  }
  if (mouseX > 1054.3 && mouseX < 1054.3 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && researchScreen == true && icepeaTier3 == false) {
    researchColor[23] = color(#BA5D00);
  }
  //loan highlight
  if (money >= 100 && lives != 0) {
    loanButtonColor = color(#5C2E00);
  } else if (money < 100 && lives != 0) {
    loanButtonColor = color(#8A4500);
  }
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 690 && mouseY < 690 + 75 && money < 100 && dialogue <= 6 && dialogue >= 6) {
    loanButtonColor = color(#BA5D00);
  }
  //Research screen
  if (researchScreen ==  true) {
    fill(#663300);
    image(woodPanelHorizontal, 10, 10, 1346, 748);
    image(exitButtonLight, exit1X, exit1Y, exit1W, exit1H);
    fill(255);
    textSize(50);
    text("Research Centre", width / 2 - 200, 100);

    //Sunflower
    stroke(1);
    fill(researchColor[0]);
    rect(50 + 100, 115, 170.86, 150, 7);
    fill(researchColor[1]);
    rect(50 + 100, 270, 170.86, 150, 7);
    fill(researchColor[2]);
    rect(50 + 100, 425, 170.86, 150, 7);
    fill(researchColor[3]);
    rect(50 + 100, 580, 170.86, 150, 7);

    fill(researchColor[4]);
    rect(230.86 + 100, 115, 170.86, 150, 7);
    fill(researchColor[5]);
    rect(230.86 + 100, 270, 170.86, 150, 7);
    fill(researchColor[6]);
    rect(230.86 + 100, 425, 170.86, 150, 7);
    fill(researchColor[7]);
    rect(230.86 + 100, 580, 170.86, 150, 7);
    
    fill(researchColor[8]);
    rect(411.72 + 100, 115, 170.86, 150, 7);
    fill(researchColor[9]);
    rect(411.72 + 100, 270, 170.86, 150, 7);
    fill(researchColor[10]);
    rect(411.72 + 100, 425, 170.86, 150, 7);
    fill(researchColor[11]);
    rect(411.72 + 100, 580, 170.86, 150, 7);
    
    fill(researchColor[12]);
    rect(592.58 + 100, 115, 170.86, 150, 7);
    fill(researchColor[13]);
    rect(592.58 + 100, 270, 170.86, 150, 7);
    fill(researchColor[14]);
    rect(592.58 + 100, 425, 170.86, 150, 7);
    fill(researchColor[15]);
    rect(592.58 + 100, 580, 170.86, 150, 7);
    
    fill(researchColor[16]);
    rect(773.44 + 100, 115, 170.86, 150, 7);
    fill(researchColor[17]);
    rect(773.44 + 100, 270, 170.86, 150, 7);
    fill(researchColor[18]);
    rect(773.44 + 100, 425, 170.86, 150, 7);
    fill(researchColor[19]);
    rect(773.44 + 100, 580, 170.86, 150, 7);
    
    fill(researchColor[20]);
    rect(954.3+ 100, 115, 170.86, 150, 7);
    fill(researchColor[21]);
    rect(954.3 + 100, 270, 170.86, 150, 7);
    fill(researchColor[22]);
    rect(954.3 + 100, 425, 170.86, 150, 7);
    fill(researchColor[23]);
    rect(954.3 + 100, 580, 170.86, 150, 7);
    noStroke();
    if (mouseX > exit1X && mouseX < exit1X + exit1W && mouseY > exit1Y && mouseY < exit1Y + exit1H && researchScreen == true) {
      image(exitButtonDark, exit1X, exit1Y, exit1W, exit1H);
    }
  }
  
  //Shop Lines
  for(int i = 0; i < 461; i = i + 80) {
    line(200, i + 50, 200, i + 125);
  }
  
  //Seed planting exit
  if (mouseX > exit2X && mouseX < exit2X + exit2W && mouseY > exit2Y && mouseY < exit2Y + exit2H && seedClicked == true) {
    image(exitButtonDark, exit2X, exit2Y, exit2W, exit2H);
  } else if (seedClicked == true) {
    image(exitButtonLight, exit2X, exit2Y, exit2W, exit2H);
  }
  
  //Research text
  if (researchScreen == true) {
    fill(255);
    textSize(18);
    //Row 1
    image(sunflowerPic, 175, 120, 110, 120);
    text("Researched!", 160, 255);
    text("Sunflower tier 1:", 160, 300);
    text("Increases the", 160, 322);
    text("value of the", 160, 344);
    text("sunflower by", 160, 366);
    text("$100", 160, 388);
    text("Cost: $" + nf(sunflowerTier1Cost), 160, 410);
    text("Sunflower tier 2:", 160, 454);
    text("Increases the", 160, 476);
    text("value of the", 160, 498);
    text("sunflower by", 160, 520);
    text("$100", 160, 542);
    text("Cost: $" + nf(sunflowerTier2Cost), 160, 564);
    text("Sunflower tier 3:", 160, 608);
    text("Increases the", 160, 630);
    text("value of the", 160, 652);
    text("sunflower by", 160, 674);
    text("$50", 160, 696);
    text("Cost: $" + nf(sunflowerTier3Cost), 160, 696);
    
    //Row 2
    image(peashooterPic, 355.86, 135, 100, 100);
    text("Researched!", 340.86, 255);
    text("Peashooter tier 1:", 340.86, 300);
    text("Increases the", 340.86, 322);
    text("value of the", 340.86, 344);
    text("peashooter by", 340.86, 366);
    text("$200", 340.86, 388);
    text("Cost: $" + nf(peashooterTier1Cost), 340.86, 410);
    text("Peashooter tier 2:", 340.86, 454);
    text("Increases the", 340.86, 476);
    text("value of the", 340.86, 498);
    text("peashooter by", 340.86, 520);
    text("$100", 340.86, 542);
    text("Cost: $" + nf(peashooterTier2Cost), 340.86, 564);
    text("Peashooter tier 3:", 340.86, 608);
    text("Increases the", 340.86, 630);
    text("value of the", 340.86, 652);
    text("peashooter by", 340.86, 674);
    text("$100", 340.86, 696);
    text("Cost: $" + nf(peashooterTier3Cost), 340.86, 696);
    
    //Row 3
    image(wallnutPic, 550.72, 135, 90, 100);
    if (wallnutResearch == true) {
      text("Researched!", 521.72, 255);
    } else {
      text("Cost: $" + nf(wallnutResearchCost), 521.72, 255);
    }
    text("Wallnut tier 1:", 521.72, 300);
    text("Increases the", 521.72, 322);
    text("value of the", 521.72, 344);
    text("wallnut by", 521.72, 366);
    text("$300", 521.72, 388);
    text("Cost: $" + nf(wallnutTier1Cost), 521.72, 410);
    text("Wallnut tier 2:", 521.72, 454);
    text("Increases the", 521.72, 476);
    text("value of the", 521.72, 498);
    text("wallnut by", 521.72, 520);
    text("$100", 521.72, 542);
    text("Cost: $" + nf(wallnutTier2Cost), 521.72, 564);
    text("Wallnut tier 3:", 521.72, 608);
    text("Increases the", 521.72, 630);
    text("value of the", 521.72, 652);
    text("wallnut by", 521.72, 674);
    text("$100", 521.72, 696);
    text("Cost: $" + nf(wallnutTier3Cost), 521.72, 696);
    
    //Row 4
    image(chomperPic, 728.58, 135, 100, 110);
    if (chomperResearch == true) {
      text("Researched!", 702.58, 255);
    } else {
      text("Cost: $" + nf(chomperResearchCost), 702.58, 255);
    }
    text("Chomper tier 1:", 702.58, 300);
    text("Increases the", 702.58, 322);
    text("value of the", 702.58, 344);
    text("chomper by", 702.58, 366);
    text("$400", 702.58, 388);
    text("Cost: $" + nf(chomperTier1Cost), 702.58, 410);
    text("Chomper tier 2:", 702.58, 454);
    text("Increases the", 702.58, 476);
    text("value of the", 702.58, 498);
    text("chomper by", 702.58, 520);
    text("$100", 702.58, 542);
    text("Cost: $" + nf(chomperTier2Cost), 702.58, 564);
    text("Chomper tier 3:", 702.58, 608);
    text("Increases the", 702.58, 630);
    text("value of the", 702.58, 652);
    text("chomper by", 702.58, 674);
    text("$100", 702.58, 696);
    text("Cost: $" + nf(chomperTier3Cost), 702.58, 696);
    
    //Row 5
    image(repeaterPic, 910.44, 135, 100, 100);
    if (repeaterResearch == true) {
      text("Researched!", 883.44, 255);
    } else {
      text("Cost: $" + nf(repeaterResearchCost), 883.44, 255);
    }
    text("Repeater tier 1:", 883.44, 300);
    text("Increases the", 883.44, 322);
    text("value of the", 883.44, 344);
    text("repeater by", 883.44, 366);
    text("$500", 883.44, 388);
    text("Cost: $" + nf(repeaterTier1Cost), 883.44, 410);
    text("Repeater tier 2:", 883.44, 454);
    text("Increases the", 883.44, 476);
    text("value of the", 883.44, 498);
    text("repeater by", 883.44, 520);
    text("$100", 883.44, 542);
    text("Cost: $" + nf(repeaterTier2Cost), 883.44, 564);
    text("Repeater tier 3:", 883.44, 608);
    text("Increases the", 883.44, 630);
    text("value of the", 883.44, 652);
    text("repeater by", 883.44, 674);
    text("$100", 883.44, 696);
    text("Cost: $" + nf(repeaterTier3Cost), 883.44, 696);
    
  
    //Row 6
    image(icepeaPic, 1089.3, 135, 100, 100);
    if (icepeaResearch == true) {
      text("Researched!", 1064.3, 255);
    } else {
      text("Cost: $" + nf(icepeaResearchCost), 1064.3, 255);
    }
    text("Icepea tier 1:", 1064.3, 300);
    text("Increases the", 1064.3, 322);
    text("value of the", 1064.3, 344);
    text("icepea by", 1064.3, 366);
    text("$600", 1064.3, 388);
    text("Cost: $" + nf(icepeaTier1Cost), 1064.3, 410);
    text("Icepea tier 2:", 1064.3, 454);
    text("Increases the", 1064.3, 476);
    text("value of the", 1064.3, 498);
    text("icepea by", 1064.3, 520);
    text("$100", 1064.3, 542);
    text("Cost: $" + nf(icepeaTier2Cost), 1064.3, 564);
    text("Icepea tier 3:", 1064.3, 608);
    text("Increases the", 1064.3, 630);
    text("value of the", 1064.3, 652);
    text("cepea by", 1064.3, 674);
    text("$100", 1064.3, 696);
    text("Cost: $" + nf(icepeaTier3Cost), 1064.3, 696);
  }
  
  //loan button
  fill(loanButtonColor);
  stroke(1);
  rect(20, 690, 250, 75, 7);
  noStroke();
  fill(255);
  textSize(40);
  text("Loan", 95, 740);
  //tutorial
  if (tutorialScreen == true && dialogue == 1) {
    image(crazyDave, 300, 200, 330, 800);
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 638, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("Hey, you're the new guy! I'm Crazy Dave, the guy who will be", width / 4 + 20, 678);
    text("buying all your plants and selling them off. Since you're", width / 4 + 20, 700);
    text("new to the gardening industry, I'll show you the ropes.", width / 4 + 20, 722);
    textSize(10);
    text("Press spacebar to continue.", width / 4 + 20, 734);
  } else if (tutorialScreen == true && dialogue >= 2 && dialogue <= 3) {
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 20, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("Let's  start off by planting some seeds. Click the box right", width / 4 + 20, 40);
    text("here. Then choose a floor to plant it on.", width / 4 + 20, 62); 
  } else if (tutorialScreen == true && dialogue == 4) {
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 638, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("Wow, you're really good at this! Now grow the sunflower", width / 4 + 20, 678);
    text("you planted by clicking the sun. For the sunflower, you", width / 4 + 20, 700);
    text("will need to click the sun 75 as stated in the box.", width / 4 + 20, 722);
  } else if (tutorialScreen == true && dialogue == 5) {
    image(crazyDave, 300, 200, 330, 800);
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 638, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("Great, now you have sold the plants and earned some money.", width / 4 + 20, 678);
    text("I'm going to lend you some money so you can buy an extra ", width / 4 + 20, 700);
    text("floor to plant more seeds.", width / 4 + 20, 722);
  } else if (tutorialScreen == true && dialogue == 6) {
    image(crazyDave, 300, 200, 330, 800);
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 638, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("Whoops, now you have no money to buy anything else.", width / 4 + 20, 678);
    text("If that ever happens, just get a small loan of $1000", width / 4 + 20, 700);
    text("by clicking the loan button.", width / 4 + 20, 722);
  } else if (tutorialScreen == true && dialogue == 7) {
    image(crazyDave, 300, 200, 330, 800);
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 638, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("Careful, if you ask for a loan more than 3 times, I'm", width / 4 + 20, 678);
    text("going to find another business partner to work with", width / 4 + 20, 700);
    text("and you'll be stuck with no money!", width / 4 + 20, 722);
    textSize(10);
    text("Press spacebar to continue.", width / 4 + 20, 734);
  } else if (tutorialScreen == true && dialogue == 8) {
    image(crazyDave, 300, 200, 330, 800);
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 638, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("As you can see, there are multiple seeds you cannot", width / 4 + 20, 678);
    text("plant yet. That's because it hasn't been researched", width / 4 + 20, 700);
    text("yet.", width / 4 + 20, 722);
    textSize(10);
    text("Press spacebar to continue.", width / 4 + 20, 734);
  } else if (tutorialScreen == true && dialogue == 9) {
    image(crazyDave, 300, 200, 330, 800);
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 638, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("Once you have enough money, you can buy a research", width / 4 + 20, 678);
    text("division and research new plants or upgrade your", width / 4 + 20, 700);
    text("current ones.", width / 4 + 20, 722);
    textSize(10);
    text("Press spacebar to continue.", width / 4 + 20, 734);
  } else if (tutorialScreen == true && dialogue == 10) {
    image(crazyDave, 300, 200, 330, 800);
    fill(255);
    stroke(0, 15000);
    rect(width / 4, 638, width / 2, 125, 7);
    fill(0);
    textSize(20);
    text("Anyway, that's everything I have! Welcome to town", width / 4 + 20, 678);
    text("and good luck on your business!", width / 4 + 20, 700);
    textSize(10);
    text("Press spacebar to end conversation.", width / 4 + 20, 712);
  }
  if (tutorialScreen == true && dialogue == 2) {
    image(arrowLeft, 280, 220, 70, 50);
  }
  
  if (tutorialScreen == true && dialogue == 3 && floorFull[0] == true || floorFull[1] == true) {
    dialogue = dialogue + 1;
  }
  
  if (tutorialScreen == true && dialogue == 4 && money == 200) {
    dialogue = dialogue + 1;
  }  
  if (tutorialScreen == true && dialogue == 5 && floorBought[0] == false) {
    money = 1000;
  }
  if (floorBought[0] == true && tutorialScreen == true) {
    dialogue = dialogue + 1;
  }
  if (tutorialScreen == true && dialogue == 6 && money == 1000) {
    dialogue = dialogue + 1;
  }
  if (tutorialScreen == true && dialogue == 11) {
    tutorialScreen = false;
    dialogue = dialogue - 11;
  }

}


//Click response.
void mousePressed() {
  if(mouseX > sunX && mouseX < sunX + sunW && mouseY > sunY && mouseY < sunY + sunH && researchScreen == false) {
    sunX = sunX - 5;
    sunY = sunY - 5;
    sunH = sunH + 10;
    sunW = sunW + 10;
    
    //Floor 1
    if (floorFull[0] == true && sunflowerPlanted[0] == true && sunflowerClicks[0] <= sunflowerGrowth) {
      sunflowerClicks[0] += 1;
    } else if (floorFull[0] == true && peashooterPlanted[0] == true && peashooterClicks[0] <= peashooterGrowth) {
      peashooterClicks[0] += 1;
    } else if (floorFull[0] == true && wallnutPlanted[0] == true && wallnutClicks[0] <= wallnutGrowth) {
      wallnutClicks[0] += 1;
    } else if (floorFull[0] == true && chomperPlanted[0] == true && chomperClicks[0] <= chomperGrowth) {
      chomperClicks[0] += 1;
    } else if (floorFull[0] == true && repeaterPlanted[0] == true && repeaterClicks[0] <= repeaterGrowth) {
      repeaterClicks[0] += 1;
    } else if (floorFull[0] == true && icepeaPlanted[0] == true && icepeaClicks[0] <= icepeaGrowth) {
      icepeaClicks[0] += 1;
    }
    
    //Floor 2
    if (floorFull[1] == true && sunflowerPlanted[1] == true && sunflowerClicks[1] <= sunflowerGrowth) {
      sunflowerClicks[1] += 1;
    } else if (floorFull[1] == true && peashooterPlanted[1] == true && peashooterClicks[1] <= peashooterGrowth) {
      peashooterClicks[1] += 1;
    } else if (floorFull[1] == true && wallnutPlanted[1] == true && wallnutClicks[1] <= wallnutGrowth) {
      wallnutClicks[1] += 1;
    } else if (floorFull[0] == true && chomperPlanted[1] == true && chomperClicks[1] <= chomperGrowth) {
      chomperClicks[1] += 1;
    } else if (floorFull[1] == true && repeaterPlanted[1] == true && repeaterClicks[1] <= repeaterGrowth) {
      repeaterClicks[1] += 1;
    } else if (floorFull[1] == true && icepeaPlanted[1] == true && icepeaClicks[1] <= icepeaGrowth) {
      icepeaClicks[1] += 1;
    }

    //Floor 3
    if (floorFull[2] == true && sunflowerPlanted[2] == true && sunflowerClicks[2] <= sunflowerGrowth) {
      sunflowerClicks[2] += 1;
    } else if (floorFull[2] == true && peashooterPlanted[2] == true && peashooterClicks[2] <= peashooterGrowth) {
      peashooterClicks[2] += 1;
    } else if (floorFull[2] == true && wallnutPlanted[2] == true && wallnutClicks[2] <= wallnutGrowth) {
      wallnutClicks[2] += 1;
    } else if (floorFull[2] == true && chomperPlanted[2] == true && chomperClicks[2] <= chomperGrowth) {
      chomperClicks[2] += 1;
    } else if (floorFull[2] == true && repeaterPlanted[2] == true && repeaterClicks[2] <= repeaterGrowth) {
      repeaterClicks[2] += 1;
    } else if (floorFull[2] == true && icepeaPlanted[2] == true && icepeaClicks[2] <= icepeaGrowth) {
      icepeaClicks[2] += 1;
    }
    //Floor 4
    if (floorFull[3] == true && sunflowerPlanted[3] == true && sunflowerClicks[3] <= sunflowerGrowth) {
      sunflowerClicks[3] += 1;
    } else if (floorFull[3] == true && peashooterPlanted[3] == true && peashooterClicks[3] <= peashooterGrowth) {
      peashooterClicks[3] += 1;
    } else if (floorFull[3] == true && wallnutPlanted[3] == true && wallnutClicks[3] <= wallnutGrowth) {
      wallnutClicks[3] += 1;
    } else if (floorFull[3] == true && chomperPlanted[3] == true && chomperClicks[3] <= chomperGrowth) {
      chomperClicks[3] += 1;
    } else if (floorFull[3] == true && repeaterPlanted[3] == true && repeaterClicks[3] <= repeaterGrowth) {
      repeaterClicks[3] += 1;
    } else if (floorFull[3] == true && icepeaPlanted[3] == true && icepeaClicks[3] <= icepeaGrowth) {
      icepeaClicks[3] += 1;
    }
    //Floor 5
    if (floorFull[4] == true && sunflowerPlanted[4] == true && sunflowerClicks[4] <= sunflowerGrowth) {
      sunflowerClicks[4] += 1;
    } else if (floorFull[4] == true && peashooterPlanted[4] == true && peashooterClicks[4] <= peashooterGrowth) {
      peashooterClicks[4] += 1;
    } else if (floorFull[4] == true && wallnutPlanted[4] == true && wallnutClicks[4] <= wallnutGrowth) {
      wallnutClicks[4] += 1;
    } else if (floorFull[4] == true && chomperPlanted[4] == true && chomperClicks[4] <= chomperGrowth) {
      chomperClicks[4] += 1;
    } else if (floorFull[4] == true && repeaterPlanted[4] == true && repeaterClicks[4] <= repeaterGrowth) {
      repeaterClicks[4] += 1;
    } else if (floorFull[4] == true && icepeaPlanted[4] == true && icepeaClicks[4] <= icepeaGrowth) {
      icepeaClicks[4] += 1;
    }
    //Floor 6
    if (floorFull[5] == true && sunflowerPlanted[5] == true && sunflowerClicks[5] <= sunflowerGrowth) {
      sunflowerClicks[5] += 1;
    } else if (floorFull[5] == true && peashooterPlanted[5] == true && peashooterClicks[5] <= peashooterGrowth) {
      peashooterClicks[5] += 1;
    } else if (floorFull[5] == true && wallnutPlanted[5] == true && wallnutClicks[5] <= wallnutGrowth) {
      wallnutClicks[5] += 1;
    } else if (floorFull[5] == true && chomperPlanted[5] == true && chomperClicks[5] <= chomperGrowth) {
      chomperClicks[5] += 1;
    } else if (floorFull[5] == true && repeaterPlanted[5] == true && repeaterClicks[5] <= repeaterGrowth) {
      repeaterClicks[5] += 1;
    } else if (floorFull[5] == true && icepeaPlanted[5] == true && icepeaClicks[5] <= icepeaGrowth) {
      icepeaClicks[5] += 1;
    }
  }
}

//Cookie gets larger when you click it.
void mouseReleased() {
  if(mouseX > sunX && mouseX < sunX + sunW && mouseY > sunY && mouseY < sunY + sunH && researchScreen == false) {
    sunX = sunX + 5;
    sunY = sunY + 5; 
    sunH = sunH - 10; 
    sunW = sunW - 10; 
  }
}



//Mouse Clicked.
void mouseClicked() {  
  if(mouseX > 160 && mouseX < 160 + 40 && mouseY > 5 && mouseY < 5 + 40 && researchDivisionOwned == true && researchScreen == false) {
    researchScreen = true;
  }
  
  if (mouseX > exit2X && mouseX < exit2X + exit2W && mouseY > exit2Y && mouseY < exit2Y + exit2H && seedClicked == true) {
    seedClicked = false;
  }
  
  if (mouseX > exit1X && mouseX < exit1X + exit1W && mouseY > exit1Y && mouseY < exit1Y + exit1H && researchScreen == true) {
    researchScreen = false;
  }
    // Buy building expansion
  if(mouseX > 20 && mouseX < 20 + 250 && mouseY > 50 && mouseY < 50 + 75 && money >= buildingExpansionCost && buildingFloorsBought != 4 && researchScreen == false) {
    money = money - buildingExpansionCost;
    buildingFloorsBought++;
    buildingFloors++;
    buildingY -= 110;
    buildingH += 110;
  }
    //Buy research centre
  if(mouseX > 20 && mouseX < 20 + 250 && mouseY > 130 && mouseY < 130 + 75 && money >= researchDivisionCost && researchDivisionOwned == false && researchScreen == false) {
    money = money - researchDivisionCost;
    researchDivisionOwned = true;
  }
    //Buy sunflower
  if(mouseX > 20 && mouseX < 20 + 250 && mouseY > 210 && mouseY < 210 + 75 && money >= sunflowerCost && sunflower == false && researchScreen == false && dialogue != 1 && dialogue != 5) {
    seedClicked = true;
    sunflower = true;
  } else if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 210 && mouseY < 210 + 75 && money >= sunflowerCost && sunflower == false && dialogue == 2) {
    seedClicked = true;
    sunflower = true;
    dialogue += 1;
  }
    //Buy peashooter
  if(mouseX > 20 && mouseX < 20 + 250 && mouseY > 290 && mouseY < 290 + 75 && money >= peashooterCost && peashooter == false && researchScreen == false && dialogue != 5) {
    seedClicked = true;
    peashooter = true;
  }
    //Buy wallnut
  if(mouseX > 20 && mouseX < 20 + 250 && mouseY > 370 && mouseY < 370 + 75 && money >= wallnutCost && wallnut == false && researchScreen == false && wallnutResearch == true) {
    seedClicked = true;
    wallnut = true;
  }
    //Buy chomper
  if(mouseX > 20 && mouseX < 20 + 250 && mouseY > 450 && mouseY < 450 + 75 && money >= chomperCost && chomper == false && researchScreen == false && chomperResearch == true) {
    seedClicked = true;
    chomper = true;
  }
    //Buy repeater
  if(mouseX > 20 && mouseX < 20 + 250 && mouseY > 530 && mouseY < 530 + 75 && money >= repeaterCost && repeater == false && researchScreen == false && chomperResearch == true) {
    seedClicked = true;
    repeater = true;
  }
  if(mouseX > 20 && mouseX < 20 + 250 && mouseY > 610 && mouseY < 610 + 75 && money >= icepeaCost && icepea == false && researchScreen == false && icepeaResearch == true) {
    seedClicked = true;
    icepea = true;
  }
  
  //Checking the if the floor is full
  //Floor 1
  if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 658 && mouseY < 658 + 100 && seedClicked == true && sunflower == true && floorFull[0] == false) {
    floorFull[0] = true;
    sunflowerPlanted[0] = true;
    seedClicked = false;
    money = money - sunflowerCost;
    sunflower = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 658 && mouseY < 658 + 100 && seedClicked == true && peashooter == true && floorFull[0] == false) {
    floorFull[0] = true;
    peashooterPlanted[0] = true;
    seedClicked = false;
    money = money - peashooterCost;
    peashooter = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 658 && mouseY < 658 + 100 && seedClicked == true && wallnut == true && floorFull[0] == false) {
    floorFull[0] = true;
    wallnutPlanted[0] = true;
    seedClicked = false;
    money = money - wallnutCost;
    wallnut = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 658 && mouseY < 658 + 100 && seedClicked == true && chomper == true && floorFull[0] == false) {
    floorFull[0] = true;
    chomperPlanted[0] = true;
    seedClicked = false;
    money = money - chomperCost;
    chomper = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 658 && mouseY < 658 + 100 && seedClicked == true && repeater == true && floorFull[0] == false) {
    floorFull[0] = true;
    repeaterPlanted[0] = true;
    seedClicked = false;
    money = money - repeaterCost;
    repeater = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 658 && mouseY < 658 + 100 && seedClicked == true && icepea == true && floorFull[0] == false) {
    floorFull[0] = true;
    icepeaPlanted[0] = true;
    seedClicked = false;
    money = money - icepeaCost;
    icepea = false;
  }
  //Floor 2
  if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 548 && mouseY < 548 + 100 && seedClicked == true && sunflower == true && floorFull[1] == false) {
    floorFull[1] = true;
    sunflowerPlanted[1] = true;
    seedClicked = false;
    money = money - sunflowerCost;
    sunflower = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 548 && mouseY < 548 + 100 && seedClicked == true && peashooter == true && floorFull[1] == false) {
    floorFull[1] = true;
    peashooterPlanted[1] = true;
    seedClicked = false;
    money = money - peashooterCost;
    peashooter = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 548 && mouseY < 548 + 100 && seedClicked == true && wallnut == true && floorFull[1] == false) {
    floorFull[1] = true;
    wallnutPlanted[1] = true;
    seedClicked = false;
    money = money - wallnutCost;
    wallnut = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 548 && mouseY < 548 + 100 && seedClicked == true && chomper == true && floorFull[1] == false) {
    floorFull[1] = true;
    chomperPlanted[1] = true;
    seedClicked = false;
    money = money - chomperCost;
    chomper = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 548 && mouseY < 548 + 100 && seedClicked == true && repeater == true && floorFull[1] == false) {
    floorFull[1] = true;
    repeaterPlanted[1] = true;
    seedClicked = false;
    money = money - repeaterCost;
    repeater = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 548 && mouseY < 548 + 100 && seedClicked == true && icepea == true && floorFull[1] == false) {
    floorFull[1] = true;
    icepeaPlanted[1] = true;
    seedClicked = false;
    money = money - icepeaCost;
    icepea = false;
  }
  //Floor 3
  if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 438 && mouseY < 438 + 100 && seedClicked == true && sunflower == true && floorFull[2] == false && floorBought[0] == true) {
    floorFull[2] = true;
    sunflowerPlanted[2] = true;
    seedClicked = false;
    money = money - sunflowerCost;
    sunflower = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 438 && mouseY < 438 + 100 && seedClicked == true && peashooter == true && floorFull[2] == false && floorBought[0] == true) {
    floorFull[2] = true;
    peashooterPlanted[2] = true;
    seedClicked = false;
    money = money - peashooterCost;
    peashooter = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 438 && mouseY < 438 + 100 && seedClicked == true && wallnut == true && floorFull[2] == false && floorBought[0] == true) {
    floorFull[2] = true;
    wallnutPlanted[2] = true;
    seedClicked = false;
    money = money - wallnutCost;
    wallnut = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 438 && mouseY < 438 + 100 && seedClicked == true && chomper == true && floorFull[2] == false && floorBought[0] == true) {
    floorFull[2] = true;
    chomperPlanted[2] = true;
    seedClicked = false;
    money = money - chomperCost;
    chomper = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 438 && mouseY < 438 + 100 && seedClicked == true && repeater == true && floorFull[2] == false && floorBought[0] == true) {
    floorFull[2] = true;
    repeaterPlanted[2] = true;
    seedClicked = false;
    money = money - repeaterCost;
    repeater = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 438 && mouseY < 438 + 100 && seedClicked == true && icepea == true && floorFull[2] == false && floorBought[0] == true) {
    floorFull[2] = true;
    icepeaPlanted[2] = true;
    seedClicked = false;
    money = money - icepeaCost;
    icepea = false;
  }
  //Floor 4
  if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 328 && mouseY < 328 + 100 && seedClicked == true && sunflower == true && floorFull[3] == false && floorBought[1] == true) {
    floorFull[3] = true;
    sunflowerPlanted[3] = true;
    seedClicked = false;
    money = money - sunflowerCost;
    sunflower = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 328 && mouseY < 328 + 100 && seedClicked == true && peashooter == true && floorFull[3] == false && floorBought[1] == true) {
    floorFull[3] = true;
    peashooterPlanted[3] = true;
    seedClicked = false;
    money = money - peashooterCost;
    peashooter = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 328 && mouseY < 328 + 100 && seedClicked == true && wallnut == true && floorFull[3] == false && floorBought[1] == true) {
    floorFull[3] = true;
    wallnutPlanted[3] = true;
    seedClicked = false;
    money = money - wallnutCost;
    wallnut = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 328 && mouseY < 328 + 100 && seedClicked == true && chomper == true && floorFull[3] == false && floorBought[1] == true) {
    floorFull[3] = true;
    chomperPlanted[3] = true;
    seedClicked = false;
    money = money - chomperCost;
    chomper = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 328 && mouseY < 328 + 100 && seedClicked == true && repeater == true && floorFull[3] == false && floorBought[1] == true) {
    floorFull[3] = true;
    repeaterPlanted[3] = true;
    seedClicked = false;
    money = money - repeaterCost;
    repeater = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 328 && mouseY < 328 + 100 && seedClicked == true && icepea == true && floorFull[3] == false && floorBought[1] == true) {
    floorFull[3] = true;
    icepeaPlanted[3] = true;
    seedClicked = false;
    money = money - icepeaCost;
    icepea = false;
  }
  //Floor 5
  if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 218 && mouseY < 218 + 100 && seedClicked == true && sunflower == true && floorFull[4] == false && floorBought[2] == true) {
    floorFull[4] = true;
    sunflowerPlanted[4] = true;
    seedClicked = false;
    money = money - sunflowerCost;
    sunflower = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 218 && mouseY < 218 + 100 && seedClicked == true && peashooter == true && floorFull[4] == false && floorBought[2] == true) {
    floorFull[4] = true;
    peashooterPlanted[4] = true;
    seedClicked = false;
    money = money - peashooterCost;
    peashooter = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 218 && mouseY < 218 + 100 && seedClicked == true && wallnut == true && floorFull[4] == false && floorBought[2] == true) {
    floorFull[4] = true;
    wallnutPlanted[4] = true;
    seedClicked = false;
    money = money - wallnutCost;
    wallnut = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 218 && mouseY < 218 + 100 && seedClicked == true && chomper == true && floorFull[4] == false && floorBought[2] == true) {
    floorFull[4] = true;
    chomperPlanted[4] = true;
    seedClicked = false;
    money = money - chomperCost;
    chomper = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 218 && mouseY < 218 + 100 && seedClicked == true && repeater == true && floorFull[4] == false && floorBought[2] == true) {
    floorFull[4] = true;
    repeaterPlanted[4] = true;
    seedClicked = false;
    money = money - repeaterCost;
    repeater = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 218 && mouseY < 218 + 100 && seedClicked == true && icepea == true && floorFull[4] == false && floorBought[2] == true) {
    floorFull[4] = true;
    icepeaPlanted[4] = true;
    seedClicked = false;
    money = money - icepeaCost;
    icepea = false;
  }
  //Floor 6
  if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 108 && mouseY < 108 + 100 && seedClicked == true && sunflower == true && floorFull[5] == false && floorBought[3] == true) {
    floorFull[5] = true;
    sunflowerPlanted[5] = true;
    seedClicked = false;
    money = money - sunflowerCost;
    sunflower = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 108 && mouseY < 108 + 100 && seedClicked == true && peashooter == true && floorFull[5] == false && floorBought[3] == true) {
    floorFull[5] = true;
    peashooterPlanted[5] = true;
    seedClicked = false;
    money = money - peashooterCost;
    peashooter = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 108 && mouseY < 108 + 100 && seedClicked == true && wallnut == true && floorFull[5] == false && floorBought[3] == true) {
    floorFull[5] = true;
    wallnutPlanted[5] = true;
    seedClicked = false;
    money = money - wallnutCost;
    wallnut = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 108 && mouseY < 108 + 100 && seedClicked == true && chomper == true && floorFull[5] == false && floorBought[3] == true) {
    floorFull[5] = true;
    chomperPlanted[5] = true;
    seedClicked = false;
    money = money - chomperCost;
    chomper = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 108 && mouseY < 108 + 100 && seedClicked == true && repeater == true && floorFull[5] == false && floorBought[3] == true) {
    floorFull[5] = true;
    repeaterPlanted[5] = true;
    seedClicked = false;
    money = money - repeaterCost;
    repeater = false;
  } else if (mouseX > 880 && mouseX < 880 + 475 && mouseY > 108 && mouseY < 108 + 100 && seedClicked == true && icepea == true && floorFull[5] == false && floorBought[3] == true) {
    floorFull[5] = true;
    icepeaPlanted[5] = true;
    seedClicked = false;
    money = money - icepeaCost;
    icepea = false;
  }
  if (mouseX > exit1X && mouseX < exit1X + exit1W && mouseY > exit1Y && mouseY < exit1Y + exit1H && researchScreen == true) {
    researchScreen = false;
  }
  
  if (mouseX > 150 && mouseX < 150 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && sunflowerTier1 == false && researchScreen == true && money >= sunflowerTier1Cost) {
    sunflowerTier1 = true;
    money = money - sunflowerTier1Cost;
  } else if (mouseX > 150 && mouseX < 150 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && sunflowerTier2 == false && researchScreen == true && money >= sunflowerTier2Cost) {
    sunflowerTier2 = true;
    money = money - sunflowerTier2Cost;
  } else if (mouseX > 150 && mouseX < 150 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && sunflowerTier3 == false && researchScreen == true && money >= sunflowerTier3Cost) {
    sunflowerTier3 = true;
    money = money - sunflowerTier3Cost;
  } else if (mouseX > 330.86 && mouseX < 330.86 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && peashooterTier1 == false &&researchScreen == true && money >= peashooterTier1Cost) {
    peashooterTier1 =  true;
    money = money - peashooterTier1Cost;
  } else if (mouseX > 330.86 && mouseX < 330.86 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && peashooterTier2 == false && researchScreen == true && money >= peashooterTier2Cost) {
    peashooterTier2 = true;
    money = money - peashooterTier2Cost;
  } else if (mouseX > 330.86 && mouseX < 330.86 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && peashooterTier3 == false && researchScreen == true && money >= peashooterTier3Cost) {
    peashooterTier3 = true;
    money = money - peashooterTier3Cost;
  } else if (mouseX > 511.72 && mouseX < 511.72 + 170.86 && mouseY > 150 && mouseY < 115 + 150 && wallnutResearch == false && researchScreen == true && money >= wallnutResearchCost) {
    wallnutResearch = true;
    money = money - wallnutResearchCost;
  } else if (mouseX > 511.72 && mouseX < 511.72 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && wallnutTier1 == false && researchScreen == true && money >= wallnutTier1Cost) {
    wallnutTier1 =  true;
    money = money - wallnutTier1Cost;
  } else if (mouseX > 511.72 && mouseX < 511.72 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && wallnutTier2 == false && researchScreen == true && money >= wallnutTier2Cost) {
    wallnutTier2 = true;
    money = money - wallnutTier2Cost;
  } else if (mouseX > 511.72 && mouseX < 511.72 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && wallnutTier3 == false && researchScreen == true && money >= wallnutTier3Cost) {
    wallnutTier3 = true;
    money = money - wallnutTier3Cost;
  } else if (mouseX > 692.58 && mouseX < 692.58 + 170.86 && mouseY > 150 && mouseY < 115 + 150 && chomperResearch == false && researchScreen == true && money >= chomperResearchCost) {
    chomperResearch = true;
    money = money - chomperResearchCost;
  } else if (mouseX > 692.58 && mouseX < 692.58 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && chomperTier1 == false && researchScreen == true && money >= chomperTier1Cost) {
    chomperTier1 = true;
    money = money - chomperTier1Cost;
  } else if (mouseX > 692.58 && mouseX < 692.58 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && chomperTier2 ==  false && researchScreen == true && money >= chomperTier2Cost) {
    chomperTier2 = true;
    money = money - chomperTier2Cost;
  } else if (mouseX > 692.58 && mouseX < 692.58 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && chomperTier3 == false && researchScreen == true && money >= chomperTier3Cost) {
    chomperTier3 = true;
    money = money - chomperTier3Cost;
  } else if (mouseX > 873.44 && mouseX < 873.44 + 170.86 && mouseY > 150 && mouseY < 115 + 150 && repeaterResearch == false && researchScreen == true && money >= repeaterResearchCost) {
    repeaterResearch = true;
    money = money - repeaterCost;
  } else if (mouseX > 873.44 && mouseX < 873.44 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && repeaterTier1 == false && researchScreen == true && money >= repeaterTier1Cost) {
    repeaterTier1 =  true;
    money = money - repeaterTier1Cost;
  } else if (mouseX > 873.44 && mouseX < 873.44 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && repeaterTier2 == false && researchScreen == true && money >= repeaterTier2Cost) {
    repeaterTier2 = true;
    money = money - repeaterTier2Cost;
  } else if (mouseX > 873.44 && mouseX < 873.44 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && repeaterTier3 == false && researchScreen == true && money >= repeaterTier3Cost) {
    repeaterTier3 = true;
    money = money - repeaterTier3Cost;
  } else if (mouseX > 1054.3 && mouseX < 1054.3 + 170.86 && mouseY > 150 && mouseY < 115 + 150 && icepeaResearch == false && researchScreen == true && money >= icepeaResearchCost) {
    icepeaResearch = true;
    money = money - icepeaResearchCost;
  } else if (mouseX > 1054.3 && mouseX < 1054.3 + 170.86 && mouseY > 270 && mouseY < 270 + 150 && icepeaTier1 == false && researchScreen == true && money >= icepeaTier1Cost) {
    icepeaTier1 =  true;
    money = money - icepeaTier1Cost;
  } else if (mouseX > 1054.3 && mouseX < 1054.3 + 170.86 && mouseY > 425 && mouseY < 425 + 150 && icepeaTier2 == false && researchScreen == true && money >= icepeaTier2Cost) {
    icepeaTier2 = true;
    money = money - icepeaTier2Cost;
  } else if (mouseX > 1054.3 && mouseX < 1054.3 + 170.86 && mouseY > 580 && mouseY < 580 + 150 && icepeaTier3 == false && researchScreen == true && money >= icepeaTier3Cost) {
    icepeaTier3 = true;
    money = money - icepeaTier3Cost;
  }
  //loan button
  if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 690 && mouseY < 690 + 75 && tutorialScreen == true && money < 100 && dialogue == 6) {
    money = 1000;
  } else if (mouseX > 20 && mouseX < 20 + 250 && mouseY > 690 && mouseY < 690 + 75 && tutorialScreen == false && money < 100 && lives != 0) {
    money = 1000;
    lives = lives - 1;
  }
}

void keyReleased() {
  if (key == 32 && dialogue != 2 && dialogue !=3 && dialogue != 4 && dialogue != 5 && dialogue != 6) {
    dialogue = dialogue + 1;
  }
}
void drawSun() {
  noStroke();
    image(sun, sunX, sunY, sunW, sunH);
}
