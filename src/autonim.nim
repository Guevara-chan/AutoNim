#/////////////////////////////////////////////////////////////////////////////
#
# AutoItX v3 (2016) -> AutoNim (2021)
#
# Copyright (C)1999-2021:
#		- Jonathan Bennett <jon at autoitscript dot com>
#       - Victoria Guevara <vk dot com slash guevara_chan>
#
#/////////////////////////////////////////////////////////////////////////////

#/////////////////////////////////////////////////////////////////////////////
# Definitions
#/////////////////////////////////////////////////////////////////////////////

const
    auINTDEFAULT*  = (- 2147483647) # "Default" value for _some_ int parameters (largest negative number)
    SW_SHOWNORMAL* = 1

type
    Rect*  = object
        left, top, right, bottom: int16

    Point* = object
        x, y: int16

#/////////////////////////////////////////////////////////////////////////////
# Exported functions
#/////////////////////////////////////////////////////////////////////////////

const dllname = when sizeof(int) == 8: "AutoItX3_x64.dll" else: "AutoItX3.dll"
{.pragma: AutoIt, cdecl, discardable, dynlib: dllname}

proc auInit*() {.AutoIt, importc: "AU3_Init"}
proc auerror*(): int {.AutoIt, importc: "AU3_error"}
proc auAutoItSetOption_proto(szOption: WideCString; nValue: int): int {.AutoIt, importc: "AU3_AutoItSetOption"}
proc auAutoItSetOption*(szOption: string; nValue: int): int {.inline discardable.} = 
    auAutoItSetOption_proto(szOption.newWideCString, nValue)
proc auClipGet_proto(szClip: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ClipGet"}
proc auClipGet*(szClip: string; nBufSize: int) {.inline discardable.} = 
    auClipGet_proto(szClip.newWideCString, nBufSize)
proc auClipPut_proto(szClip: WideCString) {.AutoIt, importc: "AU3_ClipPut"}
proc auClipPut*(szClip: string) {.inline discardable.} = 
    auClipPut_proto(szClip.newWideCString) 
proc auControlClick_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szButton: WideCString; nNumClicks: int; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT): int {. AutoIt, importc: "AU3_ControlClick"}
proc auControlClick*(szTitle: string; szText: string; szControl: string; szButton: string; nNumClicks: int; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT): int {.inline discardable.} = 
    auControlClick_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szButton.newWideCString, nNumClicks, nX, nY)
proc auControlClickByHandle_proto(hWnd: int; hCtrl: int; szButton: WideCString; nNumClicks: int; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT): int {.AutoIt, importc: "AU3_ControlClickByHandle"}
proc auControlClickByHandle*(hWnd: int; hCtrl: int; szButton: string; nNumClicks: int; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT): int {.inline discardable.} = 
    auControlClickByHandle_proto(hWnd, hCtrl, szButton.newWideCString, nNumClicks, nX, nY)
