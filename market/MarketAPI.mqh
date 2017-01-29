// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

// Market API
// @config
//   Event_Timer

// Trick compiler on compiling this file
#ifndef API_MARKET
    #define API_MARKET
#endif

#ifndef API_
    #include "../API.mqh"
#endif

//
class MarketAPI : public API {

protected:
    string symbol_;
    MqlTick lastMqlTick;
    bool inited;

    // -------------------------------------
    // Constructor, Destructor
    // -------------------------------------
public:
    MarketAPI( void ) {
        this.subscribe();
        EventSetTimerAPI();
    }
    
    MarketAPI( string symbol ) : symbol_( symbol ) {
        this.subscribe();
        EventSetTimerAPI();
    }
    
    ~MarketAPI( void ) {
        EventKillTimerAPI();
    }
    
    // -------------------------------------
    // Implementation
    // -------------------------------------
    
    virtual void OnTimer( void ) {
        MqlTick tmpTick;
        if ( SymbolInfoTick( this.symbol_, tmpTick ) ) {
            // Initialize
            if ( !this.inited ) {
                this.inited = true;
                this.Api().fireOnNewTick( this.symbol_, tmpTick, true );
            }
            else {
                // New tick
                if ( tmpTick.time_msc > this.lastMqlTick.time_msc ) {
                    this.Api().fireOnNewTick( this.symbol_, tmpTick );
                }
            }
        }
        
        //
        //SymbolInfoTick( this.symbol, this.lastMqlTick );
        this.lastMqlTick = tmpTick;
    }
    
    // -------------------------------------
    // Getter, Setter
    // -------------------------------------
    
    string Symbol( void ) { return this.symbol_; }
    
    void Symbol( string symbol ) { this.symbol_ = symbol; }
    
    // -------------------------------------
    // Core
    // -------------------------------------
    
    virtual string Typename(void) { return typename(this); }
    
};
