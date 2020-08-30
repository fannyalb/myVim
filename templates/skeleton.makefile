CC = gcc
OBJ = 
LIBS = -lm 

# Main target
: $(OBJ)
	$(CC) $^ $(LIBS) -o $@

# Build dependencies
%.o: %.c
	$(CC) -c $<

# Phony targets
clean:
	rm -rf *.o


