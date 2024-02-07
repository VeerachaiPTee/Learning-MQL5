//11. HOW TO Close All Positions
// Veerachai 388
#include <Trade\Trade.mqh>
CTrade trade;
CPositionInfo position;

//--------------------------------------------------
int OnInit(){
   Print("before ", PositionsTotal(), " position.");
   CloseAllPositions();
   Print("after ", PositionsTotal(), " position.");
   return(INIT_SUCCEEDED);
}
//--------------------------------------------------
void CloseAllPositions(){
   for(int i=PositionsTotal()-1; i>=0; i--) {         
      if(position.SelectByIndex(i))  {               
         trade.PositionClose(position.Ticket());     
         Sleep(100);                                  
      }
   }
}