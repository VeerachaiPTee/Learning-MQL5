void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+

int morningStarPattern() {
   datetime time1 = iTime(_Symbol,PERIOD_CURRENT,1);
   double high1 = iHigh(_Symbol,PERIOD_CURRENT,1);
   double low1 = iLow(_Symbol, PERIOD_CURRENT, 1);
   double open1 = iOpen(_Symbol, PERIOD_CURRENT, 1);
   double close1 = iClose(_Symbol, PERIOD_CURRENT, 1);
   
   datetime time2 = iTime(_Symbol,PERIOD_CURRENT,2);
   double high2 = iHigh(_Symbol,PERIOD_CURRENT,2);
   double low2 = iLow(_Symbol, PERIOD_CURRENT, 2);
   double open2 = iOpen(_Symbol, PERIOD_CURRENT, 2);
   double close2 = iClose(_Symbol, PERIOD_CURRENT, 2);
   
   datetime time3 = iTime(_Symbol,PERIOD_CURRENT,3);
   double high3 = iHigh(_Symbol,PERIOD_CURRENT,3);
   double low3 = iLow(_Symbol, PERIOD_CURRENT, 3);
   double open3 = iOpen(_Symbol, PERIOD_CURRENT, 3);
   double close3 = iClose(_Symbol, PERIOD_CURRENT, 3);
   
   if(open3 >  close3)
     {
      
     }
   
   

}
