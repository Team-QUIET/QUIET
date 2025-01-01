-- TrashBag is a class to help manage objects that need destruction. You add objects to it with Add().
-- When TrashBag:Destroy() is called, it calls Destroy() in turn on all its contained objects.

-- If an object in a TrashBag is destroyed through other means, it automatically disappears from the TrashBag.
-- This doesn't necessarily happen instantly, so it's possible in this case that Destroy() will be called twice.
-- So Destroy() should always be idempotent.

local TableGetn = table.getn
local TableEmpty = table.empty

TrashBag = ClassTrashBag {

    -- Used during class creation for debugging
    __name = 'Trashbag',

    -- Tell the garbage collector that we're a weak table for our values. If an element is ready to be collected
    -- then we're not a reason for it to remain alive. E.g., we don't care if it got cleaned up earlier.
    -- http://lua-users.org/wiki/GarbageCollectionTutorial
    -- http://lua-users.org/wiki/WeakTablesTutorial
    __mode = 'v',
    
    Counter = 1,

    --- Adds an entity to the trash bag
    ---@generic T : (Destroyable | thread)
    ---@param self TrashBag
    ---@param trash T
    ---@return T
    Add = function(self, obj)
        -- -- Uncomment for performance testing
        -- if entity == nil then 
        --     WARN("Attempted to add a nil to a TrashBag: " .. repr(debug.getinfo(2)))
        --     return 
        -- end

        -- -- Uncomment for performance testing
        -- if not entity.Destroy then 
        --     WARN("Attempted to add an entity with no Destroy() method to a TrashBag: "  .. repr(debug.getinfo(2)))
        --     return 
        -- end
	
        if obj != nil then
			self[self.Counter] = obj
            self.Counter = self.Counter + 1
		end
    end,

    --- Destroys all (remaining) entities in the trash bag
    ---@param self TrashBag
    Destroy = function(self)
        -- -- Uncomment for performance testing
        -- if not self then 
        --     WARN("Attempted to trash non-existing trash bag: "  .. repr(debug.getinfo(2)))
        --     return 
        -- end
        
        -- Remove any value still in the trashbag
        if self.Counter then
            for i = 1, self.Counter - 1 do
                if self[i] then
                    self[i]:Destroy()
                    self[i] = nil
                end
            end
            self.Counter = 1
        end
    end,

    -- Checks if the trashbag is empty
    ---@param self TrashBag
    ---@return boolean
    Empty = function(self)
        return TableEmpty(self)
    end
}