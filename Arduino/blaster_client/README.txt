File Structure:

blaster.ino
|  - Main file contains our main loop.
|  - Imports Blaster.h
|
^ Blaster.h
  | - contains the imports for all the individual class files
  | > Imports:
  |   - Trigger.h
  |   - Display.h
  |   - BatteryChecker.h
  |   - Animator.h
  |   - Websocket.h
  |
  ^ Trigger.h
  | - Class containing all the functionality of a trigger pull
  | > - reload
  |   - ammo count
  |   - send signal
  |
  ^ Display.h
  | - Class displays information as it recieves
  | > Displays:
  |   - Ammo count
  |   - Weapon ID
  |   - Battery Level
  |
  ^ BatteryChecker.h
  | - Updates the battery level
  |
  ^ Animator.h
  | - Displays team color around the Blaster
  | > - Team Color
  |   - Animations (before game/etc.)
  |
  ^ Websocket.h
  | - Connects to server
  | - Sends and receives important info
  | > - relays to rest of code
