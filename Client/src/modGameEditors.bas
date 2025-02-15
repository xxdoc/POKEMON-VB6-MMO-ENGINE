Attribute VB_Name = "modGameEditors"
Option Explicit
' ////////////////
' // Map Editor //
' ////////////////
Public Sub MapEditorInit()
    Dim i As Long
    Dim smusic() As String

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' set the width
    frmEditor_Map.Width = 7425

    ' we're in the map editor
    InMapEditor = True

    ' show the form
    frmEditor_Map.Visible = True

    ' PicCharacter Off
    frmMain.picCharacter.Visible = False

    ' set the scrolly bars
    frmEditor_Map.scrlTileSet.max = NumTileSets
    frmEditor_Map.fraTileSet.Caption = "Tileset: " & 1
    frmEditor_Map.scrlTileSet.value = 1

    ' render the tiles
    Call EditorMap_BltTileset

    ' set the scrollbars
    frmEditor_Map.scrlPictureY.max = (frmEditor_Map.picBackSelect.Height \ PIC_Y) - (frmEditor_Map.picBack.Height \ PIC_Y)
    frmEditor_Map.scrlPictureX.max = (frmEditor_Map.picBackSelect.Width \ PIC_X) - (frmEditor_Map.picBack.Width \ PIC_X)
    MapEditorTileScroll

    ' set shops for the shop attribute
    frmEditor_Map.cmbShop.AddItem "None"
    For i = 1 To MAX_SHOPS
        frmEditor_Map.cmbShop.AddItem i & ": " & Shop(i).Name
    Next

    ' we're not in a shop
    frmEditor_Map.cmbShop.ListIndex = 0

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorInit", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorProperties()
    Dim X As Long
    Dim Y As Long
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' populate the cache if we need to
    If Not hasPopulated Then
        PopulateLists
    End If
    ' add the array to the combo
    frmEditor_MapProperties.lstMusic.Clear
    frmEditor_MapProperties.lstMusic.AddItem "None."
    For i = 1 To UBound(musicCache)
        frmEditor_MapProperties.lstMusic.AddItem musicCache(i)
    Next
    ' finished populating

    With frmEditor_MapProperties
        .txtName.text = Trim$(Map.Name)

        ' find the music we have set
        If .lstMusic.ListCount >= 0 Then
            .lstMusic.ListIndex = 0
            For i = 0 To .lstMusic.ListCount
                If .lstMusic.List(i) = Trim$(Map.Music) Then
                    .lstMusic.ListIndex = i
                End If
            Next
        End If

        ' rest of it
        .txtUp.text = CStr(Map.Up)
        .txtDown.text = CStr(Map.Down)
        .txtLeft.text = CStr(Map.Left)
        .txtRight.text = CStr(Map.Right)
        .cmbMoral.ListIndex = Map.Moral
        .txtBootMap.text = CStr(Map.BootMap)
        .txtBootX.text = CStr(Map.BootX)
        .txtBootY.text = CStr(Map.BootY)
        .CmbWeather.ListIndex = CStr(Map.Weather)
        .scrlWeatherIntensity.value = CStr(Map.Intensity)

        For X = 1 To 2
            .scrlLevel(X - 1).value = CStr(Map.LevelPoke(X))
        Next

        ' show the map npcs
        .lstNpcs.Clear
        For X = 1 To MAX_MAP_NPCS
            If Map.Npc(X) > 0 Then
                .lstNpcs.AddItem X & ": " & Trim$(Npc(Map.Npc(X)).Name)
            Else
                .lstNpcs.AddItem X & ": No NPC"
            End If
        Next
        .lstNpcs.ListIndex = 0

        ' show the npc selection combo
        .cmbNpc.Clear
        .cmbNpc.AddItem "No NPC"
        For X = 1 To MAX_NPCS
            .cmbNpc.AddItem X & ": " & Trim$(Npc(X).Name)
        Next

        ' set the combo box properly
        Dim tmpString() As String
        Dim NpcNum As Long
        tmpString = Split(.lstNpcs.List(.lstNpcs.ListIndex))
        NpcNum = CLng(Left$(tmpString(0), Len(tmpString(0)) - 1))
        .cmbNpc.ListIndex = Map.Npc(NpcNum)

        ' show the current map
        .lblMap.Caption = "Current map: " & GetPlayerMap(MyIndex)
        .txtMaxX.text = Map.MaxX
        .txtMaxY.text = Map.MaxY
    End With

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorProperties", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorSetTile(ByVal X As Long, ByVal Y As Long, ByVal CurLayer As Long, Optional ByVal multitile As Boolean = False)
    Dim X2 As Long, Y2 As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If Not multitile Then    ' single
        With Map.Tile(X, Y)
            ' set layer
            .Layer(CurLayer).X = EditorTileX
            .Layer(CurLayer).Y = EditorTileY
            .Layer(CurLayer).Tileset = frmEditor_Map.scrlTileSet.value
        End With
    Else    ' multitile
        Y2 = 0    ' starting tile for y axis
        For Y = CurY To CurY + EditorTileHeight - 1
            X2 = 0    ' re-set x count every y loop
            For X = CurX To CurX + EditorTileWidth - 1
                If X >= 0 And X <= Map.MaxX Then
                    If Y >= 0 And Y <= Map.MaxY Then
                        With Map.Tile(X, Y)
                            .Layer(CurLayer).X = EditorTileX + X2
                            .Layer(CurLayer).Y = EditorTileY + Y2
                            .Layer(CurLayer).Tileset = frmEditor_Map.scrlTileSet.value
                        End With
                    End If
                End If
                X2 = X2 + 1
            Next
            Y2 = Y2 + 1
        Next
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorSetTile", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorMouseDown(ByVal Button As Integer, ByVal X As Long, ByVal Y As Long, Optional ByVal movedMouse As Boolean = True)
    Dim i As Long
    Dim CurLayer As Long
    Dim tmpDir As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' find which layer we're on
    For i = 1 To MapLayer.Layer_Count - 1
        If frmEditor_Map.optLayer(i).value Then
            CurLayer = i
            Exit For
        End If
    Next

    If Not isInBounds Then Exit Sub
    If Button = vbLeftButton Then
        If frmEditor_Map.optLayers.value Then
            If EditorTileWidth = 1 And EditorTileHeight = 1 Then    'single tile
                MapEditorSetTile CurX, CurY, CurLayer
            Else    ' multi tile!
                MapEditorSetTile CurX, CurY, CurLayer, True
            End If
        ElseIf frmEditor_Map.optAttribs.value Then
            With Map.Tile(CurX, CurY)
                ' blocked tile
                If frmEditor_Map.optBlocked.value Then .Type = TILE_TYPE_BLOCKED
                ' warp tile
                If frmEditor_Map.optWarp.value Then
                    .Type = TILE_TYPE_WARP
                    .Data1 = EditorWarpMap
                    .Data2 = EditorWarpX
                    .Data3 = EditorWarpY
                End If
                ' item spawn
                If frmEditor_Map.optItem.value Then
                    .Type = TILE_TYPE_ITEM
                    .Data1 = ItemEditorNum
                    .Data2 = ItemEditorValue
                    .Data3 = 0
                End If
                ' npc avoid
                If frmEditor_Map.optNpcAvoid.value Then
                    .Type = TILE_TYPE_NPCAVOID
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                End If
                ' npc avoid
                If frmEditor_Map.OptFlyAvoid.value Then
                    .Type = TILE_TYPE_FLYAVOID
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                End If
                ' Placas
                If frmEditor_Map.OptSign.value Then
                    .Type = TILE_TYPE_SIGN
                    .Data1 = MapEditorHealAmount
                    .Data2 = 0
                    .Data3 = 0
                End If
                ' key
                If frmEditor_Map.optKey.value Then
                    .Type = TILE_TYPE_KEY
                    .Data1 = KeyEditorNum
                    .Data2 = KeyEditorTake
                    .Data3 = 0
                End If
                ' key open
                If frmEditor_Map.optKeyOpen.value Then
                    .Type = TILE_TYPE_KEYOPEN
                    .Data1 = KeyOpenEditorX
                    .Data2 = KeyOpenEditorY
                    .Data3 = 0
                End If
                ' resource
                If frmEditor_Map.optResource.value Then
                    .Type = TILE_TYPE_RESOURCE
                    .Data1 = ResourceEditorNum
                    .Data2 = 0
                    .Data3 = 0
                End If
                ' door
                If frmEditor_Map.optDoor.value Then
                    .Type = TILE_TYPE_DOOR
                    .Data1 = EditorWarpMap
                    .Data2 = EditorWarpX
                    .Data3 = EditorWarpY
                End If
                ' npc spawn
                If frmEditor_Map.optNpcSpawn.value Then
                    .Type = TILE_TYPE_NPCSPAWN
                    .Data1 = SpawnNpcNum
                    .Data2 = SpawnNpcDir
                    .Data3 = 0
                End If
                ' shop
                If frmEditor_Map.optShop.value Then
                    .Type = TILE_TYPE_SHOP
                    .Data1 = EditorShop
                    .Data2 = 0
                    .Data3 = 0
                End If
                ' bank
                If frmEditor_Map.optBank.value Then
                    .Type = TILE_TYPE_BANK
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                End If
                ' heal
                If frmEditor_Map.optHeal.value Then
                    .Type = TILE_TYPE_HEAL
                    .Data1 = MapEditorHealType
                    .Data2 = MapEditorHealAmount
                    .Data3 = 0
                End If
                ' trap
                If frmEditor_Map.optTrap.value Then
                    .Type = TILE_TYPE_TRAP
                    .Data1 = MapEditorHealAmount
                    .Data2 = 0
                    .Data3 = 0
                End If
                ' slide
                If frmEditor_Map.optSlide.value Then
                    .Type = TILE_TYPE_SLIDE
                    .Data1 = MapEditorSlideDir
                    .Data2 = 0
                    .Data3 = 0
                End If
                ' Fishing
                If frmEditor_Map.OptFishing.value Then
                    .Type = TILE_TYPE_FISHING
                    .Data1 = MapEditorSlideDir
                    .Data2 = 0
                    .Data3 = 0
                End If
                'Grass
                If frmEditor_Map.optGrass.value Then
                    .Type = TILE_TYPE_GRASS
                    .Data1 = 0
                    .Data2 = 0
                    .Data3 = 0
                End If
                'Water
                If frmEditor_Map.OptWater.value Then
                    .Type = TILE_TYPE_WATER
                    .Data1 = MapEditorSlideDir
                    .Data2 = 0
                    .Data3 = 0
                End If
                'Script
                If frmEditor_Map.optScript.value Then
                    .Type = TILE_TYPE_SCRIPT
                    .Data1 = MapEditorScript
                    .Data2 = 0
                    .Data3 = 0
                End If
            End With
        ElseIf frmEditor_Map.optBlock.value Then
            If movedMouse Then Exit Sub
            ' find what tile it is
            X = X - ((X \ 32) * 32)
            Y = Y - ((Y \ 32) * 32)
            ' see if it hits an arrow
            For i = 1 To 4
                If X >= DirArrowX(i) And X <= DirArrowX(i) + 8 Then
                    If Y >= DirArrowY(i) And Y <= DirArrowY(i) + 8 Then
                        ' flip the value.
                        setDirBlock Map.Tile(CurX, CurY).DirBlock, CByte(i), Not isDirBlocked(Map.Tile(CurX, CurY).DirBlock, CByte(i))
                        Exit Sub
                    End If
                End If
            Next
        End If
    End If

    If Button = vbRightButton Then
        If frmEditor_Map.optLayers.value Then
            With Map.Tile(CurX, CurY)
                ' clear layer
                .Layer(CurLayer).X = 0
                .Layer(CurLayer).Y = 0
                .Layer(CurLayer).Tileset = 0
            End With
        ElseIf frmEditor_Map.optAttribs.value Then
            With Map.Tile(CurX, CurY)
                ' clear attribute
                .Type = 0
                .Data1 = 0
                .Data2 = 0
                .Data3 = 0
            End With

        End If
    End If

    CacheResources

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorMouseDown", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorChooseTile(Button As Integer, X As Single, Y As Single)
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If Button = vbLeftButton Then
        EditorTileWidth = 1
        EditorTileHeight = 1

        EditorTileX = X \ PIC_X
        EditorTileY = Y \ PIC_Y

        frmEditor_Map.shpSelected.top = EditorTileY * PIC_Y
        frmEditor_Map.shpSelected.Left = EditorTileX * PIC_X

        frmEditor_Map.shpSelected.Width = PIC_X
        frmEditor_Map.shpSelected.Height = PIC_Y
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorChooseTile", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorDrag(Button As Integer, X As Single, Y As Single)
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If Button = vbLeftButton Then
        ' convert the pixel number to tile number
        X = (X \ PIC_X) + 1
        Y = (Y \ PIC_Y) + 1
        ' check it's not out of bounds
        If X < 0 Then X = 0
        If X > frmEditor_Map.picBackSelect.Width / PIC_X Then X = frmEditor_Map.picBackSelect.Width / PIC_X
        If Y < 0 Then Y = 0
        If Y > frmEditor_Map.picBackSelect.Height / PIC_Y Then Y = frmEditor_Map.picBackSelect.Height / PIC_Y
        ' find out what to set the width + height of map editor to
        If X > EditorTileX Then    ' drag right
            EditorTileWidth = X - EditorTileX
        Else    ' drag left
            ' TO DO
        End If
        If Y > EditorTileY Then    ' drag down
            EditorTileHeight = Y - EditorTileY
        Else    ' drag up
            ' TO DO
        End If
        frmEditor_Map.shpSelected.Width = EditorTileWidth * PIC_X
        frmEditor_Map.shpSelected.Height = EditorTileHeight * PIC_Y
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorDrag", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorTileScroll()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' horizontal scrolling
    If frmEditor_Map.picBackSelect.Width < frmEditor_Map.picBack.Width Then
        frmEditor_Map.scrlPictureX.Enabled = False
    Else
        frmEditor_Map.scrlPictureX.Enabled = True
        frmEditor_Map.picBackSelect.Left = (frmEditor_Map.scrlPictureX.value * PIC_X) * -1
    End If

    ' vertical scrolling
    If frmEditor_Map.picBackSelect.Height < frmEditor_Map.picBack.Height Then
        frmEditor_Map.scrlPictureY.Enabled = False
    Else
        frmEditor_Map.scrlPictureY.Enabled = True
        frmEditor_Map.picBackSelect.top = (frmEditor_Map.scrlPictureY.value * PIC_Y) * -1
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorTileScroll", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorSend()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Call SendMap
    InMapEditor = False
    Unload frmEditor_Map

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorSend", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorCancel()
    Dim Buffer As clsBuffer

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Set Buffer = New clsBuffer
    Buffer.WriteLong CNeedMap
    Buffer.WriteLong 1
    SendData Buffer.ToArray()
    InMapEditor = False
    Unload frmEditor_Map

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorCancel", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorClearLayer()
    Dim i As Long
    Dim X As Long
    Dim Y As Long
    Dim CurLayer As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' find which layer we're on
    For i = 1 To MapLayer.Layer_Count - 1
        If frmEditor_Map.optLayer(i).value Then
            CurLayer = i
            Exit For
        End If
    Next

    If CurLayer = 0 Then Exit Sub

    ' ask to clear layer
    If MsgBox("Are you sure you wish to clear this layer?", vbYesNo, Options.Game_Name) = vbYes Then
        For X = 0 To Map.MaxX
            For Y = 0 To Map.MaxY
                Map.Tile(X, Y).Layer(CurLayer).X = 0
                Map.Tile(X, Y).Layer(CurLayer).Y = 0
                Map.Tile(X, Y).Layer(CurLayer).Tileset = 0
            Next
        Next
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorClearLayer", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorFillLayer()
    Dim i As Long
    Dim X As Long
    Dim Y As Long
    Dim CurLayer As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' find which layer we're on
    For i = 1 To MapLayer.Layer_Count - 1
        If frmEditor_Map.optLayer(i).value Then
            CurLayer = i
            Exit For
        End If
    Next

    ' Ground layer
    If MsgBox("Are you sure you wish to fill this layer?", vbYesNo, Options.Game_Name) = vbYes Then
        For X = 0 To Map.MaxX
            For Y = 0 To Map.MaxY
                Map.Tile(X, Y).Layer(CurLayer).X = EditorTileX
                Map.Tile(X, Y).Layer(CurLayer).Y = EditorTileY
                Map.Tile(X, Y).Layer(CurLayer).Tileset = frmEditor_Map.scrlTileSet.value
            Next
        Next
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorFillLayer", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorClearAttribs()
    Dim X As Long
    Dim Y As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If MsgBox("Are you sure you wish to clear the attributes on this map?", vbYesNo, Options.Game_Name) = vbYes Then

        For X = 0 To Map.MaxX
            For Y = 0 To Map.MaxY
                Map.Tile(X, Y).Type = 0
            Next
        Next

    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorClearAttribs", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub MapEditorLeaveMap()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If InMapEditor Then
        If MsgBox("Save changes to current map?", vbYesNo) = vbYes Then
            Call MapEditorSend
        Else
            Call MapEditorCancel
        End If
    End If

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "MapEditorLeaveMap", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

' /////////////////
' // Item Editor //
' /////////////////
Public Sub ItemEditorInit()
    Dim i As Long
    Dim SoundSet As Boolean

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If frmEditor_Item.Visible = False Then Exit Sub
    EditorIndex = frmEditor_Item.lstIndex.ListIndex + 1

    ' populate the cache if we need to
    If Not hasPopulated Then
        PopulateLists
    End If
    ' add the array to the combo
    frmEditor_Item.cmbSound.Clear
    frmEditor_Item.cmbSound.AddItem "None."
    For i = 1 To UBound(soundCache)
        frmEditor_Item.cmbSound.AddItem soundCache(i)
    Next
    ' finished populating

    With Item(EditorIndex)
        frmEditor_Item.txtName.text = Trim$(.Name)
        If .Pic > frmEditor_Item.scrlPic.max Then .Pic = 0
        frmEditor_Item.scrlPic.value = .Pic
        frmEditor_Item.cmbType.ListIndex = .Type
        frmEditor_Item.scrlAnim.value = .Animation
        frmEditor_Item.txtDesc.text = Trim$(.Desc)
        frmEditor_Item.scrlBau.value = 1

        If .GiveAll = True Then
            frmEditor_Item.chkGiveAll.value = 1
        Else
            frmEditor_Item.chkGiveAll.value = 0
        End If

        ' find the sound we have set
        If frmEditor_Item.cmbSound.ListCount >= 0 Then
            For i = 0 To frmEditor_Item.cmbSound.ListCount
                If frmEditor_Item.cmbSound.List(i) = Trim$(.sound) Then
                    frmEditor_Item.cmbSound.ListIndex = i
                    SoundSet = True
                End If
            Next
            If Not SoundSet Or frmEditor_Item.cmbSound.ListIndex = -1 Then frmEditor_Item.cmbSound.ListIndex = 0
        End If

        ' Type specific settings
        If (frmEditor_Item.cmbType.ListIndex >= ITEM_TYPE_WEAPON) And (frmEditor_Item.cmbType.ListIndex <= ITEM_TYPE_SHIELD) Or (frmEditor_Item.cmbType.ListIndex = ITEM_TYPE_CONSUME) Then
            frmEditor_Item.fraEquipment.Visible = True
            frmEditor_Item.scrlDamage.value = .Data2
            frmEditor_Item.cmbTool.ListIndex = .Data3

            If .speed < 100 Then .speed = 100
            frmEditor_Item.scrlSpeed.value = .speed

            ' loop for stats
            For i = 1 To Stats.Stat_Count - 1
                frmEditor_Item.scrlStatBonus(i).value = .Add_Stat(i)
            Next

            frmEditor_Item.scrlPaperdoll = .Paperdoll
            frmEditor_Item.scrlspell1.value = .Spell(1)
            frmEditor_Item.scrlspell2.value = .Spell(2)
            frmEditor_Item.scrlspell3.value = .Spell(3)
            frmEditor_Item.scrlspell4.value = .Spell(4)
            frmEditor_Item.scrlVel.value = .vel
        Else
            frmEditor_Item.fraEquipment.Visible = False
        End If

        If frmEditor_Item.cmbType.ListIndex = ITEM_TYPE_CONSUME Then
            frmEditor_Item.fraVitals.Visible = True
            frmEditor_Item.scrlAddHp.value = .AddHP
            frmEditor_Item.scrlAddMP.value = .AddMP
            frmEditor_Item.scrlAddExp.value = .AddEXP
            frmEditor_Item.scrlCastSpell.value = .CastSpell
            frmEditor_Item.chkInstant.value = .instaCast
        Else
            frmEditor_Item.fraVitals.Visible = False
        End If

        If (frmEditor_Item.cmbType.ListIndex = ITEM_TYPE_SPELL) Then
            frmEditor_Item.fraSpell.Visible = True
            frmEditor_Item.scrlSpell.value = .Data1
        Else
            frmEditor_Item.fraSpell.Visible = False
        End If

        ' Basic requirements
        frmEditor_Item.scrlAccessReq.value = .AccessReq
        frmEditor_Item.scrlLevelReq.value = .LevelReq

        ' loop for stats
        For i = 1 To Stats.Stat_Count - 1
            frmEditor_Item.scrlStatReq(i).value = .Stat_Req(i)
        Next

        ' Build cmbClassReq
        frmEditor_Item.cmbClassReq.Clear
        frmEditor_Item.cmbClassReq.AddItem "None"

        For i = 1 To Max_Classes
            frmEditor_Item.cmbClassReq.AddItem Class(i).Name
        Next

        frmEditor_Item.cmbClassReq.ListIndex = .ClassReq
        frmEditor_Item.cmbTipo.ListIndex = .Tipo
        ' Info
        frmEditor_Item.scrlPrice.value = .Price
        frmEditor_Item.cmbBind.ListIndex = .BindType
        frmEditor_Item.scrlRarity.value = .Rarity
        frmEditor_Item.scrlPokemon.value = .Pokemon
        If .Berry < 255 And .Berry >= 0 Then
            frmEditor_Item.scrlBr.value = .Berry
        End If

        If .NDrop = True Then
            frmEditor_Item.ChkNDrop.value = 1
        Else
            frmEditor_Item.ChkNDrop.value = 0
        End If

        If .NTrade = True Then
            frmEditor_Item.ChkNTrade.value = 1
        Else
            frmEditor_Item.ChkNTrade.value = 0
        End If

        If .NDeposit = True Then
            frmEditor_Item.ChkNDeposit.value = 1
        Else
            frmEditor_Item.ChkNDeposit.value = 0
        End If

        If frmEditor_Item.cmbType.ListIndex = ITEM_TYPE_BAU Then
            frmEditor_Item.scrlNum.value = .BauItem(frmEditor_Item.scrlBau)
            frmEditor_Item.scrlValue.value = .BauValue(frmEditor_Item.scrlBau)
            frmEditor_Item.fraBau.Visible = True
        Else
            frmEditor_Item.fraBau.Visible = False
        End If

        For i = 1 To 5
            If .YesNo(i) = True Then
                frmEditor_Item.ChkYesNo(i).value = 1
            Else
                frmEditor_Item.ChkYesNo(i).value = 0
            End If
        Next


        EditorIndex = frmEditor_Item.lstIndex.ListIndex + 1
    End With

    Call EditorItem_BltItem
    Call EditorItem_BltPaperdoll
    Item_Changed(EditorIndex) = True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ItemEditorInit", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ItemEditorOk()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    For i = 1 To MAX_ITEMS
        If Item_Changed(i) Then
            Call SendSaveItem(i)
        End If
    Next

    Unload frmEditor_Item
    Editor = 0
    ClearChanged_Item

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ItemEditorOk", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ItemEditorCancel()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Editor = 0
    Unload frmEditor_Item
    ClearChanged_Item
    ClearItems
    SendRequestItems

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ItemEditorCancel", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ClearChanged_Item()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ZeroMemory Item_Changed(1), MAX_ITEMS * 2    ' 2 = boolean length

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ClearChanged_Item", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

