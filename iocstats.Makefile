where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile



USR_CPPFLAGS += -DUSE_TYPED_RSET


DEVIOCSTATS:=devIocStats

HEADERS += $(DEVIOCSTATS)/os/default/devIocStatsOSD.h
HEADERS += $(DEVIOCSTATS)/devIocStats.h


# Original Makefile : OSI parts
# SRCS += devIocStatsAnalog.c
# SRCS += devIocStatsString.c
# SRCS += devIocStatsWaveform.c
# SRCS += devIocStatsSub.c
# SRCS += devIocStatsTest.c


SOURCES += $(DEVIOCSTATS)/devIocStatsAnalog.c
SOURCES += $(DEVIOCSTATS)/devIocStatsString.c
SOURCES += $(DEVIOCSTATS)/devIocStatsWaveform.c
SOURCES += $(DEVIOCSTATS)/devIocStatsSub.c
SOURCES += $(DEVIOCSTATS)/devIocStatsTest.c



# The original makefile : OSD parts
#
# SRCS += osdCpuUsage.c
# SRCS += osdCpuUtilization.c
# SRCS += osdFdUsage.c
# SRCS += osdMemUsage.c
# SRCS += osdWorkspaceUsage.c
# SRCS += osdClustInfo.c
# SRCS += osdSuspTasks.c
# SRCS += osdIFErrors.c
# SRCS += osdBootInfo.c
# SRCS += osdSystemInfo.c
# SRCS += osdHostInfo.c
# SRCS += osdPIDInfo.c

# iocStats has many source codes, which has the same name in
# terms of archtecture. driver.makefile isn't clever enough to
# understand its relations, so we have to use the specific
# source codes order in the same as the original makefile
# as follows:

SOURCES += $(DEVIOCSTATS)/os/Linux/osdCpuUsage.c
SOURCES += $(DEVIOCSTATS)/os/Linux/osdCpuUtilization.c
SOURCES += $(DEVIOCSTATS)/os/Linux/osdFdUsage.c
SOURCES += $(DEVIOCSTATS)/os/Linux/osdMemUsage.c
SOURCES += $(DEVIOCSTATS)/os/default/osdWorkspaceUsage.c
SOURCES += $(DEVIOCSTATS)/os/default/osdClustInfo.c
SOURCES += $(DEVIOCSTATS)/os/default/osdSuspTasks.c
SOURCES += $(DEVIOCSTATS)/os/default/osdIFErrors.c
SOURCES += $(DEVIOCSTATS)/os/default/osdBootInfo.c
SOURCES += $(DEVIOCSTATS)/os/posix/osdSystemInfo.c
SOURCES += $(DEVIOCSTATS)/os/posix/osdHostInfo.c
SOURCES += $(DEVIOCSTATS)/os/posix/osdPIDInfo.c

DBDS    += $(DEVIOCSTATS)/devIocStats.dbd

HEADERS += $(DEVIOCSTATS)/devIocStats.h


IOCADMIN:= iocAdmin
IOCADMINSRC:=$(IOCADMIN)/src
IOCADMINDB:=$(IOCADMIN)/Db

# Not sure the following file is useful or not
SCRIPTS += $(IOCADMINSRC)/iocReleaseCreateDb.py

# The following DBD contains "devIocStats.dbd", so it is not
# necessary to add it again. 
# DBDS      += $(IOCADMINSRC)/iocAdmin.dbd


SCRIPTS += $(wildcard ../iocsh/*.iocsh)


TEMPLATES += $(wildcard $(IOCADMINDB)/*.db)
TEMPLATES += $(wildcard $(IOCADMINDB)/*.template)
TEMPLATES += $(wildcard ../template/*.template)


USR_DBFLAGS += -I . -I ..
USR_DBFLAGS += -I$(EPICS_BASE)/db
USR_DBFLAGS += -I$(IOCADMINDB)
USR_DBFLAGS += -I$(where_am_I)/../template


SUBS += $(wildcard $(IOCADMINDB)/*.substitutions)
SUBS += $(wildcard ../template/*.substitutions)

.PHONY: vlibs
vlibs:
