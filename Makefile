.PHONY: all clean
CC=gcc
AR=ar
FLAGS= -Wall -g
basicOBJ = basicClassification.o
loopOBJ = advancedClassificationLoop.o
recOBJ = advancedClassificationRecursion.o
PROGS = mains maindloop maindrec

all: libclassloops.a libclassrec.a libclassrec.so libclassloops.so $(PROGS)

###

mains: main.o libclassrec.a
	$(CC) $(FLAGS) -o mains main.o libclassrec.a	
maindloop: main.o libclassloops.so
	$(CC) $(FLAGS) -o maindloop main.o ./libclassloops.so
maindrec: main.o libclassrec.so
	$(CC) $(FLAGS) -o maindrec main.o ./libclassrec.so

###

loops: libclassloops.a
libclassloops.a: $(basicOBJ) $(loopOBJ)
	$(AR) -rcs libclassloops.a $(basicOBJ) $(loopOBJ)

recursives: libclassrec.a
libclassrec.a: $(basicOBJ) $(recOBJ)
	$(AR) -rcs libclassrec.a $(basicOBJ) $(recOBJ)	

recursived: libclassrec.so
libclassrec.so: $(basicOBJ) $(recOBJ) 
	$(CC) -shared -o libclassrec.so $(basicOBJ) $(recOBJ)

loopd:libclassloops.so
libclassloops.so: $(basicOBJ) $(loopOBJ)
	$(CC) -shared -o libclassloops.so $(basicOBJ) $(loopOBJ)

###

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c
basicClassification.o: basicClassification.c NumClass.h 
	$(CC) $(FLAGS) -c basicClassification.c
advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h 
	$(CC) $(FLAGS) -c advancedClassificationLoop.c
advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h 
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

###

clean: 
	rm -f *.a *.o *.so $(PROGS)