' /////////////////
' // Animation Editor //
' /////////////////
Public Sub AnimationEditorInit()
    Dim i As Long
    Dim SoundSet As Boolean

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If frmEditor_Animation.Visible = False Then Exit Sub
    EditorIndex = frmEditor_Animation.lstIndex.ListIndex + 1

    ' populate the cache if we need to
    If Not hasPopulated Then
        PopulateLists
    End If
    ' add the array to the combo
    frmEditor_Animation.cmbSound.Clear
    frmEditor_Animation.cmbSound.AddItem "None."
    For i = 1 To UBound(soundCache)
        frmEditor_Animation.cmbSound.AddItem soundCache(i)
    Next
    ' finished populating

    With Animation(EditorIndex)
        frmEditor_Animation.txtName.text = Trim$(.Name)

        ' find the sound we have set
        If frmEditor_Animation.cmbSound.ListCount >= 0 Then
            For i = 0 To frmEditor_Animation.cmbSound.ListCount
                If frmEditor_Animation.cmbSound.List(i) = Trim$(.sound) Then
                    frmEditor_Animation.cmbSound.ListIndex = i
                    SoundSet = True
                End If
            Next
            If Not SoundSet Or frmEditor_Animation.cmbSound.ListIndex = -1 Then frmEditor_Animation.cmbSound.ListIndex = 0
        End If

        For i = 0 To 1
            frmEditor_Animation.scrlSprite(i).value = .Sprite(i)
            frmEditor_Animation.scrlFrameCount(i).value = .Frames(i)
            frmEditor_Animation.scrlLoopCount(i).value = .LoopCount(i)

            If .looptime(i) > 0 Then
                frmEditor_Animation.scrlLoopTime(i).value = .looptime(i)
            Else
                frmEditor_Animation.scrlLoopTime(i).value = 45
            End If

        Next

        EditorIndex = frmEditor_Animation.lstIndex.ListIndex + 1
    End With

    Call EditorAnim_BltAnim
    Animation_Changed(EditorIndex) = True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "AnimationEditorInit", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub AnimationEditorOk()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    For i = 1 To MAX_ANIMATIONS
        If Animation_Changed(i) Then
            Call SendSaveAnimation(i)
        End If
    Next

    Unload frmEditor_Animation
    Editor = 0
    ClearChanged_Animation

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "AnimationEditorOk", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub AnimationEditorCancel()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Editor = 0
    Unload frmEditor_Animation
    ClearChanged_Animation
    ClearAnimations
    SendRequestAnimations

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "AnimationEditorCancel", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ClearChanged_Animation()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ZeroMemory Animation_Changed(1), MAX_ANIMATIONS * 2    ' 2 = boolean length

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ClearChanged_Animation", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

