int smx;
int smy;

void mousePressed() {
  smx = mouseX;
  smy = mouseY;  
}

void mouseReleased() {
  
}

interface Call {
  void call();
}

class Button {
  int x;
  int y;
  int w;
  int h;
  String text;
  Call call;
  PGraphics buffer;
  Button(int x, int y, int w, int h, String text, Call call) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.call = call;
    buffer = createGraphics(w - 2, h - 2);
    buffer.beginDraw();
    buffer.textFont(createFont("Ubuntu Mono", 12));
    buffer.endDraw();
  }
  void render() {
    buffer.beginDraw();
    buffer.background(0);
    buffer.text(text, 5, 12);
    buffer.endDraw();
  }
  PGraphics getBuffer() {
    return buffer;
  }
}

void toggleRecording(AudioRecorder recorder) {
  if (recorder.isRecording())
    recorder.endRecord();
  else
    recorder.beginRecord();
}

void togglePlaying(AudioPlayer player) {
  if (player.isPlaying())
    player.pause();
  else
    player.play();
}

void keyReleased() {
  switch (key) {
  case 'r':
    toggleRecording(recorder);
    break;
  case 's':
    recorder.save();
    println("Done saving.");
    break;
  case 'p':
    if (player == null)
      break;
    togglePlaying(player);
    break;
  case 'o':
    player = minim.loadFile(file);
    println("Done loading.");
    break;
  default:
    if ('0' <= key && key <= '9')
      selectFile(key);
    break;
  }
}

void selectFile(char fileNumber) {
  if (recorder != null && recorder.isRecording())
    recorder.endRecord();
  if (player != null && player.isPlaying())
    player.pause();
  file = "file" + fileNumber + ".wav";
  recorder = minim.createRecorder(in, file);
}
