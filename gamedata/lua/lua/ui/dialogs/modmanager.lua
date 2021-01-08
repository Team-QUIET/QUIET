--*****************************************************************************
--* File: lua/modules/ui/dialogs/modmanager.lua
--* Author: Chris Blackwell
--* Summary: Allows you to choose mods
--*
--* Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
--*****************************************************************************

local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local Bitmap = import('/lua/maui/bitmap.lua').Bitmap
local Checkbox = import('/lua/maui/checkbox.lua').Checkbox
local Combo = import('/lua/ui/controls/combo.lua').Combo
local MultiLineText = import('/lua/maui/multilinetext.lua').MultiLineText
local Group = import('/lua/maui/group.lua').Group
local Mods = import('/lua/mods.lua')
local Tooltip = import('/lua/ui/game/tooltip.lua')
local ItemList = import('/lua/maui/itemlist.lua').ItemList
local Prefs = import('/lua/user/prefs.lua')
local Edit = import('/lua/maui/edit.lua').Edit

local _InternalUpdateStatus

local optionContainer = false

-- This function can be called while the ModManager is active, to update changes to the selected mods on the fly.
-- If called when the ModManger is -not- active, it is a no-op.
function UpdateClientModStatus(selectedModsFromHost)
    if _InternalUpdateStatus then
        _InternalUpdateStatus(selectedModsFromHost)
    end
end

function ClientModStatus(selectedModsFromHost)
    Mods.ClearCache() -- force reload of mod info to pick up changes on disk
    local my_all = Mods.AllSelectableMods()
    local my_sel = Mods.GetSelectedMods()
    local r = {}

    for uid, mod in my_all do

        if mod.ui_only then
            r[uid] = {
                checked = my_sel[uid],
                cantoggle = true,
                tooltip = nil
            }
        else
            r[uid] = {
                checked = (selectedModsFromHost[uid] or false),
                cantoggle = false,
                tooltip = 'modman_controlled_by_host'
            }
        end
    end
    return r
end

function HostModStatus(availableMods)
    Mods.ClearCache() -- force reload of mod info to pick up changes on disk
    local my_all = Mods.AllSelectableMods()
    local my_sel = Mods.GetSelectedMods()
    local r = {}

    local function everyoneHas(uid)
        for peer,modset in availableMods do
            if not modset[uid] then
                return false
            end
        end
        return true
    end

    for uid,mod in my_all do
        if mod.ui_only or everyoneHas(uid) then
            r[uid] = {
                checked = my_sel[uid],
                cantoggle = true,
                tooltip = nil
            }
        else
            r[uid] = {
                checked = false,
                cantoggle = false,
                tooltip = 'modman_some_missing',
            }
        end
    end
    return r
end

function LocalModStatus()
    Mods.ClearCache() -- force reload of mod info to pick up changes on disk
    local my_all = Mods.AllSelectableMods()
    local my_sel = Mods.GetSelectedMods()
    local r = {}

    for uid,mod in my_all do
        r[uid] = {
            checked = my_sel[uid],
            cantoggle = true,
            tooltip = nil
        }
    end
    return r
end

local function IsModExclusive(uid)
    local my_all = Mods.AllSelectableMods()
    if my_all[uid] and my_all[uid].exclusive then
        return true
    end
    return false
end

local function CreateDependsDialog(parent, text, yesFunc)
    local dialog = Group(parent)
    local background = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_m.dds'))
    background:SetTiled(true)
    LayoutHelpers.FillParent(background, dialog)

    dialog.Width:Set(background.Width)
    dialog.Height:Set(300)

    local backgroundTop = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_T.dds'))
    LayoutHelpers.Above(backgroundTop, dialog)
    local backgroundBottom = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_b.dds'))
    LayoutHelpers.Below(backgroundBottom, dialog)
    
    local textBox = UIUtil.CreateTextBox(background)
    LayoutHelpers.AtLeftTopIn(textBox, dialog, 30, 5)
    LayoutHelpers.AtRightIn(textBox, dialog, 64)
    LayoutHelpers.AtBottomIn(textBox, dialog, 5)
    
    local yesButton = UIUtil.CreateButtonStd( backgroundBottom, '/widgets/small', "<LOC _Yes>", 12, 0)
    LayoutHelpers.AtLeftIn(yesButton, backgroundBottom, 50)
    LayoutHelpers.AtTopIn(yesButton, backgroundBottom, 20)
    yesButton.OnClick = function(self)
        yesFunc()
        dialog:Destroy()
    end

    local noButton = UIUtil.CreateButtonStd( backgroundBottom, '/widgets/small', "<LOC _No>", 12, 0)
    LayoutHelpers.AtRightIn(noButton, backgroundBottom, 50)
    LayoutHelpers.AtTopIn(noButton, backgroundBottom, 20)
    noButton.OnClick = function(self)
        dialog:Destroy()
    end
    
    LayoutHelpers.AtCenterIn(dialog, parent:GetRootFrame())
    textBox:SetFont(UIUtil.bodyFont, 18)
    UIUtil.SetTextBoxText(textBox, text)
    UIUtil.CreateWorldCover(dialog)
