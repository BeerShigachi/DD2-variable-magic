-- author : BeerShigachi
-- date : 15 May 2024
-- version : 1.2.1

-- CONFIG: 1.0 as vanilla value. every values have to be float number. use float like 1.0 not 1.
-- damage multipliers
local multipliers = {
    FLAGRATION = { name = "FLAGRATION", value = 1.0 },
    LEVIN = { name = "LEVIN", value = 1.0 },
    FRIGOR = { name = "FRIGOR", value = 1.0 },
    ANODYNE_ATTACK_UNDEAD = { name = "ANODYNE_ATTACK_UNDEAD", value = 1.0 },
    SEISM = { name = "SEISM", value = 1.0 },
    SALAMANDER = { name = "SALAMANDER", value = 1.0 },
    HAGOL = { name = "HAGOL", value = 1.0 },
    THUNDERMINE_DAMAGE = { name = "THUNDERMINE_DAMAGE", value = 1.0 },
    DECANTER_SAP = { name = "DECANTER_SAP", value = 1.0 },
    FLARE = { name = "FLARE", value = 1.0 },
    EMPYREAN = { name = "EMPYREAN", value = 1.0 },
    EMPYREAN_ATTACK_UNDEAD = { name = "EMPYREAN_ATTACK_UNDEAD", value = 1.0 },
    METEORON = { name = "METEORON", value = 1.0 },
    METEORON_PROJECTILE = { name = "METEORON_PROJECTILE", value = 1.0 },
    MAELSTORM = { name = "MAELSTORM", value = 1.0 }
}


-- Spell effect size(area) scale: setting 2.0 means 2 times bigger.
local scales = {
    FLAGRATION = { name = "FLAGRATION", value = 1.0 },
    LEVIN = { name = "LEVIN", value = 1.0 },
    FRIGOR = { name = "FRIGOR", value = 1.0 },
    ANODYNE = { name = "ANODYNE", value = 1.0 },
    HALIDOM = { name = "HALIDOM", value = 1.0 },
    CELERITY = { name = "CELERITY", value = 1.0 },
    SEISM = { name = "SEISM", value = 1.0 },
    SALAMANDER = { name = "SALAMANDER", value = 1.0 },
    HAGOL = { name = "HAGOL", value = 1.0 },
    THUNDERMINE = { name = "THUNDERMINE", value = 1.0 },
    FLARE = { name = "FLARE", value = 1.0 },
    EMPYREAN = { name = "EMPYREAN", value = 1.0 },
    PAEAN = { name = "PAEAN", value = 1.0 },
    METEORON = { name = "METEORON", value = 1.0 },
    METEORON_PROJECTILE = { name= "METEORON_PROJECTILE", value = 1.0 },
    MAELSTORM = { name = "MAELSTORM", value = 1.0 }
}

-- SUPER OP if you want
-- CHANGE THIS VALUE TO true REQUIRES RESTART THE GAME! set this true to keep pulsing until running out of the orb lifetiem.
local UNLIMITED_THUNDERMINE = false


-- DO NOT TOUCH AFTER THIS LINE
local sdk_ = sdk
-- list of hash
local FLAGRATION_VFX_HASH = 3809388717
local HIGH_FLAGRATION_VFX_HASH = 661468703
local FLAGRATION_HASH = 3911298812
local HIGH_FLAGRATION_HASH = 1544425783
local LEVIN_HASH = 3322200037
local LEVIN_INITIAL_HASH = 2443240160
local LEVIN_ADDITIONAL_ATK_HASH = 1631386228
local FRIGOR_FRONT_HASH = 560614883 -- not main damage
local FRIGOR_PILLER_HASH = 2386535265 -- main damage source
local HIGH_FRIGOR_ADDITIONAL_ATK_HASH = 3550812182
local HIGH_FRIGOR_ICE_ELEMENT_HASH = 851770900
local ANODYNE_HEAL_HASH = 2627024446
local ANODYNE_ATTACK_UNDEAD_HASH = 3468748481
local HALIDOM_HASH = 1566402932
local HIGH_HALIDOM_HASH = 2216277281
local CELERITY_HASH = 3028058402
local HIGH_CELERITY_HASH = 2533613524
local SEISM_INITIAL_HASH = 1560174487
local SEISM_ADDITIONAL_ATK_HASH = 1372270961
local SALAMANDER_HASH = 2274290786
local HIGH_SALAMANDER_HASH = 3151664427
local HAGOL_HASH = 2078305748
local HIGH_HAGOL_HASH = 3389397243
local THUNDERMINE_HASH = 3524349485
local HIGH_THUNDERMINE_HASH = 3493273491
local THUNDERMINE_DAMAGE_HASH = 3220102239
local DECANTER_SAP_HASH = 4249229745
local HIGH_DECANTER_SAP_HASH = 552692977
local FLARE_FIRST_HASH = 2949517138
local FLARE_SECOND_HASH = 340281505
local FLARE_THIRD_HASH = 3543475679
local FLARE_FINISH_HASH = 3321228649
local FLARE_MAX_FINISH_HASH = 2810699174
local EMPYREAN_VFX_HASH = 2653820902
local HIGH_EMPYREAN_VFX_HASH = 2575444828
local EMPYREAN_HASH = 1883937863
local HIGH_EMPYREAN_HASH = 3721181979
local EMPYREAN_ATTACK_UNDEAD_HASH = 3418934292
local HIGH_EMPYREAN_ATTACK_UNDEAD_HASH = 512380958
local PAEAN_HASH = 1827152808
local METEORON_FIRST_HASH = 3625826559
local METEORON_SECOND_HASH = 1459016917
local METEORON_FIRST_PROJECTILE_HASH = 615362208
local METEORON_SECOND_PROJECTILE_HASH = 1431585106
local MAELSTORM_HASH = 4109786672