' ////////////////
' // Npc Editor //
' ////////////////
Public Sub NpcEditorInit()
    Dim i As Long
    Dim SoundSet As Boolean

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If frmEditor_NPC.Visible = False Then Exit Sub
    EditorIndex = frmEditor_NPC.lstIndex.ListIndex + 1

    ' populate the cache if we need to
    If Not hasPopulated Then
        PopulateLists
    End If
    ' add the array to the combo
    frmEditor_NPC.cmbSound.Clear
    frmEditor_NPC.cmbSound.AddItem "None."
    For i = 1 To UBound(soundCache)
        frmEditor_NPC.cmbSound.AddItem soundCache(i)
    Next
    ' finished populating

    With frmEditor_NPC
        .txtName.text = Trim$(Npc(EditorIndex).Name)
        .txtAttackSay.text = Trim$(Npc(EditorIndex).AttackSay)
        If Npc(EditorIndex).Sprite < 0 Or Npc(EditorIndex).Sprite > .scrlSprite.max Then Npc(EditorIndex).Sprite = 0
        .scrlSprite.value = Npc(EditorIndex).Sprite
        .txtSpawnSecs.text = CStr(Npc(EditorIndex).SpawnSecs)
        .cmbBehaviour.ListIndex = Npc(EditorIndex).Behaviour
        .scrlRange.value = Npc(EditorIndex).Range
        .txtChance.text = CStr(Npc(EditorIndex).DropChance)
        .scrlNum.value = Npc(EditorIndex).DropItem
        .scrlValue.value = Npc(EditorIndex).DropItemValue
        .txtHP.text = Npc(EditorIndex).HP
        .txtEXP.text = Npc(EditorIndex).Exp
        .txtLevel.text = Npc(EditorIndex).Level
        .scrlAnimation.value = Npc(EditorIndex).Animation
        .txtDamage.text = Npc(EditorIndex).Damage
        .ScrlChance.value = Npc(EditorIndex).Chance
        .scrlPokemon.value = Npc(EditorIndex).Pokemon
        .scrlQuest.value = Npc(EditorIndex).Quest(.scrlQuestSlot.value)

        ' find the sound we have set
        If .cmbSound.ListCount >= 0 Then
            For i = 0 To .cmbSound.ListCount
                If .cmbSound.List(i) = Trim$(Npc(EditorIndex).sound) Then
                    .cmbSound.ListIndex = i
                    SoundSet = True
                End If
            Next
            If Not SoundSet Or .cmbSound.ListIndex = -1 Then .cmbSound.ListIndex = 0
        End If

        For i = 1 To Stats.Stat_Count - 1
            .ScrlStat(i).value = Npc(EditorIndex).Stat(i)
        Next
    End With

    Call EditorNpc_BltSprite
    NPC_Changed(EditorIndex) = True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "NpcEditorInit", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub NpcEditorOk()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    For i = 1 To MAX_NPCS
        If NPC_Changed(i) Then
            Call SendSaveNpc(i)
        End If
    Next

    Unload frmEditor_NPC
    Editor = 0
    ClearChanged_NPC

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "NpcEditorOk", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub NpcEditorCancel()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Editor = 0
    Unload frmEditor_NPC
    ClearChanged_NPC
    ClearNpcs
    SendRequestNPCS

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "NpcEditorCancel", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ClearChanged_NPC()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ZeroMemory NPC_Changed(1), MAX_NPCS * 2    ' 2 = boolean length

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ClearChanged_NPC", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

