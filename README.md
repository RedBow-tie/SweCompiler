# The Swedish Compiler
This compiler is focusing on easy gui and databases. It’s support PostgreSQL, MariaDB, SqLite, Odbc. It is running under Linux too (wine). OpenGL support (only 64 bits version), easy printer layout (non gui) and serial communication (demo is coming). I've been used it for a long time so it should be stabile (32 bits ver).

Sorry no source available (yet). A little affirmation this program doesn’t contain any call home code or any ads.

##  Demo & test

Most of the program here is just for test/debug propose and display of the syntax (please don't laugh as most of it is nonsense).
As there is no documentation only a help program that reads out instructions and command from the program. There are 2 fully working program under my repositories so you can take a look on them too.


## Program

The 64 bit version is experimental and not fully debugged. 32 bits version has been used for a long time so it should be stabile. But I suppose when people trying to get things working they will pop up.
  
| Program | Bits | Supports |
| --- | --- | --- |
| swe.exe    | 32 | PostgreSQL, MariaDB, SqLite, Odbc         |
| sweq.exe   | 32 | Only SqLite                      |
| swe64.exe  | 64 | PostgreSQL, MariaDB, SqLite, Odbc, OpenGL |

## md5sum

| Program | md5sum |
| --- | --- |
| swe.exe    | e755c9981c86f0e6f6eb80680e1eb846 |
| sweq.exe   | 469c08ef7ea11489983defae8ebe2e56 |
| swe64.exe  | e5678f2614d48bc38bb107d87718ee1b |

## Compiler

The compiler is based on the old Lex & Yacc. Those program solves the problem that most compilers have, that they doesn't handle Math correct.   

The result of this two calculation should be the same. 

```
func main ()
  info ( 10 * 20 + 5 )
  info ( 5 + 10 * 20  )
end
```

Source size is about 110 000 lines.

As widgets id’s is created automatic (no #define needed) so can a syntax error down in the program results in allot of errors at the beginning. So the first error in the list doesn’t actually be an error. Only just a result of a missing creation of a widget id. The compiler is a two pass compiler.

## Editor

In the demo there is an embryo to a IDE, but it’s not complete.
So I’m using the [SciTE](https://scintilla.org/SciTE.html) editor (this editor is also the base for my IDE). 
For an easy use of this Compiler, do this:

Download SciTE editor. Open the cpp.properties (under options).
Change line 4 to: file.patterns.cpp=*.sw;*.c;*.cc;*.cpp;*.cxx;*.h;*.hh;*.hpp;*.hxx;*.ipp;*.m;*.mm;*.sma

Add this to the end:
```
command.compile.*.sw=E:\SweCompiler-main\swe.exe $(FileNameExt)
command.build.*.sw=E:\SweCompiler-main\64\swe64.exe $(FileNameExt)
command.go.*.sw=E:\SweCompiler-main\sweq.exe $(FileNameExt)
```

| Keys | Program |
| --- | --- |
| ctrl-F7 | swe.exe |
| F7 | swe64.exe    |
| F5 | sweq.exe     |


