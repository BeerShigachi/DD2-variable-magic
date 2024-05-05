-- author : BeerShigachi
-- date : 5 May 2024
-- version : 1.1.2

-- CONFIG: 1.0 as vanilla value. every values have to be float number. use float like 1.0 not 1.
-- damage multipliers
local FLAGRATION_MULTIPLIER = 1.0
local LEVIN_MULTIPLIER = 1.0
local FRIGOR_MULTIPLIER = 1.0
local ANODYNE_ATTACK_UNDEAD_MULTIPLIER = 1.0
local SEISM_MULTIPLIER = 1.0
local SALAMANDER_MULTIPLIER = 1.0 -- require restart the game everytime you reset scripts or change the values.
local HAGOL_MULTIPLIER = 1.0
local THUNDERMINE_DAMAGE_MULTIPLIER = 1.0
local DECANTER_SAP_MULTIPLIER = 1.0
local FLARE_MULTIPLIER = 1.0
local EMPYREAN_MULTIPLIER = 1.0
local EMPYREAN_ATTACK_UNDEAD_MULTIPLIER = 1.0

-- Spell effect size(area) scale: setting 2.0 means 2 times bigger.
local FLAGRATION_SIZE_SCALE = 1.5
local LEVIN_SIZE_SCALE = 1.0
local FRIGOR_SIZE_SCALE = 1.0
local ANODYNE_SIZE_SCALE = 3.0
local HALIDOM_SIZE_SCALE = 3.0
local CELERITY_SIZE_SCALE = 3.0
local SEISM_SIZE_SCALE = 1.5
local SALAMANDER_SIZE_SCALE = 1.5
local HAGOL_SIZE_SCALE = 1.0
local THUNDERMINE_SIZE_SCALE = 1.5
local FLARE_SIZE_SCALE = 1.0
local EMPYREAN_SIZE_SCALE = 1.0 -- CAUTION: NOT GOOD FOR YORU EYES!!

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
local EMPYREAN_VFX_HASH = 2653820902
local HIGH_EMPYREAN_VFX_HASH = 2575444828
local EMPYREAN_HASH = 1883937863
local HIGH_EMPYREAN_HASH = 3721181979
local EMPYREAN_ATTACK_UNDEAD_HASH = 3418934292
local HIGH_EMPYREAN_ATTACK_UNDEAD_HASH = 512380958