' ////////////////
' // Resource Editor //
' ////////////////
Public Sub ResourceEditorInit()
    Dim i As Long
    Dim SoundSet As Boolean

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If frmEditor_Resource.Visible = False Then Exit Sub
    EditorIndex = frmEditor_Resource.lstIndex.ListIndex + 1

    ' populate the cache if we need to
    If Not hasPopulated Then
        PopulateLists
    End If
    ' add the array to the combo
    frmEditor_Resource.cmbSound.Clear
    frmEditor_Resource.cmbSound.AddItem "None."
    For i = 1 To UBound(soundCache)
        frmEditor_Resource.cmbSound.AddItem soundCache(i)
    Next
    ' finished populating

    With frmEditor_Resource
        .scrlExhaustedPic.max = NumResources
        .scrlNormalPic.max = NumResources
        .scrlAnimation.max = MAX_ANIMATIONS

        .txtName.text = Trim$(Resource(EditorIndex).Name)
        .txtMessage.text = Trim$(Resource(EditorIndex).SuccessMessage)
        .txtMessage2.text = Trim$(Resource(EditorIndex).EmptyMessage)
        .cmbType.ListIndex = Resource(EditorIndex).ResourceType
        .scrlNormalPic.value = Resource(EditorIndex).ResourceImage
        .scrlExhaustedPic.value = Resource(EditorIndex).ExhaustedImage
        .scrlReward.value = Resource(EditorIndex).ItemReward
        .scrlTool.value = Resource(EditorIndex).ToolRequired
        .scrlHealth.value = Resource(EditorIndex).health
        .scrlRespawn.value = Resource(EditorIndex).RespawnTime
        .scrlAnimation.value = Resource(EditorIndex).Animation
        .scrlSpell.value = Resource(EditorIndex).Spell

        ' find the sound we have set
        If .cmbSound.ListCount >= 0 Then
            For i = 0 To .cmbSound.ListCount
                If .cmbSound.List(i) = Trim$(Resource(EditorIndex).sound) Then
                    .cmbSound.ListIndex = i
                    SoundSet = True
                End If
            Next
            If Not SoundSet Or .cmbSound.ListIndex = -1 Then .cmbSound.ListIndex = 0
        End If
    End With

    Call EditorResource_BltSprite

    Resource_Changed(EditorIndex) = True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ResourceEditorInit", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ResourceEditorOk()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    For i = 1 To MAX_RESOURCES
        If Resource_Changed(i) Then
            Call SendSaveResource(i)
        End If
    Next

    Unload frmEditor_Resource
    Editor = 0
    ClearChanged_Resource

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ResourceEditorOk", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ResourceEditorCancel()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Editor = 0
    Unload frmEditor_Resource
    ClearChanged_Resource
    ClearResources
    SendRequestResources

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ResourceEditorCancel", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ClearChanged_Resource()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ZeroMemory Resource_Changed(1), MAX_RESOURCES * 2    ' 2 = boolean length

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ClearChanged_Resource", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

