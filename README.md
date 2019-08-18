# Turbo-Pascal
 
Turbo Pascal is a software development system that includes a compiler and an integrated development environment (IDE) for the Pascal programming language running on CP/M, CP/M-86, and DOS. It was originally developed by Anders Hejlsberg at Borland, and was notable for its extremely fast compiling times. Turbo Pascal, and the later but similar Turbo C, made Borland a leader in PC-based development.

For versions 6 and 7 (last), both a lower-priced Turbo Pascal and more expensive Borland Pascal were produced; Borland Pascal was more oriented towards professional software development, with more libraries and standard library source code. The name Borland Pascal is also used more generically for Borland's dialect of the Pascal programming language, significantly different from Standard Pascal.

Borland has released three old versions of Turbo Pascal free of charge because of their historical interest: the original Turbo Pascal (now known as 1.0), and versions 3.02 and 5.5 for DOS.[2][3][4]

Motivation and release
Philippe Kahn first saw an opportunity for Borland, his newly formed software company, in the field of programming tools. Historically, the vast majority of programmers saw their workflow in terms of the edit/compile/link cycle, with separate tools dedicated to each task. Programmers wrote source code using a text editor; the source code was then compiled into object code (often requiring multiple passes), and a linker combined object code with runtime libraries to produce an executable program.

In the early IBM PC market (1981–1983) the major programming tool vendors all made compilers that worked in a similar fashion. For example, the Microsoft Pascal system consisted of two compiler passes and a final linking pass (which could take minutes on systems with only floppy disks for secondary storage, although programs were very much smaller than they are today). This process was less resource-intensive than the later integrated development environment (IDE). Vendors of software development tools aimed their products at professional developers, and the price for these basic tools plus ancillary tools like profilers ran into the hundreds of dollars.

Kahn's idea was to package all these functions in an integrated programming toolkit designed to have much better performance and resource utilisation than the usual professional development tools, and charge a low price for a package integrating a custom text editor, compiler, and all functionality need to produce executable programs. The program was sold by direct mail order for $49.95, without going through established sales channels (retailers or resellers).

Unlike some other development tools, Turbo Pascal disks had no copy protection. Turbo Pascal came with the "Book License": "You must treat this software just like a book ... [it] may be used by any number of people ... may be freely moved from one computer location to another, so long as there is no possibility of it being used at one location while it's being used at another."[5]

Reception
Jerry Pournelle of Byte magazine wrote in February 1984 that Turbo Pascal "comes close to what I think the computer industry is headed for: well documented, standard, plenty of good features, and a reasonable price". Pournelle disliked the requirement to buy another license to distribute binaries, but noted that "it turns out not to be a lot more. Borland only wants another $100" more than the $49.95 base price, and that "my first impression of Turbo is that it's probably worth $149.95. It looks to do everything MT+ with the Speed Programming Package does, and maybe even do it faster and better".[6] He reported in July that, according to Kahn, IBM had refused to resell Turbo Pascal unless the price was at least $200; Pournelle noted that "Turbo is much better than the Pascal IBM sells", and unlike the latter was compatible with the IBM PCjr.[7] Three Byte reviewers praised Turbo Pascal in the same issue. One called the DOS version "without doubt, the best software value I have ever purchased", and another called the CP/M version "an excellent product ... [Borland] deserves praise for this high-value product". The third stated that it was "not a good compiler for developing massive applications", but added that it was greatly superior to BASIC, the programming language usually associated with home computers at the time. He concluded that Turbo Pascal was "a bargain that shouldn't be passed up".[8]

Despite finding what it described as "a serious bug" in version 3.0, and decreased compatibility with PC clones, the magazine in February 1986 stated that "it is hard to avoid recommending Turbo to anyone who wants to program in Pascal", citing improved speed and graphic routines.[9] When reviewing four other Pascal compilers in December 1986, Byte described Turbo Pascal as "practical and attractive to programmers at all levels of expertise".[10] Bruce Webster also praised the language in the magazine, stating in August 1985 that Turbo Pascal "is best known for its small size, incredible compile speeds, and fast execution times". He noted that the software's quality and low price had been especially surprising after the "JRT Pascal fiasco", and stated that even at the new higher $69.95 price, version 3.0 was "probably still the best software deal on the market".[11]

PC Magazine was similarly complimentary in November 1984, stating that "nothing like Turbo Pascal has ever existed for PC-DOS before". It praised the software's low price, speed, unusually good documentation for a compiler, and noted the existence of many utilities from other companies that hoped to benefit from Turbo Pascal's popularity. The review stated that the IDE that simplified the edit-compile-run-debug loop made Turbo Pascal accessible to new programmers like BASIC.[12]

