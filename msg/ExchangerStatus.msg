# status
string FINISHED=finished
string EXCHANGING=exchanging
string IDLE=idle
string ERROR=error

# EXCHANGING, IDLE, FINISHED, ERROR
string state

string mode

bool left_sick_ok
bool right_sick_ok
bool stop_module_ok
bool left_battery
bool right_battery
bool battery_ready

int32 left_battery_charging_time
int32 right_battery_charging_time
