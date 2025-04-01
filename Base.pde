class Base {
  PImage img;
  rgb2gray rgb2g;
  hist h1,h2;
  auto_contrast a_c;
  image_window im1;
  cumulative_hist ch1;
  box_filter bxf1;
  gaussian gf1;
  scale_down scd1;
  String img_name;
  
  int[] current;
  int[] buffer;
  float contrast=1;
  int bright=0;
  
  float buf;
  
  int x=0;
  
  
  
  public Base(String img_name){
    this.img_name=img_name;
    img = loadImage(img_name);
    rgb2g = new rgb2gray();
    current = new int[img.pixels.length];
    buffer = new int[img.pixels.length];
    
    h1 = new hist();
    ch1 = new cumulative_hist();
    a_c = new auto_contrast();
    im1 = new image_window(img.width,img.height);
    bxf1 = new box_filter(img.width,img.height);
    gf1 = new gaussian(img.width,img.height);
    scd1 = new scale_down();
    //===============================================================================================================
    img.loadPixels();
    for(int i=0;i<img.height;i++){
       for(int j=0;j<img.width;j++){
           buffer[j+(i*(img.width))] = img.pixels[j+(i*(img.width))];
       }
    }
    rgb2g.rgb2gray_calculate(buffer);
    img.updatePixels();  
    //===============================================================================================================
    }
  
  public void calculation(int bright,float contrast,boolean auto,boolean original,boolean save_to_buffer,boolean box,boolean gaussian){
      img = loadImage(img_name);
      this.bright=bright;
      this.contrast=contrast;
  //===============================================================================================================  
      for(int i=0;i<current.length;i++){
        current[i]=buffer[i];
      }
  //===============================================================================================================    
     if(original){
        img.loadPixels();
        for(int i=0;i<img.height;i++){
          for(int j=0;j<img.width;j++){
            buffer[j+(i*(img.width))] = img.pixels[j+(i*(img.width))];
          }
        }
        rgb2g.rgb2gray_calculate(buffer);
        img.updatePixels();
      }
  //===============================================================================================================

      
      for(int i=0;i<current.length;i++){
        buf = (current[i]*contrast)+bright;
        if(buf>255){
          buf=255;
        }else if(buf<0){
          buf=0;
        }
        current[i]=int(buf);
      }
  //===============================================================================================================  
        if(box){
         bxf1.calculation(current);
        }
  //===============================================================================================================
        if(auto){
         a_c.auto_contrast_calculate(current);
         //scd1.calculation(img.width,img.height,current);
        } 
  //===============================================================================================================
        if(gaussian){
           gf1.calculation(current);
        }
  //===============================================================================================================
        if(save_to_buffer){
          for(int i=0;i<current.length;i++){
            buffer[i]=current[i];
          }
        }
  //===============================================================================================================
      
      h1.calculation(current);
      ch1.calculation(current);
   //===============================================================================================================  
      
    //===============================================================================================================  
  }
  public void imageShow(){
    im1.show(current);
  }
  
  
}