' /////////////////
' // Shop Editor //
' /////////////////
Public Sub ShopEditorInit()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If frmEditor_Shop.Visible = False Then Exit Sub
    EditorIndex = frmEditor_Shop.lstIndex.ListIndex + 1

    With frmEditor_Shop
        .txtName.text = Trim$(Shop(EditorIndex).Name)
        If Shop(EditorIndex).BuyRate > 0 Then
            .scrlBuy.value = Shop(EditorIndex).BuyRate
        Else
            .scrlBuy.value = 100
        End If

        .cmbItem.Clear
        .cmbItem.AddItem "Nenhum"
        .cmbCostItem.Clear
        .cmbCostItem.AddItem "Nenhum"

        For i = 1 To MAX_ITEMS
            .cmbItem.AddItem i & ": " & Trim$(Item(i).Name)
            .cmbCostItem.AddItem i & ": " & Trim$(Item(i).Name)
        Next

        .cmbItem.ListIndex = 0
        .cmbCostItem.ListIndex = 0

        .cmbCostItem.ListIndex = Shop(EditorIndex).TradeItem(EditorIndex).CostItem
        .txtCostValue.text = Shop(EditorIndex).TradeItem(EditorIndex).CostValue
        .cmbItem.ListIndex = Shop(EditorIndex).TradeItem(EditorIndex).Item
        .txtItemValue.text = Shop(EditorIndex).TradeItem(EditorIndex).ItemValue
    End With

    UpdateShopTrade

    Shop_Changed(EditorIndex) = True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ShopEditorInit", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub UpdateShopTrade(Optional ByVal tmpPos As Long = 0)
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    frmEditor_Shop.lstTradeItem.Clear

    For i = 1 To MAX_TRADES
        With Shop(EditorIndex).TradeItem(i)
            ' if none, show as none
            If .Item = 0 And .CostItem = 0 Then
                frmEditor_Shop.lstTradeItem.AddItem "Empty Trade Slot"
            Else
                frmEditor_Shop.lstTradeItem.AddItem i & ": " & .ItemValue & "x " & Trim$(Item(.Item).Name) & " for " & .CostValue & "x " & Trim$(Item(.CostItem).Name)
            End If
        End With
    Next

    frmEditor_Shop.lstTradeItem.ListIndex = tmpPos

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "UpdateShopTrade", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ShopEditorOk()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    For i = 1 To MAX_SHOPS
        If Shop_Changed(i) Then
            Call SendSaveShop(i)
        End If
    Next

    Unload frmEditor_Shop
    Editor = 0
    ClearChanged_Shop

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ShopEditorOk", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ShopEditorCancel()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Editor = 0
    Unload frmEditor_Shop
    ClearChanged_Shop
    ClearShops
    SendRequestShops

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ShopEditorCancel", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ClearChanged_Shop()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ZeroMemory Shop_Changed(1), MAX_SHOPS * 2    ' 2 = boolean length

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ClearChanged_Shop", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

