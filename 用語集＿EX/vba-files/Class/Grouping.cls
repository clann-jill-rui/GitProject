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

Public aList As Object
Public col_rang As Integer
Public col As Variant

'-------------------------------------------
'コンストラクタ VBAのコンストラクタは引数を使えない
Private Sub class_initialize()

    Set aList = CreateObject("System.Collections.ArrayList")
    
End Sub
'-------------------------------------------

'-------------------------------------------
'デストラクタ　ArrayListをNothing
Private Sub Class_Terminate()

    Set aList = Nothing

End Sub
'-------------------------------------------

'-------------------------------------------
'初期化処理

Sub class_Init(kaisi As String, start As Integer, zoubun As Integer)

    Dim i As Integer
    

        For i = 0 To 50 Step 1
    
            If aList.Count = 0 Then
                    
                aList.Add (start)
                'Debug.Print aList(i)
                
            ElseIf Cells(4, start + (zoubun * i)).Value = kaisi Then
                
                aList.Add (start + (zoubun * i))
                'Debug.Print aList(i)
        
        End If

    Next i

End Sub
'-------------------------------------------

'-------------------------------------------
'列のグループ化メソッド

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
'-------------------------------------------

'-------------------------------------------
'列のグループ化解除メソッド

Sub col_Grouping_Reset()

Dim i As Integer

    For i = 1 To 100
    
        On Error Resume Next
        'Debug.Print col + col_rang
        Columns(i).Ungroup
        
    Next i
    
        On Error GoTo 0

End Sub
'-------------------------------------------

'-------------------------------------------
'親カテゴリのハイパーリンク生成

Sub hyLinkCreate(sheetNumber As Integer, kaisi_Link As String, row As Integer, col As Integer)
    'row=行 ,col(column)=列

    Dim i As Variant
    Dim c As Integer: c = 0

    On Error GoTo Ehandle
    'エラーハンドル　Ehandle　にジャンプ

        For Each i In aList

            '行末に　スペース＋_　でコード内の改行
            'メソッドの引数に()を付ける場合、Callステートメントが必要
        
            Call ThisWorkbook.Worksheets(sheetNumber).Hyperlinks.Add( _
            Anchor:=ThisWorkbook.Worksheets(sheetNumber).Cells(row + c, col), _
            Address:="", _
            SubAddress:=ThisWorkbook.Worksheets(sheetNumber).Cells(row + 1, i).Address, _
            TextToDisplay:=ThisWorkbook.Worksheets(sheetNumber).Cells(row + 1, i).Value)
            
            'Worksheet.Hyperlinkオブジェクトの.Addメソッドでリンクを生成
            'anchor = ,Address= ,SubAddress=,TextToDisplay=

        c = c + 1
        
        Next i

    Exit Sub
    
Ehandle:
        

End Sub
'-------------------------------------------
