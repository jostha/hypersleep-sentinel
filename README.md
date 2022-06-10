# HyperSleep Sentinel

Game for unexpanded Vic20 in progress.

## Some notes on running this code

Was all developed on Linux. Sorry don't know how to get it going on anything else so good luck.

### XVIC

xvic - for .prg from command line (in Fedora, others prob same) go to settings / preferences

  host / autostart PRG mode  : Virtual FS

  peripheral devices / drive : disable true drive, enable virtual device
 
Then compiled code can be run from xvic with 

  xvic outfile.prg

### Compilation

#### ACME 

The source files were all compiled using ACME, which isn't available as an RPM. I'll leave the distribution file for Linux here - maybe I should use something newer but this is for a Vic20 so... other platform releases can be found on the WBM https://web.archive.org/web/20150520143433/https://www.esw-heim.tu-clausthal.de/~marco/smorbrod/acme/

For Linux just go into the src directory and type 'make' then put 'acme' somewhere on your path - ~/bin is good.

#### .asm Files

Build prg files from asm with 

  acme --cpu 6502 -f cbm -o outfile.prg infile.asm

  
