module sounds;

import raylib;
import input;
import std.string : toStringz;

// DAMN
struct Sounds {
private:
  Sound beep, bop, bah, dah, taunt;
  bool muted;

  void stopAll() {
    StopSound(beep);
    StopSound(bop);
    StopSound(bah);
    StopSound(dah);
    StopSound(taunt);
  }

public:
  void setup() {
    beep = LoadSound("assets/sounds/beep.ogg");
    bop = LoadSound("assets/sounds/bop.ogg");
    bah = LoadSound("assets/sounds/bah.ogg");
    dah = LoadSound("assets/sounds/dah.ogg");
    taunt = LoadSound("assets/sounds/taunt.ogg");
    muted = false;
  }

  void update(Input input) {
    if (muted)
      return;

    if (input.left) {
      stopAll();
      PlaySound(dah);
    }

    if (input.down) {
      stopAll();
      PlaySound(bop);
    }
    
    if (input.right) {
      stopAll();
      PlaySound(beep);
    }
    
    if (input.up) {
      stopAll();
      PlaySound(bah);
    }
    
    if (input.taunt) {
      stopAll();
      PlaySound(taunt);
    }
  }

  void mute() {
    muted = !muted;
  }

  bool isMuted() {
    return muted;
  }

  void unload() {
    UnloadSound(beep);
    UnloadSound(bop);
    UnloadSound(bah);
    UnloadSound(dah);
    UnloadSound(taunt);
  }
}
