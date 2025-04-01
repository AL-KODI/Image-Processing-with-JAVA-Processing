class gaussian{
  int img_width=0;
  int img_height=0;
  int buffer[];
  
  int[] H = {1,4,7,4,1,4,16,26,16,4,7,26,41,26,7,4,16,26,16,4,1,4,7,4,1};
//int[] H = {0,0,1,0,0,0,1,2,1,0,1,2,-16,2,1,0,1,2,1,0,0,0,1,0,0};
  float I=0;
  public gaussian(int img_width,int img_height){
    this.img_width = img_width;
    this.img_height = img_height;
    buffer = new int[img_width*img_height];
  }
  
  public void calculation(int arry[]){
    for(int i=0;i<arry.length;i++){
      buffer[i]=arry[i];
    }
    
    for(int u=2;u<img_height-2;u++){
      for(int v=2;v<img_width-2;v++){
        for(int i=-2;i<3;i++){
          for(int j=-2;j<3;j++){
            I=I+(H[((i+2)*3)+(j+2)]*buffer[((u+i)*img_width)+(v+j)]);
            
          }
        }
        I=I/273;
        if(I>255){
          I=255;
        }else if(I<0){
          I=0;
        }
        arry[(u*img_width)+v]=(int(I));
        arry[((u*img_width)+v)+1]=(int(I));
        I=0; 
      }
    }
    
  }
}
