# Makefile for aapt; from https://heiher.info/2227.html

SRCDIR ?= $(CURDIR)

VPATH+= $(SRCDIR)/base/tools/aapt

SRCS+= AaptAssets.cpp
SRCS+= Command.cpp
SRCS+= CrunchCache.cpp
SRCS+= FileFinder.cpp
SRCS+= Main.cpp
SRCS+= Package.cpp
SRCS+= StringPool.cpp
SRCS+= XMLNode.cpp
SRCS+= ResourceFilter.cpp
SRCS+= ResourceIdCache.cpp
SRCS+= ResourceTable.cpp
SRCS+= Images.cpp
SRCS+= Resource.cpp
SRCS+= SourcePos.cpp
SRCS+= ZipEntry.cpp
SRCS+= ZipFile.cpp

VPATH+= $(SRCDIR)/native/libs/utils
#SRCS+= BasicHashtable.cpp
#SRCS+= BlobCache.cpp
SRCS+= BufferedTextOutput.cpp
#SRCS+= CallStack.cpp
SRCS+= Debug.cpp
SRCS+= FileMap.cpp
#SRCS+= Flattenable.cpp
#SRCS+= LinearTransform.cpp
SRCS+= Log.cpp
#SRCS+= Looper.cpp
SRCS+= misc.cpp
#SRCS+= PropertyMap.cpp
SRCS+= RefBase.cpp
SRCS+= SharedBuffer.cpp
SRCS+= Static.cpp
#SRCS+= StopWatch.cpp
SRCS+= String16.cpp
SRCS+= String8.cpp
#SRCS+= StringArray.cpp
#SRCS+= SystemClock.cpp
SRCS+= TextOutput.cpp
SRCS+= Threads.cpp
SRCS+= Timers.cpp
#SRCS+= Tokenizer.cpp
#SRCS+= Trace.cpp
SRCS+= Unicode.cpp
SRCS+= VectorImpl.cpp
SRCS+= WorkQueue.cpp
#SRCS+= ZipFileCRO.cpp
SRCS+= ZipFileRO.cpp
SRCS+= ZipUtils.cpp

VPATH+= $(SRCDIR)/core/liblog
SRCS+= event_tag_map.c
SRCS+= fake_log_device.c
SRCS+= logprint.c
SRCS+= logd_write.c

VPATH+= $(SRCDIR)/base/libs/androidfw
SRCS+= Asset.cpp
SRCS+= AssetDir.cpp
SRCS+= AssetManager.cpp
#SRCS+= BackupHelpers.cpp
#SRCS+= BackupData.cpp
#SRCS+= CursorWindow.cpp
#SRCS+= InputTransport.cpp
#SRCS+= Input.cpp
#SRCS+= InputDevice.cpp
#SRCS+= Keyboard.cpp
#SRCS+= KeyLayoutMap.cpp
#SRCS+= KeyCharacterMap.cpp
#SRCS+= ObbFile.cpp
SRCS+= ResourceTypes.cpp
SRCS+= StreamingZipInflater.cpp
#SRCS+= VelocityTracker.cpp
#SRCS+= VirtualKeyMap.cpp
#SRCS+= VelocityControl.cpp

VPATH+= $(SRCDIR)/host
SRCS+= CopyFile.c
SRCS+= pseudolocalize.cpp

VPATH+= $(SRCDIR)/core/libcutils
SRCS+= atomic.c
SRCS+= qsort_r_compat.c
SRCS+= threads.c
SRCS+= properties.c


CPPFLAGS+= -DHAVE_OFF64_T
CPPFLAGS+= -DHAVE_ENDIAN_H
CPPFLAGS+= -DHAVE_SYS_UIO_H
CPPFLAGS+= -DHAVE_PTHREADS
CPPFLAGS+= -DHAVE_POSIX_FILEMAP
CPPFLAGS+= -DFAKE_LOG_DEVICE=1
CPPFLAGS+= -DANDROID_SMP
CPPFLAGS+= -I$(SRCDIR)/core/include
CPPFLAGS+= -I$(SRCDIR)/base/include
CPPFLAGS+= -I$(SRCDIR)/native/include
CPPFLAGS+= -I$(SRCDIR)/host/include
CPPFLAGS+= -include $(SRCDIR)/AndroidConfig.h

LIBS+= -lpthread -lz -lpng -lexpat

SRC_cpp= $(filter %.cpp,$(SRCS))
SRC_c= $(filter %.c,$(SRCS))
OBJS+= $(SRC_cpp:.cpp=.o)
OBJS+= $(SRC_c:.c=.o)

all: aapt

aapt: $(OBJS)
	$(CXX) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)

clean:
	rm -rf $(OBJS) aapt

