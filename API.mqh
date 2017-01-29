// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

// API class

#include <Arrays/ArrayObj.mqh>

#include "API.config.mqh"
#include "utility/event.mqh"

// For Child Class to detect to Avoid compile issue on signle file
#define API_


class API : public CObject {

// -------------------------------------
// Start: Register Modules API

#ifdef API_SYSTEM
    #include "system/api.mqh"
#endif

#ifdef API_MARKET
    #include "market/MarketAPI.api.mqh"
#endif

#ifdef API_TRADE
    #include "trade/TradeAPI.api.mqh"
#endif

#ifdef API_ORDERBAG
    #include "trade/OrderBagAPI.api.mqh"
#endif


// End: Register Modules API
// -------------------------------------

protected:
    CArrayObj listeners;

public:
    // -------------------------------------
    // Constructor, Destructor
    // -------------------------------------
    
    API( void ) {}
    ~API(void) {}

    // Singleton Factory Method
    static API* All( void ) { static API self; return GetPointer( self ); }
    
    //
    API* Api(void) const { return API::All(); }
    
    // -------------------------------------
    // Behavior
    // -------------------------------------

protected:
    // Subscribe to API Registries, for listener to run in constructor or initializer
    void subscribe( void ) {
        this.Api().AddSubscriber( this.Pointer() );
    }

public:
    // Add Subscriber Manually
    void AddSubscriber( API* client ) {
        this.listeners.Add( client );
    }
    
    // -------------------------------------
    // Utility
    // -------------------------------------

    //
    // CArrayObj* Listeners(void) const { return GetPointer(this.listeners); }
    CArrayObj* Listeners(void) { return GetPointer(this.listeners); }
    
    // Pointer/Descripter
    API* Pointer(void) { return GetPointer(this); }
    
    // -------------------------------------
    // Core
    // -------------------------------------
    
    // Since this in MQL seems always represent the current class type of the variable modifier, this can fix that.
    // Usually just copy to subclass to return class name.
    // Get the object class type.
    virtual string Typename(void) { return typename(this); }

    // Convert to string expression.
    virtual string ToString(void) { return this.Typename(); }

};

// -------------------------------------
// Start: Load Modules

#ifdef API_MARKET
    #include "market/MarketAPI.mqh"
#endif

#ifdef API_TRADE
    #include "trade/TradeAPI.mqh"
#endif

#ifdef API_ORDERBAG
    #include "trade/OrderBagAPI.mqh"
#endif

// End: Load Modules
// -------------------------------------
