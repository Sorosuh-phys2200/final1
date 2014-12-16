GRAPH = gnuplot

CC = clang
CFLAGS = -Wall -O3
LFLAGS = -O3
LIBS = -lgsl -lm

main: main.o se.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res: main
	./main > res

mc-se.png: mc-se.gpl res
	$(GRAPH) mc-se.gpl

clean:
	rm -f *.o *~ main

veryclean: clean
	rm -f res mc-se.png
