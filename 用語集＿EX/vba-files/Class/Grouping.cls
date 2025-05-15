VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Grouping"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'ArrayListの宣言

aList As Object
col_rang As Integer
col As Variant

'コンストラクタ VBAのコンストラクタは引数を使えない
Private Sub Class_Initialize()

Set aList = CreateObject("System.Collections.ArrayList")

End Sub

Private Sub Class_Terminate()

Set aList = Nothing

End Sub


Sub class_Init(kaisi As String)

    Dim i As Integer

    '起点になる先頭列の判定 100列まで
    For i = 1 To 100 Step 1

    If Cells(4, i).Value = kaisi Then

    aList.Add (i)
    
    End If

    Next

End Sub


Public Sub col_Grouping(col_rang As Integer)
      
    '列のグループ化'
    Dim con As Integer

    For Each col In aList
    
        Debug.Print col + col_rang
        Columns(col + col_rang).Group
        '条件に当てはまる列＝col　、　グループ化範囲＝2
        
        ' 前の列もグループ化
        If col > 1 Then ' colが1より大きい場合のみ前の列をグループ化
        
            Columns(col + col_rang - 1).Group
            
            Else
            
            Columns(2).Group
        
        End If
    
    Next
    
End Sub

Sub col_Grouping_Reset()

Dim i As Integer

    For i = 1 To 100
    
        On Error Resume Next
        'Debug.Print col + col_rang
        Columns(i).Ungroup
        
    Next i
    
        On Error GoTo 0

End Sub
