using StringTools;

abstract Insensitive(String) from String {
	inline function tolower(i:Int)
		return i | 32;

	inline function imatch(a:Int, b:Int)
		return tolower(a) == tolower(b);

	public function indexOf(str:Insensitive, startIndex=0):Int
	{
		var str = str.toString();
		var alen = this.length;
		var blen = str.length;
		var i = startIndex;
		while (i + blen - 1 < alen) {
			var j = 0;
			while (j < blen && imatch(this.fastCodeAt(i + j), str.fastCodeAt(j)))
				j++;
			if (j == blen) return i;
			i++;
		}
		return -1;
	}

	public function lastIndexOf(str:Insensitive, ?startIndex=-1):Int
	{
		var str = str.toString();
		var alen = this.length;
		var blen = str.length;
		var i = startIndex == -1 ? alen - blen : startIndex;
		while (i >= 0) {
			var j = 0;
			while (j < blen && imatch(this.fastCodeAt(i + j), str.fastCodeAt(j)))
				j++;
			if (j == blen) return i;
			i--;
		}
		return -1;
	}

	@:to public inline function toString()
		return this;
}

