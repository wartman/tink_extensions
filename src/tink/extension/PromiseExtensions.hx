package tink.extension;

import tink.core.Error;
import tink.core.Promise;

using tink.extension.OutcomeExtensions;

class PromiseExtensions {
  public static function inspect<Data>(promise:Promise<Data>, inspector:(data:Data)->Void) {
    return promise.flatMap(outcome -> {
      outcome.inspect(inspector);
      outcome;
    });
  }

  public static function inspectFailure<Data>(promise:Promise<Data>, inspector:(error:Error)->Void) {
    return promise.flatMap(outcome -> {
      outcome.inspectFailure(inspector);
      outcome;
    });
  }
}