end

local function CreateLoadPresetDialog(parent, scrollGroup)
    local dialog = Group(parent)
	dialog.Depth:Set(function() return parent.Depth() + 5 end)
    local background = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_m.dds'))
    background:SetTiled(true)
    LayoutHelpers.FillParent(background, dialog)

    dialog.Width:Set(background.Width)
    dialog.Height:Set(300)

    local backgroundTop = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_T.dds'))
    LayoutHelpers.Above(backgroundTop, dialog)
    local backgroundBottom = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_b.dds'))
    LayoutHelpers.Below(backgroundBottom, dialog)
    
    local presets = ItemList(dialog)
	presets:SetFont(UIUtil.bodyFont, 16)
	presets:SetColors(UIUtil.fontColor(), "Black", "Black", "Gainsboro", "Black", "Gainsboro")
	LayoutHelpers.DepthOverParent(presets, dialog, 10)
    LayoutHelpers.AtLeftTopIn(presets, dialog, 30, 5)
    LayoutHelpers.AtRightIn(presets, dialog, 64)
    LayoutHelpers.AtBottomIn(presets, dialog, 5)
	presetsScroll = UIUtil.CreateVertScrollbarFor(presets)
	
	local userPresets = Prefs.GetFromCurrentProfile('UserPresets')
	
	local function fillPresetList()
		presets:DeleteAllItems()
		if userPresets then
			for k,v in userPresets do
				presets:AddItem(k)
			end
		end
	end
	
    local yesButton = UIUtil.CreateButtonStd( backgroundBottom, '/widgets/small', "Load", 12, 0)
    LayoutHelpers.AtLeftIn(yesButton, backgroundBottom, 0)
    LayoutHelpers.AtTopIn(yesButton, backgroundBottom, 20)
    yesButton.OnClick = function(self)
		local index = presets:GetSelection()
		if index and index >= 0 then
			local name = presets:GetItem(index)
			local presetMods = userPresets[name]
			for index, control in scrollGroup.controlList do
				if presetMods[control.modInfo.uid] and not control.active then
					control:Toggle()
				elseif not presetMods[control.modInfo.uid] and control.active then
					control:Toggle()
				end
			end
			dialog:Destroy()
		else
			UIUtil.ShowInfoDialog(dialog, "You have not selected a preset to load.", "OK")
		end
    end
	
    local deleteButton = UIUtil.CreateButtonStd( backgroundBottom, '/widgets/small', "Delete", 12, 0)
    LayoutHelpers.AtCenterIn(deleteButton, backgroundBottom)
    LayoutHelpers.AtTopIn(deleteButton, backgroundBottom, 20)
    deleteButton.OnClick = function(self)
		local index = presets:GetSelection()
		if index and index >= 0 then
			local name = presets:GetItem(index)
			UIUtil.QuickDialog(dialog, "Are you sure you want to delete the preset "..name.."?", 
				"<LOC _Yes>", function()
					-- table.remove(userPresets, index + 1)
					userPresets[name] = nil
					Prefs.SetToCurrentProfile('UserPresets', userPresets)
					fillPresetList()
				end,
				"<LOC _No>", nil,
				nil, nil, 
				true, {worldCover = false, enterButton = 1, escapeButton = 2})
		else
			UIUtil.ShowInfoDialog(dialog, "You have not selected a preset to delete.", "OK")
		end
    end

    local noButton = UIUtil.CreateButtonStd( backgroundBottom, '/widgets/small', "Cancel", 12, 0)
    LayoutHelpers.AtRightIn(noButton, backgroundBottom, 0)
    LayoutHelpers.AtTopIn(noButton, backgroundBottom, 20)
    noButton.OnClick = function(self)
		dialog:Destroy()
    end
    
	fillPresetList()
		
    LayoutHelpers.AtCenterIn(dialog, parent:GetRootFrame())
    UIUtil.CreateWorldCover(dialog)
end

