//40.CCI Commodity Channel Index EA
//Veerachai 388 
void OnTick()
  {
//---
   double priceArr[];
   int cciDF = iCCI(_Symbol,PERIOD_CURRENT,14,PRICE_CLOSE);
   ArraySetAsSeries(priceArr,true);
   CopyBuffer(cciDF,0,0,3,priceArr);
   
   double cciVal = (priceArr[0]);
   if(cciVal > 100)
   Comment("OverBought")
   if(cciVal < 100)
   Comment("Oversold")
   if(())
  }
//+------------------------------------------------------------------+
