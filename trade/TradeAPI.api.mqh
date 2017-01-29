// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

// -------------------------------------
// Event: OrderSend Pre/Post.
//     Before OrderSend(), after OrderSend().
// -------------------------------------

public: virtual void OnOrderSendPre( OrderSendParam &param, API* context ) {}

public: void fireOrderSendPre( OrderSendParam &param, API* context ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At(i);
        listener.OnOrderSendPre( param, context );
    }
}

public: virtual void OnOrderSendPost( OrderSendParam &param, API* context ) {}

public: void fireOrderSendPost( OrderSendParam &param, API* context ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At(i);
        listener.OnOrderSendPost( param, context );
    }
}