local function CreateSavePresetDialog(parent, scrollGroup)
    local dialog = Group(parent)
	dialog.Depth:Set(function() return parent.Depth() + 5 end)
    local background = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_m.dds'))
    background:SetTiled(true)
    LayoutHelpers.FillParent(background, dialog)

    dialog.Width:Set(background.Width)
    dialog.Height:Set(60)

    local backgroundTop = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_T.dds'))
    LayoutHelpers.Above(backgroundTop, dialog)
    local backgroundBottom = Bitmap(dialog, UIUtil.SkinnableFile('/dialogs/dialog/panel_bmp_b.dds'))
    LayoutHelpers.Below(backgroundBottom, dialog)
	
    local title = UIUtil.CreateText(dialog, 'Name your preset', 18)
    LayoutHelpers.AtTopIn(title, dialog, 10)
    LayoutHelpers.AtHorizontalCenterIn(title, dialog)
    
	local nameEdit = Edit(dialog)
	nameEdit.Width:Set(function() return background.Width() - 80 end)
	nameEdit.Height:Set(function() return nameEdit:GetFontHeight() end)
    LayoutHelpers.AtTopIn(nameEdit, dialog, 30)
    LayoutHelpers.AtHorizontalCenterIn(nameEdit, dialog)
	UIUtil.SetupEditStd(nameEdit, UIUtil.fontColor, "00569FFF", UIUtil.highlightColor, "880085EF", UIUtil.bodyFont, 18, 30)
	nameEdit:AcquireFocus()
    
    local yesButton = UIUtil.CreateButtonStd( backgroundBottom, '/widgets/small', "Save", 12, 0)
    LayoutHelpers.AtLeftIn(yesButton, backgroundBottom, 50)
    LayoutHelpers.AtTopIn(yesButton, backgroundBottom, 20)
    yesButton.OnClick = function(self)
        local name = nameEdit:GetText()
		local presets = Prefs.GetFromCurrentProfile('UserPresets')
		if not presets then presets = {} end
        if name == "" then
            nameEdit:AbandonFocus()
            UIUtil.ShowInfoDialog(dialog, "Please fill in a preset name", "OK", function() nameEdit:AcquireFocus() end)
            return
		elseif presets[name] then
            nameEdit:AbandonFocus()
            UIUtil.QuickDialog(dialog, "A preset with that name already exists. Do you want to overwrite it?", 
				"<LOC _Yes>", function()
					local selMods = {}
					for index, control in scrollGroup.controlList do
						if control.active then
							selMods[control.modInfo.uid] = true
						end
					end
					presets[name] = selMods
					Prefs.SetToCurrentProfile('UserPresets', presets)
					nameEdit:AcquireFocus()
				end,
				"<LOC _No>", function() nameEdit:AcquireFocus() end,
				nil, nil, 
				true, {worldCover = false, enterButton = 1, escapeButton = 2})
			return
		else
			local selMods = {}
			for index, control in scrollGroup.controlList do
				if control.active then
					selMods[control.modInfo.uid] = true
				end
			end
			presets[name] = selMods
			Prefs.SetToCurrentProfile('UserPresets', presets)
		end
        dialog:Destroy()
    end

    local noButton = UIUtil.CreateButtonStd( backgroundBottom, '/widgets/small', "Cancel", 12, 0)
    LayoutHelpers.AtRightIn(noButton, backgroundBottom, 50)
    LayoutHelpers.AtTopIn(noButton, backgroundBottom, 20)
    noButton.OnClick = function(self)
        dialog:Destroy()
    end
    
    LayoutHelpers.AtCenterIn(dialog, parent:GetRootFrame())
    UIUtil.CreateWorldCover(dialog)
end

local loudStandard = { 
    '25D57D85-7D84-27HT-A501-BR3WL4N000079', -- BrewLAN
    '62e2j64a-53a2-y6sg-32h5-146as555a18u3', -- Total Mayhem
    '9a9C61C0-1787-10DF-A0AD-BATTLEPACK002', -- Wyvern Battle Pack
    'ffffffff-6e98-4864-9599-4133236eea7a', -- LOUD Integrated Storage
    '25D57D85-9JA7-D842-GKG4-ORIGIN0000001', -- BrewLAN Barista
    'ffffffff-ffff-ffff-ffff-fffffffffffe', -- LOUD Structure Enhancements
    '454af309-5afb-458b-bf5b-a00000000007', -- 4th Dimension
    '9e8ea941-c306-4751-b367-a11000000502', -- BlackOps Unleashed
    'fffffffe-6e98-4864-9599-4133236eea7a', -- LOUD Unit Additions
    'D000E905-1E97-420D-8ED9-DF083282F59D', -- Sequential Mex Upgrades
    'HUSSAR-PL-a1e2-c4t4-scfa-ssbmod-v1240', -- Supreme Score Board
    '9e8ea941-c306-4751-b367-e00000000302', -- BlackOps ACUs
    'EF3ADDB4-9D34-437F-B1C8-440DAF896802', -- Mass Fab Manager
    'ffffffff-6f00-4864-9599-4133236eea7a', -- Evenflow
    '89BF1572-9EA8-11DC-1313-635F56D89591', -- Supreme Economy
    '2529ea71-93ef-41a6-b552-EXPERICON00005', -- Experimental Icons Overhaul
}

