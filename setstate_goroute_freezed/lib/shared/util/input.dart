Map<String, InputControllerState> inputControllers = {};

class Input {
  // var photo = Input.get("photo");
  static get(String id) {
    return inputControllers[id]!.getValue();
  }
  // static set(String id) {}
}

class InputControllerState {
  setValue(value) {}
  getValue() {}
}
