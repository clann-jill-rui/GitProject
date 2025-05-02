Attribute VB_Name = "Module2"
Option Explicit

Sub test2()

Dim Mojiretsu As String
Mojiretsu = "mojiretsu"

Dim Seisu2 As Integer
    Seisu2 = 1

Dim Seisu4 As Long
    Seisu4 = 114514

Dim tanseido_Syousu As Single
    tanseido_Syousu = 1.1

Dim baiseido_Syousu As Single
    baiseido_Syousu = 893.364364111111

Dim okane As Currency
    okane = 100

'Dim hiduke As Date
'    hiduke = Application.WorksheetFunction.today()

Dim singi As Boolean
    singi = True

'Dim obj As Object
'    obj = ThisWorkbook

Dim Val As Variant
    Val = "aaaaa"

Dim arg(10) As Variant

Dim i As Long
For i = 0 To 10
    'Debug.Print i
    arg(i) = i + 1
    'Debug.Print arg(i)
    ActiveWorkbook.Worksheets(1).Cells(i, i + 1).value = arg(i).value
Next i

End Sub
