## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
## | wAuto standart sample remade for AutoNim v0.1  |
## | Developed in 2021 by Victoria A. Guevara       |
## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
import "../src/autonim"

auInit()

# Open "Run" box
auOpt "SendKeyDelay", 50
auSend "#r"

# Start notepad.exe
auSend "notepad{enter}"
auOpt "SendKeyDelay", 0

# Wait the window
auWinWaitActive "[Class:Notepad]"
let notepad = auWinGetProcess("[Class:Notepad]")

# Send some words
auSend "Hello, world"

# Drag the mouse cursor to select
auOpt "MouseCoordMode", 2
auMouseClickDrag "left", 0, 0, 200, 0

# Copy it
auSend "^c"

# Paste 10 times slowlyn
auOpt "SendKeyDelay", 250
auSend "^{v 10}"

# Terminates the process
auProcessClose $notepad