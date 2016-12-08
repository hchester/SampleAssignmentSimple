Table table;
int male;
int female;
int total;

void setup(){
  size(1920, 1080);
  background(255);
   loadInts();
}
void loadInts(){
  
  //table= loadTable("Traffic_Violations.csv", "header, csv");
  table= loadTable("https://raw.githubusercontent.com/ACS-2016-2017/CHESTER.H/master/Traffic/Traffic_Violations.csv?token=ANk2acFkhEac5JLmGPU4UH4AHL2kpyV2ks5YUuC0wA%3D%3D", "header, csv");
  
  for (int i=0; i<table.getRowCount(); i++){
   if (table.getString(i, 0).equals("No")){
     if (table.getString(i, 1).equals("M")){
       male++;
       total++;
     }
     if (table.getString(i, 1).equals("F")){
       female++;
       total++;
     }
   }
  }
  //System.out.println(male + " " + female);
}

float calculateDiameter(String gender){
  float diameter=0;
  if (gender.equals("M")){
  diameter= male;
  diameter/= (PI/4);
  diameter=sqrt(diameter);
  }
  else {
    diameter= female;
  diameter/= (PI/4);
  diameter=sqrt(diameter);
  }
 return diameter; 
}

void draw(){
 noLoop();
fill(0, 0, 255);
 ellipse(480, 540, calculateDiameter("M")*3, calculateDiameter("M")*3);
 fill(255,192,203);
 ellipse(1440, 540, calculateDiameter("F")*3, calculateDiameter("F")*3);
 fill(255);
 textSize(25);
 text("Male Traffic Violations: " + male, 295, 540);
 text("Female Traffic Violations: " + female, 1240, 540);
 fill(0);
 text("Traffic Violations In Montgomery County, Maryland by Gender(To Scale)", 40, 40);
 
}
