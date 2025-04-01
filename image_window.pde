class image_window extends PApplet{
  PImage img;
  int window_height,window_width = 0;

  public image_window(int window_width,int window_height){
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
    this.window_height=window_height;
    this.window_width=window_width;
    img=createImage(window_width,window_height,RGB);
  }
  
 
  public void setup(){
      windowResize(window_width,window_height); 
  }
  
   
  public void show(int[] arry){
      img.loadPixels();
        for(int i=0;i<window_height;i++){
          for(int j=0;j<window_width;j++){
            img.pixels[j+(i*(window_width))] =color(arry[j+(i*(window_width))]);
            
          }
        }
   img.updatePixels();
  
  }
  
    
  public void exit(){
    //dispose();
  }
  public void draw(){
     image(img,0,0);
  }
}
