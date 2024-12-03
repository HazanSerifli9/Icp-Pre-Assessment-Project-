import Array "mo:base/Array";
import Int "mo:base/Int";



actor Calculator {
  var memory: Int = 0;
  var log: [Text] = [];

  // Addition
  public func add(value: Int): async Int {
    memory += value;
    log := Array.append(log, ["Added " # Int.toText(value) # ". Result: " # Int.toText(memory)]);
    memory;
  };

  // Subtraction
  public func subtract(value: Int): async Int {
    memory -= value;
    log := Array.append(log, ["Subtracted " # Int.toText(value) # ". Result: " # Int.toText(memory)]);
    memory;
  };

  // Multiplication
  public func multiply(value: Int): async Int {
    memory *= value;
    log := Array.append(log, ["Multiplied by " # Int.toText(value) # ". Result: " # Int.toText(memory)]);
    memory;
  };

  // Division
  public func divide(value: Int): async ?Int {
    if (value == 0) {
      log := Array.append(log, ["Division by zero attempted. Operation failed."]);
      return null;
    } else {
      memory /= value;
      log := Array.append(log, ["Divided by " # Int.toText(value) # ". Result: " # Int.toText(memory)]);
      return ?memory;
    }
  };

  // Reset to zero
  public func reset(): async () {
    memory := 0;
    log := Array.append(log, ["Memory reset to 0."]);
  };

  // Reset to a specific value
  public func resetTo(value: Int): async () {
    memory := value;
    log := Array.append(log, ["Memory reset to " # Int.toText(value) # "."]);
  };

  // Get current memory
  public query func getMemory(): async Int {
    memory;
  };

  // Get operation log
  public query func getLog(): async [Text] {
    log;
  };

  // Clear operation log
  public func clearLog(): async () {
    log := [];
  };
};
