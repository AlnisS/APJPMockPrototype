import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioInput in;
AudioRecorder recorder;

PGraphics waveform;

String file = "file1.wav";

void setup() {
  size(512, 200, P2D);
  //printArray(PFont.list());
  textFont(createFont("Ubuntu Mono", 12));
  waveform = createGraphics(64, 40);

  minim = new Minim(this);
  in = minim.getLineIn();

  recorder = minim.createRecorder(in, file);
}

void draw() {
  background(0);
  stroke(255);
  drawWaveform(in, width - 66 - 5, 0 + 5);
  drawRecordingStatus(recorder);
  text("Current file: " + file, 5, 27);
  text("Time since program started: " + millisToHHMMSS(millis()), 5, 39);
  text("Time left until 2 minutes have passed: " + millisToHHMMSS(1000 * 60 * 2 - millis()), 5, 51);
}
