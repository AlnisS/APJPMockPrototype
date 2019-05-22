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
