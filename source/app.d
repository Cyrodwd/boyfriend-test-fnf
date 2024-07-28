import raylib;
import background;
import boyfriend;

void main() {
	const uint screenWidth = 1280;
	const uint screenHeight = 720;
	InitWindow(screenWidth, screenHeight, "Boyfriend - Test");

	InitAudioDevice();

	Texture2D backgroundTexture = LoadTexture("assets/testBG.png");
	Texture2D playerTexture = LoadTexture("assets/bf.png");
	Image iconImage = LoadImage("assets/icon.png");
	Background background = Background(backgroundTexture);
	Boyfriend player = Boyfriend(playerTexture);
	SetWindowIcon(iconImage);

	SetTargetFPS(60);

	while (!WindowShouldClose()) {
		player.update(GetFrameTime());
		background.update(GetFrameTime());
		BeginDrawing();

		ClearBackground(Colors.WHITE);

		background.draw();
		player.draw();
		EndDrawing();
	}

	CloseAudioDevice();
	UnloadTexture(playerTexture);
	UnloadTexture(backgroundTexture);
	UnloadImage(iconImage);
	CloseWindow();
}