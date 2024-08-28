# The Swedish Compiler
This compiler is focusing on easy gui and databases. It’s support PostgreSQL, SqLite, Odbc. It is running under Linux too (wine). OpenGL support (only 64 bits version), easy printer layout (non gui) and serial communication (demo is coming).

##  Demo & test

Most of the program here is just for test/debug propose and display of the syntax (please don't laugh as most of it is nonsense).
As there is no documentation only a help program that reads out instructions and command from the program. There are 2 fully working program under my repositories so you can take a look on them too.


## Program
The 64 bit version is experimental and not fully debugged. 32 bits version has been used for a long time so it should be stabile. But I suppose when people trying to get things working they will pop up.
  
swe.exe     32 bit  Supports PostgreSQL, SqLite, Odbc
sweq.exe    32 bit  Supports only SqLite
swe64.exe   64 bit  Supports PostgreSQL, SqLite, Odbc, OpenGL

## md5sum

swe.exe     1f23ab1964b95dc1f0b73b3c22bd8942
sweq.exe    1355dc1533dad9febab18f38d1b34dfe
swe64.exe   1f97f87520f1f9eacd3bc7765d905f09

## Compiler

The compiler is based on the old Lex & Yacc. Those program solves the problem that most compilers have, that they doesn't handle Math correct.   

The result of this two calculation should be the same. 

‘’’
func main ()
  info ( 10 * 20 + 5 )
  info ( 5 + 10 * 20  )
end
‘’’

Source size is about 110000 lines.

