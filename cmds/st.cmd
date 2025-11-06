# This should be a test or example startup script

epicsEnvSet ("IOCNAME", "MJioc-test")
epicsEnvSet("ENGINEER", "MJ")

require iocstats

dbLoadRecords("iocAdminSoft-freia.db", "IOC=$(IOCNAME)")
