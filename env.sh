#!/bin/csh

# User must update this to the directory name or their project
# e.g. alu32 or fifo or PROJECT_2A
# NOTE: It must be same as the diretory name in projects/
setenv PROJECT $1

# KEEP_BUILDS "true" will create new synth and pnr directories
# with the following naming convention synth/pnr_<BLOCK>_<YYYYMMDD_HHMM> by default
# or the value of BUILD provided by the user (e.g. make pnr BUILD=mybuild)
# Setting this variable "false" will overwrite the synth and pnr directory for every run
# NOTE: case sensitive | use lowercase "true" only
setenv KEEP_BUILDS "false" 

# DO NOT CHANGE
setenv REPO_ROOT "`git rev-parse --show-toplevel`"
#setenv TOP "`python3 ${REPO_ROOT}/util/compile.py manifest.json syn_top`"


#setenv MBFF "false"
#setenv MULTIVT "false"

setenv CDS_Netlisting_Mode "Analog"
setenv LM_LICENSE_FILE 5280@cadence

setenv CDS_LIC_FILE $LM_LICENSE_FILE
setenv CDS_LIC_QA_TesT ./qaLog.txt
setenv LANG en_US
setenv QRC_EXTRACTION_ENABLE
setenv CDS_LIC_ONLY 1
setenv CDS_AUTO_64BIT ALL

setenv CDSHOME /home/cadence/lnx/ic_231

setenv INNOVUSHOME /home/cadence/lnx/innovus_211

setenv XRUN_HOME  /home/cadence/lnx/xce_24

#setenv QRC_HOME /
setenv SPECTRE_HOME /home/cadence/lnx/spectre_23

setenv SSV_HOME /home/cadence/lnx/ssv_221
setenv CONFORMAL /home/cadence/lnx/con_231/

setenv GENUS_HOME /home/cadence/lnx/genus_211

setenv MODUS_HOME /home/cadence/lnx/modus_221
#setenv PVS_HOME /
setenv PEGASUS_HOME /home/cadence/lnx/pegasus_22

#setenv PEGASUS_HOME /tools/
#setenv JASPER_HOME /tools/
#setenv MVS_HOME /tools/
setenv VMANAGER_HOME /home/cadence/lnx/vmanager

setenv UVM_HOME /home/cadence/lnx/xce_24/tools/methodology/UVM/CDNS-IEEE/sv/
#setenv ICADVM_HOME /
#setenv INDAGOA_HOME /
#setenv INTEGRAND_HOME /
#setenv JLS_HOME /tools/
#setenv LIBERATE_HOME /
#setenv STRATUS_HOME /
#setenv SPB_HOME /
#setenv SIGRITY_HOME /

