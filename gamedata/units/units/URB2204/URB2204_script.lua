local CStructureUnit = import('/lua/defaultunits.lua').StructureUnit

local CAABurstCloudFlakArtilleryWeapon = import('/lua/cybranweapons.lua').CAABurstCloudFlakArtilleryWeapon

URB2204 = ClassUnit(CStructureUnit) {
    Weapons = {
        AAGun = ClassWeapon(CAABurstCloudFlakArtilleryWeapon) {},
    },
}

TypeClass = URB2204