VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Option Explicit
Sub guroup()

'Dim oya As String
'oya = "親カテゴリ"
'
'Dim aList As Object
'Set aList = CreateObject("System.Collections.ArrayList")
'Dim i As Integer
'
'    '列の判定’
'    For i = 1 To 100 Step 1
'
'    If Cells(1, i).Value = oya Then
'
'    aList.Add (i)
'    'Debug.Print aList.Item(aList.Count - 1)
'
'    End If
'
'    Next
'
'    '列のグループの初期化
'
'    On Error Resume Next
'    Column(col + 2).ShowDetail = True
'    On Error GoTo 0
'
'    '列のグループ化'
'    Dim col, con As Integer
'
'    For Each col In aList
'
'    Columns(col + 2).Group
'    'グループ化したい列範囲の最後の列から＋1した列を基準にグループ化する
'    '条件に当てはまる列＝col　、　グループ化範囲＝2
'
'    Next

Dim col_Group As Grouping
Set col_Group = New Grouping
    
    col_Group.class_Init ("親カテゴリ")
    col_Group.col_Grouping (2)
        

    Set col_Group = Nothing
    End Sub


Sub reset()

Dim col_Group As Grouping
Set col_Group = New Grouping
    
    col_Group.class_Init ("親カテゴリ")
    col_Group.col_Grouping_Reset
    
     Set col_Group = Nothing
     
End Sub

Sub ins()



End Sub
