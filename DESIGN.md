
# PuzzleWarp Design

## Preface

This game idea arived from my attempts to visualize and understand linear logic in my free time.
This document tries to explain both the semantics of linear logic, and the overall intended design of the game.

The game, and this document is meant to be playable for people who do not know about linear logic,
and appreciated by those who do.

This document is the result of a brainstorming session, so it may be clanky in text structure.
The author will try to distinguish specific game-design and linear logic ideas in separate footnotes,
marked as \[`n`\], where `n` is an integer.

## Overall Idea

In Summary, PuzzleWarp is a Shape Shorter-like game, in which the goal of the player is to receive
given objects, and put them at the holes with the correct shapes. The main rules are:

1. The player must fill every target hole with exactly one compatible object to finish a level.
2. The player must use all objects they are given;
   The level only ends once the room is empty, and all target holes have been filled.
3. The player cannot duplicate (most) objects.
4. The player cannot make (most) objects disapear.

However, as it will be described, this game has weird mechanics, which include additional 'soft' rules,
such as:

5. The player has to solve the puzzle in all parallel universes it creates to truly pass the lavel.

## First Level

PuzzleWarp is an idea about a [Portal](https://en.wikipedia.org/wiki/Portal_(video_game))
inpired first-person 3D puzzle game.

In this game, the player initially finds themselves located inside of a white room. \[1\]

There would be two relevant walls in this white room: A wall the player faces once they spawn -
which will be known as the source wall - and a wall to the opposite direction of the player,
which will be known as the target wall. \[2\]

Both walls contain holes shaped like objects, such as cubes, pyramids, bottles, buckets,
and other objects with distinct silhouettes.

The walls need not contain the same holes/silhouettes.

After a few seconds, objects would come from the silhouettes of the source wall, from their respective holes.

The player is able to pick and move such objects. \[3\]
The goal of the game, is to take all objects, and put them in the target wall's holes.

As it possible to imagine, the player is only allowed to fill holes with objects that match
its shape.

After a hole is filled, no objects may fill that hole again. \[4\]

The winning condition is:
1. There are no objects in the room.
2. All holes have been filled.

After the winning condition is met, the room blinks with a green light,
and the level is finished. \[5\].

### First Level Design Notes

\[1\]: This room would be shaped like the interior of a semi-shpere, and the floor in which the player stands on is
The flat region of the semi-shpere.
Optionally, the floor of such room could be made out of a transparent/translucid glass, and the player would be
able to see what is below themselves, which is the other side of the semi-shpere.

\[2\]:
The room should probably be some indication of which is the source all and which is the target wall.
When the player gets close to a hole and stares at it, the game should indicate visually in a UI what is
the object meant to be placed in that hole, and the player should be able to right click to see the details
of the object. This may not be necessary in the first level, however.

\[3\]:
The initial design for picking objects is meant to be similar to the one in Portal, in which the player picks objects and moves
them around, and not something like an inventory system.

\[4\]: There should be some visual indication that a hole is finished, like a metallic wall covering it, or it
disapearing from the wall, or a force field. To be decided.

\[5\]: After the level is finished, the player should be directly presented with the next level,
without having to go to an angry-birds style level select screen.

Before the start of each level, the game should not show the number of the level,
but instead show a text that represents the linear logic formual









