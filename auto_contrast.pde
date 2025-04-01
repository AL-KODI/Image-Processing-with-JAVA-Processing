class auto_contrast{
  float max=255;int min=0;
  float high,low=0;
  float auto_ans=0;
  float ans=0;
  float buf;
  
  public void auto_contrast_calculate(int[] arry){
         high=high(arry);
         low=low();
         
         for(int i=0;i<arry.length;i++){
            ans=((max-min)/(high-low));
            auto_ans=min+(arry[i]-low)*ans;
            buf = int(auto_ans);
            if(buf>255){
              buf=255;
            }else if(buf<0){
              buf=0;
            }
            arry[i]=int(buf);
         }
  }
  
  public float high(int[] arry){
     high=0;
     low=255;
     for(int i=0;i<arry.length;i++){
       if(arry[i]>high){
         high=arry[i];
       }
       if(arry[i]<low && arry[i]>0){
         low=arry[i];
       }
     }
     return high;
   }  
   
   public float low(){
     return low;
   }
}
