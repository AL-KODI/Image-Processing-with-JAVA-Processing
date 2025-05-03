class draw_main{
  public draw_main(){
    
  }
  
  public void draw_main_draw(int x1,int x2){
     //Brightness Bar
  strokeWeight(10);
  stroke(#3a7cd6);
  line(20,50,275,50);
  
  
  stroke(#de8d37);
  rect(x1,30,10,40);
  fill(#3a7cd6);
  textSize(20);
  text("Brightness", 295, 55);
  //Contrast Bar
  stroke(#3a7cd6);
  line(20,100,275,100);
  stroke(#de8d37);
  rect(x2,80,10,40);
  fill(#3a7cd6);
  textSize(20);
  text("Contrast", 295, 105);
  
    
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
    
    fill(#4287f5);
    rect(15,570,160,50);
    fill(255);
    textSize(24);
    text("Laplace Filter", 20, 600);
    fill(0); 
  }
}
