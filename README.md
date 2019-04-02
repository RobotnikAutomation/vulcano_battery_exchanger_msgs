# vulcano_battery_exchanger_msgs

Package where all the messages used by [vulcano_battery_exchanger](https://github.com/RobotnikAutomation/vulcano_battery_exchanger/) are definied.

---

## msg

### BeaconLightsReq

Used as request message of the SetBeacon srv message.

```bash
bool default_mode
bool slow
bool green
bool yellow
bool red
```

- **default_mode**: sets the default light mode on
- **slow**: if it is set to true the lights will blink at half rate
- **green**: switches on/off green light
- **red**: switches on/off red light
- **yellow**: switches on/off yellow light

### BeaconLightsRes

Used as response message of the SetBeacon srv message.

```bash
bool success
string description
```

- **success**: *True* if the SetBeacon service call has been successful. *False* in any other case.
- **description**: Provides more detailed information.

### ExchangerStatus

```bash
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
```

- **state**: Shows the current state of the robot related with the exchange battery action.
  - **FINISHED**: The other battery has been received.
  - **EXCHANGING**: The battery is exchanging.  
  - **IDLE**: Ready to receive an exchange action.
  - **ERROR**: Error during the exchange.

- **mode**: Shows the mode of the exchanger.
- **left_sick_ok**: The left proximity sensor is detecting the robot.
- **right_sick_ok**: The right proximity sensor is detecting the robot.
- **stop_module_ok**: The stop module flag is active.
- **left_battery**: True if the left battery is in the battery exchanger.
- **right_battery**: True if the right battery is in the battery exchanger.
- **battery_ready**: True if the battery in the exchanger is ready to use (100% of charge).
- **left_battery_charging_time**: Time in minutes that the left battery is charging. 0 if the left battery is not detected by the exchanger  *left_battery*=*false*.
- **right_battery_charging_time**: Time in minutes that the right battery is charging. 0 if the right battery is not detected by the exchanger  *right_battery*=*false*.

### BatteryExchangerStatus

Summary message of *ExchangerStatus.msg*. Used in the *Satus.msg*.

```bash
string state
string mode
bool battery_ready
```

### Status

```bash
vulcano_battery_exchanger_msgs/BatteryExchangerStatus battery_exchanger_status
```

---

## srv

### SetBeacon

Service message to set the exchanger beacon lights.

```bash
vulcano_battery_exchanger_msgs/BeaconLightsReq lights
---
vulcano_battery_exchanger_msgs/BeaconLightsRes lights

```

---

## action

### InitExchange

Action message to exchange the battery.

```bash
---
bool result
string state
---
string state
```

- **Goal**: Empty
- **Result**:
  - result: *True* if the exchange has succeeded
  - state: The state of the exchanger when the action finishes.
- **Feedback**:
  - state: The state of the exchanger during the exchange.