' //////////////////
' // Spell Editor //
' //////////////////
Public Sub SpellEditorInit()
    Dim i As Long
    Dim SoundSet As Boolean

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If frmEditor_Spell.Visible = False Then Exit Sub
    EditorIndex = frmEditor_Spell.lstIndex.ListIndex + 1

    ' populate the cache if we need to
    If Not hasPopulated Then
        PopulateLists
    End If
    ' add the array to the combo
    frmEditor_Spell.cmbSound.Clear
    frmEditor_Spell.cmbSound.AddItem "None."
    For i = 1 To UBound(soundCache)
        frmEditor_Spell.cmbSound.AddItem soundCache(i)
    Next
    ' finished populating

    With frmEditor_Spell
        ' set max values
        .scrlAnimCast.max = MAX_ANIMATIONS
        .scrlAnim.max = MAX_ANIMATIONS
        .scrlAOE.max = MAX_BYTE
        .scrlRange.max = MAX_BYTE
        .scrlMap.max = MAX_MAPS
        .scrlIcon.max = NumSpellIcons
        ' build class combo
        .cmbClass.Clear
        .cmbClass.AddItem "None"
        For i = 1 To Max_Classes
            .cmbClass.AddItem Trim$(Class(i).Name)
        Next
        .cmbClass.ListIndex = Spell(EditorIndex).ClassReq

        ' set values
        .txtName.text = Trim$(Spell(EditorIndex).Name)
        .txtDesc.text = Trim$(Spell(EditorIndex).Desc)
        .cmbType.ListIndex = Spell(EditorIndex).Type
        .scrlMP.value = Spell(EditorIndex).MPCost
        .scrlLevel.value = Spell(EditorIndex).LevelReq
        .scrlAccess.value = Spell(EditorIndex).AccessReq
        .cmbClass.ListIndex = Spell(EditorIndex).ClassReq
        .scrlCast.value = Spell(EditorIndex).CastTime
        .scrlCool.value = Spell(EditorIndex).CDTime
        .scrlIcon.value = Spell(EditorIndex).Icon
        .scrlMap.value = Spell(EditorIndex).Map
        .scrlX.value = Spell(EditorIndex).X
        .scrlY.value = Spell(EditorIndex).Y
        .scrlDir.value = Spell(EditorIndex).Dir
        .scrlVital.value = Spell(EditorIndex).Vital
        .scrlDuration.value = Spell(EditorIndex).Duration
        .scrlInterval.value = Spell(EditorIndex).Interval
        .scrlRange.value = Spell(EditorIndex).Range
        If Spell(EditorIndex).IsAoE Then
            .chkAOE.value = 1
        Else
            .chkAOE.value = 0
        End If
        .scrlAOE.value = Spell(EditorIndex).AoE
        .scrlAnimCast.value = Spell(EditorIndex).CastAnim
        .scrlAnim.value = Spell(EditorIndex).SpellAnim
        .scrlStun.value = Spell(EditorIndex).StunDuration
        .scrlTamanho.value = Spell(EditorIndex).Tamanho
        .scrlAnimL.value = Spell(EditorIndex).AnimL
        .scrlBaseStat.value = Spell(EditorIndex).BaseStat
        .scrlElemental.value = Spell(EditorIndex).Element
        .scrlScript.value = Spell(EditorIndex).Script

        ' find the sound we have set
        If .cmbSound.ListCount >= 0 Then
            For i = 0 To .cmbSound.ListCount
                If .cmbSound.List(i) = Trim$(Spell(EditorIndex).sound) Then
                    .cmbSound.ListIndex = i
                    SoundSet = True
                End If
            Next
            If Not SoundSet Or .cmbSound.ListIndex = -1 Then .cmbSound.ListIndex = 0
        End If
    End With

    EditorSpell_BltIcon

    Spell_Changed(EditorIndex) = True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "SpellEditorInit", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub SpellEditorOk()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    For i = 1 To MAX_SPELLS
        If Spell_Changed(i) Then
            Call SendSaveSpell(i)
        End If
    Next

    Unload frmEditor_Spell
    Editor = 0
    ClearChanged_Spell

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "SpellEditorOk", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub SpellEditorCancel()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Editor = 0
    Unload frmEditor_Spell
    ClearChanged_Spell
    ClearSpells
    SendRequestSpells

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "SpellEditorCancel", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ClearChanged_Spell()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ZeroMemory Spell_Changed(1), MAX_SPELLS * 2    ' 2 = boolean length

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ClearChanged_Spell", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ClearAttributeDialogue()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    frmEditor_Map.fraNpcSpawn.Visible = False
    frmEditor_Map.fraResource.Visible = False
    frmEditor_Map.fraMapItem.Visible = False
    frmEditor_Map.fraMapKey.Visible = False
    frmEditor_Map.fraKeyOpen.Visible = False
    frmEditor_Map.fraMapWarp.Visible = False
    frmEditor_Map.fraShop.Visible = False

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ClearAttributeDialogue", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

