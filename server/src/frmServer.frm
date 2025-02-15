VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmServer 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Loading..."
   ClientHeight    =   7695
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   13560
   BeginProperty Font 
      Name            =   "Verdana"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmServer.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7695
   ScaleWidth      =   13560
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton frmControl 
      Caption         =   "Controle"
      Height          =   495
      Left            =   3240
      TabIndex        =   51
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Frame Frame3 
      Caption         =   "Controle"
      Height          =   3375
      Left            =   6840
      TabIndex        =   31
      Top             =   120
      Width           =   6615
      Begin VB.Frame fraVip 
         Caption         =   "Vip Points"
         Height          =   1215
         Left            =   3120
         TabIndex        =   47
         Top             =   2040
         Width           =   3375
         Begin VB.TextBox txtQuant 
            Alignment       =   2  'Center
            Height          =   375
            Left            =   1920
            TabIndex        =   50
            Text            =   "0"
            Top             =   240
            Width           =   1335
         End
         Begin VB.CommandButton SendVPt 
            Caption         =   "Send Points"
            Height          =   255
            Left            =   600
            TabIndex        =   49
            Top             =   720
            Width           =   1815
         End
         Begin VB.TextBox txtVip 
            Height          =   375
            Left            =   120
            TabIndex        =   48
            Top             =   240
            Width           =   1695
         End
      End
      Begin VB.Frame fraServer 
         Caption         =   "Server"
         Height          =   1815
         Left            =   3120
         TabIndex        =   43
         Top             =   240
         Width           =   1815
         Begin VB.CommandButton cmdShutDown 
            Caption         =   "Shut Down"
            Height          =   375
            Left            =   120
            TabIndex        =   46
            Top             =   240
            Width           =   1575
         End
         Begin VB.CommandButton cmdExit 
            Caption         =   "Exit"
            Height          =   375
            Left            =   120
            TabIndex        =   45
            Top             =   720
            Width           =   1575
         End
         Begin VB.CheckBox chkServerLog 
            Caption         =   "Server Log"
            Height          =   255
            Left            =   120
            TabIndex        =   44
            Top             =   1200
            Width           =   1575
         End
      End
      Begin VB.Frame fraDatabase 
         Caption         =   "Reload"
         Height          =   3015
         Left            =   120
         TabIndex        =   32
         Top             =   240
         Width           =   2895
         Begin VB.CommandButton CmdReloadOrgShop 
            Caption         =   "OrgShop"
            Height          =   375
            Left            =   1440
            TabIndex        =   42
            Top             =   2160
            Width           =   1215
         End
         Begin VB.CommandButton cmdReloadClasses 
            Caption         =   "Classes"
            Height          =   375
            Left            =   120
            TabIndex        =   41
            Top             =   240
            Width           =   1215
         End
         Begin VB.CommandButton cmdReloadMaps 
            Caption         =   "Maps"
            Height          =   375
            Left            =   120
            TabIndex        =   40
            Top             =   720
            Width           =   1215
         End
         Begin VB.CommandButton CmdReloadSpells 
            Caption         =   "Spells"
            Height          =   375
            Left            =   120
            TabIndex        =   39
            Top             =   1200
            Width           =   1215
         End
         Begin VB.CommandButton cmdReloadShops 
            Caption         =   "Shops"
            Height          =   375
            Left            =   120
            TabIndex        =   38
            Top             =   1680
            Width           =   1215
         End
         Begin VB.CommandButton cmdReloadNPCs 
            Caption         =   "Npcs"
            Height          =   375
            Left            =   120
            TabIndex        =   37
            Top             =   2160
            Width           =   1215
         End
         Begin VB.CommandButton cmdReloadItems 
            Caption         =   "Items"
            Height          =   375
            Left            =   1440
            TabIndex        =   36
            Top             =   240
            Width           =   1215
         End
         Begin VB.CommandButton cmdReloadResources 
            Caption         =   "Resources"
            Height          =   375
            Left            =   1440
            TabIndex        =   35
            Top             =   720
            Width           =   1215
         End
         Begin VB.CommandButton cmdReloadAnimations 
            Caption         =   "Animations"
            Height          =   375
            Left            =   1440
            TabIndex        =   34
            Top             =   1200
            Width           =   1215
         End
         Begin VB.CommandButton cmdReloadQuests 
            Caption         =   "Quests"
            Height          =   375
            Left            =   1440
            TabIndex        =   33
            Top             =   1680
            Width           =   1215
         End
      End
   End
   Begin VB.Frame frmPlayers 
      Caption         =   "Jogadores"
      Height          =   3375
      Left            =   120
      TabIndex        =   29
      Top             =   4200
      Width           =   6615
      Begin MSComctlLib.ListView lvwInfo 
         Height          =   3015
         Left            =   120
         TabIndex        =   30
         Top             =   240
         Width           =   6375
         _ExtentX        =   11245
         _ExtentY        =   5318
         View            =   3
         Arrange         =   1
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Index"
            Object.Width           =   1147
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "IP Address"
            Object.Width           =   3175
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Account"
            Object.Width           =   3175
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Character"
            Object.Width           =   2999
         EndProperty
      End
   End
   Begin VB.CommandButton btnPlayers 
      Caption         =   "Jogadores"
      Height          =   495
      Left            =   1680
      TabIndex        =   28
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Frame frmConsole 
      Caption         =   "Console"
      Height          =   3375
      Left            =   120
      TabIndex        =   23
      Top             =   120
      Width           =   6615
      Begin VB.TextBox txtChat 
         Appearance      =   0  'Flat
         Height          =   375
         Left            =   120
         TabIndex        =   25
         Top             =   2880
         Width           =   6255
      End
      Begin VB.TextBox txtText 
         Appearance      =   0  'Flat
         Height          =   2175
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   24
         Top             =   600
         Width           =   6255
      End
      Begin VB.Label lblCpsLock 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         Caption         =   "[Unlock]"
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   120
         TabIndex        =   27
         Top             =   240
         Width           =   720
      End
      Begin VB.Label lblCPS 
         Caption         =   "CPS: 0"
         Height          =   255
         Left            =   960
         TabIndex        =   26
         Top             =   240
         Width           =   1815
      End
   End
   Begin VB.CommandButton btnConsole 
      Caption         =   "Console"
      Height          =   495
      Left            =   120
      TabIndex        =   22
      Top             =   3600
      Width           =   1455
   End
   Begin VB.Frame Frame2 
      Caption         =   "Outros"
      Height          =   975
      Left            =   6840
      TabIndex        =   11
      Top             =   6360
      Width           =   6255
      Begin VB.HScrollBar ScrlTimer 
         Height          =   255
         Index           =   5
         Left            =   2760
         Max             =   240
         Min             =   1
         TabIndex        =   16
         Top             =   240
         Value           =   1
         Width           =   495
      End
      Begin VB.HScrollBar ScrlTimer 
         Height          =   255
         Index           =   4
         Left            =   1440
         Max             =   240
         Min             =   1
         TabIndex        =   15
         Top             =   600
         Value           =   1
         Width           =   495
      End
      Begin VB.HScrollBar ScrlTimer 
         Height          =   255
         Index           =   3
         Left            =   1440
         Max             =   240
         Min             =   1
         TabIndex        =   14
         Top             =   240
         Value           =   1
         Width           =   495
      End
      Begin VB.HScrollBar ScrlTimer 
         Height          =   255
         Index           =   2
         Left            =   120
         Max             =   240
         Min             =   1
         TabIndex        =   13
         Top             =   600
         Value           =   1
         Width           =   495
      End
      Begin VB.HScrollBar ScrlTimer 
         Height          =   255
         Index           =   1
         Left            =   120
         Max             =   240
         Min             =   1
         TabIndex        =   12
         Top             =   240
         Value           =   1
         Width           =   495
      End
      Begin VB.Timer TmrNoticias 
         Interval        =   60000
         Left            =   5760
         Top             =   480
      End
      Begin VB.Label lblTimer 
         Caption         =   "T5: 1"
         Height          =   255
         Index           =   5
         Left            =   3360
         TabIndex        =   21
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblTimer 
         Caption         =   "T4: 1"
         Height          =   255
         Index           =   4
         Left            =   2040
         TabIndex        =   20
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblTimer 
         Caption         =   "T3: 1"
         Height          =   255
         Index           =   3
         Left            =   2040
         TabIndex        =   19
         Top             =   240
         Width           =   735
      End
      Begin VB.Label lblTimer 
         Caption         =   "T2: 1"
         Height          =   255
         Index           =   2
         Left            =   720
         TabIndex        =   18
         Top             =   600
         Width           =   735
      End
      Begin VB.Label lblTimer 
         Caption         =   "T1: 1"
         Height          =   255
         Index           =   1
         Left            =   720
         TabIndex        =   17
         Top             =   240
         Width           =   735
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Noticias"
      Height          =   2055
      Left            =   6840
      TabIndex        =   0
      Top             =   4200
      Width           =   6255
      Begin VB.CheckBox Check1 
         Caption         =   "chkNtc"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   10
         Top             =   1680
         Width           =   255
      End
      Begin VB.CheckBox Check1 
         Caption         =   "chkNtc"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   9
         Top             =   1320
         Width           =   255
      End
      Begin VB.CheckBox Check1 
         Caption         =   "chkNtc"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   8
         Top             =   960
         Width           =   255
      End
      Begin VB.CheckBox Check1 
         Caption         =   "chkNtc"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   7
         Top             =   600
         Width           =   255
      End
      Begin VB.CheckBox Check1 
         Caption         =   "chkNtc"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   255
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Index           =   5
         Left            =   360
         TabIndex        =   5
         Text            =   "txtNtc"
         Top             =   1680
         Width           =   5775
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Index           =   4
         Left            =   360
         TabIndex        =   4
         Text            =   "txtNtc"
         Top             =   1320
         Width           =   5775
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Index           =   3
         Left            =   360
         TabIndex        =   3
         Text            =   "txtNtc"
         Top             =   960
         Width           =   5775
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Index           =   2
         Left            =   360
         TabIndex        =   2
         Text            =   "txtNtc"
         Top             =   600
         Width           =   5775
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Index           =   1
         Left            =   360
         TabIndex        =   1
         Text            =   "txtNtc"
         Top             =   240
         Width           =   5775
      End
   End
   Begin MSWinsockLib.Winsock Socket 
      Index           =   0
      Left            =   7560
      Top             =   3600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Menu mnuKick 
      Caption         =   "&Kick"
      Visible         =   0   'False
      Begin VB.Menu mnuKickPlayer 
         Caption         =   "Kick"
      End
      Begin VB.Menu mnuDisconnectPlayer 
         Caption         =   "Disconnect"
      End
      Begin VB.Menu mnuBanPlayer 
         Caption         =   "Ban"
      End
      Begin VB.Menu mnuAdminPlayer 
         Caption         =   "Make Admin"
      End
      Begin VB.Menu mnuRemoveAdmin 
         Caption         =   "Remove Admin"
      End
   End
