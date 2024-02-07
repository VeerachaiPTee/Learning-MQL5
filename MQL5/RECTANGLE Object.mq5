//21. RECTANGLE Object
//Veerachai 388
void OnTick()
  {
   int highestCandle, lowestCandle;
   double High[],Low[];
   ArraySetAsSeries(High,true);
   ArraySetAsSeries(Low,true);
   CopyHigh(_Symbol,PERIOD_CURRENT,0,30,High);
   CopyLow(_Symbol,PERIOD_CURRENT,0,30,Low);
   highestCandle = ArrayMaximum(High,0,30);
   lowestCandle = ArrayMinimum(Low,0,30);
   MqlRates priceInfomation[];
   ArraySetAsSeries(priceInfomation,true);
   int Data = CopyRates(Symbol(),Period(),0,Bars(Symbol(),Period()),priceInfomation);
   ObjectDelete(_Symbol,"Rectangle");
   ObjectCreate(
   _Symbol,
   "Rectangle",
   OBJ_RECTANGLE,
   0,
   priceInfomation[30].time,
   priceInfomation[highestCandle].high,
   priceInfomation[0].time,
   priceInfomation[lowestCandle].low
   );
   ObjectSetInteger(0,"Rectangle",OBJPROP_COLOR,clrRed);
   ObjectSetInteger(0,"Rectangle",OBJPROP_FILL,clrRed);
  }
//+------------------------------------------------------------------+
