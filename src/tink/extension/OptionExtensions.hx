package tink.extension;

import tink.core.Option;

class OptionExtensions {
	public static function toOption<T>(value:Null<T>):Option<T> {
		return switch value {
			case null: None;
			case value: Some(value);
		}
	}
}
