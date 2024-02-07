//20. Last Closed Order Profit History
//Veerachai 388
#include <Trade\Trade.mqh>;
CTrade trade;
void OnTick()
  {
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
      if(PositionsTotal()<1)
        {
         trade.Buy(0.10,NULL,Ask,0,(Ask+500*_Point),NULL);
         trade.Sell(0.10,NULL,Bid,0,(Bid-500*_Point),NULL);
        }
   string MyLastProfit = getLastProfit();
   Comment("My last Profit was: ","\n", MyLastProfit);
 }
string getLastProfit() {
   uint totalNumberOfDeals = HistoryDealsTotal();
   ulong ticketNumber = 0;
   long orderType, dealEntry;
   double orderProfit = 0;
   string mySymbol = "";
   string positionDirection = "";
   string myResult = "";
   
   HistorySelect(0,TimeCurrent());
   for(uint i=0;i<totalNumberOfDeals;i++)
     {
      if((ticketNumber = HistoryDealGetTicket(i))>0)
        {
         orderProfit = HistoryDealGetDouble(ticketNumber,DEAL_PROFIT);
         orderType = HistoryDealGetInteger(ticketNumber,DEAL_TYPE);
         mySymbol = HistoryDealGetString(ticketNumber,DEAL_SYMBOL);
         dealEntry = HistoryDealGetInteger(ticketNumber,DEAL_ENTRY);
         if(mySymbol == _Symbol)
         if(orderType == ORDER_TYPE_BUY || orderType == ORDER_TYPE_SELL)
         if(dealEntry ==1)
           {
            if(orderType == ORDER_TYPE_BUY)positionDirection = "SELL-TRADE";
            if(orderType == ORDER_TYPE_SELL)positionDirection = "BUY-TRADE";
            myResult = "Profit : "+orderProfit+" Ticket : "+ticketNumber+"Position Direction : "+positionDirection;
           }
        }
     }
     return myResult;
}
