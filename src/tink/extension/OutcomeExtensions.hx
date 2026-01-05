package tink.extension;

import tink.core.Outcome;

class OutcomeExtensions {
  public static macro function orReturn<T, E>(expr:haxe.macro.Expr.ExprOf<tink.core.Outcome<T, E>>) {
    return macro @:pos(expr.pos) switch ${expr} {
      case Success(value): value;
      case Failure(error): return tink.core.Outcome.Failure(error);
    }
  }

  public static function inspect<Data, Failure>(outcome:Outcome<Data, Failure>, handler:(data:Data) -> Void) {
    switch outcome {
      case Success(data): handler(data);
      case Failure(_):
    }
    return outcome;
  }

  public static function inspectFailure<Data, Failure>(outcome:Outcome<Data, Failure>, handler:(failure:Failure) -> Void) {
    switch outcome {
      case Success(_): 
      case Failure(failure): handler(failure);
    }
    return outcome;
  }

	public static function always<Data, Failure>(outcome:Outcome<Data, Failure>, handler:() -> Void) {
		handler();
		return outcome;
	}
}
