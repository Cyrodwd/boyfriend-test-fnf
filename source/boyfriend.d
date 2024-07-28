module boyfriend;

import raylib;
import input;
import sounds;
import std.string : toStringz;

enum Animations {
    IDLE,
    LEFT,
    UP,
    RIGHT,
    DOWN,
    TAUNT
}

enum int SPRITE_WIDTH = 415;
enum int SPRITE_HEIGHT = 428;

// CLAUDE AI DID THIS xD (just the animations dude)
struct AnimationInfo {
    int frameCount;
    float frameTime;
}

struct Boyfriend
{
private:
    Texture2D spritesheet;
    Animations currentAnimation;
    Rectangle srcRect, destRect;
    float animationTimer, idleTimer;
    int currentFrame;
    Input controls;
    Sounds sounds;
    string msgMuted;

    AnimationInfo[Animations] animationData;

public:
    this(Texture2D spritesheet) {
        this.spritesheet = spritesheet;
        currentAnimation = Animations.IDLE;
        controls = Input();
        sounds.setup();
        idleTimer = 0.0f;
        msgMuted = "UNMUTED";

        animationData[Animations.IDLE] = AnimationInfo(5, 0.1f);
        animationData[Animations.LEFT] = AnimationInfo(3, 0.05f);
        animationData[Animations.UP] = AnimationInfo(2, 0.05f);
        animationData[Animations.RIGHT] = AnimationInfo(2, 0.05f);
        animationData[Animations.DOWN] = AnimationInfo(2, 0.05f);
        animationData[Animations.TAUNT] = AnimationInfo(3, 0.1f);

        updateRectangles();
    }

    void setAnimation(Animations newAnimation) {
        if (currentAnimation != newAnimation) {
            currentAnimation = newAnimation;
            currentFrame = 0;
            animationTimer = 0;
            idleTimer = 0;
            updateRectangles();
        }
    }

    void update(float delta) {
        controls.update();
        sounds.update(controls);
        Animations newAnimation = controls.getAnimation();

        if (newAnimation != currentAnimation && newAnimation != Animations.IDLE) {
            setAnimation(newAnimation);
        }

        if (currentAnimation != Animations.IDLE) {
            idleTimer += delta;
            if (idleTimer >= 0.3f) {
                setAnimation(Animations.IDLE);
            }
        }

        animationTimer += delta;
        if (animationTimer >= animationData[currentAnimation].frameTime) {
            currentFrame = (currentFrame + 1) % animationData[currentAnimation].frameCount;
            animationTimer = 0;
            updateRectangles();
        }

        // Sound
        if (controls.mute) {
          sounds.mute();
        }

        msgMuted = (sounds.isMuted()) ? "MUTED" : "UNMUTED";
    }

    void draw() const {
        DrawTexturePro(spritesheet, srcRect, destRect, Vector2(0, 0), 0, Colors.WHITE);
        DrawText(TextFormat("Audio: %s", msgMuted.toStringz), 0, 0, 50, Colors.WHITE);
    }

    ~this() {
      sounds.unload();
    }

private:
    void updateRectangles() {
        int row = cast(int)currentAnimation;
        srcRect = Rectangle(
            currentFrame * SPRITE_WIDTH,
            row * SPRITE_HEIGHT,
            SPRITE_WIDTH,
            SPRITE_HEIGHT
        );
        destRect = Rectangle(
            GetScreenWidth() / 2 - 200,
            GetScreenHeight() / 2 - 200,
            SPRITE_WIDTH,
            SPRITE_HEIGHT
        );
    }
}