proc auControlCommand_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szCommand: WideCString; szExtra: WideCString; szResult: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlCommand"}
proc auControlCommand*(szTitle: string; szText: string; szControl: string; szCommand: string; szExtra: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auControlCommand_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szCommand.newWideCString, szExtra.newWideCString, szResult.newWideCString, nBufSize)
proc auControlCommandByHandle_proto(hWnd: int; hCtrl: int; szCommand: WideCString; szExtra: WideCString; szResult: WideCString; nBufSize: int) {. AutoIt, importc: "AU3_ControlCommandByHandle"}
proc auControlCommandByHandle*(hWnd: int; hCtrl: int; szCommand: string; szExtra: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auControlCommandByHandle_proto(hWnd, hCtrl, szCommand.newWideCString, szExtra.newWideCString, szResult.newWideCString, nBufSize)
proc auControlListView_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szCommand: WideCString; szExtra1: WideCString; szExtra2: WideCString; szResult: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlListView"}
proc auControlListView*(szTitle: string; szText: string; szControl: string; szCommand: string; szExtra1: string; szExtra2: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auControlListView_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szCommand.newWideCString, szExtra1.newWideCString, szExtra2.newWideCString, szResult.newWideCString, nBufSize)
proc auControlListViewByHandle_proto(hWnd: int; hCtrl: int; szCommand: WideCString; szExtra1: WideCString; szExtra2: WideCString; szResult: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlListViewByHandle"}
proc auControlListViewByHandle*(hWnd: int; hCtrl: int; szCommand: string; szExtra1: string; szExtra2: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auControlListViewByHandle_proto(hWnd, hCtrl, szCommand.newWideCString, szExtra1.newWideCString, szExtra2.newWideCString, szResult.newWideCString, nBufSize)
proc auControlDisable_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. AutoIt, importc: "AU3_ControlDisable"}
proc auControlDisable*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlDisable_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 
proc auControlDisableByHandle*(hWnd: int; hCtrl: int): int {.AutoIt, importc: "AU3_ControlDisableByHandle"}
proc auControlEnable_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. AutoIt, importc: "AU3_ControlEnable"}
proc auControlEnable*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlEnable_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 
proc auControlEnableByHandle*(hWnd: int; hCtrl: int): int {.AutoIt, importc: "AU3_ControlEnableByHandle"}
proc auControlFocus_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. AutoIt, importc: "AU3_ControlFocus"}
proc auControlFocus*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlFocus_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 
proc auControlFocusByHandle*(hWnd: int; hCtrl: int): int {.AutoIt, importc: "AU3_ControlFocusByHandle"}
proc auControlGetFocus_proto(szTitle: WideCString; szText: WideCString; szControlWithFocus: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlGetFocus"}
proc auControlGetFocus*(szTitle: string; szText: string; szControlWithFocus: string; nBufSize: int) {.inline discardable.} = 
    auControlGetFocus_proto(szTitle.newWideCString, szText.newWideCString, szControlWithFocus.newWideCString, nBufSize)
proc auControlGetFocusByHandle_proto(hWnd: int; szControlWithFocus: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlGetFocusByHandle"}
proc auControlGetFocusByHandle*(hWnd: int; szControlWithFocus: string; nBufSize: int) {.inline discardable.} = 
    auControlGetFocusByHandle_proto(hWnd, szControlWithFocus.newWideCString, nBufSize)
proc auControlGetHandle_proto(hWnd: int; szControl: WideCString): int {.AutoIt, importc: "AU3_ControlGetHandle"}
proc auControlGetHandle*(hWnd: int; szControl: string): int {.inline discardable.} = 
    auControlGetHandle_proto(hWnd, szControl.newWideCString) 
proc auControlGetHandleAsText_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szRetText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlGetHandleAsText"}
proc auControlGetHandleAsText*(szTitle: string; szText: string; szControl: string; szRetText: string; nBufSize: int) {.inline discardable.} = 
    auControlGetHandleAsText_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szRetText.newWideCString, nBufSize)
proc auControlGetPos_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; lpRect: Rect): int {.AutoIt, importc: "AU3_ControlGetPos"}
proc auControlGetPos*(szTitle: string; szText: string; szControl: string; lpRect: Rect): int {.inline discardable.} = 
    auControlGetPos_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, lpRect)
proc auControlGetPosByHandle*(hWnd: int; hCtrl: int; lpRect: Rect): int {.AutoIt, importc: "AU3_ControlGetPosByHandle"}
proc auControlGetText_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szControlText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlGetText"}
proc auControlGetText*(szTitle: string; szText: string; szControl: string; szControlText: string; nBufSize: int) {.inline discardable.} = 
    auControlGetText_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szControlText.newWideCString, nBufSize)
proc auControlGetTextByHandle_proto(hWnd: int; hCtrl: int; szControlText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlGetTextByHandle"}
proc auControlGetTextByHandle*(hWnd: int; hCtrl: int; szControlText: string; nBufSize: int) {.inline discardable.} = 
    auControlGetTextByHandle_proto(hWnd, hCtrl, szControlText.newWideCString, nBufSize)
proc auControlHide_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. AutoIt, importc: "AU3_ControlHide"}
proc auControlHide*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlHide_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 
proc auControlHideByHandle*(hWnd: int; hCtrl: int): int {.AutoIt, importc: "AU3_ControlHideByHandle"}
proc auControlMove_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.AutoIt, importc: "AU3_ControlMove"}
proc auControlMove*(szTitle: string; szText: string; szControl: string; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.inline discardable.} = 
    auControlMove_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, nX, nY, nWidth, nHeight)
proc auControlMoveByHandle*(hWnd: int; hCtrl: int; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.AutoIt, importc: "AU3_ControlMoveByHandle"}
proc auControlSend_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szSendText: WideCString; nMode: int = 0): int {.AutoIt, importc: "AU3_ControlSend"}
proc auControlSend*(szTitle: string; szText: string; szControl: string; szSendText: string; nMode: int = 0): int {.inline discardable.} = 
    auControlSend_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szSendText.newWideCString, nMode)
