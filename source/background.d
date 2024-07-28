module background;

import raylib;
import std.random : uniform;

// Alright, this is the most decent code in this project lol
struct Background {
private:
  Texture2D texture;
  Color color;
  float timer;
  const float COLOR_CHANGE_INTERVAL = 3.0f;
public:
  this(Texture2D texture) {
    this.texture = texture;
    color = Colors.WHITE;
    timer = COLOR_CHANGE_INTERVAL;
  }

  void update(float delta) {
    timer -= delta;

    if (timer <= 0) {
      // Change color every 5 seconds
      color = Color(
        cast(ubyte)uniform(0, 256),
        cast(ubyte)uniform(0, 256),
        cast(ubyte)uniform(0, 256),
        255
      );
      timer = COLOR_CHANGE_INTERVAL; // Reset timer
    }
  }

  void draw() const {
    DrawTexture(texture, 0, 0, color);
  }
}