-- SALAMANDER base rate, requires update if vanilla val changed
local BASE_RATE_SALAMANDER = 2.0

local data_table = {
    [FLAGRATION_VFX_HASH] = { multiplier = nil, scale = scales.FLAGRATION, cache = nil },
    [HIGH_FLAGRATION_VFX_HASH] = { multiplier = nil, scale = scales.FLAGRATION, cache = nil },
    [FLAGRATION_HASH] = { multiplier = multipliers.FLAGRATION, scale = nil, cache = nil },
    [HIGH_FLAGRATION_HASH] = { multiplier = multipliers.FLAGRATION, scale = nil, cache = nil },
    [LEVIN_HASH] = { multiplier = multipliers.LEVIN, scale = scales.LEVIN, cache = nil },
    [LEVIN_INITIAL_HASH] = { multiplier = multipliers.LEVIN, scale = scales.LEVIN, cache = nil },
    [LEVIN_ADDITIONAL_ATK_HASH] = { multiplier = multipliers.LEVIN, scale = scales.LEVIN, cache = nil },
    [FRIGOR_FRONT_HASH] = { multiplier = multipliers.FRIGOR, scale = scales.FRIGOR, cache = nil },
    [FRIGOR_PILLER_HASH] = { multiplier = multipliers.FRIGOR, scale = scales.FRIGOR, cache = nil },
    [HIGH_FRIGOR_ADDITIONAL_ATK_HASH] = { multiplier = multipliers.FRIGOR, scale = scales.FRIGOR, cache = nil },
    [HIGH_FRIGOR_ICE_ELEMENT_HASH] = { multiplier = multipliers.FRIGOR, scale = scales.FRIGOR, cache = nil },
    [ANODYNE_HEAL_HASH] = { multiplier = nil, scale = scales.ANODYNE, cache = nil },
    [ANODYNE_ATTACK_UNDEAD_HASH] = { multiplier = multipliers.ANODYNE_ATTACK_UNDEAD, scale = scales.ANODYNE, cache = nil },
    [HALIDOM_HASH] = { multiplier = nil, scale = scales.HALIDOM, cache = nil },
    [CELERITY_HASH] = { multiplier = nil, scale = scales.CELERITY, cache = nil },
    [HIGH_HALIDOM_HASH] = { multiplier = nil, scale = scales.HALIDOM, cache = nil },
    [HIGH_CELERITY_HASH] = { multiplier = nil, scale = scales.CELERITY, cache = nil },
    [SEISM_INITIAL_HASH] = { multiplier = multipliers.SEISM, scale = scales.SEISM, cache = nil },
    [SEISM_ADDITIONAL_ATK_HASH] = { multiplier = multipliers.SEISM, scale = scales.SEISM, cache = nil },
    [SALAMANDER_HASH] = { multiplier = multipliers.SALAMANDER, scale = scales.SALAMANDER, cache = nil },
    [HIGH_SALAMANDER_HASH] = { multiplier = multipliers.SALAMANDER, scale = scales.SALAMANDER, cache = nil },
    [HAGOL_HASH] = { multiplier = multipliers.HAGOL, scale = scales.HAGOL, cache = nil },
    [HIGH_HAGOL_HASH] = { multiplier = multipliers.HAGOL, scale = scales.HAGOL, cache = nil },
    [THUNDERMINE_HASH] = { multiplier = nil, scale = scales.THUNDERMINE, cache = nil },
    [HIGH_THUNDERMINE_HASH] = { multiplier = nil, scale = scales.THUNDERMINE, cache = nil },
    [THUNDERMINE_DAMAGE_HASH] = { multiplier = multipliers.THUNDERMINE_DAMAGE, scale = nil, cache = nil },
    [DECANTER_SAP_HASH] = { multiplier = multipliers.DECANTER_SAP, scale = nil, cache = nil },
    [HIGH_DECANTER_SAP_HASH] = { multiplier = multipliers.DECANTER_SAP, scale = nil, cache = nil },
    [FLARE_FIRST_HASH] = { multiplier = multipliers.FLARE, scale = scales.FLARE, cache = nil },
    [FLARE_SECOND_HASH] = { multiplier = multipliers.FLARE, scale = scales.FLARE, cache = nil },
    [FLARE_THIRD_HASH] = { multiplier = multipliers.FLARE, scale = scales.FLARE, cache = nil },
    [FLARE_FINISH_HASH] = { multiplier = multipliers.FLARE, scale = scales.FLARE, cache = nil },
    [FLARE_MAX_FINISH_HASH] = { multiplier = multipliers.FLARE, scale = scales.FLARE, cache = nil},
    [EMPYREAN_VFX_HASH] = { multiplier = nil, scale = scales.EMPYREAN, cache = nil },
    [HIGH_EMPYREAN_VFX_HASH] = { multiplier = nil, scale = scales.EMPYREAN, cache = nil },
    [EMPYREAN_HASH] = { multiplier = multipliers.EMPYREAN, scale = nil, cache = nil },
    [HIGH_EMPYREAN_HASH] = { multiplier = multipliers.EMPYREAN, scale = nil, cache = nil },
    [EMPYREAN_ATTACK_UNDEAD_HASH] = { multiplier = multipliers.EMPYREAN_ATTACK_UNDEAD, scale = nil, cache = nil },
    [HIGH_EMPYREAN_ATTACK_UNDEAD_HASH] = { multiplier = multipliers.EMPYREAN_ATTACK_UNDEAD, scale = nil, cache = nil },
    [PAEAN_HASH] = { multiplier = nil, scale = scales.PAEAN, cache = nil },
    [METEORON_FIRST_HASH] = { multiplier = multipliers.METEORON, scale = scales.METEORON, cache = nil },
    [METEORON_FIRST_PROJECTILE_HASH] = { multiplier = multipliers.METEORON_PROJECTILE, scale = scales.METEORON_PROJECTILE, cache = nil },
    [METEORON_SECOND_HASH] = { multiplier = multipliers.METEORON, scale = scales.METEORON, cache = nil },
    [METEORON_SECOND_PROJECTILE_HASH] = { multiplier = multipliers.METEORON_PROJECTILE, scale = scales.METEORON_PROJECTILE, cache = nil },
    [MAELSTORM_HASH] = { multiplier = multipliers.MAELSTORM, scale = scales.MAELSTORM, cache = nil }
}


