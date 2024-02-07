//23.HOW TO Calculate A Simple Moving Average Value
//Veerachai 388
void OnTick()
  {
   double myMaArray[];
   int MADestinition = iMA(_Symbol,_Period,30,0,MODE_SMA,PRICE_CLOSE);
   CopyBuffer(MADestinition,0,0,3,myMaArray);
   float myMaArray30 = myMaArray[1];
   Comment("My MA 30= ",myMaArray30);
   
  }