End
Attribute VB_Name = "frmServer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Check1_Click(Index As Integer)
    NotTick(Index) = NotVInicial(Index)
End Sub

Private Sub CmdReloadOrgShop_Click()
Dim i As Long

    Call LoadOrgShop
    For i = 1 To Player_HighIndex
        Call SendOrgShop(i)
    Next
End Sub

Private Sub cmdReloadQuests_Click()
    Dim i As Long
    Call LoadQuests
    Call TextAdd("All quests reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            SendQuests i
        End If
    Next
End Sub

Private Sub lblCPSLock_Click()
    If CPSUnlock Then
        CPSUnlock = False
        lblCpsLock.Caption = "[Unlock]"
    Else
        CPSUnlock = True
        lblCpsLock.Caption = "[Lock]"
    End If
End Sub

Private Sub ScrlTimer_Change(Index As Integer)
    lblTimer(Index).Caption = "T" & Index & ": " & ScrlTimer(Index).Value
    NotVInicial(Index) = ScrlTimer(Index).Value
End Sub

Private Sub SendVPt_Click()
Dim Name As String

Name = FindPlayer(txtVip.Text)

If txtVip = vbNullString Then Exit Sub

If Name Then
    Player(Trim$(Name)).VipPoints = Player(Trim$(Name)).VipPoints + frmServer.txtQuant.Text
    SendNoticia "O Jogador: " & Trim$(Player(Name).Name) & " Adiquiriu: " & Player(Trim$(Name)).VipPoints & " Pontos Vip.", Yellow
    PlayerMsg Name, "Voc� obteve: " & Player(Trim$(Name)).VipPoints & " pontos vip.", Green
    SendPlayerData Name
    SendVipPointsInfo Name
Else
    Call MsgBox("Jogador n�o est� online!", vbOKOnly)
End If

End Sub

' ********************
' ** Winsock object **
' ********************
Private Sub Socket_ConnectionRequest(Index As Integer, ByVal requestID As Long)
    Call AcceptConnection(Index, requestID)
End Sub

Private Sub Socket_Accept(Index As Integer, SocketId As Integer)
    Call AcceptConnection(Index, SocketId)
End Sub

Private Sub Socket_DataArrival(Index As Integer, ByVal bytesTotal As Long)

    If IsConnected(Index) Then
        Call IncomingData(Index, bytesTotal)
    End If

End Sub

Private Sub Socket_Close(Index As Integer)
    Call CloseSocket(Index)
End Sub

' ********************
Private Sub chkServerLog_Click()

    ' if its not 0, then its true
    If Not chkServerLog.Value Then
        ServerLog = True
    End If

End Sub

Private Sub cmdExit_Click()
    Call DestroyServer
End Sub

Private Sub cmdReloadClasses_Click()
Dim i As Long
    Call LoadClasses
    Call TextAdd("All classes reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            SendClasses i
        End If
    Next
End Sub

Private Sub cmdReloadItems_Click()
Dim i As Long
    Call LoadItems
    Call TextAdd("All items reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            SendItems i
        End If
    Next
End Sub

Private Sub cmdReloadMaps_Click()
Dim i As Long
    Call LoadMaps
    Call TextAdd("All maps reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            PlayerWarp i, GetPlayerMap(i), GetPlayerX(i), GetPlayerY(i)
        End If
    Next
End Sub

Private Sub cmdReloadNPCs_Click()
Dim i As Long
    Call LoadNpcs
    Call TextAdd("All npcs reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            SendNpcs i
        End If
    Next
End Sub

Private Sub cmdReloadShops_Click()
Dim i As Long
    Call LoadShops
    Call TextAdd("All shops reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            SendShops i
        End If
    Next
End Sub

Private Sub cmdReloadSpells_Click()
Dim i As Long
    Call LoadSpells
    Call TextAdd("All spells reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            SendSpells i
        End If
    Next
End Sub

Private Sub cmdReloadResources_Click()
Dim i As Long
    Call LoadResources
    Call TextAdd("All Resources reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            SendResources i
        End If
    Next
End Sub

Private Sub cmdReloadAnimations_Click()
Dim i As Long
    Call LoadAnimations
    Call TextAdd("All Animations reloaded.")
    For i = 1 To Player_HighIndex
        If IsPlaying(i) Then
            SendAnimations i
        End If
    Next
End Sub

Private Sub cmdShutDown_Click()
    If isShuttingDown Then
        isShuttingDown = False
        cmdShutDown.Caption = "Shutdown"
        GlobalMsg "Shutdown canceled.", BrightBlue
    Else
        isShuttingDown = True
        cmdShutDown.Caption = "Cancel"
    End If
End Sub

Private Sub Form_Load()
    Call UsersOnline_Start
End Sub

Private Sub Form_Resize()

    If frmServer.WindowState = vbMinimized Then
        frmServer.Hide
    End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
    Cancel = True
    Call DestroyServer
End Sub

Private Sub lvwInfo_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)

    'When a ColumnHeader object is clicked, the ListView control is sorted by the subitems of that column.
    'Set the SortKey to the Index of the ColumnHeader - 1
    'Set Sorted to True to sort the list.
    If lvwInfo.SortOrder = lvwAscending Then
        lvwInfo.SortOrder = lvwDescending
    Else
        lvwInfo.SortOrder = lvwAscending
    End If

    lvwInfo.SortKey = ColumnHeader.Index - 1
    lvwInfo.Sorted = True
End Sub


Private Sub TmrNoticias_Timer()
Dim i As Long
  
    For i = 1 To 5
        If Check1(i).Value = 1 Then
            If NotVInicial(i) > 0 Then
                If NotTick(i) <= 0 Then
                    NotTick(i) = NotVInicial(i)
                    SendNoticia Text1(i), Yellow
                Else
                    NotTick(i) = NotTick(i) - 1
                End If
            End If
        End If
    Next
End Sub

Private Sub txtText_GotFocus()
    txtChat.SetFocus
End Sub

Private Sub txtChat_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        If LenB(Trim$(txtChat.Text)) > 0 Then
            Call SendNoticia(txtChat.Text, White)
            Call GlobalMsg(txtChat.Text, White)
            Call TextAdd("Server: " & txtChat.Text)
            txtChat.Text = vbNullString
        End If

        KeyAscii = 0
    End If

End Sub

Sub UsersOnline_Start()
    Dim i As Long

    For i = 1 To MAX_PLAYERS
        frmServer.lvwInfo.ListItems.Add (i)

        If i < 10 Then
            frmServer.lvwInfo.ListItems(i).Text = "00" & i
        ElseIf i < 100 Then
            frmServer.lvwInfo.ListItems(i).Text = "0" & i
        Else
            frmServer.lvwInfo.ListItems(i).Text = i
        End If

        frmServer.lvwInfo.ListItems(i).SubItems(1) = vbNullString
        frmServer.lvwInfo.ListItems(i).SubItems(2) = vbNullString
        frmServer.lvwInfo.ListItems(i).SubItems(3) = vbNullString
    Next

End Sub

Private Sub lvwInfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

    If Button = vbRightButton Then
        PopupMenu mnuKick
    End If

End Sub

Private Sub mnuKickPlayer_Click()
    Dim Name As String
    Name = frmServer.lvwInfo.SelectedItem.SubItems(3)

    If Not Name = "Not Playing" Then
        Call AlertMsg(FindPlayer(Name), "You have been kicked by the server owner!")
    End If

End Sub

Sub mnuDisconnectPlayer_Click()
    Dim Name As String
    Name = frmServer.lvwInfo.SelectedItem.SubItems(3)

    If Not Name = "Not Playing" Then
        CloseSocket (FindPlayer(Name))
    End If

End Sub

Sub mnuBanPlayer_click()
    Dim Name As String
    Name = frmServer.lvwInfo.SelectedItem.SubItems(3)

    If Not Name = "Not Playing" Then
        Call ServerBanIndex(FindPlayer(Name))
    End If

End Sub

Sub mnuAdminPlayer_click()
    Dim Name As String
    Name = frmServer.lvwInfo.SelectedItem.SubItems(3)

    If Not Name = "Not Playing" Then
        Call SetPlayerAccess(FindPlayer(Name), 4)
        Call SendPlayerData(FindPlayer(Name))
        Call PlayerMsg(FindPlayer(Name), "You have been granted administrator access.", BrightCyan)
    End If

End Sub

Sub mnuRemoveAdmin_click()
    Dim Name As String
    Name = frmServer.lvwInfo.SelectedItem.SubItems(3)

    If Not Name = "Not Playing" Then
        Call SetPlayerAccess(FindPlayer(Name), 0)
        Call SendPlayerData(FindPlayer(Name))
        Call PlayerMsg(FindPlayer(Name), "You have had your administrator access revoked.", BrightRed)
    End If

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim lmsg As Long
    lmsg = X / Screen.TwipsPerPixelX

    Select Case lmsg
        Case WM_LBUTTONDBLCLK
            frmServer.WindowState = vbNormal
            frmServer.Show
            txtText.SelStart = Len(txtText.Text)
    End Select

End Sub
