# simple make to build Simple Calculator Language (SCL)

JC  = javac
JVM = java
CLASS_FILES = $(wildcard *.java)
MAIN_CLASS  = Main
GRAMMAR = SCLParser.g4
ANTLR4 = antlr4

all: grammar scl run

grammar:
	$(JVM) -jar antlr-4.13.2-complete.jar -listener -visitor $(GRAMMAR)

scl:
	javac -cp .:antlr-4.13.2-complete.jar SCLParser*.java
	javac -cp .:antlr-4.13.2-complete.jar Calc.java
 
run:
	java -cp .:./antlr-4.13.2-complete.jar Calc t.expr

clean:
	rm -rf *.class
	rm -rf *.tokens
	rm -rf *.interp
	rm -rf SCL*.java