proc auControlSendByHandle_proto(hWnd: int; hCtrl: int; szSendText: WideCString; nMode: int = 0): int {.AutoIt, importc: "AU3_ControlSendByHandle"}
proc auControlSendByHandle*(hWnd: int; hCtrl: int; szSendText: string; nMode: int = 0): int {.inline discardable.} = 
    auControlSendByHandle_proto(hWnd, hCtrl, szSendText.newWideCString, nMode)
proc auControlSetText_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szControlText: WideCString): int {.AutoIt, importc: "AU3_ControlSetText"}
proc auControlSetText*(szTitle: string; szText: string; szControl: string; szControlText: string): int {.inline discardable.} = 
    auControlSetText_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szControlText.newWideCString) 
proc auControlSetTextByHandle_proto(hWnd: int; hCtrl: int; szControlText: WideCString): int {. AutoIt, importc: "AU3_ControlSetTextByHandle"}
proc auControlSetTextByHandle*(hWnd: int; hCtrl: int; szControlText: string): int {.inline discardable.} = 
    auControlSetTextByHandle_proto(hWnd, hCtrl, szControlText.newWideCString) 
proc auControlShow_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString): int {. AutoIt, importc: "AU3_ControlShow"}
proc auControlShow*(szTitle: string; szText: string; szControl: string): int {.inline discardable.} = 
    auControlShow_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString) 
