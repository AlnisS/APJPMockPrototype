import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioInput in;
AudioRecorder recorder;

void setup() {
  size(512, 200, P3D);
  textFont(createFont("Arial", 12));

  minim = new Minim(this);
  in = minim.getLineIn();

  recorder = minim.createRecorder(in, "file.wav");
}

void draw() {
  background(0);
  stroke(255);
  drawWaveform(in);
  drawRecordingStatus(recorder);
}

void drawWaveform(AudioInput in) {
  for (int i = 0; i < in.bufferSize() - 1; i++) {
    //   x1 y1                          x2     y2
    line(i, 50  + in.left.get(i)  * 50, i + 1, 50  + in.left.get(i+1)  * 50);
    line(i, 150 + in.right.get(i) * 50, i + 1, 150 + in.right.get(i+1) * 50);
  }
}

void drawRecordingStatus(AudioRecorder recorder) {
  if (recorder.isRecording())
    text("Currently recording...", 5, 15);
  else
    text("Not recording.", 5, 15);
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
    player = minim.loadFile("file.wav");
    println("Done loading.");
    break;
  default:
    break;
  }
}
