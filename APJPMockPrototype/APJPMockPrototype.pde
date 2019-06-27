import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioInput in;
AudioRecorder recorder;
ArrayList<Action> actions;
ArrayList<Button> buttons;

int currentAction;

PGraphics actionBuffer;
PGraphics waveform;

String file = "file1.wav";

void setup() {
  size(512, 200, P2D);
  //printArray(PFont.list());
  textFont(createFont("Ubuntu Mono", 12));
  actionBuffer = createGraphics(width - 2, height - 22);
  waveform = createGraphics(64, 40);

  actions = loadActions("actions.txt");
  for (Action action : actions)
    if (action instanceof Notification)
      println(((Notification) action).text);
  
  buttons = new ArrayList<Button>();
  buttons.add(new Button(40, 40, 30, 15, "foo", new Call() {public void call() {println("pressed");}}));
  
  currentAction = 0;

  minim = new Minim(this);
  in = minim.getLineIn();

  recorder = minim.createRecorder(in, file);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(1);
  noFill();
  
  drawWaveform(in, width - 66 - 5, 0 + 5);
  drawRecordingStatus(recorder);
  text("Current file: " + file, 5, 27);
  text("Time since program started: " + millisToHHMMSS(millis()), 5, 39);
  text("Time left until 2 minutes have passed: " + millisToHHMMSS(1000 * 60 * 2 - millis()), 5, 51);
  
  //rect(0, 19, width - 1, height - 20);
  //Action curr = actions.get(currentAction);
  //curr.render();
  //image(curr.getBuffer(), 1, 21);
}
