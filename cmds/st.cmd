# This should be a test or example startup script

#epicsEnvSet ("IOCNAME", "MJioc-test")
epicsEnvSet("ENGINEER", "MJ")

require iocstats


#dbLoadRecords("iocAdminSoft-freia.db", "IOC=$(IOCNAME)")
iocshLoad("$(iocstats_DIR)iocStats-host.iocsh","HOSTNAME=Ctrl-nuc11")
iocshLoad("$(iocstats_DIR)iocStats-ioc.iocsh","IOCNAME=ioc99-test")