local function get_new_vector3(x, y, z)
    local new_vector3 = ValueType.new(sdk_.find_type_definition("via.vec3"))
    local function fixed_size(val)
        if val < 0.1 then
            return 0.1
        end
        return val
    end
    new_vector3.x = fixed_size(x)
    new_vector3.y = fixed_size(y)
    new_vector3.z = fixed_size(z)
    return new_vector3
end


local function create_drag_bars(table_)
    for _, v in pairs(table_) do
        local change, new_ = imgui.drag_float(v.name, v.value, 0.01, 0.1, 20, "%.2f")
        if change then
            v.value = new_
        end
    end
end


local function load_config(filepath, table_)
    local _table = json.load_file(filepath)
    if not _table then return end
    for _, v in pairs(_table) do
        table_[v.name].value = v.value
    end
end


local function save_config()
    if not json.dump_file("VariableMagic\\multiplier.json", multipliers) then
        re.msg("Failed to save multiplier config")
    end
    if not json.dump_file("VariableMagic\\scales.json", scales) then
        re.msg("Failed to save scales config.")
    end
    re.msg("Saved to\nreframework\\data\\VariableMagic\\config.json")
end


if reframework.get_commit_count() < 1645 then
	re.msg("Variable Magic: Your REFramework is older version.\n If the mod does not work, Get version `REF Nightly 913` from\nhttps://github.com/praydog/REFramework-nightly/releases")
