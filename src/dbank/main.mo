import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));  

  stable var currentValue: Float = 300;
  currentValue:= 300;

  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
  // topUp();
  public func withdraw(amount:Float) {
    let temp: Float = currentValue - amount;
    if (temp >= 0) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    } else {
    Debug.print("Withdrawal amount exceeds wallet amount!, please reduce the amount");
    };
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 10000000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime:= currentTime;
  }
}