local function ModConfigDialog(parent, modInfo, config, modStatus)
    table.sort(config, function(a, b) return a.key < b.key end)

    local newConfig = Prefs.GetFromCurrentProfile("modConfig")
    if not newConfig then
        newConfig = {}
    end
    if not newConfig[modInfo.uid] then
        newConfig[modInfo.uid] = {}
        for _, v in config do
            newConfig[modInfo.uid][v.key] = v.default
        end
    end

    local dialog = Bitmap(parent, UIUtil.UIFile('/scx_menu/panel-brd/panel_brd_m.dds'))
    LayoutHelpers.AtCenterIn(dialog, parent)
    LayoutHelpers.DepthOverParent(dialog, parent, 100)
    dialog.Width:Set(300)
    dialog.Height:Set(450)
    dialog.border = import('/lua/ui/lobby/restrictedUnitsDlg.lua').CreateBorder(dialog)
    dialog.brackets = UIUtil.CreateDialogBrackets(dialog, 118, 106, 118, 104)

    local title = UIUtil.CreateText(dialog, "Mod Config: "..modInfo.name, 20, UIUtil.titleFont)
    LayoutHelpers.AtTopIn(title, dialog.border.tm, 12)
    LayoutHelpers.AtHorizontalCenterIn(title, dialog)
    local cancelBtn = UIUtil.CreateButtonStd(dialog, '/scx_menu/small-btn/small', "<LOC Cancel>", 16, 2, 0, "UI_Menu_Cancel_02", "UI_Opt_Affirm_Over")
    LayoutHelpers.Below(cancelBtn, dialog, -16)
    LayoutHelpers.AtHorizontalCenterIn(cancelBtn, dialog)
    local okBtn = UIUtil.CreateButtonStd(dialog, '/scx_menu/small-btn/small', "<LOC _Ok>", 16, 2, 0, "UI_Opt_Yes_No", "UI_Opt_Affirm_Over")
    LayoutHelpers.Below(okBtn, dialog, -20)
    LayoutHelpers.AtLeftIn(okBtn, dialog, -50)
    LayoutHelpers.RightOf(cancelBtn, okBtn)

    local optionList = {}

    optionContainer = Group(dialog)
    optionContainer.Height:Set(dialog.Height() - 32)
    optionContainer.Width:Set(dialog.Width)
    optionContainer.top = 0
    LayoutHelpers.AtCenterIn(optionContainer, parent, -12)

    local function CreateOptionCombo(list, optionData, width)
        local combo = Combo(list, nil, nil, nil, nil, "UI_Tab_Rollover_01", "UI_Tab_Click_01")
        combo.Width:Set(240)
        combo.Depth:Set(function() return list.Depth() + 10 end)
        local itemArray = {}
        combo.keyMap = {}
        local tooltipTable = {}
        -- Tooltip.AddComboTooltip(combo, tooltipTable, combo._list)
        combo.UpdateValue = function(key)
            combo:SetItem(combo.keyMap[key])
        end
        if not modStatus.cantoggle then
            combo:Disable()
        end
        return combo
    end

    local function CreateOptionElement(index)
        optionList[index] = Group(optionContainer)
        optionList[index].Height:Set(46)
        optionList[index].Width:Set(optionContainer.Width)

        optionList[index].bg = Bitmap(optionList[index])
        optionList[index].bg.Depth:Set(optionList[index].Depth)
        LayoutHelpers.FillParent(optionList[index].bg, optionList[index])
        optionList[index].bg.Right:Set(function() return optionList[index].Right() - 10 end)

        optionList[index].text = UIUtil.CreateText(optionContainer, '', 14, "Arial")
        optionList[index].text:DisableHitTest()
        LayoutHelpers.AtLeftTopIn(optionList[index].text, optionList[index], 10)

        optionList[index].combo = CreateOptionCombo(optionList[index])
        LayoutHelpers.AtLeftTopIn(optionList[index].combo, optionList[index], 5, 22)
    end

    CreateOptionElement(1)
    LayoutHelpers.AtLeftTopIn(optionList[1], optionContainer)

    for i = 2, 9 do
        CreateOptionElement(i)
        LayoutHelpers.Below(optionList[i], optionList[i - 1])
    end

    local numLines = function() return table.getsize(optionList) end

    local function DataSize()
        return table.getn(config)
    end

    -- Called when the scrollbar for the control requires data to size itself
    -- GetScrollValues must return 4 values in this order:
    -- rangeMin, rangeMax, visibleMin, visibleMax
    -- aixs can be "Vert" or "Horz"
    optionContainer.GetScrollValues = function(self, axis)
        local size = DataSize()
        return 0, size, self.top, math.min(self.top + numLines(), size)
    end

    -- Called when the scrollbar wants to scroll a specific number of lines (negative indicates scroll up)
    optionContainer.ScrollLines = function(self, axis, delta)
        self:ScrollSetTop(axis, self.top + math.floor(delta))
    end

    -- Called when the scrollbar wants to scroll a specific number of pages (negative indicates scroll up)
    optionContainer.ScrollPages = function(self, axis, delta)
        self:ScrollSetTop(axis, self.top + math.floor(delta) * numLines())
    end

    -- Called when the scrollbar wants to set a new visible top line
    optionContainer.ScrollSetTop = function(self, axis, top)
        top = math.floor(top)
        if top == self.top then return end
        local size = DataSize()
        self.top = math.max(math.min(size - numLines() , top), 0)
        self:CalcVisible()
    end

    -- Called to determine if the control is scrollable on a particular access. Must return true or false.
    optionContainer.IsScrollable = function(self, axis)
        return true
    end

    optionContainer.CalcVisible = function(self)
        local function SetTextLine(line, data, lineID)
            line.text:SetText(LOC(data.label))
            line.text:SetFont(UIUtil.bodyFont, 14)
            line.text:SetColor(UIUtil.fontColor)
            line.bg:SetTexture(UIUtil.UIFile('/dialogs/mapselect03/options-panel-bar_bmp.dds'))
            LayoutHelpers.AtLeftTopIn(line.text, line, 10, 5)
            line.combo:ClearItems()
            line.combo:Show()
            local itemArray = {}
            line.combo.keyMap = {}
            local tooltipTable = {}
            for index, val in data.values do
                itemArray[index] = val.text
                line.combo.keyMap[val.key] = index
                -- tooltipTable[index] = 'lob_'..data.data.key..'_'..val.key
            end
            local def = newConfig[modInfo.uid][data.key] or 1
            line.combo:AddItems(itemArray, def)
            line.combo.OnClick = function(self, index, text)
                newConfig[modInfo.uid][data.key] = index
            end
            line.combo.UpdateValue = function(key)
                line.combo:SetItem(line.combo.keyMap[key])
            end
        end
        for i, v in optionList do
            if config[i + self.top] then
                SetTextLine(v, config[i + self.top], i + self.top)
            else
                v.text:SetText('')
                v.combo:Hide()
                v.bg:SetSolidColor('00000000')
            end
        end
    end

    optionContainer:CalcVisible()

    optionContainer.HandleEvent = function(self, event)
        if event.Type == 'WheelRotation' then
            local lines = 1
            if event.WheelRotation > 0 then
                lines = -1
            end
            self:ScrollLines(nil, lines)
        end
    end

    okBtn.OnClick = function(self, modifiers)
        Prefs.SetToCurrentProfile("modConfig", newConfig)
        modInfo.config = table.copy(newConfig[modInfo.uid])
        dialog:Destroy()
    end

    cancelBtn.OnClick = function(self, modifiers)
        dialog:Destroy()
    end

    UIUtil.CreateVertScrollbarFor(optionContainer)
    UIUtil.MakeInputModal(dialog, function() okBtn.OnClick(okBtn) end, function() cancelBtn.OnClick(cancelBtn) end)
    UIUtil.CreateWorldCover(dialog)
