// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

//
// @module-notready

#ifndef API_ORDERBAG
    #define API_ORDERBAG
#endif

#ifndef API_
    #include "..\API.mqh"
#endif

// Automatically regularly collect orders base on settings.
class OrderBagAPI : public API {

public:
    OrderBagAPI( void ) {
        this.subscribe();
    }
    ~OrderBagAPI( void ) {}

    

};
