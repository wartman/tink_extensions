import utest.Test;

using tink.CoreApi;
using tink.ExtensionsApi;
using utest.Assert;

class TestAll extends Test {
  function testOutcomeExtensions() {
    function earlyReturn():Outcome<Int, String> {
      var outcome:Outcome<String, String> = Failure('expected');
      outcome.orReturn();
      return Success(1);
    }

    switch earlyReturn() {
      case Failure(failure):
        failure.equals('expected');
      case Success(_):
        Assert.fail('Should have returned a Failure');
    }
  }
}
