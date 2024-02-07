//29. Bollinger Band EA
//Veerachai 388
void OnTick()
  {
//---
   double MiddleBandArr[];
   double UpperBandArr [];
   double LowerBandArr [];
   
   ArraySetAsSeries(MiddleBandArr,true);
   ArraySetAsSeries(UpperBandArr,true);
   ArraySetAsSeries(LowerBandArr,true);
   
   int bollingBandsDefinition = iBands(_Symbol,_Period,20,0,2,PRICE_CLOSE);
   CopyBuffer(bollingBandsDefinition,0,0,3,MiddleBandArr);
   CopyBuffer(bollingBandsDefinition,1,0,3,UpperBandArr);
   CopyBuffer(bollingBandsDefinition,2,0,3,LowerBandArr);
   
   double midval = MiddleBandArr[0];
   double upval = MiddleBandArr[0];
   double lowval = MiddleBandArr[0];
   
   Comment(
   "My Middle Band Value: ", midval,"\n",
   "My Upper Band Value: ", midval,"\n",
   "My Lower Band Value: ", midval);
  }
//+------------------------------------------------------------------+
