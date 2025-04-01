class scale_down{
  int arry_width = 0,arry_height = 0;
  int img_width =0,img_height = 0;
  int[] arry_Scaled;
  int index = 0;

  image_window img;
  
  public scale_down(){
  }
  
  public void calculation(int img_width,int img_height,int[] original_array){
    this.img_width = img_width;
    this.img_height = img_height;
    if((img_width % 2)==0){
      arry_width = img_width / 2;
    }else{
       arry_width = (img_width / 2)+1;
    }
    System.out.println("width = "+img_width);
    if((img_height % 2)==0){
      arry_height = img_height / 2;
    }else{
      arry_height = (img_height / 2) + 1;
    }
    System.out.println("height = "+img_height);
    arry_Scaled = new int[arry_height * arry_width];
    
    for(int i=0;i<img_height;i=i+2){
      for(int j=0;j<img_width;j=j+2){
        arry_Scaled[index] = original_array[(img_width*i)+j];
        index++;
        
      }
    }
    
    
    index=0;
    img = new image_window(arry_width,arry_height);
    img.show(arry_Scaled);
    System.out.println(arry_width+" "+arry_height);
  }
  
  
}
