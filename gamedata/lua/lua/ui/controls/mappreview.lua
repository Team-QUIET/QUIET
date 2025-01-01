

local Control = import('/lua/maui/control.lua').Control

MapPreview = ClassUI(moho.ui_map_preview_methods, Control) {

    __init = function(self, parent)
        InternalCreateMapPreview(self, parent)
    end,

}

