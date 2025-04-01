class box_filter{
  int img_width=0;
  int img_height=0;
  int buffer[];
  //int[] H = {0,0,0,0,0,0,1,1,1,0,0,1,1,1,0,0,1,1,1,0,0,0,0,0,0};
//int[] H = {0,0,0,0,0,0,0,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0};
  //int[] H = {0,1,2,1,0,1,3,5,3,1,2,5,9,5,2,1,3,5,3,1,0,1,2,1,0};
  int[] H = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
//int[] H = {2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2};
  float I=0;
  public box_filter(int img_width,int img_height){
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
        I=I/25;
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
