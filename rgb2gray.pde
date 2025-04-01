class rgb2gray{
  int[] arry;
  float r,g,b=0;
  int R,G,B=0;
  float contrast=1;
  int bright=0;
  int a=0;
  
  public rgb2gray(){
    System.out.println("RGB obj created");
  }
  
  public void rgb2gray_calculate(int[] arry){
    for(int i=0;i<arry.length;i++){
         R=arry[i] & #00ff0000;
         G=arry[i] & #0000ff00;
         B=arry[i] & #000000ff;
         R=R>>16;
         G=G>>8;
         
         r=(R*0.3);
         g=(G*0.59);
         b=(B*0.11);
          
          if((r+g+b)>255){
            a=255;
          }else if((r+g+b)<0){
            a=0;
          }else{
            a=int((r+g+b));
          }
          arry[i]=a;
          
    } 
  }
}
