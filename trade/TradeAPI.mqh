// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

//
// @module-notready

#ifndef API_TRADE
    #define API_TRADE
#endif

#ifndef API_
    #include "..\API.mqh"
#endif

class TradeAPI : public API {

public:
    TradeAPI( void ) {}
    ~TradeAPI( void ) {}
    
    // Singleton Factory Method
    static TradeAPI* Com( void ) { static TradeAPI self; return GetPointer( self ); }

    // 
    int OrderSend( const string symbol, const int cmd, const double volume, const double price,
        const int slippage, const double stoploss, const double takeprofit, const string comment = NULL,
        const int magic = 0, const datetime expiration = 0, const color arrow_color = clrNONE
    ) { 
        OrderSendParam param = {
            symbol, cmd, volume, price, slippage, stoploss, takeprofit,
            comment, magic, expiration, arrow_color
        };
        
        API::All().fireOnOrderSendPre( param, this.Pointer() );
        
        //int ticket = OrderSend( symbol, cmd, volume, price, slippage, stoploss,
        //    takeprofit, comment, magic, expiration, arrow_color );
        
        
        
        API::All().fireOnOrderSendPost( param, this.Pointer() );
    }
    
    //
    bool OrderModify( int ticket, double price, double stoploss, double takeprofit,
        datetime expiration, color arrow_color
    ) {
        
        
        
    }
    
    //
    bool OrderClose( int ticket, double lots, double price, int slippage, color arrow_color ) {
    
    }
    
    //
    bool OrderDelete( int ticket, color arrow_color ) {
        
    }
    
    
};
