int x1=138;
int mouse_previous_x=-1000;
boolean save=true;
boolean auto_contrast=false,box=false,gaussian=false;
float x2=138;
int x3=20;

Base b1;
void setup(){
  size(400,800);
  b1 = new Base("hat.png");
  b1.calculation(0,1,false,false,false,false,false);
  b1.imageShow();
}

void draw(){
 
  background(0);
  
  //Brightness Bar
  strokeWeight(10);
  stroke(#3a7cd6);
  line(20,50,275,50);
  if(mousePressed ){
    if(mouseY<=70 && mouseY>=30 && mouseX<=275 && mouseX>=20){
        x1=mouseX;
        if(x1!=mouse_previous_x){
          mouse_previous_x = x1;
          b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,false,false);
        }
       save=true;
       auto_contrast=false;
  }
  }
  
  stroke(#de8d37);
  rect(x1,30,10,40);
  fill(#3a7cd6);
  textSize(20);
  text("Brightness", 295, 55);
  
  //Contrast Bar
  stroke(#3a7cd6);
  line(20,100,275,100);
  if(mousePressed){
    if(mouseY<=120 && mouseY>=80 && mouseX<=275 && mouseX>=20){
      x2=mouseX;
      if(x2!=mouse_previous_x){
          mouse_previous_x = int(x2);
          b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,false,false);
        }
      save=true;
      auto_contrast=false;
    }
    
  }
  stroke(#de8d37);
  rect(x2,80,10,40);
  fill(#3a7cd6);
  textSize(20);
  text("Contrast", 295, 105);
  
  
  //Auto Contrast Button
  if(mousePressed){
    if(mouseY<=220 && mouseY>=170 && mouseX>=15 && mouseX<=175){
      auto_contrast=true;
      b1.calculation(2*(x1-138),(x2-106)/32,auto_contrast,false,false,false,false);
      save=true;
    }
    
  }
  
  
  //Original Button
   if(mousePressed){
    if(mouseY<=300 && mouseY>=250 && mouseX>=15 && mouseX<=175){
      b1.calculation(0,1,false,true,false,false,false);
      x1=138;
      x2=138;
      save=true;
      auto_contrast=false;
      box=false;
      gaussian=false;
    }
    
  }
  //box filter button
   if(mousePressed){
    if(mouseY<=460 && mouseY>=410 && mouseX>=15 && mouseX<=175){
      b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,true,false);
     save=true;
     box=true;
     gaussian=false;
    }
  }
  //gaussian button
   
   if(mousePressed){
    if(mouseY<=540 && mouseY>=490 && mouseX>=15 && mouseX<=175){
      b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,false,true);
     save=true;
     box=false;
     gaussian=true;
    }
  }
  strokeWeight(2);
  stroke(255);
  fill(#4287f5);
  rect(15,170,160,50);
  fill(255);
  textSize(24);
  text("Auto Contrast", 20, 200);
  fill(0);
  
  fill(#4287f5);
  rect(15,250,160,50);
  fill(255);
  textSize(24);
  text("Revert Settings", 20, 280);
  fill(0);
  
  fill(#4287f5);
  rect(15,330,160,50);
  fill(255);
  textSize(24);
  text("Save to Buffer", 20, 360);
  fill(0);
  
  fill(#4287f5);
  rect(15,410,160,50);
  fill(255);
  textSize(24);
  text("Box Filter", 20, 440);
  fill(0);
  
  fill(#4287f5);
  rect(15,490,160,50);
  fill(255);
  textSize(24);
  text("Gaussian Filter", 20, 520);
  fill(0);
  
  b1.imageShow();
}

void mouseReleased(){
  //save to buffer button
  if(mouseY<=380 && mouseY>=330 && mouseX>=15 && mouseX<=175 && save==true){
      b1.calculation(2*(x1-138),(x2-106)/32,auto_contrast,false,true,box,gaussian);
      x1=138;
      x2=138;
      save=false;
      auto_contrast=false;
      box=false;
      gaussian=false;
    }
}
