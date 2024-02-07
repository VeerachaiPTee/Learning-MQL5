//36. Average True Range ATR EA
//Veerachai 388 
void OnTick()
  {
   
   double priceArr[];
   int AvarageTrueDefinition = iATR(_Symbol,PERIOD_CURRENT,14);
   ArraySetAsSeries(priceArr,true);
   CopyBuffer(AvarageTrueDefinition,0,0,3,priceArr);
   
   double AverageTrueRangeVal = NormalizeDouble(priceArr[0],5);
   
   if(AverageTrueRangeVal > 0.00024)Comment("Strong AverageTrueRage: ",AverageTrueRangeVal);
   if(AverageTrueRangeVal < 0.00024)Comment("Week AverageTrueRage: ",AverageTrueRangeVal);
   
   if((AverageTrueRangeVal > 0.00014) && (AverageTrueRangeVal < 0.00024))
   Comment("", AverageTrueRangeVal);
   
  }
//+------------------------------------------------------------------+
