QT += core
QT += gui
QT += widgets


TARGET = photogrammetry
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000

SDKSTAGE = /home/pi/vc

INCLUDEPATH += $$SDKSTAGE/include/
INCLUDEPATH +=-I$(SDKSTAGE)/include/interface/vcos/pthreads
INCLUDEPATH +=-I$(SDKSTAGE)/include/interface/vmcs_host/linux
INCLUDEPATH += /usr/local/include


CONFIG += c++14

SOURCES += main.cpp \
    maindialog.cpp
SOURCES += cameracontrol.cpp
SOURCES += jpegencoder.cpp
SOURCES += picamera.cpp
SOURCES += preview.cpp
SOURCES += utility.cpp
SOURCES +=

HEADERS += \
    maindialog.h
HEADERS += cameracontrol.h
HEADERS += jpegencoder.h
HEADERS += picamera.h
HEADERS += preview.h
HEADERS += utility.h

FORMS += \
    maindialog.ui


LIBS+= -L$$SDKSTAGE/lib
LIBS += -lbcm_host
LIBS += -lvcos
LIBS += -lmmal
LIBS += -lmmal_core
LIBS += -lmmal_util

LIBS += -L"/usr/local/lib" -lpigpiod_if2


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


DISTFILES += movie.png
