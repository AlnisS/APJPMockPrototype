void drawWaveform(AudioInput in, int x, int y) {
  waveform.beginDraw();
  waveform.background(0);
  waveform.stroke(255);
  for (int i = 0; i < in.bufferSize() - 1; i++) {
    //            x1 y1                         x2     y2
    waveform.line(i, 10 + in.left.get(i)  * 10, i + 1, 10 + in.left.get(i + 1)  * 10);
    waveform.line(i, 30 + in.right.get(i) * 10, i + 1, 30 + in.right.get(i + 1) * 10);
  }
  waveform.endDraw();
  noFill();
  rect(x, y, 65, 41);
  image(waveform, x + 1, y + 1);
}

void drawRecordingStatus(AudioRecorder recorder) {
  if (recorder.isRecording())
    text("Currently recording...", 5, 15);
  else
    text("Not recording.", 5, 15);
}

String millisToHHMMSS(int millis) {
  millis /= 1000;
  String hh = padLeft(str(millis / 3600));
  millis %= 3600;
  String mm = padLeft(str(millis / 60));
  millis %= 60;
  String ss = padLeft(str(millis));
  return hh + ":" + mm + ":" + ss;
}

String padLeft(String input) {
  if (input.length() == 1)
    return "0" + input;
  return input;
}
