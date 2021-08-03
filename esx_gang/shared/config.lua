Gang = {
    {
        GangName = "Vagos", -- Nom du Gang
        JobGangName = "vagos", -- Nom du set job Gang
        Garage = { -- Garage
            GradeJobAcces = {"pequeno", "asistente", "teniente", "soldado", "segundo", "boss"}, -- Grade du job qui a accès au garage
            PosDeleter = vector3(327.96, -2027.72, 21.07), -- Position du point pour ranger les véhicules
            PosSpawner = vector3(316.47, -2031.82, 20.56), -- Position du point sortir les véhicules
            Vehicule = { -- Vehicule dans le garage
                -- Nom du véhicule / nom de spawn du véhicule / nombre de véhicule que peuvent sortir les personnes / hash du véhicule / couleur du véhicule
                {name = "Sultan", label = "sultan", stock = 2, hash = 970598228, color = {255, 235, 52}},
                {name = "Bf400", label = "bf400", stock = 2, hash = 86520421, color = {255, 235, 52}},
            },
        },
        BossAction = { -- Action Patron
            GradeJobAcces = {"segundo", "boss"}, -- Grade du job qui a accès aux actions patron
            PosBoss = vector3(343.23, -2028.14, 22.35), -- Position du point action patron
            SocietyAction = "society_vagos", -- Nom de la societe pour l'argent gang
            ArgentType = "black_money", -- Argent à déposer/récupérer du gang (bank/money/black_money)
        },
        Coffre = { -- Coffre
            GradeJobAcces = {"pequeno", "asistente", "teniente", "soldado", "segundo", "boss"}, -- Grade du job qui a accès aux actions patron
            PosCoffre = vector3(332.28, -2018.77, 22.35), -- Position du point action patron
            SocietyCoffre = "society_vagos", -- Nom de la societe pour l'argent gang
        },
    },
    {
        GangName = "Ballas", -- Nom du Gang
        JobGangName = "ballas", -- Nom du set job Gang
        Garage = { -- Garage
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès au garage
            PosDeleter = vector3(89.66, -1966.67, 20.74),-- Position du point pour ranger les véhicules
            PosSpawner = vector3(102.78, -1958.81, 20.78),-- Position du point sortir les véhicules
            Vehicule = { -- Vehicule dans le garage
                -- Nom du véhicule / nom de spawn du véhicule / nombre de véhicule que peuvent sortir les personnes / hash du véhicule / couleur du véhicule
                {name = "Sultan", label = "sultan", stock = 2, hash = 970598228, color = {254, 248, 108}},
                {name = "Bf400", label = "bf400", stock = 2, hash = 86520421, color = {254, 248, 108}},
            },
        },
        BossAction = { -- Action Patron
            GradeJobAcces = {"boss"}, -- Grade du job qui a accès aux actions patron
            PosBoss = vector3(114.28, -1960.90, 21.33), -- Position du point action patron
            SocietyAction = "society_ballas", -- Nom de la societe pour l'argent gang.
            ArgentType = "black_money", -- Argent à déposer/récupérer du gang (bank/money/black_money)
        },
        Coffre = { -- Coffre
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosCoffre = vector3(117.70, -1944.10, 20.64), -- Position du point action patron
            SocietyCoffre = "society_ballas", -- Nom de la societe pour l'argent gang
        },
    },

    --[[
        Pour créer un nouveau gang il suffit juste de copier coller un des gangs et le coller en dessous de modifier par vos trucs !
    ]]
}

BlipsGang = {
    Blip = {
        {pos = vector3(340.63, -2044.76, 21.31), id = 303, scale = 0.8, display = 4, color = 5, name = "Vagos"},
        {pos = vector3(107.03, -1940.77, 20.80), id = 303, scale = 0.8, display = 4, color = 83, name = "Ballas"},
    },
}