Byte in 1989 listed Turbo C and Turbo Pascal as among the "Distinction" winners of the Byte Awards. Citing their user interface and continued emphasis on speed, the magazine stated that "for rapid prototyping there's not much better".[13] In the same issue Pournelle again praised version 4.0 and 5.0 of Turbo Pascal. Citing Anacreon as "a good example of how complex a program you can write in Pascal", and the many libraries available from Borland and other developers, he wrote, "I am more and more convinced that Turbo Pascal is the programming language of choice for people who are more interested in what they want the machine to do than in how to make that happen. Turbo Pascal may be neither as elegant nor as portable as C, but it's sure less obscure. I think it may well be the language for the rest of us".[14]

Borland sold about 250,000 copies of Turbo Pascal in two years, which Webster described as "an amazing figure for a computer language".[11] He reported six months later that the figure had risen to "more than 400,000 copies in a marketplace that had been estimated as having only 30,000 potential buyers".[15]

Versions
CP/M and DOS versions
Version 1

Turbo Pascal 3.0 manual front cover
The Turbo Pascal compiler was based on the Blue Label Pascal compiler originally produced for the NasSys cassette-based operating system of the Nascom microcomputer in 1981 by Anders Hejlsberg. Borland licensed Hejlsberg's "PolyPascal" compiler core (Poly Data was the name of Hejlsberg's company in Denmark), and added the user interface and editor. Anders Hejlsberg joined the company as an employee and was the architect for all versions of the Turbo Pascal compiler and the first three versions of Borland Delphi.[2]

The compiler was first released as Compas Pascal for CP/M, and then released on November 20, 1983 as Turbo Pascal for CP/M (including the Apple II computer when fitted with a Z-80 SoftCard, effectively converting the 6502-based Apple into a CP/M machine, the Commodore 64 with CP/M cartridge, and the later DEC Rainbow), CP/M-86, and DOS machines. On its launch in the United States market, Turbo Pascal retailed for USD49.99, a very low price for a compiler at the time. The integrated Pascal compiler was of good quality compared to other Pascal products of the time.[16]