end



local _character_manager
local function GetCharacterManager()
    if not _character_manager then
        _character_manager = sdk_.get_managed_singleton("app.CharacterManager")
    end
	return _character_manager
end

local _player_chara
local function GetManualPlayer()
    if not _player_chara then
        local characterManager = GetCharacterManager()
        if characterManager then
            _player_chara = characterManager:get_ManualPlayer()
        end
    end
    return _player_chara
end


local function initialize_()
    load_config("VariableMagic\\multiplier.json", multipliers)
    load_config("VariableMagic\\scales.json", scales)
    _character_manager = nil
    _player_chara = nil
    _player_chara = GetManualPlayer()
end


initialize_()


re.on_draw_ui(function()
    if imgui.tree_node("Variable Magic") then
        if imgui.button("Save") then
            save_config()
        end

        if imgui.tree_node("Action Rate Multipliers") then
            create_drag_bars(multipliers)
            imgui.tree_pop()
        end

        if imgui.tree_node("Scale") then
            create_drag_bars(scales)
            imgui.tree_pop()
        end
        imgui.tree_pop()
    end
end)


sdk_.hook(sdk_.find_type_definition("app.GuiManager"):get_method("OnChangeSceneType"),
    function () end,
    function (...)
        initialize_()
        return ...
    end)


sdk_.hook(sdk_.find_type_definition("app.ShellManager"):get_method("registShell(app.Shell)"),
    function (args)
        local app_shell = sdk_.to_managed_object(args[3])
        local data = data_table[app_shell:get_ShellParamId()]
        if data and data.scale then
            local shell_base_param = app_shell:get_ShellParameter():get_field("ShellBaseParam")
            shell_base_param["Scale"] = get_new_vector3(data.scale.value, data.scale.value, data.scale.value)
            shell_base_param["UseScale"] = true
        end
    end,
    function (rtval)
        return rtval
    end)


sdk_.hook(sdk_.find_type_definition("app.HitController"):get_method("calcDamageValue(app.HitController.DamageInfo)"),
function (args)
    local damage_info = sdk_.to_managed_object(args[3])
    -- perhaps better to use _player_chara:get_GameObject()
    local attacker_hit_controller = damage_info:get_field("<AttackOwnerHitController>k__BackingField")
    local attack_hit_controller = damage_info:get_field("<AttackHitController>k__BackingField")
    if attacker_hit_controller ~= nil and attack_hit_controller ~= nil then
        local attacker_chara = attacker_hit_controller:get_CachedCharacter()
        if attacker_chara == _player_chara then
            local attacker_shell_cache = attack_hit_controller:get_CachedShell()
            if attacker_shell_cache ~= nil then
                local hash_ = attacker_shell_cache:get_ShellParamId()
                local data = data_table[hash_]
                if data and data.multiplier then
                    local attack_user_data = damage_info:get_field("<AttackUserData>k__BackingField")
                    local new_rate
                    if hash_ == SEISM_ADDITIONAL_ATK_HASH then
                        new_rate = attack_user_data:get_field("ActionRate") * data.multiplier.value
                    elseif hash_ == SALAMANDER_HASH or hash_ == HIGH_SALAMANDER_HASH then
                        new_rate = multipliers.SALAMANDER * BASE_RATE_SALAMANDER
                    elseif data.cache == nil then
                        local origin = attack_user_data:get_field("ActionRate")
                        new_rate = origin * data.multiplier.value
                        data.cache = new_rate
                    else
                        new_rate = data.cache
                    end
                    attack_user_data:set_field("ActionRate", new_rate)
                    damage_info:set_field("<AttackUserData>k__BackingField", attack_user_data)
                end
                print("hash", hash_)
            end
        end
    end
end,
function (rtval)
    return rtval
end)


sdk_.hook(sdk_.find_type_definition("app.ShellAdditionalMineVolt"):get_method("onShellUpdate()"),
function (args)
    local this = sdk_.to_managed_object(args[2])
    if UNLIMITED_THUNDERMINE then
        this:set_InterceptionCounter(0)
    end
end,
function (rtval)
    return rtval
end)
