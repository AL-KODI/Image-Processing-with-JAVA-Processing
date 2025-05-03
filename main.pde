int x1=138;
int mouse_previous_x=-1000;
boolean save=true;
boolean auto_contrast=false,box=false,gaussian=false,laplace=false;
float x2=138;
int x3=20;
draw_main d1 = new draw_main();
Base b1;
void setup(){
  size(400,800);
  b1 = new Base("chess.jpg");
  b1.calculation(0,1,false,false,false,false,false,false);
  b1.imageShow();
}

void draw(){
 
  background(0);
 
  if(mousePressed){
    //brightness bar
  if(mouseY<=70 && mouseY>=30 && mouseX<=275 && mouseX>=20){
        x1=mouseX;
        if(x1!=mouse_previous_x){
          mouse_previous_x = x1;
          b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,false,false,false);
        }
       save=true;
       auto_contrast=false;
  }
  //contrast bar
   if(mouseY<=120 && mouseY>=80 && mouseX<=275 && mouseX>=20){
      x2=mouseX;
      if(x2!=mouse_previous_x){
          mouse_previous_x = int(x2);
          b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,false,false,false);
        }
      save=true;
      auto_contrast=false;
    }
    
  }
  
  
  d1.draw_main_draw(x1,int(x2));
  b1.imageShow();
}

void mouseReleased(){
  //save to buffer button
  if(mouseY<=380 && mouseY>=330 && mouseX>=15 && mouseX<=175 && save==true){
      b1.calculation(2*(x1-138),(x2-106)/32,auto_contrast,false,true,box,gaussian,laplace);
      x1=138;
      x2=138;
      save=false;
      auto_contrast=false;
      box=false;
      gaussian=false;
      laplace=false;
    }
}

void mousePressed(){
 
//auto_contrast
   if(mouseY<=220 && mouseY>=170 && mouseX>=15 && mouseX<=175){
        auto_contrast=true;
        b1.calculation(2*(x1-138),(x2-106)/32,auto_contrast,false,false,false,false,false);
        save=true;
      }
  //original
  if(mouseY<=300 && mouseY>=250 && mouseX>=15 && mouseX<=175){
      b1.calculation(0,1,false,true,false,false,false,false);
      x1=138;
      x2=138;
      save=true;
      auto_contrast=false;
      box=false;
      gaussian=false;
      laplace=false;
    }
    
   //box filter
    
    if(mouseY<=460 && mouseY>=410 && mouseX>=15 && mouseX<=175){
      b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,true,false,false);
     save=true;
     box=true;
     gaussian=false;
     laplace=false;
    }
  
  //gaussian
    if(mouseY<=540 && mouseY>=490 && mouseX>=15 && mouseX<=175){
      b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,false,true,false);
     save=true;
     box=false;
     gaussian=true;
     laplace=false;
    }
    //laplace
    if(mouseY<=620 && mouseY>=570 && mouseX>=15 && mouseX<=175){
      b1.calculation(2*(x1-138),(x2-106)/32,false,false,false,false,false,true);
     save=true;
     box=false;
     gaussian=false;
     laplace=true;
    }
    
}
