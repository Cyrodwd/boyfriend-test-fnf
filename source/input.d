module input;

import raylib;
import boyfriend : Animations;

// LOL I SUCK
struct Input {
  public:
    bool left;
    bool right;
    bool up;
    bool down;
    bool taunt;
    bool mute;

    void update() {
        left = IsKeyPressed(KeyboardKey.KEY_LEFT) || IsKeyPressed(KeyboardKey.KEY_A);
        right = IsKeyPressed(KeyboardKey.KEY_RIGHT) || IsKeyPressed(KeyboardKey.KEY_D);
        up = IsKeyPressed(KeyboardKey.KEY_UP) || IsKeyPressed(KeyboardKey.KEY_W);
        down = IsKeyPressed(KeyboardKey.KEY_DOWN) || IsKeyPressed(KeyboardKey.KEY_S);
        taunt = IsKeyPressed(KeyboardKey.KEY_SPACE);
        mute = IsKeyPressed(KeyboardKey.KEY_M);
    }

    Animations getAnimation() {
        if (left) return Animations.LEFT;
        if (right) return Animations.RIGHT;
        if (up) return Animations.UP;
        if (down) return Animations.DOWN;
        if (taunt) return Animations.TAUNT;
        return Animations.IDLE;
    }
}
