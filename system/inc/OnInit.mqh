// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

public:

virtual void OnInit( void ) {}
virtual void OnInit( ENUM_INIT_RETCODE &code ) {}


// 
void fireOnInit( void ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnInit();
    }
}

// 
void fireOnInit( ENUM_INIT_RETCODE &code ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnInit( code );
    }
}