'###################
'#######QUESTS######
'###################

Public Sub QuestEditorInit()
    Dim i As Byte

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    If frmEditor_Quest.Visible = False Then Exit Sub

    ' Declarations
    EditorIndex = frmEditor_Quest.lstIndex.ListIndex + 1
    QuestTask = frmEditor_Quest.scrlTask

    With Quest(EditorIndex)
        ' Properties
        frmEditor_Quest.txtName.text = Trim$(.Name)
        frmEditor_Quest.txtDescription.text = Trim$(.Description)

        If .Retry Then
            frmEditor_Quest.chkRetry.value = 1
        Else
            frmEditor_Quest.chkRetry.value = 0
        End If

        If .Diaria Then
            frmEditor_Quest.ChkDiaria.value = 1
        Else
            frmEditor_Quest.ChkDiaria.value = 0
        End If

        ' Requirements
        frmEditor_Quest.scrlQuestReq.value = .QuestReq
        frmEditor_Quest.scrlLevelReq.value = .OrgLvlReq
        frmEditor_Quest.scrlInsignia.value = .InsiReq
        frmEditor_Quest.scrlItemReq.value = .ItemReq
        frmEditor_Quest.scrlValueReq.value = .ValueReq

        If .RetItemReq = True Then
            frmEditor_Quest.ChkRetItem.value = 1
        Else
            frmEditor_Quest.ChkRetItem.value = 0
        End If

        ' Rewards
        For i = 1 To 3
            frmEditor_Quest.ScrlCoin(i - 1).value = .Coin(i)
        Next

        frmEditor_Quest.scrlQItemRew.value = 1
        frmEditor_Quest.ScrlItemRew.value = .ItemRew(1)
        frmEditor_Quest.ScrlValueRew.value = .ValueRew(1)
        frmEditor_Quest.ScrlPokeRew.value = .PokeRew(1)

        frmEditor_Quest.scrlOrgExp.value = .OrgExpRew
        frmEditor_Quest.ScrlExpBall.value = .ExpBallRew

    End With

    ' Tasks
    With Quest(EditorIndex).Task(QuestTask)
        frmEditor_Quest.cmbType.ListIndex = .Type

        For i = 1 To 3
            frmEditor_Quest.txtMessage(i).text = Trim$(.Message(i))
        Next

        If .Instant Then
            frmEditor_Quest.chkInstant.value = 1
        Else
            frmEditor_Quest.chkInstant.value = 0
        End If

        frmEditor_Quest.scrlNum.value = .num
        frmEditor_Quest.scrlValue.value = .value

        ' Others values
        QuestEditorTask
    End With

    QuestTask = frmEditor_Quest.scrlTask
    Quest_Changed(EditorIndex) = True

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "QuestEditorInit", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub QuestEditorTask()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ' Set values
    Select Case frmEditor_Quest.cmbType.ListIndex
    Case QUEST_TYPE_NONE    ' None
        frmEditor_Quest.scrlNum.Enabled = False
        frmEditor_Quest.scrlValue.Enabled = False
    Case QUEST_TYPE_KILLNPC    ' Kill npcs
        frmEditor_Quest.scrlNum.max = MAX_NPCS
        frmEditor_Quest.scrlNum.Enabled = True
        frmEditor_Quest.scrlValue.Enabled = True
    Case QUEST_TYPE_KILLPLAYER    ' Kill players
        frmEditor_Quest.scrlNum.Enabled = False
        frmEditor_Quest.scrlValue.Enabled = True
    Case QUEST_TYPE_GOTOMAP    ' Go to map
        frmEditor_Quest.scrlNum.max = MAX_MAPS
        frmEditor_Quest.scrlNum.Enabled = True
        frmEditor_Quest.scrlValue.Enabled = False
    Case QUEST_TYPE_TALKNPC    ' Talk with npcs
        frmEditor_Quest.scrlNum.max = MAX_NPCS
        frmEditor_Quest.scrlNum.Enabled = True
        frmEditor_Quest.scrlValue.Enabled = False
    Case QUEST_TYPE_COLLECTITEMS    ' Colect items
        frmEditor_Quest.scrlNum.max = MAX_ITEMS
        frmEditor_Quest.scrlNum.Enabled = True
        frmEditor_Quest.scrlValue.Enabled = True
    End Select

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "QuestEditorTask", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub QuestEditorOk()
    Dim i As Long

    ' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    For i = 1 To MAX_QUESTS
        If Quest_Changed(i) Then
            Call SendSaveQuest(i)
        End If
    Next

    Unload frmEditor_Quest
    Editor = 0
    ClearChanged_Quest

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "QuestEditorOk", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub QuestEditorCancel()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    Editor = 0
    Unload frmEditor_Quest
    ClearChanged_Quest
    ClearQuests
    SendRequestQuests

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "QuestEditorCancel", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

Public Sub ClearChanged_Quest()
' If debug mode, handle error then exit out
    If Options.Debug = 1 Then On Error GoTo errorhandler

    ZeroMemory Quest_Changed(1), MAX_QUESTS * 2    ' 2 = boolean length

    ' Error handler
    Exit Sub
errorhandler:
    HandleError "ClearChanged_Quest", "modGameEditors", Err.Number, Err.Description, Err.Source, Err.HelpContext
    Err.Clear
    Exit Sub
End Sub