proc auControlShowByHandle*(hWnd: int; hCtrl: int): int {.AutoIt, importc: "AU3_ControlShowByHandle"}
proc auControlTreeView_proto(szTitle: WideCString; szText: WideCString; szControl: WideCString; szCommand: WideCString; szExtra1: WideCString; szExtra2: WideCString; szResult: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlTreeView"}
proc auControlTreeView*(szTitle: string; szText: string; szControl: string; szCommand: string; szExtra1: string; szExtra2: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auControlTreeView_proto(szTitle.newWideCString, szText.newWideCString, szControl.newWideCString, szCommand.newWideCString, szExtra1.newWideCString, szExtra2.newWideCString, szResult.newWideCString, nBufSize)
proc auControlTreeViewByHandle_proto(hWnd: int; hCtrl: int; szCommand: WideCString; szExtra1: WideCString; szExtra2: WideCString; szResult: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_ControlTreeViewByHandle"}
proc auControlTreeViewByHandle*(hWnd: int; hCtrl: int; szCommand: string; szExtra1: string; szExtra2: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auControlTreeViewByHandle_proto(hWnd, hCtrl, szCommand.newWideCString, szExtra1.newWideCString, szExtra2.newWideCString, szResult.newWideCString, nBufSize)
proc auDriveMapAdd_proto(szDevice: WideCString; szShare: WideCString; nFlags: int; szUser: WideCString; szPwd: WideCString; szResult: WideCString; nBufSize: int) {. AutoIt, importc: "AU3_DriveMapAdd"}
proc auDriveMapAdd*(szDevice: string; szShare: string; nFlags: int; szUser: string; szPwd: string; szResult: string; nBufSize: int) {.inline discardable.} = 
    auDriveMapAdd_proto(szDevice.newWideCString, szShare.newWideCString, nFlags, szUser.newWideCString, szPwd.newWideCString, szResult.newWideCString, nBufSize)
proc auDriveMapDel_proto(szDevice: WideCString): int {.AutoIt, importc: "AU3_DriveMapDel"}
proc auDriveMapDel*(szDevice: string): int {.inline discardable.} = 
    auDriveMapDel_proto(szDevice.newWideCString) 
proc auDriveMapGet_proto(szDevice: WideCString; szMapping: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_DriveMapGet"}
proc auDriveMapGet*(szDevice: string; szMapping: string; nBufSize: int) {.inline discardable.} = 
    auDriveMapGet_proto(szDevice.newWideCString, szMapping.newWideCString, nBufSize)
proc auIsAdmin*(): int {.AutoIt, importc: "AU3_IsAdmin"}
proc auMouseClick_proto(szButton: WideCString; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT; nClicks: int = 1; nSpeed: int = - 1): int {. AutoIt, importc: "AU3_MouseClick"}
proc auMouseClick*(szButton: string; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT; nClicks: int = 1; nSpeed: int = - 1): int {.inline discardable.} = 
    auMouseClick_proto(szButton.newWideCString, nX, nY, nClicks, nSpeed)
proc auMouseClickDrag_proto(szButton: WideCString; nX1: int; nY1: int; nX2: int; nY2: int; nSpeed: int = - 1): int {.AutoIt, importc: "AU3_MouseClickDrag"}
proc auMouseClickDrag*(szButton: string; nX1: int; nY1: int; nX2: int; nY2: int; nSpeed: int = - 1): int {.inline discardable.} = 
    auMouseClickDrag_proto(szButton.newWideCString, nX1, nY1, nX2, nY2, nSpeed)
proc auMouseDown_proto(szButton: WideCString) {.AutoIt, importc: "AU3_MouseDown"}
proc auMouseDown*(szButton: string) {.inline discardable.} = 
    auMouseDown_proto(szButton.newWideCString) 
proc auMouseGetCursor*(): int {.AutoIt, importc: "AU3_MouseGetCursor"}
proc auMouseGetPos*(lpPoint: Point) {.AutoIt, importc: "AU3_MouseGetPos"}
proc auMouseMove*(nX: int; nY: int; nSpeed: int = - 1): int {.AutoIt, importc: "AU3_MouseMove"}
proc auMouseUp_proto(szButton: WideCString) {.AutoIt, importc: "AU3_MouseUp"}
proc auMouseUp*(szButton: string) {.inline discardable.} = 
    auMouseUp_proto(szButton.newWideCString) 
proc auMouseWheel_proto(szDirection: WideCString; nClicks: int) {.AutoIt, importc: "AU3_MouseWheel"}
proc auMouseWheel*(szDirection: string; nClicks: int) {.inline discardable.} = 
    auMouseWheel_proto(szDirection.newWideCString, nClicks)
proc auOpt_proto(szOption: WideCString; nValue: int): int {.AutoIt, importc: "AU3_Opt"}
proc auOpt*(szOption: string; nValue: int): int {.inline discardable.} = 
    auOpt_proto(szOption.newWideCString, nValue)
proc auPixelChecksum*(lpRect: Rect; nStep: int = 1): cuint {.AutoIt, importc: "AU3_PixelChecksum"}
proc auPixelGetColor*(nX: int; nY: int): int {.AutoIt, importc: "AU3_PixelGetColor"}
proc auPixelSearch*(lpRect: Rect; nCol: int; nVar: int; nStep: int; pPointResult: Point) {.AutoIt, importc: "AU3_PixelSearch"}
proc auProcessClose_proto(szProcess: WideCString): int {.AutoIt, importc: "AU3_ProcessClose"}
proc auProcessClose*(szProcess: string): int {.inline discardable.} = 
    auProcessClose_proto(szProcess.newWideCString) 
proc auProcessExists_proto(szProcess: WideCString): int {.AutoIt, importc: "AU3_ProcessExists"}
proc auProcessExists*(szProcess: string): int {.inline discardable.} = 
    auProcessExists_proto(szProcess.newWideCString) 
proc auProcessSetPriority_proto(szProcess: WideCString; nPriority: int): int {.AutoIt, importc: "AU3_ProcessSetPriority"}
proc auProcessSetPriority*(szProcess: string; nPriority: int): int {.inline discardable.} = 
    auProcessSetPriority_proto(szProcess.newWideCString, nPriority)
proc auProcessWait_proto(szProcess: WideCString; nTimeout: int = 0): int {.AutoIt, importc: "AU3_ProcessWait"}
proc auProcessWait*(szProcess: string; nTimeout: int = 0): int {.inline discardable.} = 
    auProcessWait_proto(szProcess.newWideCString, nTimeout)
proc auProcessWaitClose_proto(szProcess: WideCString; nTimeout: int = 0): int {.AutoIt, importc: "AU3_ProcessWaitClose"}
proc auProcessWaitClose*(szProcess: string; nTimeout: int = 0): int {.inline discardable.} = 
    auProcessWaitClose_proto(szProcess.newWideCString, nTimeout)
proc auRun_proto(szProgram: WideCString; szDir: WideCString; nShowFlag: int = SW_SHOWNORMAL): int {. AutoIt, importc: "AU3_Run"}
proc auRun*(szProgram: string; szDir = ""; nShowFlag: int = SW_SHOWNORMAL): int {.inline discardable.} = 
    auRun_proto(szProgram.newWideCString, szDir.newWideCString, nShowFlag)
proc auRunWait_proto(szProgram: WideCString; szDir: WideCString; nShowFlag: int = SW_SHOWNORMAL): int {. AutoIt, importc: "AU3_RunWait"}
proc auRunWait*(szProgram: string; szDir = ""; nShowFlag: int = SW_SHOWNORMAL): int {.inline discardable.} = 
    auRunWait_proto(szProgram.newWideCString, szDir.newWideCString, nShowFlag)
proc auRunAs_proto(szUser: WideCString; szDomain: WideCString; szPassword: WideCString; nLogonFlag: int; szProgram: WideCString; szDir: WideCString; nShowFlag: int = SW_SHOWNORMAL): int {.AutoIt, importc: "AU3_RunAs"}
proc auRunAs*(szUser: string; szDomain: string; szPassword: string; nLogonFlag: int; szProgram: string; szDir: string; nShowFlag: int = SW_SHOWNORMAL): int {.inline discardable.} = 
    auRunAs_proto(szUser.newWideCString, szDomain.newWideCString, szPassword.newWideCString, nLogonFlag, szProgram.newWideCString, szDir.newWideCString, nShowFlag)
proc auRunAsWait_proto(szUser: WideCString; szDomain: WideCString; szPassword: WideCString; nLogonFlag: int; szProgram: WideCString; szDir: WideCString; nShowFlag: int = SW_SHOWNORMAL): int {.AutoIt, importc: "AU3_RunAsWait"}
proc auRunAsWait*(szUser: string; szDomain: string; szPassword: string; nLogonFlag: int; szProgram: string; szDir: string; nShowFlag: int = SW_SHOWNORMAL): int {.inline discardable.} = 
    auRunAsWait_proto(szUser.newWideCString, szDomain.newWideCString, szPassword.newWideCString, nLogonFlag, szProgram.newWideCString, szDir.newWideCString, nShowFlag)
proc auSend_proto(szSendText: WideCString; nMode: int = 0) {.AutoIt, importc: "AU3_Send"}
proc auSend*(szSendText: string; nMode: int = 0) {.inline discardable.} = 
    auSend_proto(szSendText.newWideCString, nMode)
proc auShutdown*(nFlags: int): int {.AutoIt, importc: "AU3_Shutdown"}
proc auSleep*(nMilliseconds: int) {.AutoIt, importc: "AU3_Sleep"}
proc auStatusbarGetText_proto(szTitle: WideCString; szText: WideCString; nPart: int; szStatusText: WideCString; nBufSize: int): int {.AutoIt, importc: "AU3_StatusbarGetText"}
proc auStatusbarGetText*(szTitle: string; szText: string; nPart: int; szStatusText: string; nBufSize: int): int {.inline discardable.} = 
    auStatusbarGetText_proto(szTitle.newWideCString, szText.newWideCString, nPart, szStatusText.newWideCString, nBufSize)
proc auStatusbarGetTextByHandle_proto(hWnd: int; nPart: int; szStatusText: WideCString; nBufSize: int): int {.AutoIt, importc: "AU3_StatusbarGetTextByHandle"}
proc auStatusbarGetTextByHandle*(hWnd: int; nPart: int; szStatusText: string; nBufSize: int): int {.inline discardable.} = 
    auStatusbarGetTextByHandle_proto(hWnd, nPart, szStatusText.newWideCString, nBufSize)
proc auToolTip_proto(szTip: WideCString; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT) {. AutoIt, importc: "AU3_ToolTip"}
proc auToolTip*(szTip: string; nX: int = auINTDEFAULT; nY: int = auINTDEFAULT) {.inline discardable.} = 
    auToolTip_proto(szTip.newWideCString, nX, nY)
proc auWinActivate_proto(szTitle: WideCString; szText: WideCString): int {.AutoIt, importc: "AU3_WinActivate"}
proc auWinActivate*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinActivate_proto(szTitle.newWideCString, szText.newWideCString) 
proc auWinActivateByHandle*(hWnd: int): int {.AutoIt, importc: "AU3_WinActivateByHandle"}
proc auWinActive_proto(szTitle: WideCString; szText: WideCString): int {.AutoIt, importc: "AU3_WinActive"}
proc auWinActive*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinActive_proto(szTitle.newWideCString, szText.newWideCString) 
proc auWinActiveByHandle*(hWnd: int): int {.AutoIt, importc: "AU3_WinActiveByHandle"}
proc auWinClose_proto(szTitle: WideCString; szText: WideCString): int {.AutoIt, importc: "AU3_WinClose"}
proc auWinClose*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinClose_proto(szTitle.newWideCString, szText.newWideCString) 
proc auWinCloseByHandle*(hWnd: int): int {.AutoIt, importc: "AU3_WinCloseByHandle"}
proc auWinExists_proto(szTitle: WideCString; szText: WideCString): int {.AutoIt, importc: "AU3_WinExists"}
proc auWinExists*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinExists_proto(szTitle.newWideCString, szText.newWideCString) 
proc auWinExistsByHandle*(hWnd: int): int {.AutoIt, importc: "AU3_WinExistsByHandle"}
proc auWinGetCaretPos*(lpPoint: Point): int {.AutoIt, importc: "AU3_WinGetCaretPos"}
proc auWinGetClassList_proto(szTitle: WideCString; szText: WideCString; szRetText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_WinGetClassList"}
proc auWinGetClassList*(szTitle: string; szText: string; szRetText: string; nBufSize: int) {.inline discardable.} = 
    auWinGetClassList_proto(szTitle.newWideCString, szText.newWideCString, szRetText.newWideCString, nBufSize)
proc auWinGetClassListByHandle_proto(hWnd: int; szRetText: WideCString; nBufSize: int) {. AutoIt, importc: "AU3_WinGetClassListByHandle"}
proc auWinGetClassListByHandle*(hWnd: int; szRetText: string; nBufSize: int) {.inline discardable.} = 
    auWinGetClassListByHandle_proto(hWnd, szRetText.newWideCString, nBufSize)
proc auWinGetClientSize_proto(szTitle: WideCString; szText: WideCString; lpRect: Rect): int {. AutoIt, importc: "AU3_WinGetClientSize"}
proc auWinGetClientSize*(szTitle: string; szText: string; lpRect: Rect): int {.inline discardable.} = 
    auWinGetClientSize_proto(szTitle.newWideCString, szText.newWideCString, lpRect)
proc auWinGetClientSizeByHandle*(hWnd: int; lpRect: Rect): int {.AutoIt, importc: "AU3_WinGetClientSizeByHandle"}
proc auWinGetHandle_proto(szTitle: WideCString; szText: WideCString): int {.AutoIt, importc: "AU3_WinGetHandle"}
proc auWinGetHandle*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinGetHandle_proto(szTitle.newWideCString, szText.newWideCString) 
proc auWinGetHandleAsText_proto(szTitle: WideCString; szText: WideCString; szRetText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_WinGetHandleAsText"}
proc auWinGetHandleAsText*(szTitle: string; szText: string; szRetText: string; nBufSize: int) {.inline discardable.} = 
    auWinGetHandleAsText_proto(szTitle.newWideCString, szText.newWideCString, szRetText.newWideCString, nBufSize)
proc auWinGetPos_proto(szTitle: WideCString; szText: WideCString; lpRect: Rect): int {.AutoIt, importc: "AU3_WinGetPos"}
proc auWinGetPos*(szTitle: string; szText: string; lpRect: Rect): int {.inline discardable.} = 
    auWinGetPos_proto(szTitle.newWideCString, szText.newWideCString, lpRect)
proc auWinGetPosByHandle*(hWnd: int; lpRect: Rect): int {.AutoIt, importc: "AU3_WinGetPosByHandle"}
proc auWinGetProcess_proto(szTitle: WideCString; szText: WideCString): int32 {.AutoIt, importc: "AU3_WinGetProcess"}
proc auWinGetProcess*(szTitle: string; szText: string): int32 {.inline discardable.} = 
    auWinGetProcess_proto(szTitle.newWideCString, szText.newWideCString) 
proc auWinGetProcessByHandle*(hWnd: int): int32 {.AutoIt, importc: "AU3_WinGetProcessByHandle"}
proc auWinGetState_proto(szTitle: WideCString; szText: WideCString): int {.AutoIt, importc: "AU3_WinGetState"}
proc auWinGetState*(szTitle: string; szText: string): int {.inline discardable.} = 
    auWinGetState_proto(szTitle.newWideCString, szText.newWideCString) 
proc auWinGetStateByHandle*(hWnd: int): int {.AutoIt, importc: "AU3_WinGetStateByHandle"}
proc auWinGetText_proto(szTitle: WideCString; szText: WideCString; szRetText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_WinGetText"}
proc auWinGetText*(szTitle: string; szText: string; szRetText: string; nBufSize: int) {.inline discardable.} = 
    auWinGetText_proto(szTitle.newWideCString, szText.newWideCString, szRetText.newWideCString, nBufSize)
proc auWinGetTextByHandle_proto(hWnd: int; szRetText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_WinGetTextByHandle"}
proc auWinGetTextByHandle*(hWnd: int; szRetText: string; nBufSize: int) {.inline discardable.} = 
    auWinGetTextByHandle_proto(hWnd, szRetText.newWideCString, nBufSize)
proc auWinGetTitle_proto(szTitle: WideCString; szText: WideCString; szRetText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_WinGetTitle"}
proc auWinGetTitle*(szTitle: string; szText: string; szRetText: string; nBufSize: int) {.inline discardable.} = 
    auWinGetTitle_proto(szTitle.newWideCString, szText.newWideCString, szRetText.newWideCString, nBufSize)
proc auWinGetTitleByHandle_proto(hWnd: int; szRetText: WideCString; nBufSize: int) {.AutoIt, importc: "AU3_WinGetTitleByHandle"}
proc auWinGetTitleByHandle*(hWnd: int; szRetText: string; nBufSize: int) {.inline discardable.} = 
    auWinGetTitleByHandle_proto(hWnd, szRetText.newWideCString, nBufSize)
proc auWinKill_proto(szTitle: WideCString; szText: WideCString): int {.AutoIt, importc: "AU3_WinKill"}
proc auWinKill*(szTitle: string; szText = ""): int {.inline discardable.} = 
    auWinKill_proto(szTitle.newWideCString, szText.newWideCString) 
proc auWinKillByHandle*(hWnd: int): int {.AutoIt, importc: "AU3_WinKillByHandle"}
proc auWinMenuSelectItem_proto(szTitle: WideCString; szText: WideCString; szItem1: WideCString; szItem2: WideCString; szItem3: WideCString; szItem4: WideCString; szItem5: WideCString; szItem6: WideCString; szItem7: WideCString; szItem8: WideCString): int {.AutoIt, importc: "AU3_WinMenuSelectItem"}
proc auWinMenuSelectItem*(szTitle: string; szText: string; szItem1: string; szItem2: string; szItem3: string; szItem4: string; szItem5: string; szItem6: string; szItem7: string; szItem8: string): int {.inline discardable.} = 
    auWinMenuSelectItem_proto(szTitle.newWideCString, szText.newWideCString, szItem1.newWideCString, szItem2.newWideCString, szItem3.newWideCString, szItem4.newWideCString, szItem5.newWideCString, szItem6.newWideCString, szItem7.newWideCString, szItem8.newWideCString) 
proc auWinMenuSelectItemByHandle_proto(hWnd: int; szItem1: WideCString; szItem2: WideCString; szItem3: WideCString; szItem4: WideCString; szItem5: WideCString; szItem6: WideCString; szItem7: WideCString; szItem8: WideCString): int {.AutoIt, importc: "AU3_WinMenuSelectItemByHandle"}
proc auWinMenuSelectItemByHandle*(hWnd: int; szItem1: string; szItem2: string; szItem3: string; szItem4: string; szItem5: string; szItem6: string; szItem7: string; szItem8: string): int {.inline discardable.} = 
    auWinMenuSelectItemByHandle_proto(hWnd, szItem1.newWideCString, szItem2.newWideCString, szItem3.newWideCString, szItem4.newWideCString, szItem5.newWideCString, szItem6.newWideCString, szItem7.newWideCString, szItem8.newWideCString) 
proc auWinMinimizeAll*() {.AutoIt, importc: "AU3_WinMinimizeAll"}
proc auWinMinimizeAllUndo*() {.AutoIt, importc: "AU3_WinMinimizeAllUndo"}
proc auWinMove_proto(szTitle: WideCString; szText: WideCString; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.AutoIt, importc: "AU3_WinMove"}
proc auWinMove*(szTitle: string; szText: string; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.inline discardable.} = 
    auWinMove_proto(szTitle.newWideCString, szText.newWideCString, nX, nY, nWidth, nHeight)
proc auWinMoveByHandle*(hWnd: int; nX: int; nY: int; nWidth: int = - 1; nHeight: int = - 1): int {.AutoIt, importc: "AU3_WinMoveByHandle"}
proc auWinSetOnTop_proto(szTitle: WideCString; szText: WideCString; nFlag: int): int {.AutoIt, importc: "AU3_WinSetOnTop"}
proc auWinSetOnTop*(szTitle: string; szText: string; nFlag: int): int {.inline discardable.} = 
    auWinSetOnTop_proto(szTitle.newWideCString, szText.newWideCString, nFlag)
proc auWinSetOnTopByHandle*(hWnd: int; nFlag: int): int {.AutoIt, importc: "AU3_WinSetOnTopByHandle"}
proc auWinSetState_proto(szTitle: WideCString; szText: WideCString; nFlags: int): int {.AutoIt, importc: "AU3_WinSetState"}
proc auWinSetState*(szTitle: string; szText: string; nFlags: int): int {.inline discardable.} = 
    auWinSetState_proto(szTitle.newWideCString, szText.newWideCString, nFlags)
proc auWinSetStateByHandle*(hWnd: int; nFlags: int): int {.AutoIt, importc: "AU3_WinSetStateByHandle"}
proc auWinSetTitle_proto(szTitle: WideCString; szText: WideCString; szNewTitle: WideCString): int {. AutoIt, importc: "AU3_WinSetTitle"}
proc auWinSetTitle*(szTitle: string; szText: string; szNewTitle: string): int {.inline discardable.} = 
    auWinSetTitle_proto(szTitle.newWideCString, szText.newWideCString, szNewTitle.newWideCString) 
proc auWinSetTitleByHandle_proto(hWnd: int; szNewTitle: WideCString): int {.AutoIt, importc: "AU3_WinSetTitleByHandle"}
proc auWinSetTitleByHandle*(hWnd: int; szNewTitle: string): int {.inline discardable.} = 
    auWinSetTitleByHandle_proto(hWnd, szNewTitle.newWideCString) 
proc auWinSetTrans_proto(szTitle: WideCString; szText: WideCString; nTrans: int): int {.AutoIt, importc: "AU3_WinSetTrans"}
proc auWinSetTrans*(szTitle: string; szText: string; nTrans: int): int {.inline discardable.} = 
    auWinSetTrans_proto(szTitle.newWideCString, szText.newWideCString, nTrans)
proc auWinSetTransByHandle*(hWnd: int; nTrans: int): int {.AutoIt, importc: "AU3_WinSetTransByHandle"}
proc auWinWait_proto(szTitle: WideCString; szText: WideCString; nTimeout: int = 0): int {.AutoIt, importc: "AU3_WinWait"}
proc auWinWait*(szTitle: string; szText= ""; nTimeout: int = 0): int {.inline discardable.} = 
    auWinWait_proto(szTitle.newWideCString, szText.newWideCString, nTimeout)
proc auWinWaitByHandle*(hWnd: int; nTimeout: int = 0): int {.AutoIt, importc: "AU3_WinWaitByHandle"}
proc auWinWaitActive_proto(szTitle: WideCString; szText: WideCString; nTimeout: int = 0): int {. AutoIt, importc: "AU3_WinWaitActive"}
proc auWinWaitActive*(szTitle: string; szText = ""; nTimeout: int = 0): int {.inline discardable.} = 
    auWinWaitActive_proto(szTitle.newWideCString, szText.newWideCString, nTimeout)
proc auWinWaitActiveByHandle*(hWnd: int; nTimeout: int): int {.AutoIt, importc: "AU3_WinWaitActiveByHandle"}
proc auWinWaitClose_proto(szTitle: WideCString; szText: WideCString; nTimeout: int = 0): int {. AutoIt, importc: "AU3_WinWaitClose"}
proc auWinWaitClose*(szTitle: string; szText = ""; nTimeout: int = 0): int {.inline discardable.} = 
    auWinWaitClose_proto(szTitle.newWideCString, szText.newWideCString, nTimeout)
proc auWinWaitCloseByHandle*(hWnd: int; nTimeout: int): int {.AutoIt, importc: "AU3_WinWaitCloseByHandle"}
proc auWinWaitNotActive_proto(szTitle: WideCString; szText: WideCString; nTimeout: int): int {. AutoIt, importc: "AU3_WinWaitNotActive"}
proc auWinWaitNotActive*(szTitle: string; szText = ""; nTimeout: int = 0): int {.inline discardable.} = 
    auWinWaitNotActive_proto(szTitle.newWideCString, szText.newWideCString, nTimeout)
proc auWinWaitNotActiveByHandle*(hWnd: int; nTimeout: int = 0): int {.AutoIt, importc: "AU3_WinWaitNotActiveByHandle"}

#/////////////////////////////////////////////////////////////////////////////