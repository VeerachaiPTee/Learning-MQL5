//24.HOW TO Calculate Hidden Swap Fees
//Veerachai 388

void OnTick()
  {
   double swapLongTrades = SymbolInfoDouble(Symbol(),SYMBOL_SWAP_LONG);
   double swapShortTrades = SymbolInfoDouble(Symbol(),SYMBOL_SWAP_SHORT);
   Comment(
      "Swap Long Trades: ",swapLongTrades,"\n",
      "Swap Short Trades: ",swapShortTrades
   );
  }

