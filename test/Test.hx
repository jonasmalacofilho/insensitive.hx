import utest.Assert in A;

class Test {
	function new() {}

	function test_001_indexOf()
	{
		A.equals(0, ("foobar":Insensitive).indexOf("foo"));
		A.equals(3, ("foobar":Insensitive).indexOf("bar"));
		A.equals(0, ("FOOBAR":Insensitive).indexOf("foo"));
		A.equals(3, ("FOOBAR":Insensitive).indexOf("bar"));
		A.equals(0, ("foobar":Insensitive).indexOf("FOO"));
		A.equals(3, ("foobar":Insensitive).indexOf("BAR"));

		A.equals(0, ("foofoobar":Insensitive).indexOf("FOO"));
		A.equals(3, ("fooBARbar":Insensitive).indexOf("bar"));

		A.equals(3, ("foofoobar":Insensitive).indexOf("FOO", 1));
		A.equals(6, ("foobarBAR":Insensitive).indexOf("bar", 4));

		A.equals(-1, ("foobar":Insensitive).indexOf("fooo"));
		A.equals(-1, ("foobar":Insensitive).indexOf("foobarr"));
	}

	function test_001_lastIndexOf()
	{
		A.equals(0, ("foobar":Insensitive).lastIndexOf("foo"));
		A.equals(3, ("foobar":Insensitive).lastIndexOf("bar"));
		A.equals(0, ("FOOBAR":Insensitive).lastIndexOf("foo"));
		A.equals(3, ("FOOBAR":Insensitive).lastIndexOf("bar"));
		A.equals(0, ("foobar":Insensitive).lastIndexOf("FOO"));
		A.equals(3, ("foobar":Insensitive).lastIndexOf("BAR"));

		A.equals(3, ("foofoobar":Insensitive).lastIndexOf("FOO"));
		A.equals(6, ("foobarBAR":Insensitive).lastIndexOf("bar"));

		A.equals(0, ("foofoobar":Insensitive).lastIndexOf("FOO", 2));
		A.equals(3, ("fooBARbar":Insensitive).lastIndexOf("bar", 5));

		A.equals(-1, ("foobar":Insensitive).lastIndexOf("fooo"));
		A.equals(-1, ("foobar":Insensitive).lastIndexOf("foobarr"));

		A.equals("foofoobar".lastIndexOf("foo", 2), ("foofoobar":Insensitive).lastIndexOf("FOO", 2));
		A.equals("foofoobar".lastIndexOf("foo", 3), ("foofoobar":Insensitive).lastIndexOf("FOO", 3));

		A.equals("foobarbar".lastIndexOf("bar", 5), ("foobarBAR":Insensitive).lastIndexOf("bar", 5));
		A.equals("foobarbar".lastIndexOf("bar", 6), ("foobarBAR":Insensitive).lastIndexOf("bar", 6));
	}

	static function main()
	{
		var r = new utest.Runner();
		r.addCase(new Test());
		utest.ui.Report.create(r);
		r.run();
	}
}

