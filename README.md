# Noob vs Senior Programmer 💀



**Noob vs Senior Programmer** is a planned Roblox 1v1 party fighting game. Before each combat round, both players choose an algorithm challenge difficulty. Correct answers unlock attacks; harder challenges unlock more powerful skills.

### Planned gameplay

1. Both players join a match at 100 HP.
2. Each chooses an easy or medium challenge.
3. The server randomly picks an unused question in that difficulty tier.
4. Both players answer within a time limit. Correct answers grant a one-use special attack for the next combat phase.
5. Players fight using basic attacks and unlocked skills.
6. The next round starts unless a player has 0 HP or the maximum round count is reached.
7. The game announces the winner; if the round limit is reached, the player with more HP wins.

## Tech stack

| Area                        | Choice                                 |
| --------------------------- | -------------------------------------- |
| Language                    | Luau                                   |
| Game engine                 | Roblox Studio                          |
| Client-server communication | Roblox RemoteEvents                    |
| Question storage            | Server-only ModuleScript (no database) |
| Match state                 | Temporary server memory                |
| Local source workflow       | Rojo + VS Code (optional, recommended) |
| Version control             | Git and GitHub                         |
| Third-party API             | None for v1                            |

## Build milestones

1. Repository and Rojo setup
2. Battle arena and player spawns
3. Random question bank
4. Question GUI + server validation
5. Round and timer state machine
6. Basic combat + unlockable skills
7. Victory and rematch
8. Multiplayer testing and polish

## 
