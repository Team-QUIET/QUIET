local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CAABurstCloudFlakArtilleryWeapon = import('/lua/cybranweapons.lua').CAABurstCloudFlakArtilleryWeapon

URB3304 = ClassUnit(CStructureUnit) {
    Weapons = {
        AAGun = ClassWeapon(CAABurstCloudFlakArtilleryWeapon) {},
    },
}

TypeClass = URB3304