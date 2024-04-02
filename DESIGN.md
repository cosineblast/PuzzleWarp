
# PuzzleWarp Design, Part 1

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

5. The player has to solve the puzzle in all parallel universes it creates.

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
but instead show a mathematical text that represents the linear logic sequent equivalent to that level
(more on that later).

For instance, if in a specific level, the player moves a bottle and a bucket from one wall to another,
the level would start briefly showing the text:

[Bottle Image] × [Bucket Icon] ⊢ [Bucket Icon] × [Bottle Icon]

The game would not explain what those mean, but after some level-solving, the player should get some intuition for it.


## Second And Third Level

The next two levels are meant to teach the player about the winning conditions.

In the second level, at first, the player is given a single pillow
object, and the target wall has holes for two pillows.
Once the player fills one of the pillows, after around 10 seconds,
the game will give the player another one, and possibly provide some
text indication that tells the user that they cannot duplicate objects. \[1\]

In the third level, at first, the player is given fire extinguisher
and a frying pan. The target wall, however, only has a hole for the extinguisher.
To solve this problem. A few seconds after the extinguisher is sent into the hole,
a second hole, for the frying pan appears, and a visual indication tells the user that they
must use every object. \[2\]

The formulas for level 2 and level 3 would be
- [Pillow Icon] ⊬ [Pillow Icon] × [Pillow Icon]
- [Extinguisher Icon] × [Pan Icon] ⊬ [Extinguisher Icon]

### Second and Third Level Design Notes

\[1\]: This indication should probably be done either as screen text,
or as a piece of paper that is given as an object, and destroyed once interacted with.

\[2\]: This should probably be the only levels in the game, in which not all holes and
objects are given at the same time.
An alternative to these two assistance levels, would be a single visual indication in the
first level, telling the user about the first three rules.

## Fourth(ish) Level

In this level, the player is presented with the first weird mechanic of the game: Superposition. \[1\]

The player is given an object, that represents the superposition of
a pillow and a frying pan. This superposition can be observed directly, and this superposition
may look like both objects occupy the same space. This, however, is a single object.

The target wall, however, asks for a single frying pan.

When the player holds the superposition object to move it around,
the player will be given a way to optionally select between a pan and a pillow.

When the player does so, the superposition object will turn into the selected object.

If the player turns the superposition object into a pillow, they will have to retry the level.
However, if they turn the superposition value into a frying pan, they can fill the hole,
and the level will be finished.

The superposition object represents choice: You can chose which object you want it to turn into,
but the superposition object cannot be turned back into its original superposition form.


### Relevant Design Notes

The name superposition is what I came up to explain the phenomena, but I am not
into quantum mechanics, so I do not know if this is the best name for this.
Maybe it should be reserved for a later concept in this game, which, as you will see,
is currently named as Schrodinger box.

The linear logic formula for the level is
[Pillow Icon] & [Frying Pan Icon] ⊢ [Frying Pan Icon].

The following levels should be simple, and use some of the superposition mechanics:
- (Bucket & Pillow) × (Bucket & Pillow) ⊢ (Bucket × Bucket)
- (Bucket & Pillow) × (Bucket & Pillow) ⊢ (Pillow × Pillow)

From now on, we will be not be presenting the level numberings, as it's easy to lose track of.
Instead, levels will be presented in "batches". The first batch was the "basics" batch,
we have now presented the "basic superposition" batch, and the following batch will be
the "basic transformation" level batch.

It is important, that from now on, it is easy to inspect "what" an object is, when the user
picks it up, (e.g showing the linear formula equivalent of that object), because
it may be difficult to tell what is going on.

Also, it should be possible to inspect what a hole asks for with more details, so
when the game asks the user for a superposition object, it is possible for the player
to know. This should probably be achieved with some UI when the player inspects
a hole or object closely.


## Transformation

The next concept in the game, is possibly the most important one: Transformation.
In the first level of this batch, the player is given a large coin,
and a new kind of object: A transformation sphere.

A transformation sphere is a watermelon sized sphere, that contains two semi-shpere sections.
In each of the semi-shpere sections, there is an icon of an object.
Additionally, there should be some arrow-like indication in the sphere that points from one
section to another.

One of the sections of the sphere is known as the "source" side, and the other side of the
sphere is the "result" side.

The mechanics of the sphere are very simple: If I put the sphere next to an object that matches the
icon of the source side, and activate the sphere, the sphere absorbs the source object, and turns into the
target object.

In this particular level, you are given a sphere that turns a coin into a candy bar, and the
target wall asks for a candy bar.

To solve this level, you use the sphere with the coin, turn that into a candy bar, and put the candy bar into
the target wall.

This batch of levels should start simple, by making the user apply multiple transformation spheres,
and ocasionally some superpositions, but nothing too fancy.

The following batch of levels, however, is allowed to be more complex, by providing the player with
things such as:

- Transformations that take multiple objects as sources
- Transformations that produce multiple objects as results
- Transformations that take superpositions as arguments
- Superpositions of 3 or more objects
- Superpositions in which one of the objects is itself a transformation sphere

### Design Notes

