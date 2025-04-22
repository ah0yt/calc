This example is from 4.2 int eh Antlr 4 Difnitive Reference:

For this calculator example, we need a 'visitor' that computes 
and returns a value by walking the parse tree.  You can use antlr 
to generate a default visitor by using the -visitor parameter when
calling antlr4 from the command line - this will create an interface
for you to override:

antlr4 -no-listener -visitor LabeledExpr.g4

We then  write EvalVisitor.java to override the methods - revew 
the EvalVisitor.java source file to understand how the 
'visitor' was created and overriden:

less EvalVisitor.java


Now, compile the Calc.java and LaveledExpr.java with:

javac -cp .:antlr-4.13.2-complete.jar Calc.java LabeledExpr*.java


and run the example fromt he command line with:

java -cp .:./antlr-4.13.2-complete.jar Calc t.expr


which will give the following output of:

193
17
9

