# Toolchain variables
TOOLCHAIN := arm-linux-gnueabihf

AR = $(TOOLCHAIN)-ar
CC = $(TOOLCHAIN)-gcc
OBJCOPY = $(TOOLCHAIN)-objcopy

TARGET  = raspdrone
LIBRARY = libdriver.a

OBJ_C = engine.c autopilot.c camera.c gyroscope.c motor.c navigation.c pwm_drone.c
OBJ_O = $(OBJ_C:.c=.o)

LIB_C = camera.c motor.c gyroscope.c
LIB_O = $(LIB_C:.c=.o)

# FLAGS

CFLAGS = -fno-builtin -I../../../u-boot/include -I../../../u-boot/arch/arm/include -D__KERNEL__ -I. -marm -g
LFLAGS = -L. -ldriver -T asm.lds

all: checklib $(TARGET) $(TARGET).bin

$(TARGET): $(OBJ_O)
	$(CC) -o $@ $^ $(LFLAGS)
	@echo "--------------- linking done ---------------"

$(TARGET).bin: $(TARGET)
	$(OBJCOPY) -O binary $< $@
	@echo "--------------- created bin file ---------------"

%.o: %.c
	$(CC) -c $< -o $@ $(CFLAGS)
	
$(LIBRARY): $(LIB_O)
	$(AR) -r $@ $^
	@echo "--------------- archived library ---------------"

.PHONY: checklib clean all

checklib: $(LIBRARY)
	@echo "--------------- library up to date ---------------"

clean:
	rm -rf *.o $(LIBRARY) $(TARGET) $(TARGET).bin
# DEPENDENCIES
engine.o: motor.h autopilot.h camera.h gyroscope.h
autopilot.o: autopilot.h gyroscope.h navigation.h
gyroscope.o: gyroscope.h
motor.o: motor.h
navigation.o: navigation.h gyroscope.h camera.h
pwm_drone.o: pwm_drone.h
camera.o: camera.h