end

function CreateDialog(over, inLobby, exitBehavior, useCover, modStatus)

    ---------------------------------------------------------------------------
    -- fill in default args
    ---------------------------------------------------------------------------
    modStatus = modStatus or LocalModStatus()

    local exclusiveModSelected = nil

    ---------------------------------------------------------------------------
    -- basic layout and operation of dialog
    ---------------------------------------------------------------------------

	local parent = over

    local panel = Bitmap(parent, UIUtil.UIFile('/scx_menu/mod-manager/panel_bmp.dds'))
    LayoutHelpers.AtCenterIn(panel, parent)
    
    panel.brackets = UIUtil.CreateDialogBrackets(panel, 38, 24, 38, 24)
    
    local title = UIUtil.CreateText(panel, LOC("<LOC _Mod_Manager>Mod Manager"), 24)
    LayoutHelpers.AtTopIn(title, panel, 31)
    LayoutHelpers.AtHorizontalCenterIn(title, panel)
    
    panel.Depth:Set(GetFrame(over:GetRootFrame():GetTargetHead()):GetTopmostDepth() + 1)
    
    local worldCover = nil
    if useCover then
    	worldCover = UIUtil.CreateWorldCover(panel)
    end
    
    local dlgLabel = UIUtil.CreateText(panel, "<LOC uimod_0001>Click to select or deselect", 20, 'Arial Bold')
    -- LayoutHelpers.AtTopIn(dlgLabel, panel, 80)
    -- LayoutHelpers.AtHorizontalCenterIn(dlgLabel, panel)
    LayoutHelpers.AtLeftTopIn(dlgLabel, panel, 30, 75)
	
    ---------------------------------------------------------------------------
    -- Mod list control
    ---------------------------------------------------------------------------
    local numElementsPerPage = 5
    
    local scrollGroup = Group(panel)
    scrollGroup.Width:Set(635)
    scrollGroup.Height:Set(372)
    
    LayoutHelpers.AtLeftTopIn(scrollGroup, panel, 25, 118)
    UIUtil.CreateVertScrollbarFor(scrollGroup)
    
    scrollGroup.controlList = {}
    scrollGroup.top = 1
    
    -- called when the scrollbar for the control requires data to size itself
    -- GetScrollValues must return 4 values in this order:
    -- rangeMin, rangeMax, visibleMin, visibleMax
    -- aixs can be "Vert" or "Horz"
    scrollGroup.GetScrollValues = function(self, axis)
        return 1, table.getn(self.controlList), self.top, math.min(self.top + numElementsPerPage - 1, table.getn(scrollGroup.controlList))
    end

    -- called when the scrollbar wants to scroll a specific number of lines (negative indicates scroll up)
    scrollGroup.ScrollLines = function(self, axis, delta)
        self:ScrollSetTop(axis, self.top + math.floor(delta))
    end

    -- called when the scrollbar wants to scroll a specific number of pages (negative indicates scroll up)
    scrollGroup.ScrollPages = function(self, axis, delta)
        self:ScrollSetTop(axis, self.top + math.floor(delta) * numElementsPerPage)
    end

    -- called when the scrollbar wants to set a new visible top line
    scrollGroup.ScrollSetTop = function(self, axis, top)
        top = math.floor(top)
        if top == self.top then return end
        self.top = math.max(math.min(table.getn(self.controlList) - numElementsPerPage + 1 , top), 1)
        self:CalcVisible()
    end

    -- called to determine if the control is scrollable on a particular access. Must return true or false.
    scrollGroup.IsScrollable = function(self, axis)
        return true
    end
    
    -- determines what controls should be visible or not, and hide/show appropriately
    scrollGroup.CalcVisible = function(self)
        local top = self.top
        local bottom = self.top + numElementsPerPage
        for index, control in ipairs(self.controlList) do
            if index < top or index >= bottom then
                control:Hide()
            else
                control:Show()
                control.Left:Set(self.Left)
                local lIndex = index
                local lControl = control
                control.Top:Set(function() return self.Top() + ((lIndex - top) * lControl.Height()) end)
            end
        end
    end
    
    -- return all the currently selected controls
    local function GetCurrentlyListedMods()
        local ret = nil
        for index, control in scrollGroup.controlList do
            if not ret then ret = {} end
            ret[control.modInfo.uid] = control
        end
        return ret
    end

    ---------------------------------------------------------------------------
    -- Mod list element
    ---------------------------------------------------------------------------
    local function CreateListElement(parent, modInfo)
        local bg = Bitmap(parent, UIUtil.UIFile('/dialogs/mod_btn/mod-d_btn_up.dds'))
        bg.Height:Set(function() return parent.Height() / numElementsPerPage  end)
        bg.Width:Set(parent.Width)
        bg.modInfo = modInfo
        
        local icon = Bitmap(bg, modInfo.icon)
        icon.Height:Set(56)
        icon.Width:Set(56)
        LayoutHelpers.AtLeftTopIn(icon, bg, 12, 12)
        
        local name = UIUtil.CreateText(bg, modInfo.name, 14, UIUtil.bodyFont)
        LayoutHelpers.AtLeftTopIn(name, bg, 92, 12)
        name:SetDropShadow(true)
        
        local activecheck = Checkbox(bg, 
            UIUtil.UIFile('/dialogs/check-box_btn/radio-d_btn_up.dds'), 
            UIUtil.UIFile('/dialogs/check-box_btn/radio-s_btn_up.dds'), 
            UIUtil.UIFile('/dialogs/check-box_btn/radio-d_btn_over.dds'), 
            UIUtil.UIFile('/dialogs/check-box_btn/radio-s_btn_over.dds'), 
            UIUtil.UIFile('/dialogs/check-box_btn/radio-d_btn_dis.dds'), 
            UIUtil.UIFile('/dialogs/check-box_btn/radio-s_btn_dis.dds'))
        LayoutHelpers.AtRightTopIn(activecheck, bg, 5, 6)
        activecheck:DisableHitTest()
        
        local desc = MultiLineText(bg, UIUtil.bodyFont, 14, UIUtil.fontColor)
        LayoutHelpers.AtLeftTopIn(desc, bg, 92, 34)
        desc.Height:Set(40)
        desc.Width:Set(460)
        desc:SetText(modInfo.description)

        icon:DisableHitTest()
        name:DisableHitTest()
        desc:DisableHitTest()

        if modStatus[modInfo.uid].checked then
            activecheck:SetCheck(true)
			if not modStatus[modInfo.uid].cantoggle then
				bg:SetTexture(UIUtil.UIFile('/dialogs/mod_btn/mod-t_btn_up.dds'))
			else
				bg:SetTexture(UIUtil.UIFile('/dialogs/mod_btn/mod-s_btn_up.dds'))
			end
            bg.active = true
            if IsModExclusive(modInfo.uid) then
                exclusiveModSelected = bg
            end
        else
            activecheck:SetCheck(false)
			if not modStatus[modInfo.uid].cantoggle then
				bg:SetTexture(UIUtil.UIFile('/dialogs/mod_btn/mod-b_btn_up.dds'))
			else
				bg:SetTexture(UIUtil.UIFile('/dialogs/mod_btn/mod-d_btn_up.dds'))
			end
            bg.active = false
        end

        bg:Hide()
        
        function bg:Toggle()
            if self.active then
                activecheck:SetCheck(false)
                self:SetTexture(UIUtil.UIFile('/dialogs/mod_btn/mod-d_btn_up.dds'))
                self.active = false
            else
                activecheck:SetCheck(true)
                self:SetTexture(UIUtil.UIFile('/dialogs/mod_btn/mod-s_btn_up.dds'))
                self.active = true
            end
        end

        local function HandleExclusiveClick(bg)
            local function DoExclusiveBehavior()
                exclusiveModSelected = bg
                bg:Toggle()
                for index, control in scrollGroup.controlList do
                    if control ~= bg and control.active then
                        control:Toggle()
                    end
                end
            end
            
            UIUtil.QuickDialog(
                parent, 
                "<LOC uimod_0010>The mod you have requested is marked as exclusive. If you select this mod, all other mods will be disabled. Do you wish to enable this mod?",
                "<LOC _Yes>", DoExclusiveBehavior,
                "<LOC _No>")
        end
        
        local function HandleExclusiveActive(bg, normalClickFunc)
            UIUtil.QuickDialog(
                parent,
                "<LOC uimod_0011>You currently have an exclusive mod selected, do you wish to deselect it?",
                "<LOC _Yes>", function()
                    exclusiveModSelected:Toggle()
                    exclusiveModSelected = nil
                    normalClickFunc(bg)
                end,
                "<LOC _No>")
        end

        local function HandleNormalClick(bg)
            if not bg.active then
                local curListed = GetCurrentlyListedMods()
                local depends = Mods.GetDependencies(bg.modInfo.uid)
                
                if depends.missing then
                    local boxText = LOC("<LOC uimod_0012>The requested mod can not be enabled as it requires the following mods that you don't currently have installed:\n\n")
                    for uid, v in depends.missing do
                        local name
                        if bg.modInfo.requiresNames and bg.modInfo.requiresNames[uid] then
                            name = bg.modInfo.requiresNames[uid]
                        else
                            name = uid
                        end
                        boxText = boxText .. name .. "\n"
                    end
                    UIUtil.QuickDialog(parent, boxText, "<LOC _Ok>")
                else
                    if depends.requires or depends.conflicts then
                        local needsRequiredActivated = false
                        local needsConflictsDisabled = false
                        
                        if depends.requires then
                            for uid, v in depends.requires do
                                if curListed[uid] and not curListed[uid].active then
                                    needsRequiredActivated = true
                                    break
                                end
                            end
                        end
                        
                        if depends.conflicts then
                            for uid, v in depends.conflicts do
                                if curListed[uid] and curListed[uid].active then
                                    needsConflictsDisabled = true
                                    break
                                end
                            end
                        end
                        
                        if (needsRequiredActivated == true) or (needsConflictsDisabled == true) then
                            local allMods = Mods.AllMods()
                            local boxText = ""
                            
                            if needsRequiredActivated == true then
                                boxText = boxText .. LOC("<LOC uimod_0013>The requested mod requires the following mods be enabled:\n\n")
                                for uid, v in depends.requires do
                                    if curListed[uid] and not curListed[uid].active then
                                        boxText = boxText .. allMods[uid].name .. "\n"
                                    end
                                end
                                boxText = boxText .. "\n"
                            end
                            if needsConflictsDisabled == true then
                                boxText = boxText .. LOC("<LOC uimod_0014>The requested mod requires the following mods be disabled:\n\n")
                                for uid, v in depends.conflicts do
                                    if curListed[uid] and curListed[uid].active then
                                        boxText = boxText .. allMods[uid].name .. "\n"
                                    end
                                end
                                boxText = boxText .. "\n"
                            end
                            boxText = boxText .. LOC("<LOC uimod_0015>Would you like to enable the requested mod? Selecting Yes will enable all required mods, and disable all conflicting mods.")
                            CreateDependsDialog(parent, boxText, function()
                                bg:Toggle()
                                if depends.requires then
                                    for uid, v in depends.requires do
                                        if curListed[uid] and not curListed[uid].active then
                                            curListed[uid]:Toggle()
                                        end
                                    end
                                end
                                if depends.conflicts then
                                    for uid, v in depends.conflicts do
                                        if curListed[uid] and curListed[uid].active then
                                            curListed[uid]:Toggle()
                                        end
                                    end
                                end
                            end)
                        else
                            bg:Toggle()
                        end                            
                    else
                        bg:Toggle()
                    end
                end
            else
                bg:Toggle()
            end
        end
        
        bg.HandleEvent = function(self, event)
            if event.Type == 'ButtonPress' or event.Type == 'ButtonDClick' then
                if modStatus[modInfo.uid].cantoggle then
                    if IsModExclusive(modInfo.uid) and not self.active then
                        HandleExclusiveClick(bg)                                    
                    else
                        if exclusiveModSelected then
                            HandleExclusiveActive(self, HandleNormalClick)
                        else
                            HandleNormalClick(self)
                        end
                    end
                end
                local sound = Sound({Cue = "UI_Mod_Select", Bank = "Interface",})
                PlaySound(sound)
            end
        end

        if modStatus[modInfo.uid].tooltip then
            Tooltip.AddControlTooltip(bg, modStatus[modInfo.uid].tooltip, .2)
        end

        local env = {}
        local ok, result = pcall(doscript, bg.modInfo.location..'/config.lua', env)
        if ok then
            bg.config = env.config
            local configBtn = UIUtil.CreateButtonStd(bg, '/lobby/lan-game-lobby/smalltoggle', "Config", 12, 2)
            LayoutHelpers.LeftOf(configBtn, activecheck, 2)
            configBtn.OnClick = function(self, modifiers)
                ModConfigDialog(panel, bg.modInfo, bg.config, modStatus[bg.modInfo.uid])
            end
        end
        
        return bg
    end
    
    ---------------------------------------------------------------------------
    -- Mod list element
    ---------------------------------------------------------------------------
    local allmods = Mods.AllSelectableMods()
	local selmods = Mods.GetSelectedMods()
	
    local modNamesTable = {}
    for k,v in allmods do 
        table.insert(modNamesTable, v)
    end
	
    table.sort(modNamesTable, function(a,b) 
			if selmods[a.uid] and selmods[b.uid] then
				return a.name < b.name
			elseif selmods[a.uid] or selmods[b.uid] then
				return selmods[a.uid] or false
			else
				return a.name < b.name
			end
		end)
	
    for k,v in modNamesTable do 
        local uid = v.uid
        local status = modStatus[uid]
		if inLobby and uid == "F14E58B6-E7F3-11DD-88AB-418A55D89593" then
			status.cantoggle = false
		end
        table.insert(scrollGroup.controlList, CreateListElement(scrollGroup, allmods[uid], status))
    end

    _InternalUpdateStatus = function(selectedModsFromHost)
        for index, control in scrollGroup.controlList do
            local uid = control.modInfo.uid
            if not modStatus[uid].cantoggle then
                if control.active ~= (selectedModsFromHost[uid] or false) then
                    control:Toggle()
                end
            end
        end
    end

    scrollGroup:CalcVisible()

    ---------------------------------------------------------------------------
    -- OK and cancel button behaviors
    ---------------------------------------------------------------------------
    local function KillDialog(cancel)
        local selectedMods
        if not cancel then
            selectedMods = {}
            
            for index, control in scrollGroup.controlList do
                if control.active then
                    selectedMods[control.modInfo.uid] = true
                end
            end
        end

        -- Clear out the module var '_InternalUpdateStatus' to disable background updates
        _InternalUpdateStatus = nil

        if over then
            panel:Destroy()
        else
            parent:Destroy()
        end

        (exitBehavior or Mods.SetSelectedMods)(selectedMods)
    end

    local loudStdBtn = UIUtil.CreateButtonStd(panel, '/widgets/small', "LOUD Standard", 12, 2)
    -- LayoutHelpers.RightOf(loudStdBtn, saveBtn)
    LayoutHelpers.AtRightTopIn(loudStdBtn, panel, 30, 75)
    loudStdBtn.OnClick = function(self, modifiers)
        local curListed = GetCurrentlyListedMods()
        for k,v in loudStandard do
            if not curListed[v].active then
                curListed[v]:Toggle()
            end
        end
    end
    Tooltip.AddButtonTooltip(loudStdBtn, 'modmgr_loudstandard')
	
    local loadBtn = UIUtil.CreateButtonStd(panel, '/widgets/tiny', "Load", 12, 2)
    LayoutHelpers.LeftOf(loadBtn, loudStdBtn)
    -- LayoutHelpers.AtLeftTopIn(loadBtn, panel, 30, 75)
    loadBtn.OnClick = function(self, modifiers)
		CreateLoadPresetDialog(panel, scrollGroup)
    end
	
    local saveBtn = UIUtil.CreateButtonStd(panel, '/widgets/tiny', "Save", 12, 2)
    LayoutHelpers.LeftOf(saveBtn, loadBtn)
    -- LayoutHelpers.AtRightTopIn(saveBtn, panel, 30, 75)
    saveBtn.OnClick = function(self, modifiers)
		CreateSavePresetDialog(panel, scrollGroup)
    end

    local cancelBtn = UIUtil.CreateButtonStd(panel, '/scx_menu/small-btn/small', "<LOC _Cancel>", 16, nil, nil, "UI_Menu_Cancel_02")
    LayoutHelpers.AtRightTopIn(cancelBtn, panel, 30, 505)
    cancelBtn.OnClick = function(self, modifiers)
        KillDialog(true)
    end
    
    local okBtn = UIUtil.CreateButtonStd(panel, '/scx_menu/small-btn/small', "<LOC _Ok>", 16, nil, nil, nil, "UI_Opt_Yes_No")
    LayoutHelpers.LeftOf(okBtn, cancelBtn)
    okBtn.OnClick = function(self, modifiers)
        KillDialog(false)
    end
	
    local disableBtn = UIUtil.CreateButtonStd(panel, '/scx_menu/small-btn/small', "Disable All", 16, 2)
    LayoutHelpers.AtLeftTopIn(disableBtn, panel, 30, 505)
	-- Tooltip.AddButtonTooltip(disableBtn, 'lob_disable_allmods')
    disableBtn.OnClick = function(self, modifiers)
		for index, control in scrollGroup.controlList do
			if control.active then
				control:Toggle()
			end
		end
    end

    UIUtil.MakeInputModal(panel, function() okBtn.OnClick(okBtn) end, function() cancelBtn.OnClick(cancelBtn) end)
end