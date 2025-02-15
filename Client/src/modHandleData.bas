Attribute VB_Name = "modHandleData"
Option Explicit

' ******************************************
' ** Parses and handles String packets    **
' ******************************************
Public Function GetAddress(FunAddr As Long) As Long
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    GetAddress = FunAddr

    ' Error handler
    Exit Function
errorhandler:
    HandleError "GetAddress", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Function
End Function

Public Sub InitMessages()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    HandleDataSub(SAlertMsg) = GetAddress(AddressOf HandleAlertMsg)
    HandleDataSub(SLoginOk) = GetAddress(AddressOf HandleLoginOk)
    HandleDataSub(SNewCharClasses) = GetAddress(AddressOf HandleNewCharClasses)
    HandleDataSub(SClassesData) = GetAddress(AddressOf HandleClassesData)
    HandleDataSub(SInGame) = GetAddress(AddressOf HandleInGame)
    HandleDataSub(SPlayerInv) = GetAddress(AddressOf HandlePlayerInv)
    HandleDataSub(SPlayerInvUpdate) = GetAddress(AddressOf HandlePlayerInvUpdate)
    HandleDataSub(SPlayerWornEq) = GetAddress(AddressOf HandlePlayerWornEq)
    HandleDataSub(SPlayerHp) = GetAddress(AddressOf HandlePlayerHp)
    HandleDataSub(SPlayerMp) = GetAddress(AddressOf HandlePlayerMp)
    HandleDataSub(SPlayerStats) = GetAddress(AddressOf HandlePlayerStats)
    HandleDataSub(SPlayerData) = GetAddress(AddressOf HandlePlayerData)
    HandleDataSub(SPlayerMove) = GetAddress(AddressOf HandlePlayerMove)
    HandleDataSub(SNpcMove) = GetAddress(AddressOf HandleNpcMove)
    HandleDataSub(SPlayerDir) = GetAddress(AddressOf HandlePlayerDir)
    HandleDataSub(SNpcDir) = GetAddress(AddressOf HandleNpcDir)
    HandleDataSub(SPlayerXY) = GetAddress(AddressOf HandlePlayerXY)
    HandleDataSub(SPlayerXYMap) = GetAddress(AddressOf HandlePlayerXYMap)
    HandleDataSub(SAttack) = GetAddress(AddressOf HandleAttack)
    HandleDataSub(SNpcAttack) = GetAddress(AddressOf HandleNpcAttack)
    HandleDataSub(SCheckForMap) = GetAddress(AddressOf HandleCheckForMap)
    HandleDataSub(SMapData) = GetAddress(AddressOf HandleMapData)
    HandleDataSub(SMapItemData) = GetAddress(AddressOf HandleMapItemData)
    HandleDataSub(SMapNpcData) = GetAddress(AddressOf HandleMapNpcData)
    HandleDataSub(SMapDone) = GetAddress(AddressOf HandleMapDone)
    HandleDataSub(SGlobalMsg) = GetAddress(AddressOf HandleGlobalMsg)
    HandleDataSub(SAdminMsg) = GetAddress(AddressOf HandleAdminMsg)
    HandleDataSub(SPlayerMsg) = GetAddress(AddressOf HandlePlayerMsg)
    HandleDataSub(SMapMsg) = GetAddress(AddressOf HandleMapMsg)
    HandleDataSub(SSpawnItem) = GetAddress(AddressOf HandleSpawnItem)
    HandleDataSub(SItemEditor) = GetAddress(AddressOf HandleItemEditor)
    HandleDataSub(SUpdateItem) = GetAddress(AddressOf HandleUpdateItem)
    HandleDataSub(SSpawnNpc) = GetAddress(AddressOf HandleSpawnNpc)
    HandleDataSub(SNpcDead) = GetAddress(AddressOf HandleNpcDead)
    HandleDataSub(SNpcEditor) = GetAddress(AddressOf HandleNpcEditor)
    HandleDataSub(SUpdateNpc) = GetAddress(AddressOf HandleUpdateNpc)
    HandleDataSub(SMapKey) = GetAddress(AddressOf HandleMapKey)
    HandleDataSub(SEditMap) = GetAddress(AddressOf HandleEditMap)
    HandleDataSub(SShopEditor) = GetAddress(AddressOf HandleShopEditor)
    HandleDataSub(SUpdateShop) = GetAddress(AddressOf HandleUpdateShop)
    HandleDataSub(SSpellEditor) = GetAddress(AddressOf HandleSpellEditor)
    HandleDataSub(SUpdateSpell) = GetAddress(AddressOf HandleUpdateSpell)
    HandleDataSub(SSpells) = GetAddress(AddressOf HandleSpells)
    HandleDataSub(SLeft) = GetAddress(AddressOf HandleLeft)
    HandleDataSub(SResourceCache) = GetAddress(AddressOf HandleResourceCache)
    HandleDataSub(SResourceEditor) = GetAddress(AddressOf HandleResourceEditor)
    HandleDataSub(SUpdateResource) = GetAddress(AddressOf HandleUpdateResource)
    HandleDataSub(SSendPing) = GetAddress(AddressOf HandleSendPing)
    HandleDataSub(SDoorAnimation) = GetAddress(AddressOf HandleDoorAnimation)
    HandleDataSub(SActionMsg) = GetAddress(AddressOf HandleActionMsg)
    HandleDataSub(SPlayerEXP) = GetAddress(AddressOf HandlePlayerExp)
    HandleDataSub(SAnimationEditor) = GetAddress(AddressOf HandleAnimationEditor)
    HandleDataSub(SUpdateAnimation) = GetAddress(AddressOf HandleUpdateAnimation)
    HandleDataSub(SAnimation) = GetAddress(AddressOf HandleAnimation)
    HandleDataSub(SMapNpcVitals) = GetAddress(AddressOf HandleMapNpcVitals)
    HandleDataSub(SCooldown) = GetAddress(AddressOf HandleCooldown)
    HandleDataSub(SClearSpellBuffer) = GetAddress(AddressOf HandleClearSpellBuffer)
    HandleDataSub(SSayMsg) = GetAddress(AddressOf HandleSayMsg)
    HandleDataSub(SOpenShop) = GetAddress(AddressOf HandleOpenShop)
    HandleDataSub(SResetShopAction) = GetAddress(AddressOf HandleResetShopAction)
    HandleDataSub(SStunned) = GetAddress(AddressOf HandleStunned)
    HandleDataSub(SMapWornEq) = GetAddress(AddressOf HandleMapWornEq)
    HandleDataSub(SBank) = GetAddress(AddressOf HandleBank)
    HandleDataSub(STrade) = GetAddress(AddressOf HandleTrade)
    HandleDataSub(SCloseTrade) = GetAddress(AddressOf HandleCloseTrade)
    HandleDataSub(STradeUpdate) = GetAddress(AddressOf HandleTradeUpdate)
    HandleDataSub(STradeStatus) = GetAddress(AddressOf HandleTradeStatus)
    HandleDataSub(STarget) = GetAddress(AddressOf HandleTarget)
    HandleDataSub(SHotbar) = GetAddress(AddressOf HandleHotbar)
    HandleDataSub(SHighIndex) = GetAddress(AddressOf HandleHighIndex)
    HandleDataSub(SSound) = GetAddress(AddressOf HandleSound)
    HandleDataSub(STradeRequest) = GetAddress(AddressOf HandleTradeRequest)
    HandleDataSub(SPartyInvite) = GetAddress(AddressOf HandlePartyInvite)
    HandleDataSub(SPartyUpdate) = GetAddress(AddressOf HandlePartyUpdate)
    HandleDataSub(SPartyVitals) = GetAddress(AddressOf HandlePartyVitals)
    HandleDataSub(SPokemonEditor) = GetAddress(AddressOf HandlePokemonEditor)
    HandleDataSub(SUpdatePokemon) = GetAddress(AddressOf HandleUpdatePokemon)
    HandleDataSub(SPlayerPokedex) = GetAddress(AddressOf HandlePlayerPokedex)
    HandleDataSub(SPokeEvo) = GetAddress(AddressOf HandlePokeEvo)
    HandleDataSub(SFishing) = GetAddress(AddressOf handleInFishing)
    HandleDataSub(SUpdateQuest) = GetAddress(AddressOf HandleUpdateQuest)
    HandleDataSub(SQuestCommand) = GetAddress(AddressOf HandleQuestCommand)
    HandleDataSub(SQuestEditor) = GetAddress(AddressOf HandleQuestEditor)
    HandleDataSub(SDialogue) = GetAddress(AddressOf HandleDialogue)
    HandleDataSub(SLeiloar) = GetAddress(AddressOf HandleAttLeilao)
    HandleDataSub(SCChat) = GetAddress(AddressOf HandleCChat)
    HandleDataSub(SPokeSelect) = GetAddress(AddressOf handlePokeSelect)
    HandleDataSub(SSurfInit) = GetAddress(AddressOf HandleSendSurfInit)
    HandleDataSub(SUpdateRankLevel) = GetAddress(AddressOf HandleUpdateRankLevel)
    HandleDataSub(SCLutar) = GetAddress(AddressOf HandleCLuta)
    HandleDataSub(SArenas) = GetAddress(AddressOf HandleArenas)
    HandleDataSub(SAprender) = GetAddress(AddressOf HandleAprenderSpell)
    HandleDataSub(SNoticia) = GetAddress(AddressOf HandleNoticia)
    HandleDataSub(SOrganiza��o) = GetAddress(AddressOf HandleAttOrg)
    HandleDataSub(SOrgShop) = GetAddress(AddressOf HandleOrgShop)
    HandleDataSub(SChatBubble) = GetAddress(AddressOf HandleChatBubble)
    HandleDataSub(SVipInfo) = GetAddress(AddressOf HandleVipPlayerInfo)
    'HandleDataSub(SAparencia) = GetAddress(AddressOf HandleAparencia)
    HandleDataSub(SRunning) = GetAddress(AddressOf HandlePlayerRun)
    HandleDataSub(SComandGym) = GetAddress(AddressOf HandleComandoGym)
    HandleDataSub(SContagem) = GetAddress(AddressOf HandleContagem)

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "InitMessages", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleData(ByRef data() As Byte)
    Dim Buffer As clsBuffer
    Dim MsgType As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    MsgType = Buffer.ReadLong

    If MsgType < 0 Then
        DestroyGame
        Exit Sub
    End If

    If MsgType >= SMSG_COUNT Then
        DestroyGame
        Exit Sub
    End If

    CallWindowProc HandleDataSub(MsgType), MyIndex, Buffer.ReadBytes(Buffer.length), 0, 0

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleData", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleAlertMsg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Msg As String
    Dim Buffer As clsBuffer
    Dim i As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    frmLoad.Visible = False
    frmMenu.Visible = True
    frmMenu.picLogin.Visible = False
    frmMenu.picCharacter.Visible = False
    frmMenu.picRegister.Visible = False
    frmMenu.PicRecover.Visible = False
    frmMenu.PicNewPass.Visible = False
    frmMenu.picMain.Visible = True

    For i = 0 To 2
        frmMenu.txtRecover(i).text = vbNullString
    Next

    For i = 0 To 4
        frmMenu.txtNewPass(i).text = vbNullString
    Next

    Msg = Buffer.ReadString    'Parse(1)

    Set Buffer = Nothing
    Call MsgBox(Msg, vbOKOnly, Options.Game_Name)

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleAlertMsg", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleLoginOk(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    ' save options
    Options.SavePass = frmMenu.chkPass.value
    Options.Username = Trim$(frmMenu.txtLUser.text)

    If frmMenu.chkPass.value = 0 Then
        Options.Password = vbNullString
    Else
        Options.Password = Trim$(frmMenu.txtLPass.text)
    End If

    SaveOptions

    ' Now we can receive game data
    MyIndex = Buffer.ReadLong

    ' player high index
    Player_HighIndex = Buffer.ReadLong

    Set Buffer = Nothing
    frmLoad.Visible = True
    Call SetStatus("Receiving game data...")

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleLoginOk", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleNewCharClasses(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim i As Long
    Dim z As Long, X As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = 1
    ' Max classes
    Max_Classes = Buffer.ReadLong
    ReDim Class(1 To Max_Classes)
    n = n + 1

    For i = 1 To Max_Classes

        With Class(i)
            .Name = Buffer.ReadString
            .Vital(Vitals.HP) = Buffer.ReadLong
            .Vital(Vitals.MP) = Buffer.ReadLong

            ' get array size
            z = Buffer.ReadLong
            ' redim array
            ReDim .MaleSprite(0 To z)
            ' loop-receive data
            For X = 0 To z
                .MaleSprite(X) = Buffer.ReadLong
            Next

            ' get array size
            z = Buffer.ReadLong
            ' redim array
            ReDim .FemaleSprite(0 To z)
            ' loop-receive data
            For X = 0 To z
                .FemaleSprite(X) = Buffer.ReadLong
            Next

            For X = 1 To Stats.Stat_Count - 1
                .Stat(X) = Buffer.ReadLong
            Next
        End With

        n = n + 10
    Next

    Set Buffer = Nothing

    ' Used for if the player is creating a new character
    frmMenu.Visible = True
    frmMenu.picCharacter.Visible = True
    frmMenu.picLogin.Visible = False
    frmMenu.picRegister.Visible = False
    frmLoad.Visible = False
    frmMenu.cmbClass.Clear
    For i = 1 To Max_Classes
        frmMenu.cmbClass.AddItem Trim$(Class(i).Name)
    Next

    frmMenu.cmbClass.ListIndex = 0
    n = frmMenu.cmbClass.ListIndex + 1

    newCharSprite = 0
    NewCharacterBltSprite

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleNewCharClasses", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleClassesData(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim i As Long
    Dim z As Long, X As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = 1
    ' Max classes
    Max_Classes = Buffer.ReadLong    'CByte(Parse(n))
    ReDim Class(1 To Max_Classes)
    n = n + 1

    For i = 1 To Max_Classes

        With Class(i)
            .Name = Buffer.ReadString    'Trim$(Parse(n))
            .Vital(Vitals.HP) = Buffer.ReadLong    'CLng(Parse(n + 1))
            .Vital(Vitals.MP) = Buffer.ReadLong    'CLng(Parse(n + 2))

            ' get array size
            z = Buffer.ReadLong
            ' redim array
            ReDim .MaleSprite(0 To z)
            ' loop-receive data
            For X = 0 To z
                .MaleSprite(X) = Buffer.ReadLong
            Next

            ' get array size
            z = Buffer.ReadLong
            ' redim array
            ReDim .FemaleSprite(0 To z)
            ' loop-receive data
            For X = 0 To z
                .FemaleSprite(X) = Buffer.ReadLong
            Next

            For X = 1 To Stats.Stat_Count - 1
                .Stat(X) = Buffer.ReadLong
            Next
        End With

        n = n + 10
    Next

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleClassesData", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleInGame(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    InGame = True
    Call GameInit
    Call GameLoop

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleInGame", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandlePlayerInv(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim i As Long
    Dim X As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = 1

    For i = 1 To MAX_INV
        Call SetPlayerInvItemNum(MyIndex, i, Buffer.ReadLong)
        Call SetPlayerInvItemValue(MyIndex, i, Buffer.ReadLong)
        Call SetPlayerInvItemPokeInfoPokemon(MyIndex, i, Buffer.ReadLong)
        Call SetPlayerInvItemPokeInfoPokeball(MyIndex, i, Buffer.ReadLong)
        Call SetPlayerInvItemPokeInfoLevel(MyIndex, i, Buffer.ReadLong)
        Call SetPlayerInvItemPokeInfoExp(MyIndex, i, Buffer.ReadLong)

        For X = 1 To Vitals.Vital_Count - 1
            Call SetPlayerInvItemPokeInfoVital(MyIndex, i, Buffer.ReadLong, X)
            Call SetPlayerInvItemPokeInfoMaxVital(MyIndex, i, Buffer.ReadLong, X)
        Next

        For X = 1 To Stats.Stat_Count - 1
            Call SetPlayerInvItemPokeInfoStat(MyIndex, i, X, Buffer.ReadLong)
        Next

        For X = 1 To 4
            Call SetPlayerInvItemPokeInfoSpell(MyIndex, i, Buffer.ReadLong, X)
        Next

        For X = 1 To MAX_NEGATIVES
            Call SetPlayerInvItemNgt(MyIndex, i, X, Buffer.ReadLong)
        Next

        For X = 1 To MAX_BERRYS
            Call SetPlayerInvItemBerry(MyIndex, i, X, Buffer.ReadLong)
        Next

        Call SetPlayerInvItemFelicidade(MyIndex, i, Buffer.ReadLong)
        Call SetPlayerInvItemSexo(MyIndex, i, Buffer.ReadLong)
        Call SetPlayerInvItemShiny(MyIndex, i, Buffer.ReadLong)

        n = n + 2
    Next

    ' changes to inventory, need to clear any drop menu
    frmMain.picCurrency.Visible = False
    frmMain.txtCurrency.text = vbNullString
    tmpCurrencyItem = 0
    CurrencyMenu = 0    ' clear

    Set Buffer = Nothing
    BltInventory

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerInv", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandlePlayerInvUpdate(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long, X As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = Buffer.ReadLong    'CLng(Parse(1))
    Call SetPlayerInvItemNum(MyIndex, n, Buffer.ReadLong)    'CLng(Parse(2)))
    Call SetPlayerInvItemValue(MyIndex, n, Buffer.ReadLong)    'CLng(Parse(3)))

    Call SetPlayerInvItemPokeInfoPokemon(MyIndex, n, Buffer.ReadLong)
    Call SetPlayerInvItemPokeInfoPokeball(MyIndex, n, Buffer.ReadLong)
    Call SetPlayerInvItemPokeInfoLevel(MyIndex, n, Buffer.ReadLong)
    Call SetPlayerInvItemPokeInfoExp(MyIndex, n, Buffer.ReadLong)

    For X = 1 To Vitals.Vital_Count - 1
        Call SetPlayerInvItemPokeInfoVital(MyIndex, n, Buffer.ReadLong, X)
        Call SetPlayerInvItemPokeInfoMaxVital(MyIndex, n, Buffer.ReadLong, X)
    Next

    For X = 1 To Stats.Stat_Count - 1
        Call SetPlayerInvItemPokeInfoStat(MyIndex, n, X, Buffer.ReadLong)
    Next

    For X = 1 To 4
        Call SetPlayerInvItemPokeInfoSpell(MyIndex, n, Buffer.ReadLong, X)
    Next

    For X = 1 To MAX_NEGATIVES
        Call SetPlayerInvItemNgt(MyIndex, X, weapon, Buffer.ReadLong)
    Next

    For X = 1 To MAX_BERRYS
        Call SetPlayerInvItemBerry(MyIndex, n, X, Buffer.ReadLong)
    Next

    Call SetPlayerInvItemFelicidade(MyIndex, n, Buffer.ReadLong)
    Call SetPlayerInvItemSexo(MyIndex, n, Buffer.ReadLong)
    Call SetPlayerInvItemShiny(MyIndex, n, Buffer.ReadLong)

    ' changes, clear drop menu
    frmMain.picCurrency.Visible = False
    frmMain.txtCurrency.text = vbNullString
    tmpCurrencyItem = 0
    CurrencyMenu = 0    ' clear

    BltInventory
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerInvUpdate", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandlePlayerWornEq(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    'PokeInfo Armor
    Call SetPlayerEquipment(MyIndex, Buffer.ReadLong, Armor)

    'PokeInfo Weapon
    Call SetPlayerEquipment(MyIndex, Buffer.ReadLong, weapon)
    Call SetPlayerEquipmentPokeInfoPokemon(MyIndex, Buffer.ReadLong, weapon)
    Call SetPlayerEquipmentPokeInfoPokeball(MyIndex, Buffer.ReadLong, weapon)
    Call SetPlayerEquipmentPokeInfoLevel(MyIndex, Buffer.ReadLong, weapon)
    Call SetPlayerEquipmentPokeInfoExp(MyIndex, Buffer.ReadLong, weapon)

    For i = 1 To Vitals.Vital_Count - 1
        Call SetPlayerEquipmentPokeInfoVital(MyIndex, Buffer.ReadLong, weapon, i)
        Call SetPlayerEquipmentPokeInfoMaxVital(MyIndex, Buffer.ReadLong, weapon, i)
    Next

    For i = 1 To Stats.Stat_Count - 1
        Call SetPlayerEquipmentPokeInfoStat(MyIndex, Buffer.ReadLong, weapon, i)
    Next

    For i = 1 To 4
        Call SetPlayerEquipmentPokeInfoSpell(MyIndex, Buffer.ReadLong, weapon, i)
    Next

    For i = 1 To MAX_NEGATIVES
        Call SetPlayerEquipmentNgt(MyIndex, i, weapon, Buffer.ReadLong)
    Next

    For i = 1 To MAX_BERRYS
        Call SetPlayerEquipmentBerry(MyIndex, Buffer.ReadLong, weapon, i)
    Next

    Call SetPlayerEquipmentFelicidade(MyIndex, weapon, Buffer.ReadLong)
    Call SetPlayerEquipmentSexo(MyIndex, weapon, Buffer.ReadLong)
    Call SetPlayerEquipmentShiny(MyIndex, weapon, Buffer.ReadLong)

    'PokeInfo Helmet
    Call SetPlayerEquipment(MyIndex, Buffer.ReadLong, Helmet)

    'PokeInfo Shield
    Call SetPlayerEquipment(MyIndex, Buffer.ReadLong, Shield)

    ' changes to inventory, need to clear any drop menu
    frmMain.picCurrency.Visible = False
    frmMain.txtCurrency.text = vbNullString
    tmpCurrencyItem = 0
    CurrencyMenu = 0    ' clear

    If GetPlayerEquipmentPokeInfoPokemon(Index, weapon) > 0 Then
        For i = 1 To 4
            If GetPlayerEquipmentPokeInfoSpell(MyIndex, weapon, i) > 0 Then
                frmMain.lblPokeSpell(i).Caption = Trim$(Spell(GetPlayerEquipmentPokeInfoSpell(MyIndex, weapon, i)).Name)
            Else
                frmMain.lblPokeSpell(i).Caption = "Null"
            End If
            frmMain.PicPokeSpell(i).Visible = True
        Next

    Else
        For i = 1 To 4
            frmMain.PicPokeSpell(i).Visible = False
        Next
    End If

    If GetPlayerEquipmentPokeInfoPokemon(MyIndex, weapon) > 0 Then
        If GetPlayerEquipmentShiny(MyIndex, weapon) = 0 Then
            frmMain.lblCharName = Trim$(Pokemon(GetPlayerEquipmentPokeInfoPokemon(MyIndex, weapon)).Name)
        Else
            frmMain.lblCharName = "Shiny " & Trim$(Pokemon(GetPlayerEquipmentPokeInfoPokemon(MyIndex, weapon)).Name)
        End If
    Else
        ' Set the character windows
        frmMain.lblCharName = GetPlayerName(MyIndex)
    End If

    BltInventory
    BltEquipment
    BltPokeEquip

    'Resetar Anim
    Player(MyIndex).AnimFrame = 0
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerWornEq", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleMapWornEq(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim PlayerNum As Long
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer

    Buffer.WriteBytes data()

    PlayerNum = Buffer.ReadLong

    'PokeInfo Armor
    Call SetPlayerEquipment(PlayerNum, Buffer.ReadLong, Armor)

    'PokeInfo Weapon
    Call SetPlayerEquipment(PlayerNum, Buffer.ReadLong, weapon)
    Call SetPlayerEquipmentPokeInfoPokemon(PlayerNum, Buffer.ReadLong, weapon)
    Call SetPlayerEquipmentPokeInfoPokeball(PlayerNum, Buffer.ReadLong, weapon)
    Call SetPlayerEquipmentPokeInfoLevel(PlayerNum, Buffer.ReadLong, weapon)
    Call SetPlayerEquipmentPokeInfoExp(PlayerNum, Buffer.ReadLong, weapon)

    For i = 1 To Vitals.Vital_Count - 1
        Call SetPlayerEquipmentPokeInfoVital(PlayerNum, Buffer.ReadLong, weapon, i)
        Call SetPlayerEquipmentPokeInfoMaxVital(PlayerNum, Buffer.ReadLong, weapon, i)
    Next

    For i = 1 To Stats.Stat_Count - 1
        Call SetPlayerEquipmentPokeInfoStat(PlayerNum, Buffer.ReadLong, weapon, i)
    Next

    For i = 1 To 4
        Call SetPlayerEquipmentPokeInfoSpell(PlayerNum, Buffer.ReadLong, weapon, i)
    Next

    For i = 1 To MAX_NEGATIVES
        Call SetPlayerEquipmentNgt(MyIndex, i, weapon, Buffer.ReadLong)
    Next

    For i = 1 To MAX_BERRYS
        Call SetPlayerEquipmentBerry(PlayerNum, Buffer.ReadLong, weapon, i)
    Next

    Call SetPlayerEquipmentFelicidade(PlayerNum, weapon, Buffer.ReadLong)
    Call SetPlayerEquipmentSexo(PlayerNum, weapon, Buffer.ReadLong)
    Call SetPlayerEquipmentShiny(PlayerNum, weapon, Buffer.ReadLong)

    'PokeInfo Helmet
    Call SetPlayerEquipment(PlayerNum, Buffer.ReadLong, Helmet)

    'PokeInfo Shield
    Call SetPlayerEquipment(PlayerNum, Buffer.ReadLong, Shield)

    'Resetar Anim
    Player(PlayerNum).AnimFrame = 0
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleMapWornEq", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerHp(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Player(MyIndex).MaxVital(Vitals.HP) = Buffer.ReadLong
    Call SetPlayerVital(MyIndex, Vitals.HP, Buffer.ReadLong)

    If GetPlayerMaxVital(MyIndex, Vitals.HP) > 0 Then
        'frmMain.lblHP.Caption = Int(GetPlayerVital(MyIndex, Vitals.HP) / GetPlayerMaxVital(MyIndex, Vitals.HP) * 100) & "%"
        frmMain.lblHP.Caption = GetPlayerVital(MyIndex, Vitals.HP) & "/" & GetPlayerMaxVital(MyIndex, Vitals.HP)
        ' hp bar
        frmMain.imgHPBar.Width = ((GetPlayerVital(MyIndex, Vitals.HP) / HPBar_Width) / (GetPlayerMaxVital(MyIndex, Vitals.HP) / HPBar_Width)) * HPBar_Width
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerHP", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerMp(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Player(MyIndex).MaxVital(Vitals.MP) = Buffer.ReadLong
    Call SetPlayerVital(MyIndex, Vitals.MP, Buffer.ReadLong)

    If GetPlayerMaxVital(MyIndex, Vitals.MP) > 0 Then
        'frmMain.lblMP.Caption = Int(GetPlayerVital(MyIndex, Vitals.MP) / GetPlayerMaxVital(MyIndex, Vitals.MP) * 100) & "%"
        frmMain.lblMp.Caption = GetPlayerVital(MyIndex, Vitals.MP) & "/" & GetPlayerMaxVital(MyIndex, Vitals.MP)
        ' mp bar
        frmMain.imgMPBar.Width = ((GetPlayerVital(MyIndex, Vitals.MP) / SPRBar_Width) / (GetPlayerMaxVital(MyIndex, Vitals.MP) / SPRBar_Width)) * SPRBar_Width
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerMP", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerStats(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    For i = 1 To Stats.Stat_Count - 1
        SetPlayerStat Index, i, Buffer.ReadLong
        'frmMain.lblCharStat(i).Caption = GetPlayerStat(MyIndex, i)
    Next

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerStats", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerExp(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim i As Long
    Dim TNL As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    SetPlayerExp MyIndex, Buffer.ReadLong

    TNL = Buffer.ReadLong

    ' mp bar
    If GetPlayerEquipment(Index, weapon) > 0 Then
        If GetPlayerEquipmentPokeInfoPokemon(Index, weapon) > 0 Then
            frmMain.imgEXPBar.Width = ((GetPlayerExp(MyIndex) / EXPBar_Width) / (TNL / EXPBar_Width)) * EXPBar_Width
        End If
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerExp", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerData(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long, X As Long
    Dim Buffer As clsBuffer
    Dim AntHonra As Long, VipNameView As Byte

    AntHonra = GetPlayerHonra(MyIndex)

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong
    Call SetPlayerName(i, Buffer.ReadString)
    Call SetPlayerLevel(i, Buffer.ReadLong)
    Call SetPlayerPOINTS(i, Buffer.ReadLong)
    Call SetPlayerSprite(i, Buffer.ReadLong)
    Call SetPlayerMap(i, Buffer.ReadLong)
    Call SetPlayerX(i, Buffer.ReadLong)
    Call SetPlayerY(i, Buffer.ReadLong)
    Call SetPlayerDir(i, Buffer.ReadLong)
    Call SetPlayerAccess(i, Buffer.ReadLong)
    Call SetPlayerPK(i, Buffer.ReadLong)
    Call SetPlayerFlying(i, Buffer.ReadLong)
    Player(i).TPX = Buffer.ReadLong
    Player(i).TPY = Buffer.ReadLong
    Player(i).TPDir = Buffer.ReadLong
    Player(i).TPSprite = Buffer.ReadLong
    Player(i).Vitorias = Buffer.ReadLong
    Player(i).Derrotas = Buffer.ReadLong
    Player(i).ORG = Buffer.ReadByte
    Call SetPlayerHonra(i, Buffer.ReadLong)
    Player(i).MyVip = Buffer.ReadByte
    VipNameView = Buffer.ReadByte

    If VipNameView = 1 Then
        Player(i).VipInName = True
    Else
        Player(i).VipInName = False
    End If

    If Buffer.ReadByte = 1 Then
        Player(i).PokeLight = True
    Else
        Player(i).PokeLight = False
    End If

    For X = 1 To MAX_INSIGNIAS
        Player(i).Insignia(X) = Buffer.ReadLong
    Next

    For X = 1 To MAX_QUESTS
        Player(i).Quests(X).status = Buffer.ReadByte
        Player(i).Quests(X).Part = Buffer.ReadByte
    Next

    ' Check if the player is the client player
    If i = MyIndex Then
        ' Reset directions
        DirUp = False
        DirDown = False
        DirLeft = False
        DirRight = False

        ' Set training label visiblity depending on points
        frmMain.lblPoints.Caption = GetPlayerPOINTS(MyIndex)
        If GetPlayerPOINTS(MyIndex) > 0 Then
            For X = 1 To Stats.Stat_Count - 1
                If GetPlayerStat(Index, X) < 255 Then
                    frmMain.lblTrainStat(X).Visible = True
                Else
                    frmMain.lblTrainStat(X).Visible = False
                End If
            Next
        Else
            For X = 1 To Stats.Stat_Count - 1
                frmMain.lblTrainStat(X).Visible = False
            Next
        End If

    End If

    'Vip Check
    If Player(Index).VipInName = True Then
        frmMain.PicChkVipName.Picture = LoadPicture(App.Path & "\data files\graphics\gui\main\buttons\on.jpg")
    Else
        frmMain.PicChkVipName.Picture = LoadPicture(App.Path & "\data files\graphics\gui\main\buttons\off.jpg")
    End If

    'Quest
    PlayerQuests

    ' Make sure they aren't walking
    Player(i).Moving = 0
    Player(i).XOffset = 0
    Player(i).YOffset = 0

    If GetPlayerEquipmentPokeInfoPokemon(MyIndex, weapon) > 0 Then
        If GetPlayerEquipmentShiny(MyIndex, weapon) = 0 Then
            frmMain.lblCharName = Trim$(Pokemon(GetPlayerEquipmentPokeInfoPokemon(MyIndex, weapon)).Name)
        Else
            frmMain.lblCharName = "Shiny " & Trim$(Pokemon(GetPlayerEquipmentPokeInfoPokemon(MyIndex, weapon)).Name)
        End If
    Else
        frmMain.lblCharName = GetPlayerName(MyIndex)
    End If

    'Carregar Insignias
    Call CarregarInsignia

    'Atualizar Honra se necessario!
    If AntHonra <> GetPlayerHonra(MyIndex) Then
        BltOrgShop
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerData", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerMove(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long
    Dim X As Long
    Dim Y As Long
    Dim Dir As Long
    Dim n As Byte
    Dim Buffer As clsBuffer
    Dim S As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong
    X = Buffer.ReadLong
    Y = Buffer.ReadLong
    Dir = Buffer.ReadLong
    n = Buffer.ReadLong
    Call SetPlayerX(i, X)
    Call SetPlayerY(i, Y)
    Call SetPlayerDir(i, Dir)
    Player(i).XOffset = 0
    Player(i).YOffset = 0
    Player(i).Moving = n

    Select Case GetPlayerDir(i)
    Case DIR_UP
        Player(i).YOffset = PIC_Y
    Case DIR_DOWN
        Player(i).YOffset = PIC_Y * -1
    Case DIR_LEFT
        Player(i).XOffset = PIC_X
    Case DIR_RIGHT
        Player(i).XOffset = PIC_X * -1
    End Select

    'Check to see if the map tile is Grass or not
    If Player(i).Flying = 0 Then
        If Map.Tile(X, Y).Type = TILE_TYPE_GRASS Then
            MeAnimation 10, GetPlayerX(i), GetPlayerY(i)
        End If

        If Map.Tile(X, Y).Type = TILE_TYPE_SLIDE Then
            Player(i).PuloStatus = 1
            Player(i).PuloSlide = 15
        End If
    End If

    'Check to see if the map tile is Grass or not
    If Player(i).InSurf = 1 Then
        MeAnimation 14, GetPlayerX(i), GetPlayerY(i)
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerMove", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleNpcMove(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim MapNpcNum As Long, FazerRuido As Byte
    Dim X As Long, PokemonId As String
    Dim Y As Long
    Dim Dir As Long
    Dim Movement As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    MapNpcNum = Buffer.ReadLong
    X = Buffer.ReadLong
    Y = Buffer.ReadLong
    Dir = Buffer.ReadLong
    Movement = Buffer.ReadLong

    With MapNpc(MapNpcNum)
        .X = X
        .Y = Y
        .Dir = Dir
        .XOffset = 0
        .YOffset = 0
        .Moving = Movement

        Select Case .Dir
        Case DIR_UP
            .YOffset = PIC_Y
        Case DIR_DOWN
            .YOffset = PIC_Y * -1
        Case DIR_LEFT
            .XOffset = PIC_X
        Case DIR_RIGHT
            .XOffset = PIC_X * -1
        End Select

        'Check to see if the map tile is Grass or not
        If Map.Tile(X, Y).Type = TILE_TYPE_GRASS Then
            MeAnimation 10, .X, .Y
        End If

        If MapNpc(MapNpcNum).num > 0 Then
            If Npc(MapNpc(MapNpcNum).num).Pokemon > 0 Then
                'Verificar se Ira fazer Ruido!
                FazerRuido = 100 * Rnd
                If FazerRuido <= 10 Then
                    Select Case Npc(MapNpc(MapNpcNum).num).Pokemon
                    Case 1 To 9
                        PokemonId = "00" & Npc(MapNpc(MapNpcNum).num).Pokemon
                    Case 10 To 99
                        PokemonId = "0" & Npc(MapNpc(MapNpcNum).num).Pokemon
                    Case Else
                        PokemonId = Npc(MapNpc(MapNpcNum).num).Pokemon
                    End Select

                    If isInRange(5, Player(MyIndex).X, Player(MyIndex).Y, X, Y) = True Then
                        PlaySound "PokeSounds\" & PokemonId & ".mp3", -1, -1
                    End If
                End If
            End If
        End If

    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleNpcMove", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerDir(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long
    Dim Dir As Byte
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong
    Dir = Buffer.ReadLong
    Call SetPlayerDir(i, Dir)

    With Player(i)
        .XOffset = 0
        .YOffset = 0
        .Moving = 0
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerDir", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleNpcDir(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long
    Dim Dir As Byte
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong
    Dir = Buffer.ReadLong

    With MapNpc(i)
        .Dir = Dir
        .XOffset = 0
        .YOffset = 0
        .Moving = 0
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleNpcDir", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerXY(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim X As Long
    Dim Y As Long
    Dim Dir As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    X = Buffer.ReadLong
    Y = Buffer.ReadLong
    Dir = Buffer.ReadLong
    Call SetPlayerX(MyIndex, X)
    Call SetPlayerY(MyIndex, Y)
    Call SetPlayerDir(MyIndex, Dir)
    ' Make sure they aren't walking
    Player(MyIndex).Moving = 0
    Player(MyIndex).XOffset = 0
    Player(MyIndex).YOffset = 0

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerXY", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerXYMap(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim X As Long
    Dim Y As Long
    Dim Dir As Long
    Dim Buffer As clsBuffer
    Dim thePlayer As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    thePlayer = Buffer.ReadLong
    X = Buffer.ReadLong
    Y = Buffer.ReadLong
    Dir = Buffer.ReadLong
    Call SetPlayerX(thePlayer, X)
    Call SetPlayerY(thePlayer, Y)
    Call SetPlayerDir(thePlayer, Dir)
    ' Make sure they aren't walking
    Player(thePlayer).Moving = 0
    Player(thePlayer).XOffset = 0
    Player(thePlayer).YOffset = 0

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerXYMap", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleAttack(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong

    ' Set player to attacking
    Player(i).Attacking = 1
    Player(i).AttackTimer = GetTickCount

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleAttack", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleNpcAttack(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong
    ' Set player to attacking
    MapNpc(i).Attacking = 1
    MapNpc(i).AttackTimer = GetTickCount

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleNpcAttack", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleCheckForMap(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim X As Long
    Dim Y As Long
    Dim i As Long
    Dim NeedMap As Byte
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    ' Erase all players except self
    For i = 1 To MAX_PLAYERS
        If i <> MyIndex Then
            Call SetPlayerMap(i, 0)
        End If
    Next

    ' Erase all temporary tile values
    Call ClearTempTile
    Call ClearMapNpcs
    Call ClearMapItems
    Call ClearMap

    ' Get map num
    X = Buffer.ReadLong
    ' Get revision
    Y = Buffer.ReadLong

    If FileExist(MAP_PATH & "map" & X & MAP_EXT, False) Then
        Call LoadMap(X)
        ' Check to see if the revisions match
        NeedMap = 1

        If Map.Revision = Y Then
            ' We do so we dont need the map
            'Call SendData(CNeedMap & SEP_CHAR & "n" & END_CHAR)
            NeedMap = 0
        End If

    Else
        NeedMap = 1
    End If

    ' Either the revisions didn't match or we dont have the map, so we need it
    Set Buffer = New clsBuffer
    Buffer.WriteLong CNeedMap
    Buffer.WriteLong NeedMap
    SendData Buffer.ToArray()
    Set Buffer = Nothing

    ' Check if we get a map from someone else and if we were editing a map cancel it out
    If InMapEditor Then
        InMapEditor = False
        frmEditor_Map.Visible = False
        frmMain.picCharacter.Visible = True

        ClearAttributeDialogue

        If frmEditor_MapProperties.Visible Then
            frmEditor_MapProperties.Visible = False
        End If
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleCheckForMap", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleMapData(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim X As Long
    Dim Y As Long
    Dim i As Long
    Dim Buffer As clsBuffer
    Dim MapNum As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer

    Buffer.WriteBytes data()

    MapNum = Buffer.ReadLong
    Map.Name = Buffer.ReadString
    Map.Music = Buffer.ReadString
    Map.Revision = Buffer.ReadLong
    Map.Moral = Buffer.ReadByte
    Map.Up = Buffer.ReadLong
    Map.Down = Buffer.ReadLong
    Map.Left = Buffer.ReadLong
    Map.Right = Buffer.ReadLong
    Map.BootMap = Buffer.ReadLong
    Map.BootX = Buffer.ReadByte
    Map.BootY = Buffer.ReadByte
    Map.MaxX = Buffer.ReadByte
    Map.MaxY = Buffer.ReadByte
    Map.Weather = Buffer.ReadLong
    Map.Intensity = Buffer.ReadLong

    For X = 1 To 2
        Map.LevelPoke(X) = Buffer.ReadLong
    Next

    ReDim Map.Tile(0 To Map.MaxX, 0 To Map.MaxY)

    For X = 0 To Map.MaxX
        For Y = 0 To Map.MaxY
            For i = 1 To MapLayer.Layer_Count - 1
                Map.Tile(X, Y).Layer(i).X = Buffer.ReadLong
                Map.Tile(X, Y).Layer(i).Y = Buffer.ReadLong
                Map.Tile(X, Y).Layer(i).Tileset = Buffer.ReadLong
            Next
            Map.Tile(X, Y).Type = Buffer.ReadByte
            Map.Tile(X, Y).Data1 = Buffer.ReadLong
            Map.Tile(X, Y).Data2 = Buffer.ReadLong
            Map.Tile(X, Y).Data3 = Buffer.ReadLong
            Map.Tile(X, Y).DirBlock = Buffer.ReadByte
        Next
    Next

    For X = 1 To MAX_MAP_NPCS
        Map.Npc(X) = Buffer.ReadLong
        n = n + 1
    Next

    ClearTempTile

    Set Buffer = Nothing

    ' Save the map
    Call SaveMap(MapNum)

    ' Check if we get a map from someone else and if we were editing a map cancel it out
    If InMapEditor Then
        InMapEditor = False
        frmEditor_Map.Visible = False

        ClearAttributeDialogue

        If frmEditor_MapProperties.Visible Then
            frmEditor_MapProperties.Visible = False
        End If
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleMapData", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleMapItemData(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    For i = 1 To MAX_MAP_ITEMS
        With MapItem(i)
            '.playerName = Buffer.ReadString
            .num = Buffer.ReadLong
            .value = Buffer.ReadLong
            .X = Buffer.ReadLong
            .Y = Buffer.ReadLong
        End With
    Next

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleMapItemData", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleMapNpcData(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    For i = 1 To MAX_MAP_NPCS
        With MapNpc(i)
            .num = Buffer.ReadLong
            .X = Buffer.ReadLong
            .Y = Buffer.ReadLong
            .Dir = Buffer.ReadLong
            .Vital(HP) = Buffer.ReadLong
            .Sexo = Buffer.ReadLong
            .Shiny = Buffer.ReadLong
            .Level = Buffer.ReadLong
        End With
    Next

    SaveMap i

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleMapNpcData", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleMapDone()
    Dim i As Long
    Dim MusicFile As String

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' clear the action msgs
    For i = 1 To MAX_BYTE
        ClearActionMsg (i)
    Next i
    Action_HighIndex = 1

    ' load tilesets we need
    LoadTilesets

    MusicFile = Trim$(Map.Music)
    If Not MusicFile = "None." Then
        PlayMusic MusicFile
    Else
        StopMusic
    End If

    ' re-position the map name
    Call UpdateDrawMapName

    ' get the npc high index
    For i = MAX_MAP_NPCS To 1 Step -1
        If MapNpc(i).num > 0 Then
            Npc_HighIndex = i + 1
            Exit For
        End If
    Next
    ' make sure we're not overflowing
    If Npc_HighIndex > MAX_MAP_NPCS Then Npc_HighIndex = MAX_MAP_NPCS

    GettingMap = False
    CanMoveNow = True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleMapDone", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleBroadcastMsg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Msg As String
    Dim Color As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Msg = Buffer.ReadString
    Color = Buffer.ReadLong
    Call AddText(Msg, Color)

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleBroadcastMsg", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleGlobalMsg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Msg As String
    Dim Color As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Msg = Buffer.ReadString
    Color = Buffer.ReadLong
    Call AddText(Msg, Color)

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleGlobalMsg", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePlayerMsg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Msg As String
    Dim Color As Byte


    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Msg = Buffer.ReadString
    Color = Buffer.ReadLong
    Call AddText(Msg, Color)



    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePlayerMsg", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleMapMsg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Msg As String
    Dim Color As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Msg = Buffer.ReadString
    Color = Buffer.ReadLong
    Call AddText(Msg, Color)

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleMapMsg", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleAdminMsg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Msg As String
    Dim Color As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Msg = Buffer.ReadString
    Color = Buffer.ReadLong
    Call AddText(Msg, Color)

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleAdminMsg", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleSpawnItem(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long, i As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = Buffer.ReadLong

    With MapItem(n)
        '.playerName = Buffer.ReadString
        .num = Buffer.ReadLong
        .value = Buffer.ReadLong
        .X = Buffer.ReadLong
        .Y = Buffer.ReadLong
        .PokeInfo.Pokemon = Buffer.ReadLong
        .PokeInfo.Pokeball = Buffer.ReadLong
        .PokeInfo.Level = Buffer.ReadLong
        .PokeInfo.Exp = Buffer.ReadLong

        For i = 1 To Vitals.Vital_Count - 1
            .PokeInfo.Vital(i) = Buffer.ReadLong
            .PokeInfo.MaxVital(i) = Buffer.ReadLong
        Next

        For i = 1 To Stats.Stat_Count - 1
            .PokeInfo.Stat(i) = Buffer.ReadLong
        Next

        For i = 1 To 4
            .PokeInfo.Spells(i) = Buffer.ReadLong
        Next

    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleSpawnItem", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub


