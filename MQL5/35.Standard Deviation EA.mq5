//35.Standard Deviation EA
//Veerachai 388
void OnTick()
  {
   double stdDevArr[];
   int stdDevDefinition = iStdDev(_Symbol,PERIOD_CURRENT,20,0,MODE_SMA,PRICE_CLOSE);
   ArraySetAsSeries(stdDevArr,true);
   CopyBuffer(stdDevDefinition,0,0,3,stdDevArr);
   double stdDevVal = NormalizeDouble(stdDevArr[0],6);
   Comment("StdDevVal: ",stdDevVal);
   
  }
//+------------------------------------------------------------------+
