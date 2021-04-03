## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
## | Basic spatial (re)positioning sample v0.1  |
## | Developed in 2021 by Victoria A. Guevara   |
## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
import "../src/autonim", os

auInit()

# Run notepad as always.
auRun "notepad.exe"
auWinWaitActive "[Class:Notepad]"
let hwnd = auWinGetHandle("[CLASS:Notepad]")

# Get it's initial position.
let def_pos = auWinGetPosByHandle(hwnd)

# Move to top left corner.
1000.sleep()
auWinMove "[CLASS:Notepad]", "", 0, 0, 200, 200
auControlCommand("[CLASS:Notepad]", "", "Edit1", "EditPaste", "I like to move it !")

# Move to initial position.
5000.sleep()
auWinMoveByHandle hWnd, def_pos.x, def_pos.y, def_pos.width, def_pos.height
auControlCommand("[CLASS:Notepad]", "", "Edit1", "EditPaste", " Move it !")

# Position mouse to center of Notepad window.
auMouseMove(def_pos.x + def_pos.width div 2, def_pos.y + def_pos.height div 2)
auWinSetStatebyHandle(hwnd, 3)

# Kill it finally.
1000.sleep()
auWinKillByHandle hwnd