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
