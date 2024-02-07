//30.RSI Relative Strength Index EA
//Veerachai 388

void OnTick()
  {
   double myRsiarr[];
   int myRsiDefinition = iRSI(_Symbol,_Period,14,PRICE_CLOSE);
   ArraySetAsSeries(myRsiarr,true);
   CopyBuffer(myRsiDefinition,0,0,3,myRsiarr);
   double myRsiVal = NormalizeDouble(myRsiarr[0],2);
   Comment("Rsi Value = ", myRsiVal);
  }
//+------------------------------------------------------------------+
