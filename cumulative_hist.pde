class cumulative_hist extends PApplet{
  
  int beginx =15 ;
  int beginy =1080 ;
  int[] hist = new int[256];
  int[] Hist = new int[256];
  float high=0;
  int c=0;
  int[] arry;
  float low=255;

    //for making objects with new windows
   public cumulative_hist(){
     PApplet.runSketch(new String[]{this.getClass().getName()}, this);  
   }
  
   //histogram calculation 
   public void calculation(int[] arry){
    for(int i=0;i<256;i++){
       hist[i]=0;
    }
    for(int i=0;i<arry.length;i++){
       hist[arry[i]]=hist[arry[i]]+1;
    }
    for(int i=1;i<hist.length;i++){
      if(i==0){
        Hist[i]=hist[i];
      }else{
        Hist[i]=Hist[i-1]+hist[i];
      }
      
       
    }
   }
   
 
  public void settings(){
    size(530,1000);
  }
  
  public void setup(){
  }
    
  public void exit(){
    //dispose();
  }
  
  public void draw(){
      background(0);
      strokeWeight(2);
      stroke(#3a7cd6);
      for(int i=0;i<256;i++){
        line(beginx, beginy,beginx ,height-Hist[i]/20);
        beginx=beginx+2;
        beginy=beginy+2;
      
      }
      beginx =15 ;
      beginy =1080 ; 
  }
}
