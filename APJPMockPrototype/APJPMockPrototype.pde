import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioInput in;
AudioRecorder recorder;

String file = "file1.wav";

void setup() {
  size(512, 200, P3D);
  textFont(createFont("Arial", 12));

  minim = new Minim(this);
  in = minim.getLineIn();

  recorder = minim.createRecorder(in, file);
}

void draw() {
  background(0);
  stroke(255);
  drawWaveform(in);
  drawRecordingStatus(recorder);
  text("Current file: " + file, 5, 27);
}