It is crucial that once picking a transformation sphere, the player is
given some indication of that it takes as source, and what it produces as result.

The linear logic symbol for a transformation sphere from A to B is "A ⊸ B",
so the first transformation level may be presented as Coin × (Coin ⊸ Candy) ⊢ Candy.

## Bubbles

### Destruction

After the first and second transformation batches are over, the player will
be presented to bubbles, which introduce very important concepts: Destruction and Imagination.

In the first level of this batch, the player is given a hammer and a bubble,
which is a small and hollow sphere. The target wall asks for a hammer.

The bubble however, is not an ordinary object. When the player holds the bubble, they
should be given the option to pop the bubble.

This way, after the hammer is inserted into the hole, the player may burst the bubble, and
the level will be finished.

In this game, the bubble is the only object that may be destructed.

However, this allows for problems in which the player has to use transformation orbs,
that turn objects into bubbles, effectivelly allowing the user to get rid of one object.

This why the game rule says that the player cannot get rid of _most_ things, as they
are still able to get rid of bubbles.

### Imagination

After a few bubble bursting levels, the player may be presented with one of the most
important things in this game: Imagination.

In the level that introduces this concept, the player is given nothing, and is asked
to provide a bubble. How is it possible to beat the level? By using their imagination...

... except, if the player imagines something, then that becomes real.

The game should do some indication to which key the player is supposed to press to imagine something.

When the player imagines something, their eyes close, and the player is given a UI to select what they want
to imagine. Initiall, the only thing the player is allowed to imagine, is the bubble.
Once the player does that, their eyes open, and a bubble is created,
and the player is allowed to put the bubble, into the wall
and finish the level.

In other words, bubble can be created from thin air, and be destroyed at will.

Some simple levels should be used to illustrate this, for instance: given only a transformation sphere
that turns a bubble into a bucket, give me a bucket.

### Bubble Design Notes

The linear logic formula for the bubble, is the symbol 1.
The presented level have the following formulas:

- 1 × Hammer ⊢ Hammer
- ⊢ 1
- (1 ⊸ Hammer) ⊢ Hammer

After some time, the player will be allowed to imagine more than just bubbles.

## Schrodinger Boxes

The next concept in this game is the Schrodinger box.
In the first level about this subject, the room gives the user two objects.
One of them, is a superposition of two transformation spheres:
The first one, is able to convert a ruby into a 100 dollar bill.
The second one, is able to convert a diamond into a 100 dollar bill.

The second item the player is given, is a weird cardboard box, in which
two sides of the box have images, one has the image of a ruby, and the other
has the image of a diamond. On top of the box, there is a big red button.


The target wall, asks for a dollar bill.

The box may contain a ruby, or a diamond, but the player doesn't know which,
but the button may be used to open the box.

To solve this level, the player must first select the box, and click the button.
When this happens, the box will reveal its contents. However, doing such
has an interesting side effect: It splits the current universe into two,
creating two parallel universes.

When this happens, the player is able to select which of the parallel universes they wish to play,
and ideally, the game should inform the user of how they can open that parallel universe selection
menu again.

Let's say the player selects the first parallel universe, in which the box happened to contain a ruby.
Then, the player may use the early mentioned superposition, and turn that into a transformation
sphere that turns rubies into money, use such sphere with the ruby, and put the money in the target wall.

Then, the player might go back to the parallel universe selection menu,
to then select the other reality \[1\].

After the player does such, the box will have turned into a diamond instead, and the player does a
similar process: turn the superposition into a sphere from diamon to money, use the sphere with the
diamond, get the money, and use the money to clear the level.

Once the player has finished the level in all parallel universes, the level is finished. \[2\]


### Schrodinger Boxes Design Notes

\[1\]. The game should probably indicate in the PU selection menu that a reality has already been solved.

\[2\]. There should be some textual indication about the rule that the player must solve the level
in all parallel universes it creates.





## Relationship with Linear Logic

This is an introductory text to regular, and linear logic.

In normal logic, a formula is a mathematical value that represents some affirmation, they
usually involve symbols such as
- ∧: Known as conjunction, means "and",
- ∨: Known as disjunction, means "or"
- →: Known as implication, means "implies"
- ¬: Known as negation, and means "not",

So one can state something like "If it is (R)aining, then there will be (C)olds and (P)onds"
as "R → (C ∧ P)" (we use single-letter abreviations in math and logic).

However, in linear logic, formulas don't exactly represent affirmations, but instead,
they represent resources, and transformations.
Additionally, linear logic has a different and greater roster of symbols (yay).

So in our interpretation of linear logic, things like [Frying Pan Icon] and [Pillow Icon]
are formulas.

In regular logic, altough formulas represent affirmations, they are not claims
by themselves. This is specially true in linear logic, as formulas now represent objects,
and saying something like [Bucket Icon] doesn't really sound like a claim.

So in both logics, we have the concept of sequent. A sequent is a proper mathematical claim
about two (or more) formulas.
They are of form "A ⊢ B", (where A and B are formulas), and in linear logic, it means
that "It is possible to transform A into B".

In PuzzleWarp, every level is meant to represent a linear logic sequent, and the player,
by solving the level, is proves that such claim is true.



