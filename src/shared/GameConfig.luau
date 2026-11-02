--!strict
-- Shared constants only. Do not store correct quiz answers in ReplicatedStorage.
local GameConfig = {
    STARTING_HP = 100,
    QUIZ_SECONDS = 25,
    COMBAT_SECONDS = 45,
    MAX_ROUNDS = 5,
    SKILLS = {
        Easy = {name = "Double Slap", damage = 15, cooldown = 8},
        Medium = {name = "Divide by Two", damage = 28, cooldown = 14},
    },
}

return GameConfig