local data_table = {
    [FLAGRATION_VFX_HASH] = { multiplier = nil, scale = FLAGRATION_SIZE_SCALE, cache = nil },
    [HIGH_FLAGRATION_VFX_HASH] = { multiplier = nil, scale = FLAGRATION_SIZE_SCALE, cache = nil },
    [FLAGRATION_HASH] = { multiplier = FLAGRATION_MULTIPLIER, scale = nil, cache = nil },
    [HIGH_FLAGRATION_HASH] = { multiplier = FLAGRATION_MULTIPLIER, scale = nil, cache = nil },
    [LEVIN_HASH] = { multiplier = LEVIN_MULTIPLIER, scale = LEVIN_SIZE_SCALE, cache = nil },
    [LEVIN_INITIAL_HASH] = { multiplier = LEVIN_MULTIPLIER, scale = LEVIN_SIZE_SCALE, cache = nil },
    [LEVIN_ADDITIONAL_ATK_HASH] = { multiplier = LEVIN_MULTIPLIER, scale = LEVIN_SIZE_SCALE, cache = nil },
    [FRIGOR_FRONT_HASH] = { multiplier = FRIGOR_MULTIPLIER, scale = FRIGOR_SIZE_SCALE, cache = nil },
    [FRIGOR_PILLER_HASH] = { multiplier = FRIGOR_MULTIPLIER, scale = FRIGOR_SIZE_SCALE, cache = nil },
    [HIGH_FRIGOR_ADDITIONAL_ATK_HASH] = { multiplier = FRIGOR_MULTIPLIER, scale = FRIGOR_SIZE_SCALE, cache = nil },
    [HIGH_FRIGOR_ICE_ELEMENT_HASH] = { multiplier = FRIGOR_MULTIPLIER, scale = FRIGOR_SIZE_SCALE, cache = nil },
    [ANODYNE_HEAL_HASH] = { multiplier = nil, scale = ANODYNE_SIZE_SCALE, cache = nil },
    [ANODYNE_ATTACK_UNDEAD_HASH] = { multiplier = ANODYNE_ATTACK_UNDEAD_MULTIPLIER, scale = nil, cache = nil },
    [HALIDOM_HASH] = { multiplier = nil, scale = HALIDOM_SIZE_SCALE, cache = nil },
    [CELERITY_HASH] = { multiplier = nil, scale = CELERITY_SIZE_SCALE, cache = nil },
    [HIGH_HALIDOM_HASH] = { multiplier = nil, scale = HALIDOM_SIZE_SCALE, cache = nil },
    [HIGH_CELERITY_HASH] = { multiplier = nil, scale = CELERITY_SIZE_SCALE, cache = nil },
    [SEISM_INITIAL_HASH] = { multiplier = SEISM_MULTIPLIER, scale = SEISM_SIZE_SCALE, cache = nil },
    [SEISM_ADDITIONAL_ATK_HASH] = { multiplier = SEISM_MULTIPLIER, scale = SEISM_SIZE_SCALE, cache = nil },
    [SALAMANDER_HASH] = { multiplier = SALAMANDER_MULTIPLIER, scale = SALAMANDER_SIZE_SCALE, cache = nil },
    [HIGH_SALAMANDER_HASH] = { multiplier = SALAMANDER_MULTIPLIER, scale = SALAMANDER_SIZE_SCALE, cache = nil },
    [HAGOL_HASH] = { multiplier = HAGOL_MULTIPLIER, scale = HAGOL_SIZE_SCALE, cache = nil },
    [HIGH_HAGOL_HASH] = { multiplier = HAGOL_MULTIPLIER, scale = HAGOL_SIZE_SCALE, cache = nil },
    [THUNDERMINE_HASH] = { multiplier = nil, scale = THUNDERMINE_SIZE_SCALE, cache = nil },
    [HIGH_THUNDERMINE_HASH] = { multiplier = nil, scale = THUNDERMINE_SIZE_SCALE, cache = nil },
    [THUNDERMINE_DAMAGE_HASH] = { multiplier = THUNDERMINE_DAMAGE_MULTIPLIER, scale = nil, cache = nil },
    [DECANTER_SAP_HASH] = { multiplier = DECANTER_SAP_MULTIPLIER, scale = nil, cache = nil },
    [HIGH_DECANTER_SAP_HASH] = { multiplier = DECANTER_SAP_MULTIPLIER, scale = nil, cache = nil },
    [FLARE_FIRST_HASH] = { multiplier = FLARE_MULTIPLIER, scale = FLARE_SIZE_SCALE, cache = nil },
    [FLARE_SECOND_HASH] = { multiplier = FLARE_MULTIPLIER, scale = FLARE_SIZE_SCALE, cache = nil },
    [FLARE_THIRD_HASH] = { multiplier = FLARE_MULTIPLIER, scale = FLARE_SIZE_SCALE, cache = nil },
    [FLARE_FINISH_HASH] = { multiplier = FLARE_MULTIPLIER, scale = FLARE_SIZE_SCALE, cache = nil },
    [EMPYREAN_VFX_HASH] = { multiplier = nil, scale = EMPYREAN_SIZE_SCALE, cache = nil },
    [HIGH_EMPYREAN_VFX_HASH] = { multiplier = nil, scale = EMPYREAN_SIZE_SCALE, cache = nil },
    [EMPYREAN_HASH] = { multiplier = EMPYREAN_MULTIPLIER, scale = nil, cache = nil },
    [HIGH_EMPYREAN_HASH] = { multiplier = EMPYREAN_MULTIPLIER, scale = nil, cache = nil },
    [EMPYREAN_ATTACK_UNDEAD_HASH] = { multiplier = EMPYREAN_ATTACK_UNDEAD_MULTIPLIER, scale = nil, cache = nil },
    [HIGH_EMPYREAN_ATTACK_UNDEAD_HASH] = { multiplier = EMPYREAN_ATTACK_UNDEAD_MULTIPLIER, scale = nil, cache = nil }
}


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

local cache_vector3 = ValueType.new(sdk_.find_type_definition("via.vec3"))
local function get_new_vector3(x, y, z)
    local function fixed_size(val)
        if val < 0.1 then
            return 0.1
        end
        return val
    end
    cache_vector3.x = fixed_size(x)
    cache_vector3.y = fixed_size(y)
    cache_vector3.z = fixed_size(z)
    return cache_vector3
end

local function initialize_()
    _character_manager = nil
    _player_chara = nil
    _player_chara = GetManualPlayer()
end

initialize_()

-- could use 
sdk_.hook(sdk_.find_type_definition("app.GuiManager"):get_method("OnChangeSceneType"),
    function () end,
    function (...)
        initialize_()
        return ...
    end)

sdk_.hook(sdk_.find_type_definition("app.ShellManager"):get_method("registShell(app.Shell)"),
    function (args)
        local app_shell = sdk_.to_managed_object(args[3])
        print("register new shell", app_shell:get_ShellParamId())
        local data = data_table[app_shell:get_ShellParamId()]
        if data and data.scale then
            local shell_base_param = app_shell:get_ShellParameter():get_field("ShellBaseParam")
            shell_base_param["Scale"] = get_new_vector3(data.scale, data.scale, data.scale)
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
    if attacker_hit_controller ~= nil then
        local attacker_chara = attacker_hit_controller:get_CachedCharacter()
        if attacker_chara == _player_chara then
            local attacker_shell_cache = damage_info:get_field("<AttackHitController>k__BackingField"):get_CachedShell()
            if attacker_shell_cache ~= nil then
                local hash_ = attacker_shell_cache:get_ShellParamId()
                local data = data_table[hash_]
                if data and data.multiplier then
                    local attack_user_data = damage_info:get_field("<AttackUserData>k__BackingField")
                    if data.cache == nil then
                        local origin = attack_user_data:get_field("ActionRate")
                        data.cache = origin * data.multiplier
                        attack_user_data:set_field("ActionRate", data.cache)
                        damage_info:set_field("<AttackUserData>k__BackingField", attack_user_data)
                    else
                        attack_user_data:set_field("ActionRate", data.cache)
                        damage_info:set_field("<AttackUserData>k__BackingField", attack_user_data)
                    end
                end
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
