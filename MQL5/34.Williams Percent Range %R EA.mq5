//34.Williams Percent Range %R EA
//Veerachai 388
void OnTick()
  {
   double WprArr[];
   int wprDefinition = iWPR(_Symbol,_Period,14);
   CopyBuffer(wprDefinition,0,0,3,WprArr);
   double WPRval = NormalizeDouble(WprArr[0],2);
   Comment("WPRVALUE: ",WPRval);
   
 }
//+------------------------------------------------------------------+
