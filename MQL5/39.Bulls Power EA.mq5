//39.Bulls Power EA
//Veerachai 388 
void OnTick()
  {
   double priceArray[];
   int bullPowerDF = iBullsPower(_Symbol,PERIOD_CURRENT,13);
   ArraySetAsSeries(priceArray,true);
   CopyBuffer(bullPowerDF,0,0,3,priceArray);
   float bullPowerVal = (priceArray[0]);
   Comment("Bull Power Val: ",bullPowerVal);
   
  }
//+------------------------------------------------------------------+
