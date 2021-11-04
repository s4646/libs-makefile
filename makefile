basicOBJ = basicClassification.o
loopOBJ = advancedClassificationLoop.o
recOBJ = advancedClassificationRecursion.o
CC = gcc
FLAGS_OBJ = -c -fpic -Wall
FLAGS_SO = -Wall -shared -o
FLAGS_MAIN = -Wall main.o
RM_FLAGS = *a *o *so
PROGS = mains maindloop maindrec
.PHONY = all loops recursives loopd recursived

###

all: $(PROGS)

basicClassification.o: basicClassification.c
	$(CC) $(FLAGS_OBJ) basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(FLAGS_OBJ) advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) $(FLAGS_OBJ) advancedClassificationRecursion.c

main.o: main.c NumClass.h
	$(CC) $(FLAGS_OBJ) main.c

###

loops: libclassloops.a

libclassloops.a: $(basicOBJ) $(loopOBJ)
	ar -rcs libclassloops.a $(basicOBJ) $(loopOBJ)

recursives‬‬: libclassrec.a

libclassrec.a: $(basicOBJ) $(recOBJ)
	ar -rcs libclassrec.a $(basicOBJ) $(recOBJ)

###

loopd‬‬: libclassloops.so

libclassloops.so: $(basicOBJ) $(loopOBJ)
	$(CC) $(FLAGS_SO) libclassloops.so $(basicOBJ) $(loopOBJ)

recursived‬‬: libclassrec.so

libclassrec.so: $(basicOBJ) $(recOBJ)
	$(CC) $(FLAGS_SO) libclassrec.so $(basicOBJ) $(recOBJ) 

###

mains: main.o libclassrec.a
	$(CC) $(FLAGS_MAIN) libclassrec.a -o mains

maindloop: main.o libclassloops.so
	$(CC) $(FLAGS_MAIN) -o maindloop ./libclassloops.so

maindrec: main.o libclassrec.so
	$(CC) $(FLAGS_MAIN) -o maindrec ./libclassrec.so
	
###

clean:
	rm -f $(PROGS) $(RM_FLAGS)
