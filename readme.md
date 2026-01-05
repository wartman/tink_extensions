# Tink Extensions

A few little extensions for [Tink](https://github.com/haxetink/tink_core).

## Usage

Use with `using tink.ExtensionsApi`.

```haxe
using tink.CoreApi;
using tink.ExtensionsApi;

function someMethod():Outcome<String, Error> {
  var outcome:Outcome<String, Error> = Failure(new Error(NotFound, 'something not found'));
  var str:String = outcome.orReturn(); // A macro that will immediately return.
  trace(str);
  return Success(str);
}
```
