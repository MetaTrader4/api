// CODE IS POETRY
// TRADING IS MARTIAL ART
// Kolier.Li <kolier.li@gmail.com> [http://kolier.li]

public:

/*
REASON_PROGRAM 0 Expert Advisor terminated its operation by calling the ExpertRemove() function
REASON_REMOVE 1 Program has been deleted from the chart
REASON_RECOMPILE 2 Program has been recompiled
REASON_CHARTCHANGE 3 Symbol or chart period has been changed
REASON_CHARTCLOSE 4 Chart has been closed
REASON_PARAMETERS 5 Input parameters have been changed by a user
REASON_ACCOUNT 6 Another account has been activated or reconnection to the trade server has occurred due to changes in the account settings
REASON_TEMPLATE 7 A new template has been applied
REASON_INITFAILED 8 This value means that OnInit() handler has returned a nonzero value
REASON_CLOSE 9 Terminal has been closed
*/

//
virtual void OnDeinit( const int reason ) {}

//
void fireOnDeinit( const int reason ) {
    int total = this.listeners.Total();
    for ( int i = 0; i < total; i++ ) {
        API* listener = this.listeners.At( i );
        listener.OnDeinit( reason );
    }
}
