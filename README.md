# Godot Experiments

Some experiments using the [Godot](https://godotengine.org/) game engine.

These are ports of my
[PyGame experiments](https://github.com/Taffer/pygame-experiments/) (which
started as ports of my
[Löve experiments](https://github.com/Taffer/love-experiments/) for now), we'll
see where this goes.

* [Experiment 01 - Scrolling Texture](#experiment01)

## Bribe me

Want to bribe me to work on more experiments, faster? Want to suggest an
experiment?

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/U7U541Y8C)

Always willing to entertain suggestions, but if you're asking me to do some
work, you have the option of fuelling it with coffee. ;-)

## Credits

These use the [Godot Engine](https://godotengine.org/).

## License

Stuff I wrote is released under the [MIT license](LICENSE.md), and any
resources are covered by their respective licenses (please see individual
experiment writeup for details). I'm only using open source and freely usable
third-party bits, but they might not be using MIT's license.

## <a name="experiment01">Experiment 01 - Scrolling Texture</a>

Old games used a technique to animate textures where they shifted the sprite one
row or column per frame. An easy/cheesy way to do this is to just produce a set
of sprites that are shifted already and treat them as individual frames.

I want to see if there's a way to do it without duplicating and modifying the
sprite. I'm thinking that ancient platforms (think Commodore C=64 or Apple ][)
wouldn't have the memory to waste for this sort of thing.

The goal is to do this with one draw call, by adjusting the texture.

![Experiment 1 - Scrolling Texture](experiment-1.png)

This is actually more complex in Godot than in PyGame or Löve2D; we have to
write a shader! Thank you Internet for answering this question.

### Graphics

* `character_robot_jump.png` - From Kenney.nl's freely usable
  [Toon Characters 1](https://kenney.nl/assets/toon-characters-1) collection.