The Turbo name alluded to the speed of compilation and of the executables produced. The edit/compile/run cycle was fast compared to other Pascal implementations because everything related to building the program was stored in RAM, and because it was a one-pass compiler written in assembly language. Compilation was much faster than compilers for other languages (even Borland's own later compilers for C),[citation needed] and other Pascal compilers, and programmer time was also saved since the program could be compiled and run from the IDE. The execution speed of these COM-format programs was a revelation for developers whose only prior experience programming microcomputers was with interpreted BASIC or UCSD Pascal, which compiled to p-code which was then interpreted at runtime.

There were different versions of Turbo Pascal for computers running DOS, CP/M, or CP/M-86 with 64 KB of memory and at least one floppy disk drive. The CP/M version could run on the many CP/M machines of the time with 8080 or Z80 processors, or an Apple ][ with Z80 card. The DOS and CP/M-86 versions ran on the many 8086 and 8088 machines which became available, including the IBM PC. The installer, lister, and compiler with its IDE, and the source code for a simple spreadsheet program called MicroCalc written by Philippe Kahn as a demonstration, would fit on a single floppy disc. A disc copy without MicroCalc would accommodate the source code and compiled executable of a reasonable-sized program—as it was common at the time for users to have only a single floppy drive as mass storage, it was a great convenience to be able to fit both the compiler and the program being written on a single disc, avoiding endless disc swapping.

Bill Gates saw the success of Turbo Pascal "in very personal terms, and 'couldn't understand why [Microsoft's] stuff was so slow. He would bring in poor Greg Whitten [programming director of Microsoft languages] and yell at him for half an hour.' He couldn't understand why Kahn had been able to beat an established competitor like Microsoft."[17]

At the time 8080/Z80/8088/8086 machines had limited computing resources. In particular RAM was expensive. The architecture of the various machines running DOS additionally limited the maximum to under 1 MB (e.g., machines hardware-compatible with the IBM PC were limited to 640 KB), although nothing approaching this limit was affordable for most users.

The TP IDE was very advanced for its day. It was able to perform well and compile very fast with the amount of RAM on a typical home computer. The IDE was simple and intuitive to use, and had a well-organized system of menus. Early versions of the editor used WordStar key functions, which was the de facto standard at the time. Later versions of the IDE, designed for PCs with more disk space and memory, could display the definitions of the keywords of the language by putting the cursor over a keyword and pressing the F1 key (conventionally used to display help). Many definitions included example code.

In addition to standard executable programs, the compiler could generate Terminate and Stay Resident (TSR) programs, small utilities that stayed in memory and let the computer do other tasks—running several programs at the same time, multitasking, was not otherwise available. Borland itself produced a small application suite called Sidekick that was a TSR letting the user keep a diary, notes, and so forth.

Versions 2–3
Versions 2 and 3 were incremental improvements to the original Turbo Pascal, a basic all-in-one system, working in memory and producing .COM executable files for DOS and CP/M, and equivalent .CMD executables for CP/M-86 (totally different from .CMD batch files later used in 32-bit Microsoft Windows).[3] Source code files were limited to 64 KB to simplify the IDE, and DOS .COM files were limited to 64 KB each of code, stack and global (static) variables. Program source code could be extended by the use of Included files, and the .COM programs could be overlaid,[18] effectively using virtual memory if they would not otherwise fit in memory.

Versions 4
Released in 1987, it was a total rewrite, with both look and feel and internal operation much changed; versions 5 to 7 were incremental improvements and expansions. The compiler generated executables in .EXE format under DOS, rather than the simpler but more restricted .COM executables. The by-then-obsolete CP/M and CP/M-86 operating system versions were dropped when TP was rewritten. Version 4 introduced units, and a full-screen text user interface with pull-down menus; earlier versions had a text-based menu screen and a separate full-screen editor. (Microsoft Windows was still very experimental when the first version was released, and even mice were rare.)

Version 5.0
Colour displays were replacing monochrome; TP version 5.0 introduced the Borland blue screen, used by Borland's DOS compilers until the end of this product line in the mid-1990s.

Later versions came in two packages with the same version number: a less expensive "Turbo" package, and a "Borland" package with enhanced capabilities and more add-ons.

Version 5.5
This version introduced object oriented programming features for the Pascal language, including concept of classes, static and dynamic objects, constructors and destructors and inheritance, which would become the basis for the Object Pascal found in Borland Delphi. The IDE uses the default blue colour scheme that would also be used on later Borland Turbo products. Other changes to IDE include:[19]

Addition of step-by-step debugger to IDE.
Context-sensitive help with description of all built-in functions, and the ability to copying code fragments from help to edit window.
Version 6.0
Changes from 5.5 includes:[20]

Addition of inline assembly language feature for Pascal language.
Addition of Turbo Vision library.
Changes to IDE includes mouse support, clipboard for text manipulations, multiple document interface supporting up to nine edit windows.
Debugger supports usage of breakpoints and watches.
Version 7.0
Changes from 6.0 includes:[21]

Compiler supports creation of DOS and Windows executables, Windows DLL.
Changes to IDE includes addition of syntax highlighting.
Turbo Pascal for Windows
Two versions named "Turbo Pascal for Windows" (TPW), for Windows 3.x, were released: TPW 1.0, based on Turbo Pascal 6 but released about 2 years later, and 1.5, released after Turbo Pascal 7; they were succeeded by Borland Pascal 7, which had Windows support. The Windows compiler in Pascal 7 was titled Borland Pascal for Windows.

Both versions built Windows-compatible programs, and featured a Windows-based IDE, as opposed to the DOS-based IDE in Turbo Pascal. The IDE and editor commands conformed to the Microsoft Windows user interface guidelines instead of the classic TP user interface. The support for Windows programs required the ObjectWindows library, similar but not identical to that for the first release of Borland C++, and radically different from the earlier DOS Turbo Vision environment. Turbo Pascal was superseded for the Windows platform by Delphi; the Delphi compiler can produce console programs in addition to GUI applications, so that the use of Turbo and Borland Pascal became unnecessary.

Turbo Pascal for Macintosh
Borland released Turbo Pascal for Macintosh in 1985. Much like versions 1 to 3 for other operating systems, it was written in compact assembly language and had a very powerful IDE, but no good debugger. Borland did not support this product very well, although they issued a version 1.1, patched to run on the 32-bit Macintosh II. Macintosh support was dropped soon after.

Freeware releases
Borland released several versions of Turbo Pascal as freeware after they became "antique software" (abandonware)[22], with 1.0 for DOS on 1 February 2000, 3.02 on 10 February 2000, 5.5 on 21 February 2002, Turbo Pascal 7.01 French version in year 2000.[23] Most of the downloads are still available on the successor website of Embarcadero Technologies.[2][3][4]

Successors
By 1995 Borland had dropped Turbo/Borland Pascal and replaced it with the rapid application development (RAD) environment Borland Delphi, based on Object Pascal. The 32- and 64-bit Delphi versions still support the more portable Pascal enhancements of the earlier products (i.e. those that are not specific to 16-bit code) including the earlier static object model. This language backwards compatibility means much old Turbo Pascal code can still be compiled and run in a modern environment today.

Other suppliers have produced software development tools compatible with Turbo Pascal. The best-known are Free Pascal and Virtual Pascal.

In education
Borland Pascal is still taught in some countries at secondary, sixth form and university levels.[when?] It is taught at colleges and universities in Costa Rica, Turkey, Germany, Russian Federation, USA, Malta and at secondary schools in Argentina, Belgium, Bulgaria, Canada, Costa Rica, Croatia, France, Italy, Jamaica, Libya, Moldova, Romania, Serbia, Tunisia, Ukraine, Czech republic and Vietnam.[citation needed] It was the state-approved educational programming language for all South African secondary schools until 2002.[citation needed] Today it continues to be taught in some universities around the world as an introduction to computer programming, usually advancing to C or Java or both.[when?]

Some lecturers[who?] prefer to use Borland Pascal 7 or Turbo Pascal 5.5 because of its simplicity in comparison to more modern IDEs such as Microsoft Visual Studio or Borland JBuilder, so it introduces students unfamiliar with computing to common tasks such as using the keyboard and keyboard shortcuts (TP 5.5 has no mouse support), familiarises them with DOS commands (which are largely the same as those of Microsoft Windows's command prompt), and lets them write programs without spending a lot of effort on getting the environment to work. TP 5.5 is available as a free download from Borland.[22][23]

Features
Assembly language
While all versions of Turbo Pascal could include inline machine code, starting with version 6 it was possible to integrate assembly language within Pascal source code.[24]

Support for the various 8086 memory models was provided by inline assembly, compiler options, and language extensions such as the "absolute" keyword. The Turbo Assembler, TASM, a standard x86 assembler independent of TP, and source-compatible with the widely used Microsoft Macro Assembler MASM, was supplied with the enhanced "Borland Pascal" versions.

Debugging and profiling
The IDE provided several debugging facilities, including single stepping, examination and changing of variables, and conditional breakpoints. In later versions assembly-language blocks could be stepped through. The user could add breakpoints on variables and registers in an IDE window. Programs using IBM PC graphics mode could flip between graphics and text mode automatically or manually, or display both on two screens. For cases where the relatively simple debugging facilities of the IDE were insufficient, Turbopower Software produced a more powerful debugger, T-Debug.[25] The same company produced Turbo Analyst and Overlay Manager for Turbo Pascal. T-Debug was later updated for Turbo Pascal 4, but discontinued with the release of Borland's Turbo Debugger (TD), which also allowed some hardware intervention on computers equipped with the new 80386 processor.

TD was usually supplied in conjunction with the Turbo Assembler and the Turbo Profiler, a code profiler that reported on the time spent in each part of the program to assist program optimisation by finding bottlenecks.[26] The books included with Borland Pascal had detailed descriptions of the Intel assembler language, including the number of clock cycles required by each instruction. Development and debugging could be carried out entirely within the IDE unless the advanced debugging facilities of Turbopower T-Debug, and later TD, were required.

Later versions also supported remote debugging via an RS232 communication cable.[27]

Units
Over the years, Borland enhanced not only the IDE, but also extended the programming language. A development system based on ISO standard Pascal requires implementation-specific extensions for the development of real-world applications on the platforms they target. Standard Pascal is designed to be platform-independent, so prescribes no low-level access to hardware- or operating system-dependent facilities. Standard Pascal also does not prescribe how a large program should be split into separate compilation units. From version 4, Turbo Pascal adopted the concept of units from UCSD Pascal. Units were used as external function libraries, like the object files used in other languages such as FORTRAN or C.

For example, the line uses crt; in a program included the unit called crt; the uses is the mechanism for using other compilation units. interface and implementation were the keywords used to specify, within the unit, what was (and what was not) visible outside the unit. This is similar to the public and private keywords in other languages such as C++ and Java.

Units in Borland's Pascal were similar to Modula-2's separate compilation system. In 1987, when Turbo Pascal 4 was released, Modula-2 was making inroads as an educational language which could replace Pascal. Borland, in fact, had a Turbo Modula-2 compiler, but this product ran only on CP/M and was never ported to DOS (its user interface was almost identical to that of Turbo Pascal 1–3). Instead of porting their Modula-2 compiler to DOS, Borland chose to implement separate compilation in their established Pascal product.

Separate compilation was not part of the standard Pascal language, but was already available in UCSD Pascal, which was very popular on 8-bit machines. Turbo Pascal syntax for units appears to have been borrowed from UCSD Pascal.[28] Earlier versions of Turbo Pascal, designed for computers with limited resources, supported a "chain and execute" system of dynamic linking for separately compiled objects, similar to the system widely used in BASIC. Also, the language had a statement to include separate source code in a program when necessary, and overlaying was supported from TP3, but, as with overlays, chained objects had to fit into the original (limited) program memory space. As computing and storage facilities advanced, the ability to generate large EXE files was added to Turbo Pascal, with the ability to statically link and collectively load separately compiled objects.

Object-oriented programming
From version 5.5 some object-oriented programming features were introduced: classes, inheritance, constructors and destructors.[4] The IDE was already augmented with an object browser interface showing relations between objects and methods and allowing programmers to navigate the modules easily. Borland called its language Object Pascal, which was greatly extended to become the language underlying Delphi (which has two separate OOP systems). The name "Object Pascal" originated with the Pascal extensions developed by Apple Inc. to program its Lisa and Macintosh computers. Pascal originator Niklaus Wirth consulted in developing these extensions, which built upon the record type already present in Pascal.

Issue with CRT unit on fast processors
Several versions of Turbo Pascal, including the latest version 7, include a CRT unit used by many fullscreen text mode applications. This unit contains code in its initialization section to determine the CPU speed and calibrate delay loops. This code fails on processors with a speed greater than about 200 MHz and aborts immediately with a "Runtime Error 200" message.[29] (the error code 200 had nothing to do with the CPU speed 200 MHz). This is caused because a loop runs to count the number of times it can iterate in a fixed time, as measured by the real-time clock. When Turbo Pascal was developed it ran on machines with CPUs running at 1 to 8 MHz, and little thought was given to the possibility of vastly higher speeds, so from about 200 MHz enough iterations can be run to overflow the 16-bit counter.[30] A patch was produced when machines became too fast for the original method, but failed as processor speeds increased yet further, and was superseded by others.

Programs subject to this error can be recompiled from source code with a compiler patched to eliminate the error (using a TURBO.TPL itself compiled with a corrected CRT unit) or, if source code is not available, executables can be patched by a tool named TPPATCH or equivalent,[31][32] or by loading a Terminate and Stay Resident program loaded before running the faulty program.[33]

There are also patches to the TP7 compiler itself,[34] thus if the Pascal source is available, a new compilation's code will work without the compiled code having to be patched. If the source code is available, porting to libraries without CPU clock speed dependency is a solution too.[35]

Floating point
There were several floating point types, including single (the 4-byte [IEEE 754] representation) double (the 8-byte IEEE 754 representation), extended (a 10-byte IEEE 754 representation used mostly internally by numeric coprocessors) and Real (a 6-byte representation).

In the early days, Real was the most popular. Most PCs of the era did not have a floating point coprocessor so all FP had to be done in software. Borland's own FP algorithms on Real were quicker than using the other types, though its library also emulated the other types in software.

Syntax
Pascal is not case-sensitive.
Historically, Pascal comments are enclosed { within pairs of braces }, or (* left parenthesis/asterisk and asterisk/right parenthesis pairs *), and these can span any number of lines. Later versions of Borland Pascal also supported C++-style comments // preceded by two forward slashes , which finish at the end of the line.
The syntax for the statement case is more flexible than standard Pascal.
Sets may only have up to 256 (28) members.
The standard Pascal String preceded by a length byte is supported, and takes a fixed amount of storage; later versions added a more flexible null-terminated type, calling the older type "short string". Older source code which handles strings in non-standard ways (e.g., directly manipulating the length byte like S[0]:=14 to truncate a string) must either have its strings declared as short strings, or be rewritten.
This is the classic Hello world program in Turbo Pascal:

program HelloWorld;
begin
  WriteLn('Hello World')
end.
This asks for a name and writes it back to the screen a hundred times:

program WriteName;
var
  i    : Integer;        {variable to be used for looping}
  Name : String;         {declares the variable Name as a string}
begin
  Write('Please tell me your name: ');
  ReadLn(Name);          {ReadLn returns the string entered by the user}
  for i := 1 to 100 do
  begin
    WriteLn('Hello ', Name)
  end;
 readln;
end.
