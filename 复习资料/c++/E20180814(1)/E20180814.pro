TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

LIBS += -lpthread

SOURCES += main.cpp \
    hthread.cpp \
    hmutex.cpp

HEADERS += \
    fun.h \
    hthread.h \
    hmutex.h

