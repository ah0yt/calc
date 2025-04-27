grammar SCL;

// parser rules

prog:   stat+ ;

stat:   expr NEWLINE                # printExpr
    |   ID '=' expr NEWLINE         # assign
    |   NEWLINE                     # blank
    ;

expr:   expr op=('*'|'/') expr      # MulDiv
    |   expr op=('+'|'-') expr      # AddSub
    |   NUM                         # number
    |   ID                          # id
    |   '(' expr ')'                # parens
    ;

// operators
MUL :   '*' ; // assigns token name to '*' used above in grammar
DIV :   '/' ;
ADD :   '+' ;
SUB :   '-' ;
EXP :   '^' ; // exponent
MOD :   '%' ; // modulus


// lexer rules

// literals
ID  :   [a-zA-Z]+ ;             // match identifiers
NUM :   [0-9]+ ('.' [0-9]+)?;   // match numbers
STR :   '"' ~ ["\r\n]* '"';     // string literal
NEWLINE:'\r'? '\n' ;            // return newlines to parser (is end-statement signal)
WS  :   [ \t]+ -> skip ;        // toss out whitespace



// need to add support for BOOL, LOG, LOG10, SQRT, CEIL, FLOOR, FACT and  GCD
