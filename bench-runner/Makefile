CC = riscv64-unknown-linux-gnu-g++
OBJCOPY = riscv64-unknown-linux-gnu-objcopy

KEYSTONE_DIR=/home/yx/Desktop/vf-keystone/keystone/build-starfive/visionfive264/buildroot.build/host/usr/share/keystone

SDK_LIB_DIR =$(KEYSTONE_DIR)/sdk/lib
SDK_HOST_LIB = $(SDK_LIB_DIR)/libkeystone-host.a
SDK_EDGE_LIB = $(SDK_LIB_DIR)/libkeystone-edge.a
SDK_VERIFIER_LIB = $(SDK_LIB_DIR)/libkeystone-verifier.a

SDK_INCLUDE_HOST_DIR = $(SDK_LIB_DIR)/host/include
SDK_INCLUDE_EDGE_DIR = $(SDK_LIB_DIR)/edge/include
SDK_INCLUDE_VERIFIER_DIR = $(SDK_LIB_DIR)/verifier

# yx
SDK_LIB_DIR =$(KEYSTONE_DIR)/sdk/lib
SDK_HOST_LIB = $(SDK_LIB_DIR)/libkeystone-host.a
SDK_EDGE_LIB = $(SDK_LIB_DIR)/libkeystone-edge.a
SDK_VERIFIER_LIB = $(SDK_LIB_DIR)/libkeystone-verifier.a

SDK_INCLUDE_DIR =$(KEYSTONE_DIR)/sdk/include
SDK_INCLUDE_HOST_DIR = $(SDK_INCLUDE_DIR)/host
SDK_INCLUDE_EDGE_DIR = $(SDK_INCLUDE_DIR)/edge
SDK_INCLUDE_VERIFIER_DIR = $(SDK_INCLUDE_DIR)/verifier
SDK_INCLUDE_OTHER_DIR_YX = $(SDK_INCLUDE_DIR)/
# yx

RUNNER=bench-runner.riscv
# yx add -I$(SDK_INCLUDE_OTHER_DIR_YX) between -I$(SDK_INCLUDE_VERIFIER_DIR) and -std=c++
CCFLAGS = -I$(SDK_INCLUDE_HOST_DIR) -I$(SDK_INCLUDE_EDGE_DIR) -I$(SDK_INCLUDE_VERIFIER_DIR) -I$(SDK_INCLUDE_OTHER_DIR_YX) -std=c++11
LDFLAGS = -L$(SDK_LIB_DIR)

SRCS = $(patsubst %.riscv, %.cpp, $(RUNNER))
OBJS = $(patsubst %.riscv, %.o,$(RUNNER)) $(KEYSTONE_OBJ)

all:  $(OBJS) $(SDK_HOST_LIB) $(SDK_EDGE_LIB) $(SDK_VERIFIER_LIB)
	$(CC) $(CCFLAGS) $(LDFLAGS) -o $(RUNNER) $^

$(SDK_HOST_LIB):
	$(MAKE) -C $(SDK_HOST_DIR)

$(OBJS): %.o: %.cpp
	$(CC) $(CCFLAGS) -c $<

clean:
	rm -f *.o *.riscv test
