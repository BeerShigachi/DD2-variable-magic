-- author : BeerShigachi
-- date : 28 April 2024
-- version : 1.0.0

-- CONFIG: every values have to be float number. use float like 1.0 not 1.
local FLAGRATION_MULTIPLIER = 1.0
local LEVIN_MULTIPLIER = 100.0
local FRIGOR_MULTIPLIER = 1.0
local ANODYNE_ATTACK_UNDEAD_MULTIPLIER = 1.0
local SEISM_MULTIPLIER = 1.0
local SALAMANDER_MULTIPLIER = 1.0
local HAGOL_MULTIPLIER = 1.0
local THUNDERMINE_DAMAGE_MULTIPLIER = 1.0
local DECANTER_SAP_MULTIPLIER = 1.0
local FLARE_MULTIPLIER = 1.0 -- only works for level 1 version for now
local EMPYREAN_MULTIPLIER = 1.0
local EMPYREAN_ATTACK_UNDEAD_MULTIPLIER = 1.0
-- super OP if you want
local UNLIMITED_THUNDERMINE = false -- CHANGE THIS VALUE TO true REQUIRES RESTART THE GAME! set true to keep pulsing until running out of the orb lifetiem.


-- DO NOT TOUCH UNDER THIS LINE
local sdk_ = sdk
-- list of hash
local FLAGRATION_HASH = 3911298812
local HIGH_FLAGRATION_HASH = 1544425783
local LEVIN_HASH = 3322200037
local LEVIN_INITIAL_HASH = 2443240160
local LEVIN_ADDITIONAL_ATK_HASH = 1631386228
local FRIGOR_FRONT_HASH = 560614883 -- not main damage
local FRIGOR_PILLER_HASH = 2386535265 -- main damage source
local HIGH_FRIGOR_ADDITIONAL_ATK_HASH = 3550812182
local HIGH_FRIGOR_ICE_ELEMENT_HASH = 851770900
local ANODYNE_ATTACK_UNDEAD_HASH = 3468748481
local SEISM_INITIAL_HASH = 1560174487 -- not being used
local SEISM_ADDITIONAL_ATK_HASH = 1372270961
local SALAMANDER_HASH = 2274290786
local HIGH_SALAMANDER_HASH = 3151664427
local HAGOL_HASH = 2078305748
local HIGH_HAGOL_HASH = 3389397243
local THUNDERMINE_DAMAGE_HASH = 3220102239
local DECANTER_SAP_HASH = 4249229745
local HIGH_DECANTER_SAP_HASH = 552692977
local FLARE_FIRST_HASH = 2949517138
local FLARE_SECOND_HASH = 340281505
local FLARE_THIRD_HASH = 3543475679
local FLARE_FINISH_HASH = 3321228649
local EMPYREAN_HASH = 1883937863
local HIGH_EMPYREAN_HASH = 3721181979
local EMPYREAN_ATTACK_UNDEAD_HASH = 3418934292
local HIGH_EMPYREAN_ATTACK_UNDEAD_HASH = 512380958

local multipliers = {
    [FLAGRATION_HASH] = FLAGRATION_MULTIPLIER,
    [HIGH_FLAGRATION_HASH] = FLAGRATION_MULTIPLIER,
    [LEVIN_HASH] = LEVIN_MULTIPLIER,
    [LEVIN_INITIAL_HASH] = LEVIN_MULTIPLIER,
    [LEVIN_ADDITIONAL_ATK_HASH] = LEVIN_MULTIPLIER,
    [FRIGOR_FRONT_HASH] = FRIGOR_MULTIPLIER, -- not main damage
    [FRIGOR_PILLER_HASH] = FRIGOR_MULTIPLIER, -- main damage source
    [HIGH_FRIGOR_ADDITIONAL_ATK_HASH] = FRIGOR_MULTIPLIER,
    [HIGH_FRIGOR_ICE_ELEMENT_HASH] = FRIGOR_MULTIPLIER,
    [ANODYNE_ATTACK_UNDEAD_HASH] = ANODYNE_ATTACK_UNDEAD_MULTIPLIER,
    [SEISM_INITIAL_HASH] = SEISM_MULTIPLIER, -- not being used
    [SEISM_ADDITIONAL_ATK_HASH] = SEISM_MULTIPLIER,
    [SALAMANDER_HASH] = SALAMANDER_MULTIPLIER,
    [HIGH_SALAMANDER_HASH] = SALAMANDER_MULTIPLIER,
    [HAGOL_HASH] = HAGOL_MULTIPLIER,
    [HIGH_HAGOL_HASH] = HAGOL_MULTIPLIER,
    [THUNDERMINE_DAMAGE_HASH] = THUNDERMINE_DAMAGE_MULTIPLIER,
    [DECANTER_SAP_HASH] = DECANTER_SAP_MULTIPLIER,
    [HIGH_DECANTER_SAP_HASH] = DECANTER_SAP_MULTIPLIER,
    [FLARE_FIRST_HASH] = FLARE_MULTIPLIER,
    [FLARE_SECOND_HASH] = FLARE_MULTIPLIER,
    [FLARE_THIRD_HASH] = FLARE_MULTIPLIER,
    [FLARE_FINISH_HASH] = FLARE_MULTIPLIER,
    [EMPYREAN_HASH] = EMPYREAN_MULTIPLIER,
    [HIGH_EMPYREAN_HASH] = EMPYREAN_MULTIPLIER,
    [EMPYREAN_ATTACK_UNDEAD_HASH] = EMPYREAN_ATTACK_UNDEAD_MULTIPLIER,
    [HIGH_EMPYREAN_ATTACK_UNDEAD_HASH] = EMPYREAN_ATTACK_UNDEAD_MULTIPLIER
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
                local multiplier = multipliers[hash_]
                if multiplier then
                    local attack_user_data = damage_info:get_field("<AttackUserData>k__BackingField")
                    local new_rate = attack_user_data:get_field("ActionRate")
                    new_rate = new_rate * multiplier
                    attack_user_data:set_field("ActionRate", new_rate)
                    damage_info:set_field("<AttackUserData>k__BackingField", attack_user_data)
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
