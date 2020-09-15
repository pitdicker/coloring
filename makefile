
LDLIBS = -lm
CC = gcc
CFLAGS =  -O2  -Wall

default: doc
	
BINPATH = ./bin


GREEDY = gmain.o greedy.o graph.o colorrtns.o rng.o
greedy: $(GREEDY) $(BINPATH)/greedy
	
$(BINPATH)/greedy: $(GREEDY)
	@mkdir -p $(BINPATH)
	$(CC) $(GREEDY) -o $(BINPATH)/greedy $(LDLIBS)

$(GREEDY) : mysys.h greedy.h colorrtns.h graph.h rng.h makefile

DSATUR = dmain.o dsatur.o graph.o colorrtns.o rng.o
dsatur: $(DSATUR) $(BINPATH)/dsatur
	
$(BINPATH)/dsatur: $(DSATUR)
	@mkdir -p $(BINPATH)
	$(CC) $(DSATUR) -o $(BINPATH)/dsatur $(LDLIBS)

$(DSATUR) : mysys.h dsatur.h colorrtns.h graph.h rng.h makefile

MAXIS = mmain.o maxis.o graph.o colorrtns.o rng.o
maxis: $(MAXIS) $(BINPATH)/maxis
	
$(BINPATH)/maxis: $(MAXIS)
	@mkdir -p $(BINPATH)
	$(CC) $(MAXIS) -o $(BINPATH)/maxis $(LDLIB)

$(MAXIS) : mysys.h maxis.h colorrtns.h graph.h rng.h makefile

BKTDSAT = bkdmain.o bktdsat.o graph.o colorrtns.o maxclique.o rng.o
bktdsat: $(BKTDSAT) $(BINPATH)/bktdsat
	
$(BINPATH)/bktdsat: $(BKTDSAT)
	@mkdir -p $(BINPATH)
	$(CC) $(BKTDSAT) -o $(BINPATH)/bktdsat $(LDLIBS)

$(BKTDSAT) : mysys.h bktdsat.h colorrtns.h graph.h maxclique.h rng.h makefile

ITRGRDY = igmain.o greedy.o graph.o colorrtns.o itrgrdy.o rng.o
itrgrdy: $(ITRGRDY) $(BINPATH)/itrgrdy
	
$(BINPATH)/itrgrdy: $(ITRGRDY)
	@mkdir -p $(BINPATH)
	$(CC) $(ITRGRDY) -o $(BINPATH)/itrgrdy $(LDLIBS)

$(ITRGRDY) : mysys.h itrgrdy.h greedy.h colorrtns.h graph.h rng.h makefile


TABU = tbumain.o greedy.o graph.o colorrtns.o itrgrdy.o tabu.o partition.o brute.o rng.o
tabu: $(TABU) $(BINPATH)/tabu
	
$(BINPATH)/tabu: $(TABU)
	@mkdir -p $(BINPATH)
	$(CC) $(TABU) -o $(BINPATH)/tabu $(LDLIBS)

$(TABU) : mysys.h itrgrdy.h greedy.h colorrtns.h graph.h tabu.h\
	partition.h brute.h rng.h makefile


ALLH = mysys.h greedy.h colorrtns.h graph.h dsatur.h maxis.h bktdsat.h\
	maxclique.h tabu.h brute.h partition.h itrgrdy.h rng.h makefile

all: $(ALLH) greedy dsatur maxis bktdsat itrgrdy tabu

doc: README
	less README

clean:
	\rm *.o
