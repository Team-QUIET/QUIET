version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Anussons",
    description = "<LOC Anussons Playground_Description>The Anusson Islands group is a rich archipelago often hotly contested.  This is a moderately difficult AI map.",
    preview = '',
    map_version = 7.7,
    type = 'skirmish',
    starts = true,
    size = {2048, 2048},
    map = '/maps/anussons playground/Anussons.scmap',
    save = '/maps/anussons playground/Anussons_save.lua',
    script = '/maps/anussons playground/Anussons_script.lua',
    norushradius = 70,
    Configurations = {
        ['standard'] = {
            teams = {
                {
                    name = 'FFA',
                    armies = {'ARMY_1', 'ARMY_2', 'ARMY_3', 'ARMY_4', 'ARMY_5', 'ARMY_6', 'ARMY_7', 'ARMY_8', 'ARMY_10', 'ARMY_11', 'ARMY_12'}
                },
            },
            customprops = {
                ['ExtraArmies'] = STRING( 'NEUTRAL_CIVILIAN' ),
            },
        },
    },
}