set path=($XRUN_HOME/bin $XRUN_HOME/tools.lnx86/bin/64bit $XRUN_HOME/tools/dfII/bin $XRUN_HOME/share/bin $XRUN_HOME/tools.lnx86/bin $path)
set path=($path ${CDSHOME}/bin ${CDSHOME}/share/bin ${CDSHOME}/tools.lnx86/bin ${CDSHOME}/tools/bin ${CDSHOME}/share/dfII/bin ${CDSHOME}/tools.lnx86/dfII/bin ${CDSHOME}/tools/dfII/bin)
set path=($path ${INNOVUSHOME}/bin ${INNOVUSHOME}/share/bin ${INNOVUSHOME}/tools.lnx86/bin ${INNOVUSHOME}/tools/bin ${INNOVUSHOME}/share/dfII/bin ${INNOVUSHOME}/tools.lnx86/dfII/bin ${INNOVUSHOME}/tools/dfII/bin)
#set path=($path ${XRUN_HOME}/bin ${XRUN_HOME}/share/bin ${XRUN_HOME}/tools.lnx86/bin ${XRUN_HOME}/tools/bin ${XRUN_HOME}/share/dfII/bin ${XRUN_HOME}/tools.lnx86/dfII/bin ${XRUN_HOME}/tools/dfII/bin)
#set path=($path ${QRC_HOME}/bin ${QRC_HOME}/share/bin ${QRC_HOME}/tools.lnx86/bin ${QRC_HOME}/tools/bin ${QRC_HOME}/share/dfII/bin ${QRC_HOME}/tools.lnx86/dfII/bin ${QRC_HOME}/tools/dfII/bin)
set path=($path ${SPECTRE_HOME}/bin ${SPECTRE_HOME}/share/bin ${SPECTRE_HOME}/tools.lnx86/bin ${SPECTRE_HOME}/tools/bin ${SPECTRE_HOME}/share/dfII/bin ${SPECTRE_HOME}/tools.lnx86/dfII/bin ${SPECTRE_HOME}/tools/dfII/bin)
set path=($path ${SSV_HOME}/bin ${SSV_HOME}/share/bin ${SSV_HOME}/tools.lnx86/bin ${SSV_HOME}/tools/bin ${SSV_HOME}/share/dfII/bin ${SSV_HOME}/tools.lnx86/dfII/bin ${SSV_HOME}/tools/dfII/bin)
set path=($path ${CONFORMAL}/bin ${CONFORMAL}/share/bin ${CONFORMAL}/tools.lnx86/bin ${CONFORMAL}/tools/bin ${CONFORMAL}/share/dfII/bin ${CONFORMAL}/tools.lnx86/dfII/bin ${CONFORMAL}/tools/dfII/bin)
set path=($path ${GENUS_HOME}/bin ${GENUS_HOME}/share/bin ${GENUS_HOME}/tools.lnx86/bin ${GENUS_HOME}/tools/bin ${GENUS_HOME}/share/dfII/bin ${GENUS_HOME}/tools.lnx86/dfII/bin ${GENUS_HOME}/tools/dfII/bin)
set path=($path ${MODUS_HOME}/bin ${MODUS_HOME}/share/bin ${MODUS_HOME}/tools.lnx86/bin ${MODUS_HOME}/tools/bin ${MODUS_HOME}/share/dfII/bin ${MODUS_HOME}/tools.lnx86/dfII/bin ${MODUS_HOME}/tools/dfII/bin)
#set path=($path ${PVS_HOME}/bin ${PVS_HOME}/share/bin ${PVS_HOME}/tools.lnx86/bin ${PVS_HOME}/tools/bin ${PVS_HOME}/share/dfII/bin ${PVS_HOME}/tools.lnx86/dfII/bin ${PVS_HOME}/tools/dfII/bin)
set path=($path ${PEGASUS_HOME}/bin ${PEGASUS_HOME}/share/bin ${PEGASUS_HOME}/tools.lnx86/bin ${PEGASUS_HOME}/tools/bin ${PEGASUS_HOME}/share/dfII/bin ${PEGASUS_HOME}/tools.lnx86/dfII/bin ${PEGASUS_HOME}/tools/dfII/bin)
#set path=($path ${JASPER_HOME}/bin ${JASPER_HOME}/share/bin ${JASPER_HOME}/tools.lnx86/bin ${JASPER_HOME}/tools/bin ${JASPER_HOME}/share/dfII/bin ${JASPER_HOME}/tools.lnx86/dfII/bin ${JASPER_HOME}/tools/dfII/bin)
#set path=($path ${MVS_HOME}/bin ${MVS_HOME}/share/bin ${MVS_HOME}/tools.lnx86/bin ${MVS_HOME}/tools/bin ${MVS_HOME}/share/dfII/bin ${MVS_HOME}/tools.lnx86/dfII/bin ${MVS_HOME}/tools/dfII/bin)
set path=($path ${VMANAGER_HOME}/bin ${VMANAGER_HOME}/share/bin ${VMANAGER_HOME}/tools.lnx86/bin ${VMANAGER_HOME}/tools/bin ${VMANAGER_HOME}/share/dfII/bin ${VMANAGER_HOME}/tools.lnx86/dfII/bin ${VMANAGER_HOME}/tools/dfII/bin)
#set path=($path ${ICADVM_HOME}/bin ${ICADVM_HOME}/share/bin ${ICADVM_HOME}/tools.lnx86/bin ${ICADVM_HOME}/tools/bin ${ICADVM_HOME}/share/dfII/bin ${ICADVM_HOME}/tools.lnx86/dfII/bin ${ICADVM_HOME}/tools/dfII/bin)
#set path=($path ${INDAGOA_HOME}/bin ${INDAGOA_HOME}/share/bin ${INDAGOA_HOME}/tools.lnx86/bin ${INDAGOA_HOME}/tools/bin ${INDAGOA_HOME}/share/dfII/bin ${INDAGOA_HOME}/tools.lnx86/dfII/bin ${INDAGOA_HOME}/tools/dfII/bin)
#set path=($path ${INTEGRAND_HOME}/bin ${INTEGRAND_HOME}/share/bin ${INTEGRAND_HOME}/tools.lnx86/bin ${INTEGRAND_HOME}/tools/bin ${INTEGRAND_HOME}/share/dfII/bin ${INTEGRAND_HOME}/tools.lnx86/dfII/bin ${INTEGRAND_HOME}/tools/dfII/bin)
#set path=($path ${JLS_HOME}/bin ${JLS_HOME}/share/bin ${JLS_HOME}/tools.lnx86/bin ${JLS_HOME}/tools/bin ${JLS_HOME}/share/dfII/bin ${JLS_HOME}/tools.lnx86/dfII/bin ${JLS_HOME}/tools/dfII/bin)
#set path=($path ${LIBERATE_HOME}/bin ${LIBERATE_HOME}/share/bin ${LIBERATE_HOME}/tools.lnx86/bin ${LIBERATE_HOME}/tools/bin ${LIBERATE_HOME}/share/dfII/bin ${LIBERATE_HOME}/tools.lnx86/dfII/bin ${LIBERATE_HOME}/tools/dfII/bin)
#set path=($path ${STRATUS_HOME}/bin ${STRATUS_HOME}/share/bin ${STRATUS_HOME}/tools.lnx86/bin ${STRATUS_HOME}/tools/bin ${STRATUS_HOME}/share/dfII/bin ${STRATUS_HOME}/tools.lnx86/dfII/bin ${STRATUS_HOME}/tools/dfII/bin)
#set path=($path ${SPB_HOME}/bin ${SPB_HOME}/share/bin ${SPB_HOME}/tools.lnx86/bin ${SPB_HOME}/tools/bin ${SPB_HOME}/share/dfII/bin ${SPB_HOME}/tools.lnx86/dfII/bin ${SPB_HOME}/tools/dfII/bin)
#set path=($path ${SIGRITY_HOME}/bin ${SIGRITY_HOME}/share/bin ${SIGRITY_HOME}/tools.lnx86/bin ${SIGRITY_HOME}/tools/bin ${SIGRITY_HOME}/share/dfII/bin ${SIGRITY_HOME}/tools.lnx86/dfII/bin ${SIGRITY_HOME}/tools/dfII/bin)






echo "******************************************************"
echo "******        ATSH UDIF			     "
echo "******        PROJECT: $PROJECT                "
echo "******        KEEP_BUIDLS: $KEEP_BUILDS        "
echo "******************************************************"
echo "                                                      "

alias c 'clear'
