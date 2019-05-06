@ARG
M=0  // WHITE

@8192
D=A
@NUM_WORDS
M=D  // words = rows * 32 = 256 * 32 = 8192

(BEGIN)
@CURRENT_ROW_IDX
M=0

(FILL)
    @CURRENT_ROW_IDX
    D=M

    @SCREEN
    D=D+A

    @SCREEN_PLUS_I
    M=D

    @ARG
    D=M

    @SCREEN_PLUS_I
    A=M
    M=D

    @CURRENT_ROW_IDX
    M=M+1  // Increment counter

    @NUM_WORDS
    D=M
    @CURRENT_ROW_IDX
    D=D-M  // Compute difference between numWords and counter

    @FILL
    D;JNE  // Fill more if needed.

// Check Keyboard
@KBD
D=M
@KEYPRESSED
D;JNE
@NOT_KEYPRESSED
0;JMP

(KEYPRESSED)
    @ARG
    M=-1
    @BEGIN
    0;JMP

(NOT_KEYPRESSED)
    @ARG
    M=0
    @BEGIN
    0;JMP




// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
