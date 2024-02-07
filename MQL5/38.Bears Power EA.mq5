//38. Bears Power EA
//Veerchai 388
void OnTick()
  {
//---
   double priceArr[];
   int beardPowerDefinition = iBearsPower(_Symbol,PERIOD_CURRENT,13);
   ArraySetAsSeries(priceArr,true);
   CopyBuffer(beardPowerDefinition,0,0,3,priceArr);
   double bearsPowerVal = (priceArr[0]);
   
   Comment("Bear value: ",bearsPowerVal);
  }
//+------------------------------------------------------------------+
