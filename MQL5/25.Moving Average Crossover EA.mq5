//25.Moving Average Crossover EA
//Veerachai 388
void OnTick()
  {
   double myMAArray1[], myMAArray2[];
   int MADefinition1 = iMA(_Symbol,_Period,20,0,MODE_EMA,PRICE_CLOSE);
   int MADefinition2 = iMA(_Symbol,_Period,50,0,MODE_EMA,PRICE_CLOSE);
   ArraySetAsSeries(myMAArray1,true);
   ArraySetAsSeries(myMAArray2,true);
   CopyBuffer(MADefinition1,0,0,3,myMAArray1);
   CopyBuffer(MADefinition2,0,0,3,myMAArray2);
   if((myMAArray1[0] > myMAArray2[0])&&(myMAArray1[1]<myMAArray2[1]))
     {
      Comment("Buy");
     }
   if((myMAArray1[0] < myMAArray2[0])&&(myMAArray1[1]>myMAArray2[1]))
     {
      Comment("Sell");
     }
  }

