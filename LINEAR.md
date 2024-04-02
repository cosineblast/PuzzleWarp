
# Logic and PuzzleWarp
## Regular and Linear Logic


This is an interpretation of regular and linear logic.

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

## My Interpretation of Linear Logic Formula Connectives
- A × B

This is known as "multiplicative conjunction", and simply means to have both an object A, and
a object B. e.g To have a frying pan and a pillow.

- A & B

This is known as "additive conjunction", and represents the superposition of an A and a B.
You can turn it into an A, or into a B, at your choice, but then it disapears.

- A ⊸ B

This is known as "linear implication", and represents the transformation orb, an object that is able
to transform an A into a B, but once it does that, both the A object, and the transformation object
itself is gone.

In linear logic, however, this is usually not a special object, but instead, a particular case
of antimatter/negation (¬) and possibility spheres/multiplicative disjunction (⅋).

It should also be possible to "imagine" these, but I will introduce this concept in the future.

- 1
This is a value you can just come with at any time, and get rid of at any time. In this game,
it's like a bubble that you can create many of at will, and burst at will.

- 0
Not implemented in the game. This value is effectivelly the superposition of all possible things.
This means you can turn 0 into absolutely anything you want. Including (0 × AnotherThing),
which means you can also turn 0 into any quantity of anything, and even get rid of 0 itself, by
turning it into a 1. In summary, getting your hands in a zero means you can effectivelly solve
the problem for free.

- A + B

This is known as "additive disjunction", and represents an object that may be an A, may be a B,
but you don't really know which. However, you are allowed to inspect which one it is, but in order to
be able to do something useful with that, you must be able to handle both cases.
In essence, inspecting it splits the world into two parallel universes, one that has an A,
and one that has a B, and you must be able to do things in both parallel universes for things to be valid.

Additionally, it should be possible to turn put any A into A + B. In other words, if you have
a (C)andy bar, you should be able to put into a +, and turn it into a box that may either
have a candy bar, or a (B) bucket, in other words, C ⊢ C + B should be true in general,
for any resources C and B.

- ⊤
Not implemented in the game.
This value represents the additive disjunction (+) of all possible things.
In other words, you can turn anything into a ⊤, but in order to do something useful with it,
you would need to deal with infinitely many alternate realities, which in practice, requires
you to have a 0 in order to deal with so many possibilities. Easy to get, impossibly difficult to use.


- ¬ A
Not implemented in the game.

This is known as negation, but I like to think of it as "antimatter", an anti bottle, a ¬ Bottle,
looks like a bottle, but visually distinct. An important property of negation, is that it is
involutive, which means that an anti-anti-bottle is the same as a regular bottle.
When you put an anti A next to an A, you may turn that into a ⊥ (to be introduced soon).

Interesting facts: anti-1 is ⊥, anti-⊤ is 0.

- ⊥
Not implemented in the game.

Known as bottom, this is the anti-bubble.
This is not a particularly interesting value by itself. You cannot get it out of thin air,
you cannot get rid of it at will, and you cannot turn it into anything particularly by itself.
Its utility lies entirely with regard to it being the result interactions with negation/anti-matter,
and the fact that it can destroy "possibilities" of possibility spheres (multiplicative disjunction).

- A ⅋ B aka  A | B
Not implemented in the game.

This is known as "multiplicative disjunction". This is complex. Really complex.
When you have A | B, you have an object that contains both A and B, and you look
visualize both of them. Imagine a large sphere, that has two semi-sphere sections,
each of those sections containing an object, one having an A, and the other having a B.

You can put your hands inside the sections of the sphere, and you can interact witht the object inside it,
but you cannot take the object from inside the section, nor move it from one side to the other.

Each section of the sphere might contain more than one object.
You can also put objects from outside the sphere into the sections of the sphere, making it larger,
but that is usually not advisable, since taking them back is difficult.

You can interact with objects inside individual sections of the sphere. For instance,
if a section has a transformation sphere from money into candy, and there is money inside that section,
you can put your hands inside the sphere and turn those into money. In other words, you can still do
things inside one side of the sphere.
In other words, ((A × (A ⊸ B)) | C) ⊢ (B | C)

It is also important to note, that the sphere does not allow you to burst a bubble inside of a section of the sphere,
if that bubble is the only thing inside that section of the sphere.

The most interesting thing about this sphere, however, is the fact that if there is a singular ⊥ (anti-bubble)
inside of a section of the sphere, you can use that bottom to destroy that section of the sphere.

In other words, you (A | ⊥) ⊢ A.

One should also be possible to create these orbs by turning an A into an (A | ⊥).

Phew.

That's it, those are the mechanics of the multiplicative disjunction, which i name "possibility orb".

An interesting characteristic of possibility orbs, is that transformation orbs are technically just
possibility orbs. If you have an A ⊸ B, what you actually have is a (¬A | B), a
possibility orb that has an anti-A and a B. If you have an A, you can put the A inside the side of the
sphere that has the anti-A. Then, you take both and turn that into a ⊥, and you get (⊥ | B),
well, that's just B.

This has other implications, which I will not delve into within this document.