Private Sub HandleItemEditor()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    With frmEditor_Item
        Editor = EDITOR_ITEM
        .lstIndex.Clear

        ' Add the names
        For i = 1 To MAX_ITEMS
            .lstIndex.AddItem i & ": " & Trim$(Item(i).Name)
        Next

        .Show
        .lstIndex.ListIndex = 0
        ItemEditorInit
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleItemEditor", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleAnimationEditor()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    With frmEditor_Animation
        Editor = EDITOR_ANIMATION
        .lstIndex.Clear

        ' Add the names
        For i = 1 To MAX_ANIMATIONS
            .lstIndex.AddItem i & ": " & Trim$(Animation(i).Name)
        Next

        .Show
        .lstIndex.ListIndex = 0
        AnimationEditorInit
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleAnimationEditor", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleUpdateItem(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim Buffer As clsBuffer
    Dim ItemSize As Long
    Dim ItemData() As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = Buffer.ReadLong
    ' Update the item
    ItemSize = LenB(Item(n))
    ReDim ItemData(ItemSize - 1)
    ItemData = Buffer.ReadBytes(ItemSize)
    CopyMemory ByVal VarPtr(Item(n)), ByVal VarPtr(ItemData(0)), ItemSize
    Set Buffer = Nothing
    ' changes to inventory, need to clear any drop menu
    frmMain.picCurrency.Visible = False
    frmMain.txtCurrency.text = vbNullString
    tmpCurrencyItem = 0
    CurrencyMenu = 0    ' clear

    BltInventory

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleUpdateItem", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleUpdateAnimation(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim Buffer As clsBuffer
    Dim AnimationSize As Long
    Dim AnimationData() As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = Buffer.ReadLong
    ' Update the Animation
    AnimationSize = LenB(Animation(n))
    ReDim AnimationData(AnimationSize - 1)
    AnimationData = Buffer.ReadBytes(AnimationSize)
    CopyMemory ByVal VarPtr(Animation(n)), ByVal VarPtr(AnimationData(0)), AnimationSize
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleUpdateAnimation", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleSpawnNpc(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = Buffer.ReadLong

    With MapNpc(n)
        .num = Buffer.ReadLong
        .X = Buffer.ReadLong
        .Y = Buffer.ReadLong
        .Dir = Buffer.ReadLong
        .Sexo = Buffer.ReadLong
        .Shiny = Buffer.ReadLong
        .Level = Buffer.ReadLong

        ' Client use only
        .XOffset = 0
        .YOffset = 0
        .Moving = 0
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleSpawnNpc", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleNpcDead(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim MapNpcNum As Long
    Dim Buffer As clsBuffer
    Dim Morto As Long
    Dim Sumir As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Sumir = Buffer.ReadByte
    MapNpcNum = Buffer.ReadLong
    Morto = Buffer.ReadLong

    If MapNpcNum > 0 Then
        If Morto = 1 Then
            MapNpc(MapNpcNum).Desmaiado = True
        Else
            MapNpc(MapNpcNum).Desmaiado = False
        End If
    End If

    If Sumir = 1 Then
        Call ClearMapNpc(MapNpcNum)
        MapNpc(MapNpcNum).Desmaiado = False
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleNpcDead", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleNpcEditor()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    With frmEditor_NPC
        Editor = EDITOR_NPC
        .lstIndex.Clear

        ' Add the names
        For i = 1 To MAX_NPCS
            .lstIndex.AddItem i & ": " & Trim$(Npc(i).Name)
        Next

        .Show
        .lstIndex.ListIndex = 0
        NpcEditorInit
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleNpcEditor", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleUpdateNpc(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim Buffer As clsBuffer
    Dim NpcSize As Long
    Dim NpcData() As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    n = Buffer.ReadLong

    NpcSize = LenB(Npc(n))
    ReDim NpcData(NpcSize - 1)
    NpcData = Buffer.ReadBytes(NpcSize)
    CopyMemory ByVal VarPtr(Npc(n)), ByVal VarPtr(NpcData(0)), NpcSize

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleUpdateNpc", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleResourceEditor()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    With frmEditor_Resource
        Editor = EDITOR_RESOURCE
        .lstIndex.Clear

        ' Add the names
        For i = 1 To MAX_RESOURCES
            .lstIndex.AddItem i & ": " & Trim$(Resource(i).Name)
        Next

        .Show
        .lstIndex.ListIndex = 0
        ResourceEditorInit
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleResourceEditor", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleUpdateResource(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim ResourceNum As Long
    Dim Buffer As clsBuffer
    Dim ResourceSize As Long
    Dim ResourceData() As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    ResourceNum = Buffer.ReadLong

    ResourceSize = LenB(Resource(ResourceNum))
    ReDim ResourceData(ResourceSize - 1)
    ResourceData = Buffer.ReadBytes(ResourceSize)

    ClearResource ResourceNum

    CopyMemory ByVal VarPtr(Resource(ResourceNum)), ByVal VarPtr(ResourceData(0)), ResourceSize

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleUpdateResource", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleMapKey(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim X As Long
    Dim Y As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    X = Buffer.ReadLong
    Y = Buffer.ReadLong
    n = Buffer.ReadByte
    TempTile(X, Y).DoorOpen = n

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleMapKey", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleEditMap()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Call MapEditorInit

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleEditMap", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleShopEditor()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    With frmEditor_Shop
        Editor = EDITOR_SHOP
        .lstIndex.Clear

        ' Add the names
        For i = 1 To MAX_SHOPS
            .lstIndex.AddItem i & ": " & Trim$(Shop(i).Name)
        Next

        .Show
        .lstIndex.ListIndex = 0
        ShopEditorInit
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleShopEditor", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleUpdateShop(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim shopnum As Long
    Dim Buffer As clsBuffer
    Dim ShopSize As Long
    Dim ShopData() As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    shopnum = Buffer.ReadLong

    ShopSize = LenB(Shop(shopnum))
    ReDim ShopData(ShopSize - 1)
    ShopData = Buffer.ReadBytes(ShopSize)
    CopyMemory ByVal VarPtr(Shop(shopnum)), ByVal VarPtr(ShopData(0)), ShopSize

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleUpdateShop", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleSpellEditor()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    With frmEditor_Spell
        Editor = EDITOR_SPELL
        .lstIndex.Clear

        ' Add the names
        For i = 1 To MAX_SPELLS
            .lstIndex.AddItem i & ": " & Trim$(Spell(i).Name)
        Next

        .Show
        .lstIndex.ListIndex = 0
        SpellEditorInit
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleSpellEditor", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleUpdateSpell(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim SpellNum As Long
    Dim Buffer As clsBuffer
    Dim SpellSize As Long
    Dim SpellData() As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    SpellNum = Buffer.ReadLong

    SpellSize = LenB(Spell(SpellNum))
    ReDim SpellData(SpellSize - 1)
    SpellData = Buffer.ReadBytes(SpellSize)
    CopyMemory ByVal VarPtr(Spell(SpellNum)), ByVal VarPtr(SpellData(0)), SpellSize
    Set Buffer = Nothing

    ' Update the spells on the pic
    Set Buffer = New clsBuffer
    Buffer.WriteLong CSpells
    SendData Buffer.ToArray()
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleUpdateSpell", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleSpells(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    For i = 1 To MAX_PLAYER_SPELLS
        PlayerSpells(i) = Buffer.ReadLong
    Next

    BltPlayerSpells
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleSpells", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleLeft(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Call ClearPlayer(Buffer.ReadLong)
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleLeft", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleResourceCache(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' if in map editor, we cache shit ourselves
    If InMapEditor Then Exit Sub
    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Resource_Index = Buffer.ReadLong
    Resources_Init = False

    If Resource_Index > 0 Then
        ReDim Preserve MapResource(0 To Resource_Index)

        For i = 0 To Resource_Index
            MapResource(i).ResourceState = Buffer.ReadByte
            MapResource(i).X = Buffer.ReadLong
            MapResource(i).Y = Buffer.ReadLong
        Next

        Resources_Init = True
    Else
        ReDim MapResource(0 To 1)
    End If

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleResourceCache", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleSendPing(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    PingEnd = GetTickCount
    Ping = PingEnd - PingStart
    Call DrawPing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleSendPing", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleDoorAnimation(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim X As Long, Y As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    X = Buffer.ReadLong
    Y = Buffer.ReadLong
    With TempTile(X, Y)
        .DoorFrame = 1
        .DoorAnimate = 1    ' 0 = nothing| 1 = opening | 2 = closing
        .DoorTimer = GetTickCount
    End With
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleDoorAnimation", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleActionMsg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim X As Long, Y As Long, Message As String, Color As Long, tmpType As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer

    Buffer.WriteBytes data()
    Message = Buffer.ReadString
    Color = Buffer.ReadLong
    tmpType = Buffer.ReadLong
    X = Buffer.ReadLong
    Y = Buffer.ReadLong

    Set Buffer = Nothing

    CreateActionMsg Message, Color, tmpType, X, Y

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleActionMsg", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleAnimation(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer

    Buffer.WriteBytes data()

    AnimationIndex = AnimationIndex + 1
    If AnimationIndex >= MAX_BYTE Then AnimationIndex = 1

    With AnimInstance(AnimationIndex)
        .Animation = Buffer.ReadLong
        .X = Buffer.ReadLong
        .Y = Buffer.ReadLong
        .LockType = Buffer.ReadByte
        .lockindex = Buffer.ReadLong
        .Used(0) = True
        .Used(1) = True
    End With

    ' play the sound if we've got one
    If isInRange(6, GetPlayerX(MyIndex), GetPlayerY(MyIndex), AnimInstance(AnimationIndex).X, AnimInstance(AnimationIndex).Y) = True Then
        PlayMapSound AnimInstance(AnimationIndex).X, AnimInstance(AnimationIndex).Y, SoundEntity.seAnimation, AnimInstance(AnimationIndex).Animation
    End If

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleAnimation", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleMapNpcVitals(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim i As Long
    Dim MapNpcNum As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    MapNpcNum = Buffer.ReadLong
    For i = 1 To Vitals.Vital_Count - 1
        MapNpc(MapNpcNum).Vital(i) = Buffer.ReadLong
    Next

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleMapNpcVitals", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleCooldown(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Slot As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    Slot = Buffer.ReadLong
    SpellCD(Slot) = GetTickCount

    BltPlayerSpells
    blthotbar

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleCooldown", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleClearSpellBuffer(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    SpellBuffer = 0
    SpellBufferTimer = 0

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleClearSpellBuffer", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleSayMsg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Access As Long
    Dim Name As String
    Dim Message As String
    Dim colour As Long
    Dim Header As String
    Dim PK As Long
    Dim saycolour As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    Name = Buffer.ReadString
    Access = Buffer.ReadLong
    PK = Buffer.ReadLong
    Message = Buffer.ReadString
    Header = Buffer.ReadString
    saycolour = Buffer.ReadLong

    ' Check access level
    If PK = NO Then
        Select Case Access
        Case 0
            colour = White
        Case 1
            colour = DarkGrey
        Case 2
            colour = BrightBlue
        Case 3
            colour = BrightBlue
        Case 4
            colour = Yellow
        End Select
    Else
        colour = Red
    End If

    Call AddText(Header & Name & ": " & Message, colour)

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleSayMsg", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleOpenShop(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim shopnum As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    shopnum = Buffer.ReadLong

    Set Buffer = Nothing

    OpenShop shopnum

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleOpenShop", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleResetShopAction(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ShopAction = 0

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleResetShopAction", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleStunned(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    StunDuration = Buffer.ReadLong

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleStunned", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleBank(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim i As Long, X As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    For i = 1 To MAX_BANK
        Bank.Item(i).num = Buffer.ReadLong
        Bank.Item(i).value = Buffer.ReadLong
        Bank.Item(i).PokeInfo.Pokemon = Buffer.ReadLong
        Bank.Item(i).PokeInfo.Pokeball = Buffer.ReadLong
        Bank.Item(i).PokeInfo.Level = Buffer.ReadLong
        Bank.Item(i).PokeInfo.Exp = Buffer.ReadLong

        For X = 1 To Vitals.Vital_Count - 1
            Bank.Item(i).PokeInfo.Vital(X) = Buffer.ReadLong
            Bank.Item(i).PokeInfo.MaxVital(X) = Buffer.ReadLong
        Next

        For X = 1 To Stats.Stat_Count - 1
            Bank.Item(i).PokeInfo.Stat(X) = Buffer.ReadLong
        Next

        For X = 1 To 4
            Bank.Item(i).PokeInfo.Spells(X) = Buffer.ReadLong
        Next

        For X = 1 To MAX_NEGATIVES
            Bank.Item(i).PokeInfo.Negatives(X) = Buffer.ReadLong
        Next

        For X = 1 To MAX_BERRYS
            Bank.Item(i).PokeInfo.Berry(X) = Buffer.ReadLong
        Next

        Bank.Item(i).PokeInfo.Felicidade = Buffer.ReadLong
        Bank.Item(i).PokeInfo.Sexo = Buffer.ReadLong
        Bank.Item(i).PokeInfo.Shiny = Buffer.ReadLong
    Next

    InBank = True
    frmMain.picBank.Visible = True
    frmMain.picBank.top = (frmMain.ScaleHeight / 2) - (frmMain.picBank.Height / 2)
    frmMain.picBank.Left = (frmMain.ScaleWidth / 2) - (frmMain.picBank.Width / 2)
    BltBank

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleBank", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleTrade(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    InTrade = Buffer.ReadLong
    frmMain.picTrade.Visible = True
    frmMain.picYourTrade.Visible = True
    frmMain.picTheirTrade.Visible = True
    frmMain.lblTradeStatus(0).Caption = "Esperando Confirma��o"
    frmMain.lblTradeStatus(1).Caption = "Esperando Confirma��o"
    frmMain.lblTradeStatus(0).ForeColor = &HE0E0E0
    frmMain.lblTradeStatus(1).ForeColor = &HE0E0E0
    frmMain.PicTradeOn(0).Visible = False
    frmMain.PicTradeOn(1).Visible = False
    BltTrade

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleTrade", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleCloseTrade(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    InTrade = 0
    frmMain.picTrade.Visible = False
    frmMain.lblTradeStatus(0).Caption = "Esperando Confirma��o"
    frmMain.lblTradeStatus(1).Caption = "Esperando Confirma��o"
    frmMain.lblTradeStatus(0).ForeColor = &HE0E0E0
    frmMain.lblTradeStatus(1).ForeColor = &HE0E0E0
    frmMain.PicTradeOn(0).Visible = False
    frmMain.PicTradeOn(1).Visible = False
    frmMain.picYourTrade.Visible = False
    frmMain.picTheirTrade.Visible = False

    ' re-blt any items we were offering
    BltInventory

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleCloseTrade", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleTradeUpdate(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim dataType As Byte
    Dim i As Long, X As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    dataType = Buffer.ReadByte

    If dataType = 0 Then    ' ours!
        For i = 1 To MAX_INV
            TradeYourOffer(i).num = Buffer.ReadLong
            TradeYourOffer(i).value = Buffer.ReadLong
            TradeYourOffer(i).PokeInfo.Pokemon = Buffer.ReadLong
            TradeYourOffer(i).PokeInfo.Pokeball = Buffer.ReadLong
            TradeYourOffer(i).PokeInfo.Level = Buffer.ReadLong
            TradeYourOffer(i).PokeInfo.Exp = Buffer.ReadLong
            TradeYourOffer(i).PokeInfo.Felicidade = Buffer.ReadLong
            TradeYourOffer(i).PokeInfo.Sexo = Buffer.ReadLong
            TradeYourOffer(i).PokeInfo.Shiny = Buffer.ReadLong

            For X = 1 To Vitals.Vital_Count - 1
                TradeYourOffer(i).PokeInfo.Vital(X) = Buffer.ReadLong
                TradeYourOffer(i).PokeInfo.MaxVital(X) = Buffer.ReadLong
            Next

            For X = 1 To Stats.Stat_Count - 1
                TradeYourOffer(i).PokeInfo.Stat(X) = Buffer.ReadLong
            Next

            For X = 1 To 4
                TradeYourOffer(i).PokeInfo.Spells(X) = Buffer.ReadLong
            Next

            For X = 1 To MAX_BERRYS
                TradeYourOffer(i).PokeInfo.Berry(X) = Buffer.ReadLong
            Next

        Next
        frmMain.lblYourWorth.Caption = Buffer.ReadLong & "g"
        ' remove any items we're offering
        BltInventory
    ElseIf dataType = 1 Then    'theirs
        For i = 1 To MAX_INV

            TradeTheirOffer(i).num = Buffer.ReadLong
            TradeTheirOffer(i).value = Buffer.ReadLong
            TradeTheirOffer(i).PokeInfo.Pokemon = Buffer.ReadLong
            TradeTheirOffer(i).PokeInfo.Pokeball = Buffer.ReadLong
            TradeTheirOffer(i).PokeInfo.Level = Buffer.ReadLong
            TradeTheirOffer(i).PokeInfo.Exp = Buffer.ReadLong
            TradeTheirOffer(i).PokeInfo.Felicidade = Buffer.ReadLong
            TradeTheirOffer(i).PokeInfo.Sexo = Buffer.ReadLong
            TradeTheirOffer(i).PokeInfo.Shiny = Buffer.ReadLong

            For X = 1 To Vitals.Vital_Count - 1
                TradeTheirOffer(i).PokeInfo.Vital(X) = Buffer.ReadLong
                TradeTheirOffer(i).PokeInfo.MaxVital(X) = Buffer.ReadLong
            Next

            For X = 1 To Stats.Stat_Count - 1
                TradeTheirOffer(i).PokeInfo.Stat(X) = Buffer.ReadLong
            Next

            For X = 1 To 4
                TradeTheirOffer(i).PokeInfo.Spells(X) = Buffer.ReadLong
            Next
        Next
        frmMain.lblTheirWorth.Caption = Buffer.ReadLong & "g"
    End If

    BltTrade

    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleTradeUpdate", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleTradeStatus(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim tradeStatus As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    tradeStatus = Buffer.ReadByte

    Set Buffer = Nothing

    Select Case tradeStatus
    Case 0    ' clear
        frmMain.lblTradeStatus(0).Caption = "Esperando Confirma��o"
        frmMain.lblTradeStatus(1).Caption = "Esperando Confirma��o"
        frmMain.lblTradeStatus(0).ForeColor = &HE0E0E0
        frmMain.lblTradeStatus(1).ForeColor = &HE0E0E0
    Case 1    ' they've accepted
        frmMain.lblTradeStatus(1).Caption = "Troca Aceita"
        frmMain.PicTradeOn(1).Visible = True
    Case 2    ' you've accepted
        frmMain.lblTradeStatus(0).Caption = "Troca Aceita"
        frmMain.PicTradeOn(0).Visible = True
    End Select

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleTradeStatus", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleTarget(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim MapNpcNum As Integer, TargetVital As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    myTarget = Buffer.ReadLong
    myTargetType = Buffer.ReadLong
    MapNpcNum = Buffer.ReadInteger
    TargetVital = Buffer.ReadLong

    Set Buffer = Nothing

    'Target Info
    If MapNpcNum = 0 Then
        frmMain.PicTarget.Visible = False
    Else
        If MapNpc(MapNpcNum).Shiny = False Then
            frmMain.lblTargetInfo(1).Caption = Trim$(Npc(MapNpc(MapNpcNum).num).Name)
        Else
            frmMain.lblTargetInfo(1).Caption = "S." & Trim$(Npc(MapNpc(MapNpcNum).num).Name)
        End If

        If Npc(MapNpc(MapNpcNum).num).Pokemon > 0 Then
            frmMain.ElementTarget(0).Picture = LoadPicture(App.Path & "\data files\graphics\gui\main\signs\" & Pokemon(Npc(MapNpc(MapNpcNum).num).Pokemon).Tipo(1) & ".jpg")
            frmMain.ElementTarget(1).Picture = LoadPicture(App.Path & "\data files\graphics\gui\main\signs\" & Pokemon(Npc(MapNpc(MapNpcNum).num).Pokemon).Tipo(2) & ".jpg")
        Else
            frmMain.ElementTarget(0).Picture = LoadPicture(App.Path & "\data files\graphics\gui\main\signs\0.jpg")
            frmMain.ElementTarget(1).Picture = LoadPicture(App.Path & "\data files\graphics\gui\main\signs\0.jpg")
        End If

        frmMain.lblTargetInfo(0).Caption = TargetVital & "/" & GetPokemonMaxVital(MapNpc(MapNpcNum).num, MapNpc(MapNpcNum).Level)
        bltTargetHp MapNpcNum, TargetVital
        bltPokemonTarget MapNpcNum
        frmMain.PicTarget.ZOrder 0
        frmMain.PicTarget.Visible = True
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleTarget", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleHotbar(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    For i = 1 To MAX_HOTBAR
        Hotbar(i).Slot = Buffer.ReadLong
        Hotbar(i).sType = Buffer.ReadByte
        Hotbar(i).Pokemon = Buffer.ReadLong
        Hotbar(i).Pokeball = Buffer.ReadLong
    Next
    blthotbar

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleHotbar", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleHighIndex(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    Player_HighIndex = Buffer.ReadLong

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleHighIndex", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleSound(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim X As Long, Y As Long, entityType As Long, entityNum As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    X = Buffer.ReadLong
    Y = Buffer.ReadLong
    entityType = Buffer.ReadLong
    entityNum = Buffer.ReadLong

    PlayMapSound X, Y, entityType, entityNum

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleSound", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleTradeRequest(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim theName As String

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    theName = Buffer.ReadString

    Dialogue "Trade Request", theName & " has requested a trade. Would you like to accept?", DIALOGUE_TYPE_TRADE, True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleSound", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePartyInvite(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim theName As String

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    theName = Buffer.ReadString

    Dialogue "Party Invitation", theName & " has invited you to a party. Would you like to join?", DIALOGUE_TYPE_PARTY, True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePartyInvite", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePartyUpdate(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, i As Long, inParty As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    inParty = Buffer.ReadByte

    ' exit out if we're not in a party
    If inParty = 0 Then
        Call ZeroMemory(ByVal VarPtr(Party), LenB(Party))
        ' reset the labels
        For i = 1 To MAX_PARTY_MEMBERS
            frmMain.lblPartyMember(i).Caption = vbNullString
            frmMain.imgPartyHealth(i).Visible = False
            frmMain.imgPartySpirit(i).Visible = False
        Next
        ' exit out early
        Exit Sub
    End If

    ' carry on otherwise
    Party.Leader = Buffer.ReadLong
    For i = 1 To MAX_PARTY_MEMBERS
        Party.Member(i) = Buffer.ReadLong
        If Party.Member(i) > 0 Then
            frmMain.lblPartyMember(i).Caption = Trim$(GetPlayerName(Party.Member(i)))
            frmMain.imgPartyHealth(i).Visible = True
            frmMain.imgPartySpirit(i).Visible = True
        Else
            frmMain.lblPartyMember(i).Caption = vbNullString
            frmMain.imgPartyHealth(i).Visible = False
            frmMain.imgPartySpirit(i).Visible = False
        End If
    Next
    Party.MemberCount = Buffer.ReadLong

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePartyUpdate", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePartyVitals(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim PlayerNum As Long, partyIndex As Long
    Dim Buffer As clsBuffer, i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    ' which player?
    PlayerNum = Buffer.ReadLong
    ' set vitals
    For i = 1 To Vitals.Vital_Count - 1
        Player(PlayerNum).MaxVital(i) = Buffer.ReadLong
        Player(PlayerNum).Vital(i) = Buffer.ReadLong
    Next

    ' find the party number
    For i = 1 To MAX_PARTY_MEMBERS
        If Party.Member(i) = PlayerNum Then
            partyIndex = i
        End If
    Next

    ' exit out if wrong data
    If partyIndex <= 0 Or partyIndex > MAX_PARTY_MEMBERS Then Exit Sub

    ' hp bar
    frmMain.imgPartyHealth(partyIndex).Width = ((GetPlayerVital(PlayerNum, Vitals.HP) / Party_HPWidth) / (GetPlayerMaxVital(PlayerNum, Vitals.HP) / Party_HPWidth)) * Party_HPWidth
    ' spr bar
    frmMain.imgPartySpirit(partyIndex).Width = ((GetPlayerVital(PlayerNum, Vitals.MP) / Party_SPRWidth) / (GetPlayerMaxVital(PlayerNum, Vitals.MP) / Party_SPRWidth)) * Party_SPRWidth

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandlePartyVitals", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandlePokeEvo(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim PokemonId As Byte, Command As Byte
    PokemonId = GetPlayerEquipmentPokeInfoPokemon(MyIndex, weapon)

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Command = Buffer.ReadByte
    Player(MyIndex).EvolPermition = Buffer.ReadByte
    Player(MyIndex).EvoId = Buffer.ReadInteger
    Set Buffer = Nothing

    frmMain.lblEvol(0).Caption = "Seu " & Trim$(Pokemon(PokemonId).Name) & " est� prestes a evoluir para " & Trim$(Pokemon(Pokemon(PokemonId).Evolu��o(Player(MyIndex).EvoId).Pokemon).Name) & " deseja continuar?"
    frmMain.PicEvolution.Visible = True
    frmMain.PicEvolution.top = (frmMain.ScaleHeight / 2) - (frmMain.PicEvolution.Height / 2)
    frmMain.PicEvolution.Left = (frmMain.ScaleWidth / 2) - (frmMain.PicEvolution.Width / 2)

    bltPokeEvolvePortrait

    If Command = 0 Then
        frmMain.imgClose(9).Visible = True
        frmMain.imgButton(14).Visible = True
    Else
        frmMain.EvolutionTimer = True
        PlaySound Sound_Evolve, -1, -1
        frmMain.imgClose(9).Visible = False
        frmMain.imgButton(14).Visible = False
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "TrainerPoint", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub handleInFishing(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim i As Long, FishingValue As Byte, ScanValue As Byte
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong
    FishingValue = Buffer.ReadByte
    ScanValue = Buffer.ReadByte

    If FishingValue = 1 Then
        Player(i).InFishing = GetTickCount    '10000 + GetTickCount
    Else
        Player(i).InFishing = 0
    End If

    If ScanValue = 1 Then
        Player(i).ScanTime = GetTickCount
    Else
        Player(i).ScanTime = 0
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "handleInFishing", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleUpdateQuest(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim n As Long
    Dim Buffer As clsBuffer
    Dim QuestSize As Long
    Dim QuestData() As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    n = Buffer.ReadLong
    ' Update the Quest
    QuestSize = LenB(Quest(n))
    ReDim QuestData(QuestSize - 1)
    QuestData = Buffer.ReadBytes(QuestSize)
    CopyMemory ByVal VarPtr(Quest(n)), ByVal VarPtr(QuestData(0)), QuestSize
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleUpdateQuest", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleQuestCommand(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, Command As Byte, value As Long
    Dim QuestNum As Long, MapNum As Integer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Command = Buffer.ReadByte
    value = Buffer.ReadLong

    If Command = 2 Then
        QuestNum = Buffer.ReadLong
        Player(Index).Quests(QuestNum).KillNpcs = Buffer.ReadLong
        Player(Index).Quests(QuestNum).KillPlayers = Buffer.ReadLong

        'Atualizar Caso A janela esteja aberta!
        If frmMain.picQuest.Visible = True Then
            If frmMain.lstQuests.ListCount > 0 Then
                UpdateQuestInfo GetQuestNum(Trim$(frmMain.lstQuests.text))
            End If
        End If
    End If

    Set Buffer = Nothing

    Select Case Command
        ' Select npc quest
    Case 1
        frmMain.picSelectQuest.Visible = True

        frmMain.picSelectQuest.top = (frmMain.ScaleHeight / 2) - (frmMain.picSelectQuest.Height / 2)
        frmMain.picSelectQuest.Left = (frmMain.ScaleWidth / 2) - (frmMain.picSelectQuest.Width / 2)

        UpdateSelectQuest value
    End Select

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleQuestCommand", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleQuestEditor()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    With frmEditor_Quest
        Editor = EDITOR_QUEST
        .lstIndex.Clear

        ' Add the names
        For i = 1 To MAX_QUESTS
            .lstIndex.AddItem i & ": " & Trim$(Quest(i).Name)
        Next

        .Show
        .lstIndex.ListIndex = 0
        QuestEditorInit
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleQuestEditor", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleDialogue(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Dialogue Buffer.ReadString, Buffer.ReadString, Buffer.ReadByte, Buffer.ReadLong
    Set Buffer = Nothing

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleDialogue", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleAttLeilao(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim LeilaoNum As Long, Vendedor As String, ItemNum As Long, Price As Long, Tempo As Long, Tipo As Long
    Dim i As Long, X As Long, QntiaItens As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    For i = 1 To MAX_LEILAO
        Leilao(i).Vendedor = Buffer.ReadString
        Leilao(i).ItemNum = Buffer.ReadLong
        Leilao(i).Price = Buffer.ReadLong
        Leilao(i).Tempo = Buffer.ReadLong
        Leilao(i).Tipo = Buffer.ReadLong
        'Pokemon
        Leilao(i).Poke.Pokemon = Buffer.ReadLong
        Leilao(i).Poke.Pokeball = Buffer.ReadLong
        Leilao(i).Poke.Level = Buffer.ReadLong
        Leilao(i).Poke.Exp = Buffer.ReadLong
        Leilao(i).Poke.Felicidade = Buffer.ReadLong
        Leilao(i).Poke.Sexo = Buffer.ReadLong
        Leilao(i).Poke.Shiny = Buffer.ReadLong

        For X = 1 To Vitals.Vital_Count - 1
            Leilao(i).Poke.Vital(X) = Buffer.ReadLong
            Leilao(i).Poke.MaxVital(X) = Buffer.ReadLong
        Next

        For X = 1 To Stats.Stat_Count - 1
            Leilao(i).Poke.Stat(X) = Buffer.ReadLong
        Next

        For X = 1 To 4
            Leilao(i).Poke.Spells(X) = Buffer.ReadLong
        Next

        For X = 1 To MAX_NEGATIVES
            Leilao(i).Poke.Negatives(X) = Buffer.ReadLong
        Next

        For X = 1 To MAX_BERRYS
            Leilao(i).Poke.Berry(X) = Buffer.ReadLong
        Next
    Next

    PageMaxLeilao = 1

    For i = 1 To MAX_LEILAO
        If Leilao(i).ItemNum > 0 Then
            QntiaItens = QntiaItens + 1
            If QntiaItens >= 20 Then
                QntiaItens = 0
                PageMaxLeilao = PageMaxLeilao + 1
            End If
        End If
    Next

    frmMain.lblLeilaoInfo(0).Caption = PageLeilao & "/" & PageMaxLeilao

    SendALeilao
    BltLeilao

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleAttLeilao", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub HandleCChat(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, M, c As Long, T As String

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    c = Buffer.ReadLong
    M = Buffer.ReadLong
    T = Buffer.ReadString

    Select Case c
    Case 1
        frmEditor_Chat.lblJogador.Caption = "Conversando com: " & GetPlayerName(M)
        Dialogue "Chat Privado", GetPlayerName(M) & " Convidou voc� para uma conversa privada , desejaria aceitar?", DIALOGUE_TYPE_PM, True
    Case 2
        SendChatComando 6, vbNullString
    Case 3
        frmEditor_Chat.Hide
        frmEditor_Chat.txtChat.text = vbNullString
    Case 4
        frmEditor_Chat.lblJogador.Caption = "Conversando com: " & GetPlayerName(M)
    Case 5
        frmEditor_Chat.Show
        frmEditor_Chat.txtChat.text = vbNullString
    Case 6
        frmEditor_Chat.txtChat.SelText = GetPlayerName(M) & " :" & T & vbNewLine
    Case 7
        frmEditor_Chat.txtChat.SelText = GetPlayerName(M) & " :" & T & vbNewLine
        frmEditor_Chat.txtEChat.text = vbNullString
    End Select

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleCChat", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Private Sub handlePokeSelect()
    Dim i As Long

    If frmMain.PicPokeInicial.Visible = True Then Exit Sub

    AddText "[Prof.Oak]: Ol�, Seja Bem Vindo! Escolha o seu companheiro para viajar na sua Jornada!", White

    frmMain.PicPokeInicial.Visible = True
    frmMain.PicPokeInicial.top = (frmMain.ScaleHeight / 2) - (frmMain.PicPokeInicial.Height / 2)
    frmMain.PicPokeInicial.Left = (frmMain.ScaleWidth / 2) - (frmMain.PicPokeInicial.Width / 2)

    SelectPokeInicial = 1

    frmMain.lblPokeInicial(1).ForeColor = &HFF00&
    For i = 1 To 4
        If i <> 1 Then
            frmMain.lblPokeInicial(i).ForeColor = &HFFFFFF
        End If
    Next

End Sub

Private Sub HandleSendSurfInit(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim PlayerNum As Long

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    PlayerNum = Buffer.ReadLong
    Player(PlayerNum).InSurf = Buffer.ReadByte

    If PlayerNum = Index Then
        If Player(Index).InSurf = 3 Then
            frmMain.PicSurf.Visible = True
            frmMain.PicSurf.top = (frmMain.ScaleHeight / 2) - (frmMain.PicSurf.Height / 2)
            frmMain.PicSurf.Left = (frmMain.ScaleWidth / 2) - (frmMain.PicSurf.Width / 2)
        Else
            frmMain.PicSurf.Visible = False
        End If
    End If

    Set Buffer = Nothing

End Sub


Private Sub HandleUpdateRankLevel(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Position As Long
    Dim i As Byte
    Dim Buffer As clsBuffer

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    For i = 1 To MAX_RANKS
        RankLevel(i).Name = Buffer.ReadString
        RankLevel(i).Level = Buffer.ReadLong
        RankLevel(i).PokeNum = Buffer.ReadLong
    Next

    Set Buffer = Nothing
    If RankOpen = 1 Then UpdateRankLevel

End Sub

Private Sub HandleCLuta(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, c, CC, a, T, Pok As Long

    Set Buffer = New clsBuffer

    Buffer.WriteBytes data()

    c = Buffer.ReadLong
    T = Buffer.ReadLong
    CC = Buffer.ReadLong
    a = Buffer.ReadLong
    Pok = Buffer.ReadLong

    Select Case c
    Case 1
        Select Case T
        Case 0
            Dialogue "Duelo " & Pok & " Pok�mon(s)", GetPlayerName(CC) & " Desafiou voc� para uma batalha " & a & ", Aceitar ?", DIALOGUE_TYPE_LT, True
        Case 1
            Dialogue " Grupo x Grupo", GetPlayerName(CC) & " Desafiou voc� para uma lutar " & a & ", Aceitar ?", DIALOGUE_TYPE_LT, True
        Case 2
            Dialogue " Equipe x Equipe", GetPlayerName(CC) & " Desafiou voc� para uma lutar " & a & ", Aceitar ?", DIALOGUE_TYPE_LT, True
        End Select
    Case 2
        SendLutarComando 4, 0, 0, 0, vbNullString
    End Select

End Sub

Private Sub HandleArenas(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Arena As Long, status As Long

    Set Buffer = New clsBuffer

    Buffer.WriteBytes data()

    Arena = Buffer.ReadLong
    status = Buffer.ReadLong

    If Arena = 0 Then Exit Sub

    Player(Index).Arena(Arena) = status

End Sub

Private Sub HandleAprenderSpell(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Command As Long, i As Integer

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    Command = Buffer.ReadByte
    Player(Index).LearnSpell(1) = Buffer.ReadInteger
    Player(Index).LearnSpell(2) = Buffer.ReadInteger

    If Command = 0 Then
        frmMain.PicHabilidade.Visible = True
        frmMain.lblDescHab(0).Caption = "O Pok�mon " & Trim$(Pokemon(GetPlayerEquipmentPokeInfoPokemon(Index, weapon)).Name) & " qu�r aprender a habilidade " & Trim$(Spell(Player(Index).LearnSpell(2)).Name) & " mas j� possui 4 ataques, qual deseja substituir?"
        For i = 1 To 4
            If GetPlayerEquipmentPokeInfoSpell(Index, weapon, i) > 0 Then
                frmMain.lblDescHab(i).Caption = Trim$(Spell(GetPlayerEquipmentPokeInfoSpell(Index, weapon, i)).Name)
            Else
                frmMain.lblDescHab(i).Caption = vbNullString
            End If
        Next

        frmMain.PicHabilidade.top = (frmMain.ScaleHeight / 2) - (frmMain.PicHabilidade.Height / 2)
        frmMain.PicHabilidade.Left = (frmMain.ScaleWidth / 2) - (frmMain.PicHabilidade.Width / 2)

    Else
        frmMain.PicHabilidade.Visible = False
        frmMain.lblDescHab(0).Caption = vbNullString
        For i = 1 To 4
            frmMain.lblDescHab(i).Caption = vbNullString
        Next
    End If

    Set Buffer = Nothing

End Sub

Sub HandleNoticia(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Msg As String, i As Long
    Dim Color As Byte


    If Options.Debug = 1 Then On Error GoTo errorhandler

    If NoticiaServ(1) = vbNullString Then
        NotX = 0
    End If

    frmMain.tmrNoticia.Enabled = True

    Dim Buffer As clsBuffer

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Msg = Buffer.ReadString
    Color = Buffer.ReadLong

    For i = 1 To MAX_NOTICIAS
        If NoticiaServ(i) = vbNullString Then
            NoticiaServ(i) = Msg
            Exit For
        End If
    Next

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "HandleNoticia", "modHandleData", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Sub HandleAttOrg(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, P As Long, e As Long, U As String, status As String
    Dim i As Long, Membros As Boolean

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    If Player(Index).ORG > 0 Then
        Organization(Player(Index).ORG).Exp = Buffer.ReadLong
        Organization(Player(Index).ORG).Level = Buffer.ReadLong
        P = Buffer.ReadLong
        Membros = Buffer.ReadByte
        MaxExpOrg = P

        If Membros = True Then
            For i = 1 To MAX_ORG_MEMBERS
                Organization(Player(Index).ORG).OrgMember(i).User_Name = Buffer.ReadString
                Organization(Player(Index).ORG).OrgMember(i).Online = Buffer.ReadByte
                Organization(Player(Index).ORG).OrgMember(i).Used = Buffer.ReadByte
            Next

            'Limpar
            frmMain.OrgMembers.Clear

            'Adicionar
            For i = 1 To MAX_ORG_MEMBERS

                If Organization(Player(Index).ORG).OrgMember(i).Online = True Then status = "Online"
                If Organization(Player(Index).ORG).OrgMember(i).Online = False Then status = "Offline"

                If Not Organization(Player(Index).ORG).OrgMember(i).Used = 0 Then
                    If i = 1 Then
                        frmMain.OrgMembers.AddItem "L�der:" & Trim$(Organization(Player(Index).ORG).OrgMember(i).User_Name) & " - " & status
                    Else
                        frmMain.OrgMembers.AddItem i - 1 & ": " & Trim$(Organization(Player(Index).ORG).OrgMember(i).User_Name) & " - " & status
                    End If
                End If
            Next
        End If

        frmMain.PicExp.Width = ((Organization(Player(Index).ORG).Exp) / ORG) / (P / ORG) * ORG

        'Atualizar
        BltOrganiza��o

        Select Case Player(Index).ORG
        Case 1
            U = "Equipe Rocket"
        Case 2
            U = "Team Magma"
        Case 3
            U = "Team Aqua"
        Case Else
            Exit Sub
        End Select
    End If
    Set Buffer = Nothing
End Sub

Sub HandleOrgShop(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, P As Long, e As Long, U As String
    Dim i As Long

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    For i = 1 To MAX_ORG_SHOP
        OrgShop(i).Item = Buffer.ReadLong
        OrgShop(i).Quantia = Buffer.ReadLong
        OrgShop(i).Valor = Buffer.ReadLong
        OrgShop(i).Level = Buffer.ReadLong
    Next
    Set Buffer = Nothing

End Sub

Private Sub HandleChatBubble(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, targetType As Long, target As Long, Message As String, colour As Long

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()

    target = Buffer.ReadLong
    targetType = Buffer.ReadLong
    Message = Buffer.ReadString
    colour = Buffer.ReadLong

    AddChatBubble target, targetType, Message, colour
    Set Buffer = Nothing
End Sub

Private Sub HandleVipPlayerInfo(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, targetType As Long, target As Long, Message As String, colour As Long

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Player(MyIndex).VipPoints = Buffer.ReadLong
    Set Buffer = Nothing

    frmMain.lblVip(7).Caption = Player(MyIndex).VipPoints
    'Vip Points
    If Player(MyIndex).VipPoints <= 1500 Then
        frmMain.PicVipBar.Width = (Player(MyIndex).VipPoints / 377) / (1500 / 377) * 377
    Else
        frmMain.PicVipBar.Width = 377
    End If
End Sub

Private Sub HandleAparencia(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, i As Long
    Dim Sex As String

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong
    Player(i).Sex = Buffer.ReadByte

    'Modelos
    Player(i).HairModel = Buffer.ReadInteger
    Player(i).ClothModel = Buffer.ReadInteger
    Player(i).LegsModel = Buffer.ReadInteger

    'Cor
    Player(i).HairColor = Buffer.ReadByte
    Player(i).ClothColor = Buffer.ReadByte
    Player(i).LegsColor = Buffer.ReadByte

    'Numero
    Player(i).HairNum = Buffer.ReadInteger
    Player(i).ClothNum = Buffer.ReadInteger
    Player(i).LegsNum = Buffer.ReadInteger
    Set Buffer = Nothing

End Sub

Private Sub HandlePlayerRun(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer, Run As Byte, i As Long

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    i = Buffer.ReadLong
    Run = Buffer.ReadByte
    If Run = 1 Then Player(i).Running = True
    If Run = 0 Then Player(i).Running = False
    Set Buffer = Nothing
End Sub

Private Sub HandleComandoGym(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Comando As Byte

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    Comando = Buffer.ReadByte
    Set Buffer = Nothing

    Select Case Comando
    Case 1    'Brock Invite
        ChatGym = 1    'Brock
        ChatGymStep = 0    'Primeira fala
        frmMain.lblGym(0).Caption = "Ent�o, voc� est� aqui eu sou Brock o l�der do gin�sio de Pewter, minha for�a de vontade � uma Rocha S�lida � evidente, mesmo meus pok�mons s�o pura rocha, a verdadeira for�a de vontade! � isso mesmo... Os meus pok�mons s�o todos do tipo Pedra! HAHAHA! Voc� vai me desafiar sabendo que voc� vai perder?"
        frmMain.lblGym(1).Caption = "Sim!"
        frmMain.lblGym(2).Caption = "Cancelar"
        frmMain.lblGym(3).Caption = "Brock"
        frmMain.PicBlank(1).Picture = LoadPicture(App.Path & "\data files\graphics\gui\main\gymleader\1.jpg")
        frmMain.PicBlank(0).Visible = True
        frmMain.PicBlank(0).top = (frmMain.ScaleHeight / 2) - (frmMain.PicBlank(0).Height / 2)
        frmMain.PicBlank(0).Left = (frmMain.ScaleWidth / 2) - (frmMain.PicBlank(0).Width / 2)
    End Select
End Sub

Private Sub HandleContagem(ByVal Index As Long, ByRef data() As Byte, ByVal StartAddr As Long, ByVal ExtraVar As Long)
    Dim Buffer As clsBuffer
    Dim Tempo As Integer

    Set Buffer = New clsBuffer
    Buffer.WriteBytes data()
    ContagemGym = Buffer.ReadInteger
    ContagemTick = 1000 + GetTickCount
    Set Buffer = Nothing

End Sub
