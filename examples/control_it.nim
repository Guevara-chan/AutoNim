## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
## | Basic controls automation sample v0.1      |
## | Developed in 2021 by Victoria A. Guevara   |
## ◈-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-◈
import "../src/autonim"

auInit()

# Run notepad as always.
auRun "notepad.exe"
auWinWaitActive "[Class:Notepad]"
let hwnd = auWinGetHandle("[CLASS:Notepad]")

# Paste some text and retrieve it:
auControlCommand("[CLASS:Notepad]", "", "Edit1", "EditPaste", "=* Your cliboard *=\n" & auClipGet())
echo "---> Number of lines in Notepad: " & auControlCommand("[CLASS:Notepad]", "", "Edit1", "GetLineCount")
echo "---> Text in Notepad:\n" & auControlGetText("[CLASS:Notepad]", "", "Edit1")

# Kill Notepad.
auWinCloseByHandle(hWnd)