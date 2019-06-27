
ArrayList<Action> loadActions(String file) {
  String[] lines = loadStrings(file);
  ArrayList<Action> actions = new ArrayList<Action>();
  for (String s : lines) {
    String[] info = s.split("\t");
    Action action = null;
    switch (info[0]) {
    case "notification":
      action = new Notification();
      break;
    default:
      println("No such action: " + info[0]);
      break;
    }
    if (action != null)
      action.init(actionBuffer, info[2], info[1].equals("true"));
    actions.add(action);
  }
  return actions;
}


abstract class Action {
  
  abstract void init(PGraphics buffer, String args, boolean canGoBack);
  abstract void render();
  abstract PGraphics getBuffer();
  abstract void teardown();
  abstract boolean canGoBack();
  abstract boolean mustContinue();
  
}

class Notification extends Action {
  PGraphics buffer;
  String text;
  boolean canGoBack;
  void init(PGraphics buffer, String args, boolean canGoBack) {
    this.buffer = buffer;
    buffer.beginDraw();
    buffer.textFont(createFont("Ubuntu Mono", 12));
    buffer.endDraw();
    text = args;
    this.canGoBack = canGoBack;
  }
  void render() {
    buffer.beginDraw();
    buffer.background(0);
    buffer.fill(255);
    buffer.text(text, 5, 15);
    buffer.endDraw();
  }
  PGraphics getBuffer() {
    return buffer;
  }
  void teardown() {
  }
  boolean canGoBack() {
    return canGoBack;
  }
  boolean mustContinue() {
    return false;
  }
}
