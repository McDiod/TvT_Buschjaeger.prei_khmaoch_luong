/*  Hier werden Siegbedingungen festgelegt
*   Beispiel:
    class bluforeliminated {
        preset = "ELIMINATION";
        presetParams[] = {"WEST"};

        condition = "";
        checkInterval = 0;

        winners[] = {"EAST","INDEPENDENT"};
        winText = "BLUFOR eliminated after %1 minutes.<br/>OPFOR wins!";
        winTextParams[] = {"round (CBA_missionTime/60)"};
    };
    class opforeliminated {
        preset = "ELIMINATION";
        presetParams[] = {"EAST"};

        condition = "";
        checkInterval = 0;

        winners[] = {"WEST","INDEPENDENT"};
        winText = "OPFOR eliminated after %1 minutes.<br/>BLUFOR wins!";
        winTextParams[] = {"round (CBA_missionTime/60)"};
    };
*/


class bluforeliminated {
    preset = "ELIMINATION";
    presetParams[] = {"WEST"};

    condition = "";
    checkInterval = 0;

    winners[] = {"INDEPENDENT"};
    winText = "USMC eliminated.<br/>Assassins win!";
    winTextParams[] = {};
};

class opforeliminated {
    preset = "ELIMINATION";
    presetParams[] = {"INDEPENDENT"};

    condition = "";
    checkInterval = 0;

    winners[] = {"WEST"};
    winText = "Assassins eliminated.<br/>USMC wins!";
    winTextParams[] = {};
};

class civTargetsKilled {
    condition = "bj_civTargetsKilled";
    checkInterval = 4;
    winners[] = {"INDEPENDENT"};
    winText = "Targets eliminated.<br/>Assassins win!";
};
