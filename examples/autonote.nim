## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
## | Most basic Notepad automation sample v0.1  |
## | Developed in 2021 by Victoria A. Guevara   |
## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
import "../src/autonim"

auInit()
auRun "notepad.exe"
auWinWaitActive "[Class:Notepad]"
auSend "Hello, autoit & AutoNim !"
let handle = auWinGetHandle("[Class:Notepad]")
auWinKillByHandle handle