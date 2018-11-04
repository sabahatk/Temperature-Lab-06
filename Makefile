CC=gcc
CFLAGS=-lWarn -pedantic

Temperature:	Temperature.o libmyifttt.a 
	$(CC) Temperature.o -L. -lwiringPi -lmyifttt -lcurl -o Temperature

tester: tester.o libmyifttt.a
	$(CC) tester.o -L. -lmyifttt -lcurl -o tester

libmyifttt.a:	ifttt.o
	ar -rcs libmyifttt.a ifttt.o

ifttt.o: 	ifttt.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

tester.o:	tester.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

Temperature.o:	Temperature.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

all:	tester Temperature

clean:
	rm tester Temperature *.o
