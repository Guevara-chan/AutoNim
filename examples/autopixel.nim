import "../src/autonim", strutils

auInit()

# Run notepad. Yes, again.
auRun "notepad"
auWinWaitActive "[Class:Notepad]"
let hwnd = auWinGetHandle("[CLASS:Notepad]")

# Preparin pixel analysis.
auOpt("PixelCoordMode", 0)
var size = auWinGetPosByHandle(hwnd)
let checksum = proc(): string = auPixelChecksum(0, 0, size.width, size.height).toHex(8)

# Trying some.
auControlCommand "[CLASS:Notepad]", "", "Edit1", "EditPaste", "Pixel checksum of this window  == 0x" &  checksum()
auControlCommand "[CLASS:Notepad]", "", "Edit1", "EditPaste", "\nPixel checksum after insertion == 0x" & checksum()

# Kill Notepad. Again [2]
auWinCloseByHandle(hwnd)