# Boyfriend-Test-FNF

This project is not affiliated with the developers of Friday Night Funkin'. It is strongly inspired by Boyfriend test, I just tried to do it with Raylib.

Warnings:
- The sprites may shake a bit.
- The BF sounds are taken from the original Boyfriend test (at Itch io you can check the original project).
- The sprites do NOT belong to me, they are made by PhantomArcade and evilsk8r (if I'm not wrong).

I only added the following:
- Sounds that can be muted
- A BF that can play “animations” depending on the direction and a taunt.
- A background that changes color randomly.

Created with [D](https://dlang.org/) and [Raylib](https://www.raylib.com/index.html). I really like Raylib ._.

The spritesheet was made manually with GIMP lol.
Well, enjoy it if you want to ¯\_(°-°)_/¯

## Build

In your terminal/cmd:

First, on Windows to get the .dll of the library, type:
```bash
dub run raylib-d:install
```

Now, you can build it:

```bash
dub build --build=release
```

Basically that's all
