# Godot's Dribble

## Color palette

- `#abbda9` light pixel

- `#1a2c16` dark pixel

## Project settings

- window size 5 times `97*71` pixels to match the dimensions of the art

- default texture filter **nearest** to maintain crisp pixels

## Screen notes

### Title

<!-- should be the main screen -->

Instead of adding a static sprite for the ball and animating the horizontal/vertical movement with a step function I preferred to create the frames of the animation ahead of time and using an `AnimatedSprite2D` node.

With this setup you need only to move the animate sprite(s) up and down to align the pointers to the next drawn behind.

Missing:

- a way to move to the play screen or ranking screen

### Score

The screen is meant to describe the result of the race. It follows the play screen and _might_ lead to the ranking screen if the score surpasses one of the three recorded measures.

Instead of using text I managed to use the sprites in the `assets/art/scores` folder, updating the texture of the nodes as orderly arranged in the `Score` container. Strip the decimal point to avoid targeting the last node.

Missing:

- art _above_ the score

- a way to receive and pass the score's value

### Ranking

The screen needs to accommodate for multiple scenarios:

- when you go from title to ranking you show the records

  Starting out there are no records, and all slots are filled with the same default `--.---`. Importantly, all slots are also marked with the same `1st` label. As scores are recorded (and these are smaller than the measure describing 60 seconds), these fill the list one after the other. Empty slots do not increase the label on the left.

- when you go from score to ranking, you do so only if your score is better than one of the recorded one, and you are shown where you rank

  In this instance the incoming score is evaluated and slotted in the right place, possibly updating the list by moving down existing values/filling the partial list.

  In this instance there should also be an animation with the incoming score sliding in from the right.