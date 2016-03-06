#
# OMNeT++/OMNEST Makefile for P2P_Wireless_Wifi
#
# This file was generated with the command:
#  opp_makemake -f --deep -O out -I../MiXiM/src/base/phyLayer -I../MiXiM/src/base/modules -I../MiXiM/src/inet_stub/mobility -I../MiXiM/src/inet_stub/util -I../MiXiM/src/inet_stub/linklayer/contract -I../MiXiM/src/inet_stub/networklayer/common -I../MiXiM/src/base/connectionManager -I../MiXiM/src -I../MiXiM/src/inet_stub/base -I../MiXiM/src/base/messages -I../MiXiM/src/base/utils -I../MiXiM/src/base -I../MiXiM/src/inet_stub/mobility/models -L../MiXiM/out/$$\(CONFIGNAME\)/src -lmixim -KMIXIM_PROJ=../MiXiM
#

# Name of target to be created (-o option)
TARGET = P2P_Wireless_Wifi$(EXE_SUFFIX)

# User interface (uncomment one) (-u option)
USERIF_LIBS = $(ALL_ENV_LIBS) # that is, $(TKENV_LIBS) $(CMDENV_LIBS)
#USERIF_LIBS = $(CMDENV_LIBS)
#USERIF_LIBS = $(TKENV_LIBS)

# C++ include paths (with -I)
INCLUDE_PATH = \
    -I../MiXiM/src/base/phyLayer \
    -I../MiXiM/src/base/modules \
    -I../MiXiM/src/inet_stub/mobility \
    -I../MiXiM/src/inet_stub/util \
    -I../MiXiM/src/inet_stub/linklayer/contract \
    -I../MiXiM/src/inet_stub/networklayer/common \
    -I../MiXiM/src/base/connectionManager \
    -I../MiXiM/src \
    -I../MiXiM/src/inet_stub/base \
    -I../MiXiM/src/base/messages \
    -I../MiXiM/src/base/utils \
    -I../MiXiM/src/base \
    -I../MiXiM/src/inet_stub/mobility/models \
    -I. \
    -IQueryResults \
    -IQueryResults/0 \
    -IQueryResults/1 \
    -IQueryResults/10 \
    -IQueryResults/100 \
    -IQueryResults/101 \
    -IQueryResults/102 \
    -IQueryResults/103 \
    -IQueryResults/104 \
    -IQueryResults/105 \
    -IQueryResults/106 \
    -IQueryResults/107 \
    -IQueryResults/108 \
    -IQueryResults/109 \
    -IQueryResults/11 \
    -IQueryResults/110 \
    -IQueryResults/111 \
    -IQueryResults/112 \
    -IQueryResults/113 \
    -IQueryResults/114 \
    -IQueryResults/115 \
    -IQueryResults/116 \
    -IQueryResults/117 \
    -IQueryResults/118 \
    -IQueryResults/119 \
    -IQueryResults/12 \
    -IQueryResults/120 \
    -IQueryResults/121 \
    -IQueryResults/122 \
    -IQueryResults/123 \
    -IQueryResults/124 \
    -IQueryResults/125 \
    -IQueryResults/126 \
    -IQueryResults/127 \
    -IQueryResults/128 \
    -IQueryResults/129 \
    -IQueryResults/13 \
    -IQueryResults/130 \
    -IQueryResults/131 \
    -IQueryResults/132 \
    -IQueryResults/133 \
    -IQueryResults/134 \
    -IQueryResults/135 \
    -IQueryResults/136 \
    -IQueryResults/137 \
    -IQueryResults/138 \
    -IQueryResults/139 \
    -IQueryResults/14 \
    -IQueryResults/140 \
    -IQueryResults/141 \
    -IQueryResults/142 \
    -IQueryResults/143 \
    -IQueryResults/144 \
    -IQueryResults/145 \
    -IQueryResults/146 \
    -IQueryResults/147 \
    -IQueryResults/148 \
    -IQueryResults/149 \
    -IQueryResults/15 \
    -IQueryResults/150 \
    -IQueryResults/151 \
    -IQueryResults/152 \
    -IQueryResults/153 \
    -IQueryResults/154 \
    -IQueryResults/155 \
    -IQueryResults/156 \
    -IQueryResults/157 \
    -IQueryResults/158 \
    -IQueryResults/159 \
    -IQueryResults/16 \
    -IQueryResults/160 \
    -IQueryResults/161 \
    -IQueryResults/162 \
    -IQueryResults/163 \
    -IQueryResults/164 \
    -IQueryResults/165 \
    -IQueryResults/166 \
    -IQueryResults/167 \
    -IQueryResults/168 \
    -IQueryResults/169 \
    -IQueryResults/17 \
    -IQueryResults/170 \
    -IQueryResults/171 \
    -IQueryResults/172 \
    -IQueryResults/173 \
    -IQueryResults/174 \
    -IQueryResults/175 \
    -IQueryResults/176 \
    -IQueryResults/177 \
    -IQueryResults/178 \
    -IQueryResults/179 \
    -IQueryResults/18 \
    -IQueryResults/180 \
    -IQueryResults/181 \
    -IQueryResults/182 \
    -IQueryResults/183 \
    -IQueryResults/184 \
    -IQueryResults/185 \
    -IQueryResults/186 \
    -IQueryResults/187 \
    -IQueryResults/188 \
    -IQueryResults/189 \
    -IQueryResults/19 \
    -IQueryResults/190 \
    -IQueryResults/191 \
    -IQueryResults/192 \
    -IQueryResults/193 \
    -IQueryResults/194 \
    -IQueryResults/195 \
    -IQueryResults/196 \
    -IQueryResults/197 \
    -IQueryResults/198 \
    -IQueryResults/199 \
    -IQueryResults/2 \
    -IQueryResults/20 \
    -IQueryResults/200 \
    -IQueryResults/201 \
    -IQueryResults/202 \
    -IQueryResults/203 \
    -IQueryResults/204 \
    -IQueryResults/205 \
    -IQueryResults/206 \
    -IQueryResults/207 \
    -IQueryResults/208 \
    -IQueryResults/209 \
    -IQueryResults/21 \
    -IQueryResults/210 \
    -IQueryResults/211 \
    -IQueryResults/212 \
    -IQueryResults/213 \
    -IQueryResults/214 \
    -IQueryResults/215 \
    -IQueryResults/216 \
    -IQueryResults/217 \
    -IQueryResults/218 \
    -IQueryResults/219 \
    -IQueryResults/22 \
    -IQueryResults/220 \
    -IQueryResults/221 \
    -IQueryResults/222 \
    -IQueryResults/223 \
    -IQueryResults/224 \
    -IQueryResults/225 \
    -IQueryResults/226 \
    -IQueryResults/227 \
    -IQueryResults/228 \
    -IQueryResults/229 \
    -IQueryResults/23 \
    -IQueryResults/230 \
    -IQueryResults/231 \
    -IQueryResults/232 \
    -IQueryResults/233 \
    -IQueryResults/234 \
    -IQueryResults/235 \
    -IQueryResults/236 \
    -IQueryResults/237 \
    -IQueryResults/238 \
    -IQueryResults/239 \
    -IQueryResults/24 \
    -IQueryResults/240 \
    -IQueryResults/241 \
    -IQueryResults/242 \
    -IQueryResults/243 \
    -IQueryResults/244 \
    -IQueryResults/245 \
    -IQueryResults/246 \
    -IQueryResults/247 \
    -IQueryResults/248 \
    -IQueryResults/249 \
    -IQueryResults/25 \
    -IQueryResults/250 \
    -IQueryResults/251 \
    -IQueryResults/252 \
    -IQueryResults/253 \
    -IQueryResults/254 \
    -IQueryResults/255 \
    -IQueryResults/256 \
    -IQueryResults/257 \
    -IQueryResults/258 \
    -IQueryResults/259 \
    -IQueryResults/26 \
    -IQueryResults/260 \
    -IQueryResults/261 \
    -IQueryResults/262 \
    -IQueryResults/263 \
    -IQueryResults/264 \
    -IQueryResults/265 \
    -IQueryResults/266 \
    -IQueryResults/267 \
    -IQueryResults/268 \
    -IQueryResults/269 \
    -IQueryResults/27 \
    -IQueryResults/270 \
    -IQueryResults/271 \
    -IQueryResults/272 \
    -IQueryResults/273 \
    -IQueryResults/274 \
    -IQueryResults/275 \
    -IQueryResults/276 \
    -IQueryResults/277 \
    -IQueryResults/278 \
    -IQueryResults/279 \
    -IQueryResults/28 \
    -IQueryResults/280 \
    -IQueryResults/281 \
    -IQueryResults/282 \
    -IQueryResults/283 \
    -IQueryResults/284 \
    -IQueryResults/285 \
    -IQueryResults/286 \
    -IQueryResults/287 \
    -IQueryResults/288 \
    -IQueryResults/289 \
    -IQueryResults/29 \
    -IQueryResults/290 \
    -IQueryResults/291 \
    -IQueryResults/292 \
    -IQueryResults/293 \
    -IQueryResults/294 \
    -IQueryResults/295 \
    -IQueryResults/296 \
    -IQueryResults/297 \
    -IQueryResults/298 \
    -IQueryResults/299 \
    -IQueryResults/3 \
    -IQueryResults/30 \
    -IQueryResults/300 \
    -IQueryResults/301 \
    -IQueryResults/302 \
    -IQueryResults/303 \
    -IQueryResults/304 \
    -IQueryResults/305 \
    -IQueryResults/306 \
    -IQueryResults/307 \
    -IQueryResults/308 \
    -IQueryResults/309 \
    -IQueryResults/31 \
    -IQueryResults/310 \
    -IQueryResults/311 \
    -IQueryResults/312 \
    -IQueryResults/313 \
    -IQueryResults/314 \
    -IQueryResults/315 \
    -IQueryResults/316 \
    -IQueryResults/317 \
    -IQueryResults/318 \
    -IQueryResults/319 \
    -IQueryResults/32 \
    -IQueryResults/320 \
    -IQueryResults/321 \
    -IQueryResults/322 \
    -IQueryResults/323 \
    -IQueryResults/324 \
    -IQueryResults/325 \
    -IQueryResults/326 \
    -IQueryResults/327 \
    -IQueryResults/328 \
    -IQueryResults/329 \
    -IQueryResults/33 \
    -IQueryResults/330 \
    -IQueryResults/331 \
    -IQueryResults/332 \
    -IQueryResults/333 \
    -IQueryResults/334 \
    -IQueryResults/335 \
    -IQueryResults/336 \
    -IQueryResults/337 \
    -IQueryResults/338 \
    -IQueryResults/339 \
    -IQueryResults/34 \
    -IQueryResults/340 \
    -IQueryResults/341 \
    -IQueryResults/342 \
    -IQueryResults/343 \
    -IQueryResults/344 \
    -IQueryResults/345 \
    -IQueryResults/346 \
    -IQueryResults/347 \
    -IQueryResults/348 \
    -IQueryResults/349 \
    -IQueryResults/35 \
    -IQueryResults/350 \
    -IQueryResults/351 \
    -IQueryResults/352 \
    -IQueryResults/353 \
    -IQueryResults/354 \
    -IQueryResults/355 \
    -IQueryResults/356 \
    -IQueryResults/357 \
    -IQueryResults/358 \
    -IQueryResults/359 \
    -IQueryResults/36 \
    -IQueryResults/360 \
    -IQueryResults/361 \
    -IQueryResults/362 \
    -IQueryResults/363 \
    -IQueryResults/364 \
    -IQueryResults/365 \
    -IQueryResults/366 \
    -IQueryResults/367 \
    -IQueryResults/368 \
    -IQueryResults/369 \
    -IQueryResults/37 \
    -IQueryResults/370 \
    -IQueryResults/371 \
    -IQueryResults/372 \
    -IQueryResults/373 \
    -IQueryResults/374 \
    -IQueryResults/375 \
    -IQueryResults/376 \
    -IQueryResults/377 \
    -IQueryResults/378 \
    -IQueryResults/379 \
    -IQueryResults/38 \
    -IQueryResults/380 \
    -IQueryResults/381 \
    -IQueryResults/382 \
    -IQueryResults/383 \
    -IQueryResults/384 \
    -IQueryResults/385 \
    -IQueryResults/386 \
    -IQueryResults/387 \
    -IQueryResults/388 \
    -IQueryResults/389 \
    -IQueryResults/39 \
    -IQueryResults/390 \
    -IQueryResults/391 \
    -IQueryResults/392 \
    -IQueryResults/393 \
    -IQueryResults/394 \
    -IQueryResults/395 \
    -IQueryResults/396 \
    -IQueryResults/397 \
    -IQueryResults/398 \
    -IQueryResults/399 \
    -IQueryResults/4 \
    -IQueryResults/40 \
    -IQueryResults/400 \
    -IQueryResults/401 \
    -IQueryResults/402 \
    -IQueryResults/403 \
    -IQueryResults/404 \
    -IQueryResults/405 \
    -IQueryResults/406 \
    -IQueryResults/407 \
    -IQueryResults/408 \
    -IQueryResults/409 \
    -IQueryResults/41 \
    -IQueryResults/410 \
    -IQueryResults/411 \
    -IQueryResults/412 \
    -IQueryResults/413 \
    -IQueryResults/414 \
    -IQueryResults/415 \
    -IQueryResults/416 \
    -IQueryResults/417 \
    -IQueryResults/418 \
    -IQueryResults/419 \
    -IQueryResults/42 \
    -IQueryResults/420 \
    -IQueryResults/421 \
    -IQueryResults/422 \
    -IQueryResults/423 \
    -IQueryResults/424 \
    -IQueryResults/425 \
    -IQueryResults/426 \
    -IQueryResults/427 \
    -IQueryResults/428 \
    -IQueryResults/429 \
    -IQueryResults/43 \
    -IQueryResults/430 \
    -IQueryResults/431 \
    -IQueryResults/432 \
    -IQueryResults/433 \
    -IQueryResults/434 \
    -IQueryResults/435 \
    -IQueryResults/436 \
    -IQueryResults/437 \
    -IQueryResults/438 \
    -IQueryResults/439 \
    -IQueryResults/44 \
    -IQueryResults/440 \
    -IQueryResults/441 \
    -IQueryResults/442 \
    -IQueryResults/443 \
    -IQueryResults/444 \
    -IQueryResults/445 \
    -IQueryResults/446 \
    -IQueryResults/447 \
    -IQueryResults/448 \
    -IQueryResults/449 \
    -IQueryResults/45 \
    -IQueryResults/450 \
    -IQueryResults/451 \
    -IQueryResults/452 \
    -IQueryResults/453 \
    -IQueryResults/454 \
    -IQueryResults/455 \
    -IQueryResults/456 \
    -IQueryResults/457 \
    -IQueryResults/458 \
    -IQueryResults/459 \
    -IQueryResults/46 \
    -IQueryResults/460 \
    -IQueryResults/461 \
    -IQueryResults/462 \
    -IQueryResults/463 \
    -IQueryResults/464 \
    -IQueryResults/465 \
    -IQueryResults/466 \
    -IQueryResults/467 \
    -IQueryResults/468 \
    -IQueryResults/469 \
    -IQueryResults/47 \
    -IQueryResults/470 \
    -IQueryResults/471 \
    -IQueryResults/472 \
    -IQueryResults/473 \
    -IQueryResults/474 \
    -IQueryResults/475 \
    -IQueryResults/476 \
    -IQueryResults/477 \
    -IQueryResults/478 \
    -IQueryResults/479 \
    -IQueryResults/48 \
    -IQueryResults/480 \
    -IQueryResults/481 \
    -IQueryResults/482 \
    -IQueryResults/483 \
    -IQueryResults/484 \
    -IQueryResults/485 \
    -IQueryResults/486 \
    -IQueryResults/487 \
    -IQueryResults/488 \
    -IQueryResults/489 \
    -IQueryResults/49 \
    -IQueryResults/490 \
    -IQueryResults/491 \
    -IQueryResults/492 \
    -IQueryResults/493 \
    -IQueryResults/494 \
    -IQueryResults/495 \
    -IQueryResults/496 \
    -IQueryResults/497 \
    -IQueryResults/498 \
    -IQueryResults/499 \
    -IQueryResults/5 \
    -IQueryResults/50 \
    -IQueryResults/500 \
    -IQueryResults/501 \
    -IQueryResults/502 \
    -IQueryResults/503 \
    -IQueryResults/504 \
    -IQueryResults/505 \
    -IQueryResults/506 \
    -IQueryResults/507 \
    -IQueryResults/508 \
    -IQueryResults/509 \
    -IQueryResults/51 \
    -IQueryResults/510 \
    -IQueryResults/511 \
    -IQueryResults/512 \
    -IQueryResults/513 \
    -IQueryResults/514 \
    -IQueryResults/515 \
    -IQueryResults/516 \
    -IQueryResults/517 \
    -IQueryResults/518 \
    -IQueryResults/519 \
    -IQueryResults/52 \
    -IQueryResults/520 \
    -IQueryResults/521 \
    -IQueryResults/522 \
    -IQueryResults/523 \
    -IQueryResults/524 \
    -IQueryResults/525 \
    -IQueryResults/526 \
    -IQueryResults/527 \
    -IQueryResults/528 \
    -IQueryResults/529 \
    -IQueryResults/53 \
    -IQueryResults/530 \
    -IQueryResults/531 \
    -IQueryResults/532 \
    -IQueryResults/533 \
    -IQueryResults/534 \
    -IQueryResults/535 \
    -IQueryResults/536 \
    -IQueryResults/537 \
    -IQueryResults/538 \
    -IQueryResults/539 \
    -IQueryResults/54 \
    -IQueryResults/540 \
    -IQueryResults/541 \
    -IQueryResults/542 \
    -IQueryResults/543 \
    -IQueryResults/544 \
    -IQueryResults/545 \
    -IQueryResults/546 \
    -IQueryResults/547 \
    -IQueryResults/548 \
    -IQueryResults/549 \
    -IQueryResults/55 \
    -IQueryResults/550 \
    -IQueryResults/551 \
    -IQueryResults/552 \
    -IQueryResults/553 \
    -IQueryResults/554 \
    -IQueryResults/555 \
    -IQueryResults/556 \
    -IQueryResults/557 \
    -IQueryResults/558 \
    -IQueryResults/559 \
    -IQueryResults/56 \
    -IQueryResults/560 \
    -IQueryResults/561 \
    -IQueryResults/562 \
    -IQueryResults/563 \
    -IQueryResults/564 \
    -IQueryResults/565 \
    -IQueryResults/566 \
    -IQueryResults/567 \
    -IQueryResults/568 \
    -IQueryResults/569 \
    -IQueryResults/57 \
    -IQueryResults/570 \
    -IQueryResults/571 \
    -IQueryResults/572 \
    -IQueryResults/573 \
    -IQueryResults/574 \
    -IQueryResults/575 \
    -IQueryResults/576 \
    -IQueryResults/577 \
    -IQueryResults/578 \
    -IQueryResults/579 \
    -IQueryResults/58 \
    -IQueryResults/580 \
    -IQueryResults/581 \
    -IQueryResults/582 \
    -IQueryResults/583 \
    -IQueryResults/584 \
    -IQueryResults/585 \
    -IQueryResults/586 \
    -IQueryResults/587 \
    -IQueryResults/588 \
    -IQueryResults/589 \
    -IQueryResults/59 \
    -IQueryResults/590 \
    -IQueryResults/591 \
    -IQueryResults/592 \
    -IQueryResults/593 \
    -IQueryResults/594 \
    -IQueryResults/595 \
    -IQueryResults/596 \
    -IQueryResults/597 \
    -IQueryResults/598 \
    -IQueryResults/599 \
    -IQueryResults/6 \
    -IQueryResults/60 \
    -IQueryResults/61 \
    -IQueryResults/62 \
    -IQueryResults/63 \
    -IQueryResults/64 \
    -IQueryResults/65 \
    -IQueryResults/66 \
    -IQueryResults/67 \
    -IQueryResults/68 \
    -IQueryResults/69 \
    -IQueryResults/7 \
    -IQueryResults/70 \
    -IQueryResults/71 \
    -IQueryResults/72 \
    -IQueryResults/73 \
    -IQueryResults/74 \
    -IQueryResults/75 \
    -IQueryResults/76 \
    -IQueryResults/77 \
    -IQueryResults/78 \
    -IQueryResults/79 \
    -IQueryResults/8 \
    -IQueryResults/80 \
    -IQueryResults/81 \
    -IQueryResults/82 \
    -IQueryResults/83 \
    -IQueryResults/84 \
    -IQueryResults/85 \
    -IQueryResults/86 \
    -IQueryResults/87 \
    -IQueryResults/88 \
    -IQueryResults/89 \
    -IQueryResults/9 \
    -IQueryResults/90 \
    -IQueryResults/91 \
    -IQueryResults/92 \
    -IQueryResults/93 \
    -IQueryResults/94 \
    -IQueryResults/95 \
    -IQueryResults/96 \
    -IQueryResults/97 \
    -IQueryResults/98 \
    -IQueryResults/99 \
    -Ijson \
    -Iresults \
    -Iresults/100 \
    -Iresults/1000 \
    -Iresults/1000_new \
    -Iresults/10_1000 \
    -Iresults/10_200 \
    -Iresults/10_3000 \
    -Iresults/10mps \
    -Iresults/17mps \
    -Iresults/1mps \
    -Iresults/200 \
    -Iresults/300 \
    -Iresults/3mps \
    -Iresults/400 \
    -Iresults/50 \
    -Iresults/500 \
    -Iresults/500_new \
    -Iresults/50n \
    -Iresults/5mps \
    -Iresults/600 \
    -Iresults/600_100 \
    -Iresults/600_200 \
    -Iresults/600_30 \
    -Iresults/600_lamda \
    -Iresults/600_lamda_new \
    -Iresults/600_new \
    -Iresults/600_queryNumber \
    -Iresults/600_reviews \
    -Iresults/700 \
    -Iresults/700new \
    -Iresults/800 \
    -Iresults/800_new \
    -Iresults/900 \
    -Iresults/900_new \
    -Iresults/querytime

# Additional object and library files to link with
EXTRA_OBJS =

# Additional libraries (-L, -l options)
LIBS = -L../MiXiM/out/$(CONFIGNAME)/src  -lmixim
LIBS += -Wl,-rpath,`abspath ../MiXiM/out/$(CONFIGNAME)/src`

# Output directory
PROJECT_OUTPUT_DIR = out
PROJECTRELATIVE_PATH =
O = $(PROJECT_OUTPUT_DIR)/$(CONFIGNAME)/$(PROJECTRELATIVE_PATH)

# Object files for local .cc and .msg files
OBJS = \
    $O/jsoncpp.o \
    $O/Util.o \
    $O/MyApplicationLayer.o \
    $O/BSApp.o \
    $O/QueryScore.o \
    $O/BeaconReply_m.o \
    $O/QueryReply_m.o \
    $O/Beacon_m.o \
    $O/Query_m.o

# Message files
MSGFILES = \
    BeaconReply.msg \
    QueryReply.msg \
    Beacon.msg \
    Query.msg

# Other makefile variables (-K)
MIXIM_PROJ=../MiXiM

#------------------------------------------------------------------------------

# Pull in OMNeT++ configuration (Makefile.inc or configuser.vc)

ifneq ("$(OMNETPP_CONFIGFILE)","")
CONFIGFILE = $(OMNETPP_CONFIGFILE)
else
ifneq ("$(OMNETPP_ROOT)","")
CONFIGFILE = $(OMNETPP_ROOT)/Makefile.inc
else
CONFIGFILE = $(shell opp_configfilepath)
endif
endif

ifeq ("$(wildcard $(CONFIGFILE))","")
$(error Config file '$(CONFIGFILE)' does not exist -- add the OMNeT++ bin directory to the path so that opp_configfilepath can be found, or set the OMNETPP_CONFIGFILE variable to point to Makefile.inc)
endif

include $(CONFIGFILE)

# Simulation kernel and user interface libraries
OMNETPP_LIB_SUBDIR = $(OMNETPP_LIB_DIR)/$(TOOLCHAIN_NAME)
OMNETPP_LIBS = -L"$(OMNETPP_LIB_SUBDIR)" -L"$(OMNETPP_LIB_DIR)" -loppmain$D $(USERIF_LIBS) $(KERNEL_LIBS) $(SYS_LIBS)

COPTS = $(CFLAGS)  $(INCLUDE_PATH) -I$(OMNETPP_INCL_DIR)
MSGCOPTS = $(INCLUDE_PATH)

# we want to recompile everything if COPTS changes,
# so we store COPTS into $COPTS_FILE and have object
# files depend on it (except when "make depend" was called)
COPTS_FILE = $O/.last-copts
ifneq ($(MAKECMDGOALS),depend)
ifneq ("$(COPTS)","$(shell cat $(COPTS_FILE) 2>/dev/null || echo '')")
$(shell $(MKPATH) "$O" && echo "$(COPTS)" >$(COPTS_FILE))
endif
endif

#------------------------------------------------------------------------------
# User-supplied makefile fragment(s)
# >>>
# <<<
#------------------------------------------------------------------------------

# Main target
all: $O/$(TARGET)
	$(Q)$(LN) $O/$(TARGET) .

$O/$(TARGET): $(OBJS)  $(wildcard $(EXTRA_OBJS)) Makefile
	@$(MKPATH) $O
	@echo Creating executable: $@
	$(Q)$(CXX) $(LDFLAGS) -o $O/$(TARGET)  $(OBJS) $(EXTRA_OBJS) $(AS_NEEDED_OFF) $(WHOLE_ARCHIVE_ON) $(LIBS) $(WHOLE_ARCHIVE_OFF) $(OMNETPP_LIBS)

.PHONY: all clean cleanall depend msgheaders

.SUFFIXES: .cc

$O/%.o: %.cc $(COPTS_FILE)
	@$(MKPATH) $(dir $@)
	$(qecho) "$<"
	$(Q)$(CXX) -c $(CXXFLAGS) $(COPTS) -o $@ $<

%_m.cc %_m.h: %.msg
	$(qecho) MSGC: $<
	$(Q)$(MSGC) -s _m.cc $(MSGCOPTS) $?

msgheaders: $(MSGFILES:.msg=_m.h)

clean:
	$(qecho) Cleaning...
	$(Q)-rm -rf $O
	$(Q)-rm -f P2P_Wireless_Wifi P2P_Wireless_Wifi.exe libP2P_Wireless_Wifi.so libP2P_Wireless_Wifi.a libP2P_Wireless_Wifi.dll libP2P_Wireless_Wifi.dylib
	$(Q)-rm -f ./*_m.cc ./*_m.h
	$(Q)-rm -f QueryResults/*_m.cc QueryResults/*_m.h
	$(Q)-rm -f QueryResults/0/*_m.cc QueryResults/0/*_m.h
	$(Q)-rm -f QueryResults/1/*_m.cc QueryResults/1/*_m.h
	$(Q)-rm -f QueryResults/10/*_m.cc QueryResults/10/*_m.h
	$(Q)-rm -f QueryResults/100/*_m.cc QueryResults/100/*_m.h
	$(Q)-rm -f QueryResults/101/*_m.cc QueryResults/101/*_m.h
	$(Q)-rm -f QueryResults/102/*_m.cc QueryResults/102/*_m.h
	$(Q)-rm -f QueryResults/103/*_m.cc QueryResults/103/*_m.h
	$(Q)-rm -f QueryResults/104/*_m.cc QueryResults/104/*_m.h
	$(Q)-rm -f QueryResults/105/*_m.cc QueryResults/105/*_m.h
	$(Q)-rm -f QueryResults/106/*_m.cc QueryResults/106/*_m.h
	$(Q)-rm -f QueryResults/107/*_m.cc QueryResults/107/*_m.h
	$(Q)-rm -f QueryResults/108/*_m.cc QueryResults/108/*_m.h
	$(Q)-rm -f QueryResults/109/*_m.cc QueryResults/109/*_m.h
	$(Q)-rm -f QueryResults/11/*_m.cc QueryResults/11/*_m.h
	$(Q)-rm -f QueryResults/110/*_m.cc QueryResults/110/*_m.h
	$(Q)-rm -f QueryResults/111/*_m.cc QueryResults/111/*_m.h
	$(Q)-rm -f QueryResults/112/*_m.cc QueryResults/112/*_m.h
	$(Q)-rm -f QueryResults/113/*_m.cc QueryResults/113/*_m.h
	$(Q)-rm -f QueryResults/114/*_m.cc QueryResults/114/*_m.h
	$(Q)-rm -f QueryResults/115/*_m.cc QueryResults/115/*_m.h
	$(Q)-rm -f QueryResults/116/*_m.cc QueryResults/116/*_m.h
	$(Q)-rm -f QueryResults/117/*_m.cc QueryResults/117/*_m.h
	$(Q)-rm -f QueryResults/118/*_m.cc QueryResults/118/*_m.h
	$(Q)-rm -f QueryResults/119/*_m.cc QueryResults/119/*_m.h
	$(Q)-rm -f QueryResults/12/*_m.cc QueryResults/12/*_m.h
	$(Q)-rm -f QueryResults/120/*_m.cc QueryResults/120/*_m.h
	$(Q)-rm -f QueryResults/121/*_m.cc QueryResults/121/*_m.h
	$(Q)-rm -f QueryResults/122/*_m.cc QueryResults/122/*_m.h
	$(Q)-rm -f QueryResults/123/*_m.cc QueryResults/123/*_m.h
	$(Q)-rm -f QueryResults/124/*_m.cc QueryResults/124/*_m.h
	$(Q)-rm -f QueryResults/125/*_m.cc QueryResults/125/*_m.h
	$(Q)-rm -f QueryResults/126/*_m.cc QueryResults/126/*_m.h
	$(Q)-rm -f QueryResults/127/*_m.cc QueryResults/127/*_m.h
	$(Q)-rm -f QueryResults/128/*_m.cc QueryResults/128/*_m.h
	$(Q)-rm -f QueryResults/129/*_m.cc QueryResults/129/*_m.h
	$(Q)-rm -f QueryResults/13/*_m.cc QueryResults/13/*_m.h
	$(Q)-rm -f QueryResults/130/*_m.cc QueryResults/130/*_m.h
	$(Q)-rm -f QueryResults/131/*_m.cc QueryResults/131/*_m.h
	$(Q)-rm -f QueryResults/132/*_m.cc QueryResults/132/*_m.h
	$(Q)-rm -f QueryResults/133/*_m.cc QueryResults/133/*_m.h
	$(Q)-rm -f QueryResults/134/*_m.cc QueryResults/134/*_m.h
	$(Q)-rm -f QueryResults/135/*_m.cc QueryResults/135/*_m.h
	$(Q)-rm -f QueryResults/136/*_m.cc QueryResults/136/*_m.h
	$(Q)-rm -f QueryResults/137/*_m.cc QueryResults/137/*_m.h
	$(Q)-rm -f QueryResults/138/*_m.cc QueryResults/138/*_m.h
	$(Q)-rm -f QueryResults/139/*_m.cc QueryResults/139/*_m.h
	$(Q)-rm -f QueryResults/14/*_m.cc QueryResults/14/*_m.h
	$(Q)-rm -f QueryResults/140/*_m.cc QueryResults/140/*_m.h
	$(Q)-rm -f QueryResults/141/*_m.cc QueryResults/141/*_m.h
	$(Q)-rm -f QueryResults/142/*_m.cc QueryResults/142/*_m.h
	$(Q)-rm -f QueryResults/143/*_m.cc QueryResults/143/*_m.h
	$(Q)-rm -f QueryResults/144/*_m.cc QueryResults/144/*_m.h
	$(Q)-rm -f QueryResults/145/*_m.cc QueryResults/145/*_m.h
	$(Q)-rm -f QueryResults/146/*_m.cc QueryResults/146/*_m.h
	$(Q)-rm -f QueryResults/147/*_m.cc QueryResults/147/*_m.h
	$(Q)-rm -f QueryResults/148/*_m.cc QueryResults/148/*_m.h
	$(Q)-rm -f QueryResults/149/*_m.cc QueryResults/149/*_m.h
	$(Q)-rm -f QueryResults/15/*_m.cc QueryResults/15/*_m.h
	$(Q)-rm -f QueryResults/150/*_m.cc QueryResults/150/*_m.h
	$(Q)-rm -f QueryResults/151/*_m.cc QueryResults/151/*_m.h
	$(Q)-rm -f QueryResults/152/*_m.cc QueryResults/152/*_m.h
	$(Q)-rm -f QueryResults/153/*_m.cc QueryResults/153/*_m.h
	$(Q)-rm -f QueryResults/154/*_m.cc QueryResults/154/*_m.h
	$(Q)-rm -f QueryResults/155/*_m.cc QueryResults/155/*_m.h
	$(Q)-rm -f QueryResults/156/*_m.cc QueryResults/156/*_m.h
	$(Q)-rm -f QueryResults/157/*_m.cc QueryResults/157/*_m.h
	$(Q)-rm -f QueryResults/158/*_m.cc QueryResults/158/*_m.h
	$(Q)-rm -f QueryResults/159/*_m.cc QueryResults/159/*_m.h
	$(Q)-rm -f QueryResults/16/*_m.cc QueryResults/16/*_m.h
	$(Q)-rm -f QueryResults/160/*_m.cc QueryResults/160/*_m.h
	$(Q)-rm -f QueryResults/161/*_m.cc QueryResults/161/*_m.h
	$(Q)-rm -f QueryResults/162/*_m.cc QueryResults/162/*_m.h
	$(Q)-rm -f QueryResults/163/*_m.cc QueryResults/163/*_m.h
	$(Q)-rm -f QueryResults/164/*_m.cc QueryResults/164/*_m.h
	$(Q)-rm -f QueryResults/165/*_m.cc QueryResults/165/*_m.h
	$(Q)-rm -f QueryResults/166/*_m.cc QueryResults/166/*_m.h
	$(Q)-rm -f QueryResults/167/*_m.cc QueryResults/167/*_m.h
	$(Q)-rm -f QueryResults/168/*_m.cc QueryResults/168/*_m.h
	$(Q)-rm -f QueryResults/169/*_m.cc QueryResults/169/*_m.h
	$(Q)-rm -f QueryResults/17/*_m.cc QueryResults/17/*_m.h
	$(Q)-rm -f QueryResults/170/*_m.cc QueryResults/170/*_m.h
	$(Q)-rm -f QueryResults/171/*_m.cc QueryResults/171/*_m.h
	$(Q)-rm -f QueryResults/172/*_m.cc QueryResults/172/*_m.h
	$(Q)-rm -f QueryResults/173/*_m.cc QueryResults/173/*_m.h
	$(Q)-rm -f QueryResults/174/*_m.cc QueryResults/174/*_m.h
	$(Q)-rm -f QueryResults/175/*_m.cc QueryResults/175/*_m.h
	$(Q)-rm -f QueryResults/176/*_m.cc QueryResults/176/*_m.h
	$(Q)-rm -f QueryResults/177/*_m.cc QueryResults/177/*_m.h
	$(Q)-rm -f QueryResults/178/*_m.cc QueryResults/178/*_m.h
	$(Q)-rm -f QueryResults/179/*_m.cc QueryResults/179/*_m.h
	$(Q)-rm -f QueryResults/18/*_m.cc QueryResults/18/*_m.h
	$(Q)-rm -f QueryResults/180/*_m.cc QueryResults/180/*_m.h
	$(Q)-rm -f QueryResults/181/*_m.cc QueryResults/181/*_m.h
	$(Q)-rm -f QueryResults/182/*_m.cc QueryResults/182/*_m.h
	$(Q)-rm -f QueryResults/183/*_m.cc QueryResults/183/*_m.h
	$(Q)-rm -f QueryResults/184/*_m.cc QueryResults/184/*_m.h
	$(Q)-rm -f QueryResults/185/*_m.cc QueryResults/185/*_m.h
	$(Q)-rm -f QueryResults/186/*_m.cc QueryResults/186/*_m.h
	$(Q)-rm -f QueryResults/187/*_m.cc QueryResults/187/*_m.h
	$(Q)-rm -f QueryResults/188/*_m.cc QueryResults/188/*_m.h
	$(Q)-rm -f QueryResults/189/*_m.cc QueryResults/189/*_m.h
	$(Q)-rm -f QueryResults/19/*_m.cc QueryResults/19/*_m.h
	$(Q)-rm -f QueryResults/190/*_m.cc QueryResults/190/*_m.h
	$(Q)-rm -f QueryResults/191/*_m.cc QueryResults/191/*_m.h
	$(Q)-rm -f QueryResults/192/*_m.cc QueryResults/192/*_m.h
	$(Q)-rm -f QueryResults/193/*_m.cc QueryResults/193/*_m.h
	$(Q)-rm -f QueryResults/194/*_m.cc QueryResults/194/*_m.h
	$(Q)-rm -f QueryResults/195/*_m.cc QueryResults/195/*_m.h
	$(Q)-rm -f QueryResults/196/*_m.cc QueryResults/196/*_m.h
	$(Q)-rm -f QueryResults/197/*_m.cc QueryResults/197/*_m.h
	$(Q)-rm -f QueryResults/198/*_m.cc QueryResults/198/*_m.h
	$(Q)-rm -f QueryResults/199/*_m.cc QueryResults/199/*_m.h
	$(Q)-rm -f QueryResults/2/*_m.cc QueryResults/2/*_m.h
	$(Q)-rm -f QueryResults/20/*_m.cc QueryResults/20/*_m.h
	$(Q)-rm -f QueryResults/200/*_m.cc QueryResults/200/*_m.h
	$(Q)-rm -f QueryResults/201/*_m.cc QueryResults/201/*_m.h
	$(Q)-rm -f QueryResults/202/*_m.cc QueryResults/202/*_m.h
	$(Q)-rm -f QueryResults/203/*_m.cc QueryResults/203/*_m.h
	$(Q)-rm -f QueryResults/204/*_m.cc QueryResults/204/*_m.h
	$(Q)-rm -f QueryResults/205/*_m.cc QueryResults/205/*_m.h
	$(Q)-rm -f QueryResults/206/*_m.cc QueryResults/206/*_m.h
	$(Q)-rm -f QueryResults/207/*_m.cc QueryResults/207/*_m.h
	$(Q)-rm -f QueryResults/208/*_m.cc QueryResults/208/*_m.h
	$(Q)-rm -f QueryResults/209/*_m.cc QueryResults/209/*_m.h
	$(Q)-rm -f QueryResults/21/*_m.cc QueryResults/21/*_m.h
	$(Q)-rm -f QueryResults/210/*_m.cc QueryResults/210/*_m.h
	$(Q)-rm -f QueryResults/211/*_m.cc QueryResults/211/*_m.h
	$(Q)-rm -f QueryResults/212/*_m.cc QueryResults/212/*_m.h
	$(Q)-rm -f QueryResults/213/*_m.cc QueryResults/213/*_m.h
	$(Q)-rm -f QueryResults/214/*_m.cc QueryResults/214/*_m.h
	$(Q)-rm -f QueryResults/215/*_m.cc QueryResults/215/*_m.h
	$(Q)-rm -f QueryResults/216/*_m.cc QueryResults/216/*_m.h
	$(Q)-rm -f QueryResults/217/*_m.cc QueryResults/217/*_m.h
	$(Q)-rm -f QueryResults/218/*_m.cc QueryResults/218/*_m.h
	$(Q)-rm -f QueryResults/219/*_m.cc QueryResults/219/*_m.h
	$(Q)-rm -f QueryResults/22/*_m.cc QueryResults/22/*_m.h
	$(Q)-rm -f QueryResults/220/*_m.cc QueryResults/220/*_m.h
	$(Q)-rm -f QueryResults/221/*_m.cc QueryResults/221/*_m.h
	$(Q)-rm -f QueryResults/222/*_m.cc QueryResults/222/*_m.h
	$(Q)-rm -f QueryResults/223/*_m.cc QueryResults/223/*_m.h
	$(Q)-rm -f QueryResults/224/*_m.cc QueryResults/224/*_m.h
	$(Q)-rm -f QueryResults/225/*_m.cc QueryResults/225/*_m.h
	$(Q)-rm -f QueryResults/226/*_m.cc QueryResults/226/*_m.h
	$(Q)-rm -f QueryResults/227/*_m.cc QueryResults/227/*_m.h
	$(Q)-rm -f QueryResults/228/*_m.cc QueryResults/228/*_m.h
	$(Q)-rm -f QueryResults/229/*_m.cc QueryResults/229/*_m.h
	$(Q)-rm -f QueryResults/23/*_m.cc QueryResults/23/*_m.h
	$(Q)-rm -f QueryResults/230/*_m.cc QueryResults/230/*_m.h
	$(Q)-rm -f QueryResults/231/*_m.cc QueryResults/231/*_m.h
	$(Q)-rm -f QueryResults/232/*_m.cc QueryResults/232/*_m.h
	$(Q)-rm -f QueryResults/233/*_m.cc QueryResults/233/*_m.h
	$(Q)-rm -f QueryResults/234/*_m.cc QueryResults/234/*_m.h
	$(Q)-rm -f QueryResults/235/*_m.cc QueryResults/235/*_m.h
	$(Q)-rm -f QueryResults/236/*_m.cc QueryResults/236/*_m.h
	$(Q)-rm -f QueryResults/237/*_m.cc QueryResults/237/*_m.h
	$(Q)-rm -f QueryResults/238/*_m.cc QueryResults/238/*_m.h
	$(Q)-rm -f QueryResults/239/*_m.cc QueryResults/239/*_m.h
	$(Q)-rm -f QueryResults/24/*_m.cc QueryResults/24/*_m.h
	$(Q)-rm -f QueryResults/240/*_m.cc QueryResults/240/*_m.h
	$(Q)-rm -f QueryResults/241/*_m.cc QueryResults/241/*_m.h
	$(Q)-rm -f QueryResults/242/*_m.cc QueryResults/242/*_m.h
	$(Q)-rm -f QueryResults/243/*_m.cc QueryResults/243/*_m.h
	$(Q)-rm -f QueryResults/244/*_m.cc QueryResults/244/*_m.h
	$(Q)-rm -f QueryResults/245/*_m.cc QueryResults/245/*_m.h
	$(Q)-rm -f QueryResults/246/*_m.cc QueryResults/246/*_m.h
	$(Q)-rm -f QueryResults/247/*_m.cc QueryResults/247/*_m.h
	$(Q)-rm -f QueryResults/248/*_m.cc QueryResults/248/*_m.h
	$(Q)-rm -f QueryResults/249/*_m.cc QueryResults/249/*_m.h
	$(Q)-rm -f QueryResults/25/*_m.cc QueryResults/25/*_m.h
	$(Q)-rm -f QueryResults/250/*_m.cc QueryResults/250/*_m.h
	$(Q)-rm -f QueryResults/251/*_m.cc QueryResults/251/*_m.h
	$(Q)-rm -f QueryResults/252/*_m.cc QueryResults/252/*_m.h
	$(Q)-rm -f QueryResults/253/*_m.cc QueryResults/253/*_m.h
	$(Q)-rm -f QueryResults/254/*_m.cc QueryResults/254/*_m.h
	$(Q)-rm -f QueryResults/255/*_m.cc QueryResults/255/*_m.h
	$(Q)-rm -f QueryResults/256/*_m.cc QueryResults/256/*_m.h
	$(Q)-rm -f QueryResults/257/*_m.cc QueryResults/257/*_m.h
	$(Q)-rm -f QueryResults/258/*_m.cc QueryResults/258/*_m.h
	$(Q)-rm -f QueryResults/259/*_m.cc QueryResults/259/*_m.h
	$(Q)-rm -f QueryResults/26/*_m.cc QueryResults/26/*_m.h
	$(Q)-rm -f QueryResults/260/*_m.cc QueryResults/260/*_m.h
	$(Q)-rm -f QueryResults/261/*_m.cc QueryResults/261/*_m.h
	$(Q)-rm -f QueryResults/262/*_m.cc QueryResults/262/*_m.h
	$(Q)-rm -f QueryResults/263/*_m.cc QueryResults/263/*_m.h
	$(Q)-rm -f QueryResults/264/*_m.cc QueryResults/264/*_m.h
	$(Q)-rm -f QueryResults/265/*_m.cc QueryResults/265/*_m.h
	$(Q)-rm -f QueryResults/266/*_m.cc QueryResults/266/*_m.h
	$(Q)-rm -f QueryResults/267/*_m.cc QueryResults/267/*_m.h
	$(Q)-rm -f QueryResults/268/*_m.cc QueryResults/268/*_m.h
	$(Q)-rm -f QueryResults/269/*_m.cc QueryResults/269/*_m.h
	$(Q)-rm -f QueryResults/27/*_m.cc QueryResults/27/*_m.h
	$(Q)-rm -f QueryResults/270/*_m.cc QueryResults/270/*_m.h
	$(Q)-rm -f QueryResults/271/*_m.cc QueryResults/271/*_m.h
	$(Q)-rm -f QueryResults/272/*_m.cc QueryResults/272/*_m.h
	$(Q)-rm -f QueryResults/273/*_m.cc QueryResults/273/*_m.h
	$(Q)-rm -f QueryResults/274/*_m.cc QueryResults/274/*_m.h
	$(Q)-rm -f QueryResults/275/*_m.cc QueryResults/275/*_m.h
	$(Q)-rm -f QueryResults/276/*_m.cc QueryResults/276/*_m.h
	$(Q)-rm -f QueryResults/277/*_m.cc QueryResults/277/*_m.h
	$(Q)-rm -f QueryResults/278/*_m.cc QueryResults/278/*_m.h
	$(Q)-rm -f QueryResults/279/*_m.cc QueryResults/279/*_m.h
	$(Q)-rm -f QueryResults/28/*_m.cc QueryResults/28/*_m.h
	$(Q)-rm -f QueryResults/280/*_m.cc QueryResults/280/*_m.h
	$(Q)-rm -f QueryResults/281/*_m.cc QueryResults/281/*_m.h
	$(Q)-rm -f QueryResults/282/*_m.cc QueryResults/282/*_m.h
	$(Q)-rm -f QueryResults/283/*_m.cc QueryResults/283/*_m.h
	$(Q)-rm -f QueryResults/284/*_m.cc QueryResults/284/*_m.h
	$(Q)-rm -f QueryResults/285/*_m.cc QueryResults/285/*_m.h
	$(Q)-rm -f QueryResults/286/*_m.cc QueryResults/286/*_m.h
	$(Q)-rm -f QueryResults/287/*_m.cc QueryResults/287/*_m.h
	$(Q)-rm -f QueryResults/288/*_m.cc QueryResults/288/*_m.h
	$(Q)-rm -f QueryResults/289/*_m.cc QueryResults/289/*_m.h
	$(Q)-rm -f QueryResults/29/*_m.cc QueryResults/29/*_m.h
	$(Q)-rm -f QueryResults/290/*_m.cc QueryResults/290/*_m.h
	$(Q)-rm -f QueryResults/291/*_m.cc QueryResults/291/*_m.h
	$(Q)-rm -f QueryResults/292/*_m.cc QueryResults/292/*_m.h
	$(Q)-rm -f QueryResults/293/*_m.cc QueryResults/293/*_m.h
	$(Q)-rm -f QueryResults/294/*_m.cc QueryResults/294/*_m.h
	$(Q)-rm -f QueryResults/295/*_m.cc QueryResults/295/*_m.h
	$(Q)-rm -f QueryResults/296/*_m.cc QueryResults/296/*_m.h
	$(Q)-rm -f QueryResults/297/*_m.cc QueryResults/297/*_m.h
	$(Q)-rm -f QueryResults/298/*_m.cc QueryResults/298/*_m.h
	$(Q)-rm -f QueryResults/299/*_m.cc QueryResults/299/*_m.h
	$(Q)-rm -f QueryResults/3/*_m.cc QueryResults/3/*_m.h
	$(Q)-rm -f QueryResults/30/*_m.cc QueryResults/30/*_m.h
	$(Q)-rm -f QueryResults/300/*_m.cc QueryResults/300/*_m.h
	$(Q)-rm -f QueryResults/301/*_m.cc QueryResults/301/*_m.h
	$(Q)-rm -f QueryResults/302/*_m.cc QueryResults/302/*_m.h
	$(Q)-rm -f QueryResults/303/*_m.cc QueryResults/303/*_m.h
	$(Q)-rm -f QueryResults/304/*_m.cc QueryResults/304/*_m.h
	$(Q)-rm -f QueryResults/305/*_m.cc QueryResults/305/*_m.h
	$(Q)-rm -f QueryResults/306/*_m.cc QueryResults/306/*_m.h
	$(Q)-rm -f QueryResults/307/*_m.cc QueryResults/307/*_m.h
	$(Q)-rm -f QueryResults/308/*_m.cc QueryResults/308/*_m.h
	$(Q)-rm -f QueryResults/309/*_m.cc QueryResults/309/*_m.h
	$(Q)-rm -f QueryResults/31/*_m.cc QueryResults/31/*_m.h
	$(Q)-rm -f QueryResults/310/*_m.cc QueryResults/310/*_m.h
	$(Q)-rm -f QueryResults/311/*_m.cc QueryResults/311/*_m.h
	$(Q)-rm -f QueryResults/312/*_m.cc QueryResults/312/*_m.h
	$(Q)-rm -f QueryResults/313/*_m.cc QueryResults/313/*_m.h
	$(Q)-rm -f QueryResults/314/*_m.cc QueryResults/314/*_m.h
	$(Q)-rm -f QueryResults/315/*_m.cc QueryResults/315/*_m.h
	$(Q)-rm -f QueryResults/316/*_m.cc QueryResults/316/*_m.h
	$(Q)-rm -f QueryResults/317/*_m.cc QueryResults/317/*_m.h
	$(Q)-rm -f QueryResults/318/*_m.cc QueryResults/318/*_m.h
	$(Q)-rm -f QueryResults/319/*_m.cc QueryResults/319/*_m.h
	$(Q)-rm -f QueryResults/32/*_m.cc QueryResults/32/*_m.h
	$(Q)-rm -f QueryResults/320/*_m.cc QueryResults/320/*_m.h
	$(Q)-rm -f QueryResults/321/*_m.cc QueryResults/321/*_m.h
	$(Q)-rm -f QueryResults/322/*_m.cc QueryResults/322/*_m.h
	$(Q)-rm -f QueryResults/323/*_m.cc QueryResults/323/*_m.h
	$(Q)-rm -f QueryResults/324/*_m.cc QueryResults/324/*_m.h
	$(Q)-rm -f QueryResults/325/*_m.cc QueryResults/325/*_m.h
	$(Q)-rm -f QueryResults/326/*_m.cc QueryResults/326/*_m.h
	$(Q)-rm -f QueryResults/327/*_m.cc QueryResults/327/*_m.h
	$(Q)-rm -f QueryResults/328/*_m.cc QueryResults/328/*_m.h
	$(Q)-rm -f QueryResults/329/*_m.cc QueryResults/329/*_m.h
	$(Q)-rm -f QueryResults/33/*_m.cc QueryResults/33/*_m.h
	$(Q)-rm -f QueryResults/330/*_m.cc QueryResults/330/*_m.h
	$(Q)-rm -f QueryResults/331/*_m.cc QueryResults/331/*_m.h
	$(Q)-rm -f QueryResults/332/*_m.cc QueryResults/332/*_m.h
	$(Q)-rm -f QueryResults/333/*_m.cc QueryResults/333/*_m.h
	$(Q)-rm -f QueryResults/334/*_m.cc QueryResults/334/*_m.h
	$(Q)-rm -f QueryResults/335/*_m.cc QueryResults/335/*_m.h
	$(Q)-rm -f QueryResults/336/*_m.cc QueryResults/336/*_m.h
	$(Q)-rm -f QueryResults/337/*_m.cc QueryResults/337/*_m.h
	$(Q)-rm -f QueryResults/338/*_m.cc QueryResults/338/*_m.h
	$(Q)-rm -f QueryResults/339/*_m.cc QueryResults/339/*_m.h
	$(Q)-rm -f QueryResults/34/*_m.cc QueryResults/34/*_m.h
	$(Q)-rm -f QueryResults/340/*_m.cc QueryResults/340/*_m.h
	$(Q)-rm -f QueryResults/341/*_m.cc QueryResults/341/*_m.h
	$(Q)-rm -f QueryResults/342/*_m.cc QueryResults/342/*_m.h
	$(Q)-rm -f QueryResults/343/*_m.cc QueryResults/343/*_m.h
	$(Q)-rm -f QueryResults/344/*_m.cc QueryResults/344/*_m.h
	$(Q)-rm -f QueryResults/345/*_m.cc QueryResults/345/*_m.h
	$(Q)-rm -f QueryResults/346/*_m.cc QueryResults/346/*_m.h
	$(Q)-rm -f QueryResults/347/*_m.cc QueryResults/347/*_m.h
	$(Q)-rm -f QueryResults/348/*_m.cc QueryResults/348/*_m.h
	$(Q)-rm -f QueryResults/349/*_m.cc QueryResults/349/*_m.h
	$(Q)-rm -f QueryResults/35/*_m.cc QueryResults/35/*_m.h
	$(Q)-rm -f QueryResults/350/*_m.cc QueryResults/350/*_m.h
	$(Q)-rm -f QueryResults/351/*_m.cc QueryResults/351/*_m.h
	$(Q)-rm -f QueryResults/352/*_m.cc QueryResults/352/*_m.h
	$(Q)-rm -f QueryResults/353/*_m.cc QueryResults/353/*_m.h
	$(Q)-rm -f QueryResults/354/*_m.cc QueryResults/354/*_m.h
	$(Q)-rm -f QueryResults/355/*_m.cc QueryResults/355/*_m.h
	$(Q)-rm -f QueryResults/356/*_m.cc QueryResults/356/*_m.h
	$(Q)-rm -f QueryResults/357/*_m.cc QueryResults/357/*_m.h
	$(Q)-rm -f QueryResults/358/*_m.cc QueryResults/358/*_m.h
	$(Q)-rm -f QueryResults/359/*_m.cc QueryResults/359/*_m.h
	$(Q)-rm -f QueryResults/36/*_m.cc QueryResults/36/*_m.h
	$(Q)-rm -f QueryResults/360/*_m.cc QueryResults/360/*_m.h
	$(Q)-rm -f QueryResults/361/*_m.cc QueryResults/361/*_m.h
	$(Q)-rm -f QueryResults/362/*_m.cc QueryResults/362/*_m.h
	$(Q)-rm -f QueryResults/363/*_m.cc QueryResults/363/*_m.h
	$(Q)-rm -f QueryResults/364/*_m.cc QueryResults/364/*_m.h
	$(Q)-rm -f QueryResults/365/*_m.cc QueryResults/365/*_m.h
	$(Q)-rm -f QueryResults/366/*_m.cc QueryResults/366/*_m.h
	$(Q)-rm -f QueryResults/367/*_m.cc QueryResults/367/*_m.h
	$(Q)-rm -f QueryResults/368/*_m.cc QueryResults/368/*_m.h
	$(Q)-rm -f QueryResults/369/*_m.cc QueryResults/369/*_m.h
	$(Q)-rm -f QueryResults/37/*_m.cc QueryResults/37/*_m.h
	$(Q)-rm -f QueryResults/370/*_m.cc QueryResults/370/*_m.h
	$(Q)-rm -f QueryResults/371/*_m.cc QueryResults/371/*_m.h
	$(Q)-rm -f QueryResults/372/*_m.cc QueryResults/372/*_m.h
	$(Q)-rm -f QueryResults/373/*_m.cc QueryResults/373/*_m.h
	$(Q)-rm -f QueryResults/374/*_m.cc QueryResults/374/*_m.h
	$(Q)-rm -f QueryResults/375/*_m.cc QueryResults/375/*_m.h
	$(Q)-rm -f QueryResults/376/*_m.cc QueryResults/376/*_m.h
	$(Q)-rm -f QueryResults/377/*_m.cc QueryResults/377/*_m.h
	$(Q)-rm -f QueryResults/378/*_m.cc QueryResults/378/*_m.h
	$(Q)-rm -f QueryResults/379/*_m.cc QueryResults/379/*_m.h
	$(Q)-rm -f QueryResults/38/*_m.cc QueryResults/38/*_m.h
	$(Q)-rm -f QueryResults/380/*_m.cc QueryResults/380/*_m.h
	$(Q)-rm -f QueryResults/381/*_m.cc QueryResults/381/*_m.h
	$(Q)-rm -f QueryResults/382/*_m.cc QueryResults/382/*_m.h
	$(Q)-rm -f QueryResults/383/*_m.cc QueryResults/383/*_m.h
	$(Q)-rm -f QueryResults/384/*_m.cc QueryResults/384/*_m.h
	$(Q)-rm -f QueryResults/385/*_m.cc QueryResults/385/*_m.h
	$(Q)-rm -f QueryResults/386/*_m.cc QueryResults/386/*_m.h
	$(Q)-rm -f QueryResults/387/*_m.cc QueryResults/387/*_m.h
	$(Q)-rm -f QueryResults/388/*_m.cc QueryResults/388/*_m.h
	$(Q)-rm -f QueryResults/389/*_m.cc QueryResults/389/*_m.h
	$(Q)-rm -f QueryResults/39/*_m.cc QueryResults/39/*_m.h
	$(Q)-rm -f QueryResults/390/*_m.cc QueryResults/390/*_m.h
	$(Q)-rm -f QueryResults/391/*_m.cc QueryResults/391/*_m.h
	$(Q)-rm -f QueryResults/392/*_m.cc QueryResults/392/*_m.h
	$(Q)-rm -f QueryResults/393/*_m.cc QueryResults/393/*_m.h
	$(Q)-rm -f QueryResults/394/*_m.cc QueryResults/394/*_m.h
	$(Q)-rm -f QueryResults/395/*_m.cc QueryResults/395/*_m.h
	$(Q)-rm -f QueryResults/396/*_m.cc QueryResults/396/*_m.h
	$(Q)-rm -f QueryResults/397/*_m.cc QueryResults/397/*_m.h
	$(Q)-rm -f QueryResults/398/*_m.cc QueryResults/398/*_m.h
	$(Q)-rm -f QueryResults/399/*_m.cc QueryResults/399/*_m.h
	$(Q)-rm -f QueryResults/4/*_m.cc QueryResults/4/*_m.h
	$(Q)-rm -f QueryResults/40/*_m.cc QueryResults/40/*_m.h
	$(Q)-rm -f QueryResults/400/*_m.cc QueryResults/400/*_m.h
	$(Q)-rm -f QueryResults/401/*_m.cc QueryResults/401/*_m.h
	$(Q)-rm -f QueryResults/402/*_m.cc QueryResults/402/*_m.h
	$(Q)-rm -f QueryResults/403/*_m.cc QueryResults/403/*_m.h
	$(Q)-rm -f QueryResults/404/*_m.cc QueryResults/404/*_m.h
	$(Q)-rm -f QueryResults/405/*_m.cc QueryResults/405/*_m.h
	$(Q)-rm -f QueryResults/406/*_m.cc QueryResults/406/*_m.h
	$(Q)-rm -f QueryResults/407/*_m.cc QueryResults/407/*_m.h
	$(Q)-rm -f QueryResults/408/*_m.cc QueryResults/408/*_m.h
	$(Q)-rm -f QueryResults/409/*_m.cc QueryResults/409/*_m.h
	$(Q)-rm -f QueryResults/41/*_m.cc QueryResults/41/*_m.h
	$(Q)-rm -f QueryResults/410/*_m.cc QueryResults/410/*_m.h
	$(Q)-rm -f QueryResults/411/*_m.cc QueryResults/411/*_m.h
	$(Q)-rm -f QueryResults/412/*_m.cc QueryResults/412/*_m.h
	$(Q)-rm -f QueryResults/413/*_m.cc QueryResults/413/*_m.h
	$(Q)-rm -f QueryResults/414/*_m.cc QueryResults/414/*_m.h
	$(Q)-rm -f QueryResults/415/*_m.cc QueryResults/415/*_m.h
	$(Q)-rm -f QueryResults/416/*_m.cc QueryResults/416/*_m.h
	$(Q)-rm -f QueryResults/417/*_m.cc QueryResults/417/*_m.h
	$(Q)-rm -f QueryResults/418/*_m.cc QueryResults/418/*_m.h
	$(Q)-rm -f QueryResults/419/*_m.cc QueryResults/419/*_m.h
	$(Q)-rm -f QueryResults/42/*_m.cc QueryResults/42/*_m.h
	$(Q)-rm -f QueryResults/420/*_m.cc QueryResults/420/*_m.h
	$(Q)-rm -f QueryResults/421/*_m.cc QueryResults/421/*_m.h
	$(Q)-rm -f QueryResults/422/*_m.cc QueryResults/422/*_m.h
	$(Q)-rm -f QueryResults/423/*_m.cc QueryResults/423/*_m.h
	$(Q)-rm -f QueryResults/424/*_m.cc QueryResults/424/*_m.h
	$(Q)-rm -f QueryResults/425/*_m.cc QueryResults/425/*_m.h
	$(Q)-rm -f QueryResults/426/*_m.cc QueryResults/426/*_m.h
	$(Q)-rm -f QueryResults/427/*_m.cc QueryResults/427/*_m.h
	$(Q)-rm -f QueryResults/428/*_m.cc QueryResults/428/*_m.h
	$(Q)-rm -f QueryResults/429/*_m.cc QueryResults/429/*_m.h
	$(Q)-rm -f QueryResults/43/*_m.cc QueryResults/43/*_m.h
	$(Q)-rm -f QueryResults/430/*_m.cc QueryResults/430/*_m.h
	$(Q)-rm -f QueryResults/431/*_m.cc QueryResults/431/*_m.h
	$(Q)-rm -f QueryResults/432/*_m.cc QueryResults/432/*_m.h
	$(Q)-rm -f QueryResults/433/*_m.cc QueryResults/433/*_m.h
	$(Q)-rm -f QueryResults/434/*_m.cc QueryResults/434/*_m.h
	$(Q)-rm -f QueryResults/435/*_m.cc QueryResults/435/*_m.h
	$(Q)-rm -f QueryResults/436/*_m.cc QueryResults/436/*_m.h
	$(Q)-rm -f QueryResults/437/*_m.cc QueryResults/437/*_m.h
	$(Q)-rm -f QueryResults/438/*_m.cc QueryResults/438/*_m.h
	$(Q)-rm -f QueryResults/439/*_m.cc QueryResults/439/*_m.h
	$(Q)-rm -f QueryResults/44/*_m.cc QueryResults/44/*_m.h
	$(Q)-rm -f QueryResults/440/*_m.cc QueryResults/440/*_m.h
	$(Q)-rm -f QueryResults/441/*_m.cc QueryResults/441/*_m.h
	$(Q)-rm -f QueryResults/442/*_m.cc QueryResults/442/*_m.h
	$(Q)-rm -f QueryResults/443/*_m.cc QueryResults/443/*_m.h
	$(Q)-rm -f QueryResults/444/*_m.cc QueryResults/444/*_m.h
	$(Q)-rm -f QueryResults/445/*_m.cc QueryResults/445/*_m.h
	$(Q)-rm -f QueryResults/446/*_m.cc QueryResults/446/*_m.h
	$(Q)-rm -f QueryResults/447/*_m.cc QueryResults/447/*_m.h
	$(Q)-rm -f QueryResults/448/*_m.cc QueryResults/448/*_m.h
	$(Q)-rm -f QueryResults/449/*_m.cc QueryResults/449/*_m.h
	$(Q)-rm -f QueryResults/45/*_m.cc QueryResults/45/*_m.h
	$(Q)-rm -f QueryResults/450/*_m.cc QueryResults/450/*_m.h
	$(Q)-rm -f QueryResults/451/*_m.cc QueryResults/451/*_m.h
	$(Q)-rm -f QueryResults/452/*_m.cc QueryResults/452/*_m.h
	$(Q)-rm -f QueryResults/453/*_m.cc QueryResults/453/*_m.h
	$(Q)-rm -f QueryResults/454/*_m.cc QueryResults/454/*_m.h
	$(Q)-rm -f QueryResults/455/*_m.cc QueryResults/455/*_m.h
	$(Q)-rm -f QueryResults/456/*_m.cc QueryResults/456/*_m.h
	$(Q)-rm -f QueryResults/457/*_m.cc QueryResults/457/*_m.h
	$(Q)-rm -f QueryResults/458/*_m.cc QueryResults/458/*_m.h
	$(Q)-rm -f QueryResults/459/*_m.cc QueryResults/459/*_m.h
	$(Q)-rm -f QueryResults/46/*_m.cc QueryResults/46/*_m.h
	$(Q)-rm -f QueryResults/460/*_m.cc QueryResults/460/*_m.h
	$(Q)-rm -f QueryResults/461/*_m.cc QueryResults/461/*_m.h
	$(Q)-rm -f QueryResults/462/*_m.cc QueryResults/462/*_m.h
	$(Q)-rm -f QueryResults/463/*_m.cc QueryResults/463/*_m.h
	$(Q)-rm -f QueryResults/464/*_m.cc QueryResults/464/*_m.h
	$(Q)-rm -f QueryResults/465/*_m.cc QueryResults/465/*_m.h
	$(Q)-rm -f QueryResults/466/*_m.cc QueryResults/466/*_m.h
	$(Q)-rm -f QueryResults/467/*_m.cc QueryResults/467/*_m.h
	$(Q)-rm -f QueryResults/468/*_m.cc QueryResults/468/*_m.h
	$(Q)-rm -f QueryResults/469/*_m.cc QueryResults/469/*_m.h
	$(Q)-rm -f QueryResults/47/*_m.cc QueryResults/47/*_m.h
	$(Q)-rm -f QueryResults/470/*_m.cc QueryResults/470/*_m.h
	$(Q)-rm -f QueryResults/471/*_m.cc QueryResults/471/*_m.h
	$(Q)-rm -f QueryResults/472/*_m.cc QueryResults/472/*_m.h
	$(Q)-rm -f QueryResults/473/*_m.cc QueryResults/473/*_m.h
	$(Q)-rm -f QueryResults/474/*_m.cc QueryResults/474/*_m.h
	$(Q)-rm -f QueryResults/475/*_m.cc QueryResults/475/*_m.h
	$(Q)-rm -f QueryResults/476/*_m.cc QueryResults/476/*_m.h
	$(Q)-rm -f QueryResults/477/*_m.cc QueryResults/477/*_m.h
	$(Q)-rm -f QueryResults/478/*_m.cc QueryResults/478/*_m.h
	$(Q)-rm -f QueryResults/479/*_m.cc QueryResults/479/*_m.h
	$(Q)-rm -f QueryResults/48/*_m.cc QueryResults/48/*_m.h
	$(Q)-rm -f QueryResults/480/*_m.cc QueryResults/480/*_m.h
	$(Q)-rm -f QueryResults/481/*_m.cc QueryResults/481/*_m.h
	$(Q)-rm -f QueryResults/482/*_m.cc QueryResults/482/*_m.h
	$(Q)-rm -f QueryResults/483/*_m.cc QueryResults/483/*_m.h
	$(Q)-rm -f QueryResults/484/*_m.cc QueryResults/484/*_m.h
	$(Q)-rm -f QueryResults/485/*_m.cc QueryResults/485/*_m.h
	$(Q)-rm -f QueryResults/486/*_m.cc QueryResults/486/*_m.h
	$(Q)-rm -f QueryResults/487/*_m.cc QueryResults/487/*_m.h
	$(Q)-rm -f QueryResults/488/*_m.cc QueryResults/488/*_m.h
	$(Q)-rm -f QueryResults/489/*_m.cc QueryResults/489/*_m.h
	$(Q)-rm -f QueryResults/49/*_m.cc QueryResults/49/*_m.h
	$(Q)-rm -f QueryResults/490/*_m.cc QueryResults/490/*_m.h
	$(Q)-rm -f QueryResults/491/*_m.cc QueryResults/491/*_m.h
	$(Q)-rm -f QueryResults/492/*_m.cc QueryResults/492/*_m.h
	$(Q)-rm -f QueryResults/493/*_m.cc QueryResults/493/*_m.h
	$(Q)-rm -f QueryResults/494/*_m.cc QueryResults/494/*_m.h
	$(Q)-rm -f QueryResults/495/*_m.cc QueryResults/495/*_m.h
	$(Q)-rm -f QueryResults/496/*_m.cc QueryResults/496/*_m.h
	$(Q)-rm -f QueryResults/497/*_m.cc QueryResults/497/*_m.h
	$(Q)-rm -f QueryResults/498/*_m.cc QueryResults/498/*_m.h
	$(Q)-rm -f QueryResults/499/*_m.cc QueryResults/499/*_m.h
	$(Q)-rm -f QueryResults/5/*_m.cc QueryResults/5/*_m.h
	$(Q)-rm -f QueryResults/50/*_m.cc QueryResults/50/*_m.h
	$(Q)-rm -f QueryResults/500/*_m.cc QueryResults/500/*_m.h
	$(Q)-rm -f QueryResults/501/*_m.cc QueryResults/501/*_m.h
	$(Q)-rm -f QueryResults/502/*_m.cc QueryResults/502/*_m.h
	$(Q)-rm -f QueryResults/503/*_m.cc QueryResults/503/*_m.h
	$(Q)-rm -f QueryResults/504/*_m.cc QueryResults/504/*_m.h
	$(Q)-rm -f QueryResults/505/*_m.cc QueryResults/505/*_m.h
	$(Q)-rm -f QueryResults/506/*_m.cc QueryResults/506/*_m.h
	$(Q)-rm -f QueryResults/507/*_m.cc QueryResults/507/*_m.h
	$(Q)-rm -f QueryResults/508/*_m.cc QueryResults/508/*_m.h
	$(Q)-rm -f QueryResults/509/*_m.cc QueryResults/509/*_m.h
	$(Q)-rm -f QueryResults/51/*_m.cc QueryResults/51/*_m.h
	$(Q)-rm -f QueryResults/510/*_m.cc QueryResults/510/*_m.h
	$(Q)-rm -f QueryResults/511/*_m.cc QueryResults/511/*_m.h
	$(Q)-rm -f QueryResults/512/*_m.cc QueryResults/512/*_m.h
	$(Q)-rm -f QueryResults/513/*_m.cc QueryResults/513/*_m.h
	$(Q)-rm -f QueryResults/514/*_m.cc QueryResults/514/*_m.h
	$(Q)-rm -f QueryResults/515/*_m.cc QueryResults/515/*_m.h
	$(Q)-rm -f QueryResults/516/*_m.cc QueryResults/516/*_m.h
	$(Q)-rm -f QueryResults/517/*_m.cc QueryResults/517/*_m.h
	$(Q)-rm -f QueryResults/518/*_m.cc QueryResults/518/*_m.h
	$(Q)-rm -f QueryResults/519/*_m.cc QueryResults/519/*_m.h
	$(Q)-rm -f QueryResults/52/*_m.cc QueryResults/52/*_m.h
	$(Q)-rm -f QueryResults/520/*_m.cc QueryResults/520/*_m.h
	$(Q)-rm -f QueryResults/521/*_m.cc QueryResults/521/*_m.h
	$(Q)-rm -f QueryResults/522/*_m.cc QueryResults/522/*_m.h
	$(Q)-rm -f QueryResults/523/*_m.cc QueryResults/523/*_m.h
	$(Q)-rm -f QueryResults/524/*_m.cc QueryResults/524/*_m.h
	$(Q)-rm -f QueryResults/525/*_m.cc QueryResults/525/*_m.h
	$(Q)-rm -f QueryResults/526/*_m.cc QueryResults/526/*_m.h
	$(Q)-rm -f QueryResults/527/*_m.cc QueryResults/527/*_m.h
	$(Q)-rm -f QueryResults/528/*_m.cc QueryResults/528/*_m.h
	$(Q)-rm -f QueryResults/529/*_m.cc QueryResults/529/*_m.h
	$(Q)-rm -f QueryResults/53/*_m.cc QueryResults/53/*_m.h
	$(Q)-rm -f QueryResults/530/*_m.cc QueryResults/530/*_m.h
	$(Q)-rm -f QueryResults/531/*_m.cc QueryResults/531/*_m.h
	$(Q)-rm -f QueryResults/532/*_m.cc QueryResults/532/*_m.h
	$(Q)-rm -f QueryResults/533/*_m.cc QueryResults/533/*_m.h
	$(Q)-rm -f QueryResults/534/*_m.cc QueryResults/534/*_m.h
	$(Q)-rm -f QueryResults/535/*_m.cc QueryResults/535/*_m.h
	$(Q)-rm -f QueryResults/536/*_m.cc QueryResults/536/*_m.h
	$(Q)-rm -f QueryResults/537/*_m.cc QueryResults/537/*_m.h
	$(Q)-rm -f QueryResults/538/*_m.cc QueryResults/538/*_m.h
	$(Q)-rm -f QueryResults/539/*_m.cc QueryResults/539/*_m.h
	$(Q)-rm -f QueryResults/54/*_m.cc QueryResults/54/*_m.h
	$(Q)-rm -f QueryResults/540/*_m.cc QueryResults/540/*_m.h
	$(Q)-rm -f QueryResults/541/*_m.cc QueryResults/541/*_m.h
	$(Q)-rm -f QueryResults/542/*_m.cc QueryResults/542/*_m.h
	$(Q)-rm -f QueryResults/543/*_m.cc QueryResults/543/*_m.h
	$(Q)-rm -f QueryResults/544/*_m.cc QueryResults/544/*_m.h
	$(Q)-rm -f QueryResults/545/*_m.cc QueryResults/545/*_m.h
	$(Q)-rm -f QueryResults/546/*_m.cc QueryResults/546/*_m.h
	$(Q)-rm -f QueryResults/547/*_m.cc QueryResults/547/*_m.h
	$(Q)-rm -f QueryResults/548/*_m.cc QueryResults/548/*_m.h
	$(Q)-rm -f QueryResults/549/*_m.cc QueryResults/549/*_m.h
	$(Q)-rm -f QueryResults/55/*_m.cc QueryResults/55/*_m.h
	$(Q)-rm -f QueryResults/550/*_m.cc QueryResults/550/*_m.h
	$(Q)-rm -f QueryResults/551/*_m.cc QueryResults/551/*_m.h
	$(Q)-rm -f QueryResults/552/*_m.cc QueryResults/552/*_m.h
	$(Q)-rm -f QueryResults/553/*_m.cc QueryResults/553/*_m.h
	$(Q)-rm -f QueryResults/554/*_m.cc QueryResults/554/*_m.h
	$(Q)-rm -f QueryResults/555/*_m.cc QueryResults/555/*_m.h
	$(Q)-rm -f QueryResults/556/*_m.cc QueryResults/556/*_m.h
	$(Q)-rm -f QueryResults/557/*_m.cc QueryResults/557/*_m.h
	$(Q)-rm -f QueryResults/558/*_m.cc QueryResults/558/*_m.h
	$(Q)-rm -f QueryResults/559/*_m.cc QueryResults/559/*_m.h
	$(Q)-rm -f QueryResults/56/*_m.cc QueryResults/56/*_m.h
	$(Q)-rm -f QueryResults/560/*_m.cc QueryResults/560/*_m.h
	$(Q)-rm -f QueryResults/561/*_m.cc QueryResults/561/*_m.h
	$(Q)-rm -f QueryResults/562/*_m.cc QueryResults/562/*_m.h
	$(Q)-rm -f QueryResults/563/*_m.cc QueryResults/563/*_m.h
	$(Q)-rm -f QueryResults/564/*_m.cc QueryResults/564/*_m.h
	$(Q)-rm -f QueryResults/565/*_m.cc QueryResults/565/*_m.h
	$(Q)-rm -f QueryResults/566/*_m.cc QueryResults/566/*_m.h
	$(Q)-rm -f QueryResults/567/*_m.cc QueryResults/567/*_m.h
	$(Q)-rm -f QueryResults/568/*_m.cc QueryResults/568/*_m.h
	$(Q)-rm -f QueryResults/569/*_m.cc QueryResults/569/*_m.h
	$(Q)-rm -f QueryResults/57/*_m.cc QueryResults/57/*_m.h
	$(Q)-rm -f QueryResults/570/*_m.cc QueryResults/570/*_m.h
	$(Q)-rm -f QueryResults/571/*_m.cc QueryResults/571/*_m.h
	$(Q)-rm -f QueryResults/572/*_m.cc QueryResults/572/*_m.h
	$(Q)-rm -f QueryResults/573/*_m.cc QueryResults/573/*_m.h
	$(Q)-rm -f QueryResults/574/*_m.cc QueryResults/574/*_m.h
	$(Q)-rm -f QueryResults/575/*_m.cc QueryResults/575/*_m.h
	$(Q)-rm -f QueryResults/576/*_m.cc QueryResults/576/*_m.h
	$(Q)-rm -f QueryResults/577/*_m.cc QueryResults/577/*_m.h
	$(Q)-rm -f QueryResults/578/*_m.cc QueryResults/578/*_m.h
	$(Q)-rm -f QueryResults/579/*_m.cc QueryResults/579/*_m.h
	$(Q)-rm -f QueryResults/58/*_m.cc QueryResults/58/*_m.h
	$(Q)-rm -f QueryResults/580/*_m.cc QueryResults/580/*_m.h
	$(Q)-rm -f QueryResults/581/*_m.cc QueryResults/581/*_m.h
	$(Q)-rm -f QueryResults/582/*_m.cc QueryResults/582/*_m.h
	$(Q)-rm -f QueryResults/583/*_m.cc QueryResults/583/*_m.h
	$(Q)-rm -f QueryResults/584/*_m.cc QueryResults/584/*_m.h
	$(Q)-rm -f QueryResults/585/*_m.cc QueryResults/585/*_m.h
	$(Q)-rm -f QueryResults/586/*_m.cc QueryResults/586/*_m.h
	$(Q)-rm -f QueryResults/587/*_m.cc QueryResults/587/*_m.h
	$(Q)-rm -f QueryResults/588/*_m.cc QueryResults/588/*_m.h
	$(Q)-rm -f QueryResults/589/*_m.cc QueryResults/589/*_m.h
	$(Q)-rm -f QueryResults/59/*_m.cc QueryResults/59/*_m.h
	$(Q)-rm -f QueryResults/590/*_m.cc QueryResults/590/*_m.h
	$(Q)-rm -f QueryResults/591/*_m.cc QueryResults/591/*_m.h
	$(Q)-rm -f QueryResults/592/*_m.cc QueryResults/592/*_m.h
	$(Q)-rm -f QueryResults/593/*_m.cc QueryResults/593/*_m.h
	$(Q)-rm -f QueryResults/594/*_m.cc QueryResults/594/*_m.h
	$(Q)-rm -f QueryResults/595/*_m.cc QueryResults/595/*_m.h
	$(Q)-rm -f QueryResults/596/*_m.cc QueryResults/596/*_m.h
	$(Q)-rm -f QueryResults/597/*_m.cc QueryResults/597/*_m.h
	$(Q)-rm -f QueryResults/598/*_m.cc QueryResults/598/*_m.h
	$(Q)-rm -f QueryResults/599/*_m.cc QueryResults/599/*_m.h
	$(Q)-rm -f QueryResults/6/*_m.cc QueryResults/6/*_m.h
	$(Q)-rm -f QueryResults/60/*_m.cc QueryResults/60/*_m.h
	$(Q)-rm -f QueryResults/61/*_m.cc QueryResults/61/*_m.h
	$(Q)-rm -f QueryResults/62/*_m.cc QueryResults/62/*_m.h
	$(Q)-rm -f QueryResults/63/*_m.cc QueryResults/63/*_m.h
	$(Q)-rm -f QueryResults/64/*_m.cc QueryResults/64/*_m.h
	$(Q)-rm -f QueryResults/65/*_m.cc QueryResults/65/*_m.h
	$(Q)-rm -f QueryResults/66/*_m.cc QueryResults/66/*_m.h
	$(Q)-rm -f QueryResults/67/*_m.cc QueryResults/67/*_m.h
	$(Q)-rm -f QueryResults/68/*_m.cc QueryResults/68/*_m.h
	$(Q)-rm -f QueryResults/69/*_m.cc QueryResults/69/*_m.h
	$(Q)-rm -f QueryResults/7/*_m.cc QueryResults/7/*_m.h
	$(Q)-rm -f QueryResults/70/*_m.cc QueryResults/70/*_m.h
	$(Q)-rm -f QueryResults/71/*_m.cc QueryResults/71/*_m.h
	$(Q)-rm -f QueryResults/72/*_m.cc QueryResults/72/*_m.h
	$(Q)-rm -f QueryResults/73/*_m.cc QueryResults/73/*_m.h
	$(Q)-rm -f QueryResults/74/*_m.cc QueryResults/74/*_m.h
	$(Q)-rm -f QueryResults/75/*_m.cc QueryResults/75/*_m.h
	$(Q)-rm -f QueryResults/76/*_m.cc QueryResults/76/*_m.h
	$(Q)-rm -f QueryResults/77/*_m.cc QueryResults/77/*_m.h
	$(Q)-rm -f QueryResults/78/*_m.cc QueryResults/78/*_m.h
	$(Q)-rm -f QueryResults/79/*_m.cc QueryResults/79/*_m.h
	$(Q)-rm -f QueryResults/8/*_m.cc QueryResults/8/*_m.h
	$(Q)-rm -f QueryResults/80/*_m.cc QueryResults/80/*_m.h
	$(Q)-rm -f QueryResults/81/*_m.cc QueryResults/81/*_m.h
	$(Q)-rm -f QueryResults/82/*_m.cc QueryResults/82/*_m.h
	$(Q)-rm -f QueryResults/83/*_m.cc QueryResults/83/*_m.h
	$(Q)-rm -f QueryResults/84/*_m.cc QueryResults/84/*_m.h
	$(Q)-rm -f QueryResults/85/*_m.cc QueryResults/85/*_m.h
	$(Q)-rm -f QueryResults/86/*_m.cc QueryResults/86/*_m.h
	$(Q)-rm -f QueryResults/87/*_m.cc QueryResults/87/*_m.h
	$(Q)-rm -f QueryResults/88/*_m.cc QueryResults/88/*_m.h
	$(Q)-rm -f QueryResults/89/*_m.cc QueryResults/89/*_m.h
	$(Q)-rm -f QueryResults/9/*_m.cc QueryResults/9/*_m.h
	$(Q)-rm -f QueryResults/90/*_m.cc QueryResults/90/*_m.h
	$(Q)-rm -f QueryResults/91/*_m.cc QueryResults/91/*_m.h
	$(Q)-rm -f QueryResults/92/*_m.cc QueryResults/92/*_m.h
	$(Q)-rm -f QueryResults/93/*_m.cc QueryResults/93/*_m.h
	$(Q)-rm -f QueryResults/94/*_m.cc QueryResults/94/*_m.h
	$(Q)-rm -f QueryResults/95/*_m.cc QueryResults/95/*_m.h
	$(Q)-rm -f QueryResults/96/*_m.cc QueryResults/96/*_m.h
	$(Q)-rm -f QueryResults/97/*_m.cc QueryResults/97/*_m.h
	$(Q)-rm -f QueryResults/98/*_m.cc QueryResults/98/*_m.h
	$(Q)-rm -f QueryResults/99/*_m.cc QueryResults/99/*_m.h
	$(Q)-rm -f json/*_m.cc json/*_m.h
	$(Q)-rm -f results/*_m.cc results/*_m.h
	$(Q)-rm -f results/100/*_m.cc results/100/*_m.h
	$(Q)-rm -f results/1000/*_m.cc results/1000/*_m.h
	$(Q)-rm -f results/1000_new/*_m.cc results/1000_new/*_m.h
	$(Q)-rm -f results/10_1000/*_m.cc results/10_1000/*_m.h
	$(Q)-rm -f results/10_200/*_m.cc results/10_200/*_m.h
	$(Q)-rm -f results/10_3000/*_m.cc results/10_3000/*_m.h
	$(Q)-rm -f results/10mps/*_m.cc results/10mps/*_m.h
	$(Q)-rm -f results/17mps/*_m.cc results/17mps/*_m.h
	$(Q)-rm -f results/1mps/*_m.cc results/1mps/*_m.h
	$(Q)-rm -f results/200/*_m.cc results/200/*_m.h
	$(Q)-rm -f results/300/*_m.cc results/300/*_m.h
	$(Q)-rm -f results/3mps/*_m.cc results/3mps/*_m.h
	$(Q)-rm -f results/400/*_m.cc results/400/*_m.h
	$(Q)-rm -f results/50/*_m.cc results/50/*_m.h
	$(Q)-rm -f results/500/*_m.cc results/500/*_m.h
	$(Q)-rm -f results/500_new/*_m.cc results/500_new/*_m.h
	$(Q)-rm -f results/50n/*_m.cc results/50n/*_m.h
	$(Q)-rm -f results/5mps/*_m.cc results/5mps/*_m.h
	$(Q)-rm -f results/600/*_m.cc results/600/*_m.h
	$(Q)-rm -f results/600_100/*_m.cc results/600_100/*_m.h
	$(Q)-rm -f results/600_200/*_m.cc results/600_200/*_m.h
	$(Q)-rm -f results/600_30/*_m.cc results/600_30/*_m.h
	$(Q)-rm -f results/600_lamda/*_m.cc results/600_lamda/*_m.h
	$(Q)-rm -f results/600_lamda_new/*_m.cc results/600_lamda_new/*_m.h
	$(Q)-rm -f results/600_new/*_m.cc results/600_new/*_m.h
	$(Q)-rm -f results/600_queryNumber/*_m.cc results/600_queryNumber/*_m.h
	$(Q)-rm -f results/600_reviews/*_m.cc results/600_reviews/*_m.h
	$(Q)-rm -f results/700/*_m.cc results/700/*_m.h
	$(Q)-rm -f results/700new/*_m.cc results/700new/*_m.h
	$(Q)-rm -f results/800/*_m.cc results/800/*_m.h
	$(Q)-rm -f results/800_new/*_m.cc results/800_new/*_m.h
	$(Q)-rm -f results/900/*_m.cc results/900/*_m.h
	$(Q)-rm -f results/900_new/*_m.cc results/900_new/*_m.h
	$(Q)-rm -f results/querytime/*_m.cc results/querytime/*_m.h

cleanall: clean
	$(Q)-rm -rf $(PROJECT_OUTPUT_DIR)

depend:
	$(qecho) Creating dependencies...
	$(Q)$(MAKEDEPEND) $(INCLUDE_PATH) -f Makefile -P\$$O/ -- $(MSG_CC_FILES)  ./*.cc QueryResults/*.cc QueryResults/0/*.cc QueryResults/1/*.cc QueryResults/10/*.cc QueryResults/100/*.cc QueryResults/101/*.cc QueryResults/102/*.cc QueryResults/103/*.cc QueryResults/104/*.cc QueryResults/105/*.cc QueryResults/106/*.cc QueryResults/107/*.cc QueryResults/108/*.cc QueryResults/109/*.cc QueryResults/11/*.cc QueryResults/110/*.cc QueryResults/111/*.cc QueryResults/112/*.cc QueryResults/113/*.cc QueryResults/114/*.cc QueryResults/115/*.cc QueryResults/116/*.cc QueryResults/117/*.cc QueryResults/118/*.cc QueryResults/119/*.cc QueryResults/12/*.cc QueryResults/120/*.cc QueryResults/121/*.cc QueryResults/122/*.cc QueryResults/123/*.cc QueryResults/124/*.cc QueryResults/125/*.cc QueryResults/126/*.cc QueryResults/127/*.cc QueryResults/128/*.cc QueryResults/129/*.cc QueryResults/13/*.cc QueryResults/130/*.cc QueryResults/131/*.cc QueryResults/132/*.cc QueryResults/133/*.cc QueryResults/134/*.cc QueryResults/135/*.cc QueryResults/136/*.cc QueryResults/137/*.cc QueryResults/138/*.cc QueryResults/139/*.cc QueryResults/14/*.cc QueryResults/140/*.cc QueryResults/141/*.cc QueryResults/142/*.cc QueryResults/143/*.cc QueryResults/144/*.cc QueryResults/145/*.cc QueryResults/146/*.cc QueryResults/147/*.cc QueryResults/148/*.cc QueryResults/149/*.cc QueryResults/15/*.cc QueryResults/150/*.cc QueryResults/151/*.cc QueryResults/152/*.cc QueryResults/153/*.cc QueryResults/154/*.cc QueryResults/155/*.cc QueryResults/156/*.cc QueryResults/157/*.cc QueryResults/158/*.cc QueryResults/159/*.cc QueryResults/16/*.cc QueryResults/160/*.cc QueryResults/161/*.cc QueryResults/162/*.cc QueryResults/163/*.cc QueryResults/164/*.cc QueryResults/165/*.cc QueryResults/166/*.cc QueryResults/167/*.cc QueryResults/168/*.cc QueryResults/169/*.cc QueryResults/17/*.cc QueryResults/170/*.cc QueryResults/171/*.cc QueryResults/172/*.cc QueryResults/173/*.cc QueryResults/174/*.cc QueryResults/175/*.cc QueryResults/176/*.cc QueryResults/177/*.cc QueryResults/178/*.cc QueryResults/179/*.cc QueryResults/18/*.cc QueryResults/180/*.cc QueryResults/181/*.cc QueryResults/182/*.cc QueryResults/183/*.cc QueryResults/184/*.cc QueryResults/185/*.cc QueryResults/186/*.cc QueryResults/187/*.cc QueryResults/188/*.cc QueryResults/189/*.cc QueryResults/19/*.cc QueryResults/190/*.cc QueryResults/191/*.cc QueryResults/192/*.cc QueryResults/193/*.cc QueryResults/194/*.cc QueryResults/195/*.cc QueryResults/196/*.cc QueryResults/197/*.cc QueryResults/198/*.cc QueryResults/199/*.cc QueryResults/2/*.cc QueryResults/20/*.cc QueryResults/200/*.cc QueryResults/201/*.cc QueryResults/202/*.cc QueryResults/203/*.cc QueryResults/204/*.cc QueryResults/205/*.cc QueryResults/206/*.cc QueryResults/207/*.cc QueryResults/208/*.cc QueryResults/209/*.cc QueryResults/21/*.cc QueryResults/210/*.cc QueryResults/211/*.cc QueryResults/212/*.cc QueryResults/213/*.cc QueryResults/214/*.cc QueryResults/215/*.cc QueryResults/216/*.cc QueryResults/217/*.cc QueryResults/218/*.cc QueryResults/219/*.cc QueryResults/22/*.cc QueryResults/220/*.cc QueryResults/221/*.cc QueryResults/222/*.cc QueryResults/223/*.cc QueryResults/224/*.cc QueryResults/225/*.cc QueryResults/226/*.cc QueryResults/227/*.cc QueryResults/228/*.cc QueryResults/229/*.cc QueryResults/23/*.cc QueryResults/230/*.cc QueryResults/231/*.cc QueryResults/232/*.cc QueryResults/233/*.cc QueryResults/234/*.cc QueryResults/235/*.cc QueryResults/236/*.cc QueryResults/237/*.cc QueryResults/238/*.cc QueryResults/239/*.cc QueryResults/24/*.cc QueryResults/240/*.cc QueryResults/241/*.cc QueryResults/242/*.cc QueryResults/243/*.cc QueryResults/244/*.cc QueryResults/245/*.cc QueryResults/246/*.cc QueryResults/247/*.cc QueryResults/248/*.cc QueryResults/249/*.cc QueryResults/25/*.cc QueryResults/250/*.cc QueryResults/251/*.cc QueryResults/252/*.cc QueryResults/253/*.cc QueryResults/254/*.cc QueryResults/255/*.cc QueryResults/256/*.cc QueryResults/257/*.cc QueryResults/258/*.cc QueryResults/259/*.cc QueryResults/26/*.cc QueryResults/260/*.cc QueryResults/261/*.cc QueryResults/262/*.cc QueryResults/263/*.cc QueryResults/264/*.cc QueryResults/265/*.cc QueryResults/266/*.cc QueryResults/267/*.cc QueryResults/268/*.cc QueryResults/269/*.cc QueryResults/27/*.cc QueryResults/270/*.cc QueryResults/271/*.cc QueryResults/272/*.cc QueryResults/273/*.cc QueryResults/274/*.cc QueryResults/275/*.cc QueryResults/276/*.cc QueryResults/277/*.cc QueryResults/278/*.cc QueryResults/279/*.cc QueryResults/28/*.cc QueryResults/280/*.cc QueryResults/281/*.cc QueryResults/282/*.cc QueryResults/283/*.cc QueryResults/284/*.cc QueryResults/285/*.cc QueryResults/286/*.cc QueryResults/287/*.cc QueryResults/288/*.cc QueryResults/289/*.cc QueryResults/29/*.cc QueryResults/290/*.cc QueryResults/291/*.cc QueryResults/292/*.cc QueryResults/293/*.cc QueryResults/294/*.cc QueryResults/295/*.cc QueryResults/296/*.cc QueryResults/297/*.cc QueryResults/298/*.cc QueryResults/299/*.cc QueryResults/3/*.cc QueryResults/30/*.cc QueryResults/300/*.cc QueryResults/301/*.cc QueryResults/302/*.cc QueryResults/303/*.cc QueryResults/304/*.cc QueryResults/305/*.cc QueryResults/306/*.cc QueryResults/307/*.cc QueryResults/308/*.cc QueryResults/309/*.cc QueryResults/31/*.cc QueryResults/310/*.cc QueryResults/311/*.cc QueryResults/312/*.cc QueryResults/313/*.cc QueryResults/314/*.cc QueryResults/315/*.cc QueryResults/316/*.cc QueryResults/317/*.cc QueryResults/318/*.cc QueryResults/319/*.cc QueryResults/32/*.cc QueryResults/320/*.cc QueryResults/321/*.cc QueryResults/322/*.cc QueryResults/323/*.cc QueryResults/324/*.cc QueryResults/325/*.cc QueryResults/326/*.cc QueryResults/327/*.cc QueryResults/328/*.cc QueryResults/329/*.cc QueryResults/33/*.cc QueryResults/330/*.cc QueryResults/331/*.cc QueryResults/332/*.cc QueryResults/333/*.cc QueryResults/334/*.cc QueryResults/335/*.cc QueryResults/336/*.cc QueryResults/337/*.cc QueryResults/338/*.cc QueryResults/339/*.cc QueryResults/34/*.cc QueryResults/340/*.cc QueryResults/341/*.cc QueryResults/342/*.cc QueryResults/343/*.cc QueryResults/344/*.cc QueryResults/345/*.cc QueryResults/346/*.cc QueryResults/347/*.cc QueryResults/348/*.cc QueryResults/349/*.cc QueryResults/35/*.cc QueryResults/350/*.cc QueryResults/351/*.cc QueryResults/352/*.cc QueryResults/353/*.cc QueryResults/354/*.cc QueryResults/355/*.cc QueryResults/356/*.cc QueryResults/357/*.cc QueryResults/358/*.cc QueryResults/359/*.cc QueryResults/36/*.cc QueryResults/360/*.cc QueryResults/361/*.cc QueryResults/362/*.cc QueryResults/363/*.cc QueryResults/364/*.cc QueryResults/365/*.cc QueryResults/366/*.cc QueryResults/367/*.cc QueryResults/368/*.cc QueryResults/369/*.cc QueryResults/37/*.cc QueryResults/370/*.cc QueryResults/371/*.cc QueryResults/372/*.cc QueryResults/373/*.cc QueryResults/374/*.cc QueryResults/375/*.cc QueryResults/376/*.cc QueryResults/377/*.cc QueryResults/378/*.cc QueryResults/379/*.cc QueryResults/38/*.cc QueryResults/380/*.cc QueryResults/381/*.cc QueryResults/382/*.cc QueryResults/383/*.cc QueryResults/384/*.cc QueryResults/385/*.cc QueryResults/386/*.cc QueryResults/387/*.cc QueryResults/388/*.cc QueryResults/389/*.cc QueryResults/39/*.cc QueryResults/390/*.cc QueryResults/391/*.cc QueryResults/392/*.cc QueryResults/393/*.cc QueryResults/394/*.cc QueryResults/395/*.cc QueryResults/396/*.cc QueryResults/397/*.cc QueryResults/398/*.cc QueryResults/399/*.cc QueryResults/4/*.cc QueryResults/40/*.cc QueryResults/400/*.cc QueryResults/401/*.cc QueryResults/402/*.cc QueryResults/403/*.cc QueryResults/404/*.cc QueryResults/405/*.cc QueryResults/406/*.cc QueryResults/407/*.cc QueryResults/408/*.cc QueryResults/409/*.cc QueryResults/41/*.cc QueryResults/410/*.cc QueryResults/411/*.cc QueryResults/412/*.cc QueryResults/413/*.cc QueryResults/414/*.cc QueryResults/415/*.cc QueryResults/416/*.cc QueryResults/417/*.cc QueryResults/418/*.cc QueryResults/419/*.cc QueryResults/42/*.cc QueryResults/420/*.cc QueryResults/421/*.cc QueryResults/422/*.cc QueryResults/423/*.cc QueryResults/424/*.cc QueryResults/425/*.cc QueryResults/426/*.cc QueryResults/427/*.cc QueryResults/428/*.cc QueryResults/429/*.cc QueryResults/43/*.cc QueryResults/430/*.cc QueryResults/431/*.cc QueryResults/432/*.cc QueryResults/433/*.cc QueryResults/434/*.cc QueryResults/435/*.cc QueryResults/436/*.cc QueryResults/437/*.cc QueryResults/438/*.cc QueryResults/439/*.cc QueryResults/44/*.cc QueryResults/440/*.cc QueryResults/441/*.cc QueryResults/442/*.cc QueryResults/443/*.cc QueryResults/444/*.cc QueryResults/445/*.cc QueryResults/446/*.cc QueryResults/447/*.cc QueryResults/448/*.cc QueryResults/449/*.cc QueryResults/45/*.cc QueryResults/450/*.cc QueryResults/451/*.cc QueryResults/452/*.cc QueryResults/453/*.cc QueryResults/454/*.cc QueryResults/455/*.cc QueryResults/456/*.cc QueryResults/457/*.cc QueryResults/458/*.cc QueryResults/459/*.cc QueryResults/46/*.cc QueryResults/460/*.cc QueryResults/461/*.cc QueryResults/462/*.cc QueryResults/463/*.cc QueryResults/464/*.cc QueryResults/465/*.cc QueryResults/466/*.cc QueryResults/467/*.cc QueryResults/468/*.cc QueryResults/469/*.cc QueryResults/47/*.cc QueryResults/470/*.cc QueryResults/471/*.cc QueryResults/472/*.cc QueryResults/473/*.cc QueryResults/474/*.cc QueryResults/475/*.cc QueryResults/476/*.cc QueryResults/477/*.cc QueryResults/478/*.cc QueryResults/479/*.cc QueryResults/48/*.cc QueryResults/480/*.cc QueryResults/481/*.cc QueryResults/482/*.cc QueryResults/483/*.cc QueryResults/484/*.cc QueryResults/485/*.cc QueryResults/486/*.cc QueryResults/487/*.cc QueryResults/488/*.cc QueryResults/489/*.cc QueryResults/49/*.cc QueryResults/490/*.cc QueryResults/491/*.cc QueryResults/492/*.cc QueryResults/493/*.cc QueryResults/494/*.cc QueryResults/495/*.cc QueryResults/496/*.cc QueryResults/497/*.cc QueryResults/498/*.cc QueryResults/499/*.cc QueryResults/5/*.cc QueryResults/50/*.cc QueryResults/500/*.cc QueryResults/501/*.cc QueryResults/502/*.cc QueryResults/503/*.cc QueryResults/504/*.cc QueryResults/505/*.cc QueryResults/506/*.cc QueryResults/507/*.cc QueryResults/508/*.cc QueryResults/509/*.cc QueryResults/51/*.cc QueryResults/510/*.cc QueryResults/511/*.cc QueryResults/512/*.cc QueryResults/513/*.cc QueryResults/514/*.cc QueryResults/515/*.cc QueryResults/516/*.cc QueryResults/517/*.cc QueryResults/518/*.cc QueryResults/519/*.cc QueryResults/52/*.cc QueryResults/520/*.cc QueryResults/521/*.cc QueryResults/522/*.cc QueryResults/523/*.cc QueryResults/524/*.cc QueryResults/525/*.cc QueryResults/526/*.cc QueryResults/527/*.cc QueryResults/528/*.cc QueryResults/529/*.cc QueryResults/53/*.cc QueryResults/530/*.cc QueryResults/531/*.cc QueryResults/532/*.cc QueryResults/533/*.cc QueryResults/534/*.cc QueryResults/535/*.cc QueryResults/536/*.cc QueryResults/537/*.cc QueryResults/538/*.cc QueryResults/539/*.cc QueryResults/54/*.cc QueryResults/540/*.cc QueryResults/541/*.cc QueryResults/542/*.cc QueryResults/543/*.cc QueryResults/544/*.cc QueryResults/545/*.cc QueryResults/546/*.cc QueryResults/547/*.cc QueryResults/548/*.cc QueryResults/549/*.cc QueryResults/55/*.cc QueryResults/550/*.cc QueryResults/551/*.cc QueryResults/552/*.cc QueryResults/553/*.cc QueryResults/554/*.cc QueryResults/555/*.cc QueryResults/556/*.cc QueryResults/557/*.cc QueryResults/558/*.cc QueryResults/559/*.cc QueryResults/56/*.cc QueryResults/560/*.cc QueryResults/561/*.cc QueryResults/562/*.cc QueryResults/563/*.cc QueryResults/564/*.cc QueryResults/565/*.cc QueryResults/566/*.cc QueryResults/567/*.cc QueryResults/568/*.cc QueryResults/569/*.cc QueryResults/57/*.cc QueryResults/570/*.cc QueryResults/571/*.cc QueryResults/572/*.cc QueryResults/573/*.cc QueryResults/574/*.cc QueryResults/575/*.cc QueryResults/576/*.cc QueryResults/577/*.cc QueryResults/578/*.cc QueryResults/579/*.cc QueryResults/58/*.cc QueryResults/580/*.cc QueryResults/581/*.cc QueryResults/582/*.cc QueryResults/583/*.cc QueryResults/584/*.cc QueryResults/585/*.cc QueryResults/586/*.cc QueryResults/587/*.cc QueryResults/588/*.cc QueryResults/589/*.cc QueryResults/59/*.cc QueryResults/590/*.cc QueryResults/591/*.cc QueryResults/592/*.cc QueryResults/593/*.cc QueryResults/594/*.cc QueryResults/595/*.cc QueryResults/596/*.cc QueryResults/597/*.cc QueryResults/598/*.cc QueryResults/599/*.cc QueryResults/6/*.cc QueryResults/60/*.cc QueryResults/61/*.cc QueryResults/62/*.cc QueryResults/63/*.cc QueryResults/64/*.cc QueryResults/65/*.cc QueryResults/66/*.cc QueryResults/67/*.cc QueryResults/68/*.cc QueryResults/69/*.cc QueryResults/7/*.cc QueryResults/70/*.cc QueryResults/71/*.cc QueryResults/72/*.cc QueryResults/73/*.cc QueryResults/74/*.cc QueryResults/75/*.cc QueryResults/76/*.cc QueryResults/77/*.cc QueryResults/78/*.cc QueryResults/79/*.cc QueryResults/8/*.cc QueryResults/80/*.cc QueryResults/81/*.cc QueryResults/82/*.cc QueryResults/83/*.cc QueryResults/84/*.cc QueryResults/85/*.cc QueryResults/86/*.cc QueryResults/87/*.cc QueryResults/88/*.cc QueryResults/89/*.cc QueryResults/9/*.cc QueryResults/90/*.cc QueryResults/91/*.cc QueryResults/92/*.cc QueryResults/93/*.cc QueryResults/94/*.cc QueryResults/95/*.cc QueryResults/96/*.cc QueryResults/97/*.cc QueryResults/98/*.cc QueryResults/99/*.cc json/*.cc results/*.cc results/100/*.cc results/1000/*.cc results/1000_new/*.cc results/10_1000/*.cc results/10_200/*.cc results/10_3000/*.cc results/10mps/*.cc results/17mps/*.cc results/1mps/*.cc results/200/*.cc results/300/*.cc results/3mps/*.cc results/400/*.cc results/50/*.cc results/500/*.cc results/500_new/*.cc results/50n/*.cc results/5mps/*.cc results/600/*.cc results/600_100/*.cc results/600_200/*.cc results/600_30/*.cc results/600_lamda/*.cc results/600_lamda_new/*.cc results/600_new/*.cc results/600_queryNumber/*.cc results/600_reviews/*.cc results/700/*.cc results/700new/*.cc results/800/*.cc results/800_new/*.cc results/900/*.cc results/900_new/*.cc results/querytime/*.cc

# DO NOT DELETE THIS LINE -- make depend depends on it.
$O/BSApp.o: BSApp.cc \
	$(MIXIM_PROJ)/src/base/connectionManager/BaseConnectionManager.h \
	$(MIXIM_PROJ)/src/base/connectionManager/ConnectionManager.h \
	$(MIXIM_PROJ)/src/base/connectionManager/NicEntry.h \
	$(MIXIM_PROJ)/src/base/messages/ApplPkt_m.h \
	$(MIXIM_PROJ)/src/base/modules/AddressingInterface.h \
	$(MIXIM_PROJ)/src/base/modules/BaseApplLayer.h \
	$(MIXIM_PROJ)/src/base/modules/BaseBattery.h \
	$(MIXIM_PROJ)/src/base/modules/BaseLayer.h \
	$(MIXIM_PROJ)/src/base/modules/BaseModule.h \
	$(MIXIM_PROJ)/src/base/modules/MiximBatteryAccess.h \
	$(MIXIM_PROJ)/src/base/utils/FindModule.h \
	$(MIXIM_PROJ)/src/base/utils/HostState.h \
	$(MIXIM_PROJ)/src/base/utils/MiXiMDefs.h \
	$(MIXIM_PROJ)/src/base/utils/NetwControlInfo.h \
	$(MIXIM_PROJ)/src/base/utils/PassedMessage.h \
	$(MIXIM_PROJ)/src/base/utils/SimpleAddress.h \
	$(MIXIM_PROJ)/src/base/utils/miximkerneldefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/BasicModule.h \
	$(MIXIM_PROJ)/src/inet_stub/base/Coord.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INETDefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INotifiable.h \
	$(MIXIM_PROJ)/src/inet_stub/base/ModuleAccess.h \
	$(MIXIM_PROJ)/src/inet_stub/base/NotificationBoard.h \
	$(MIXIM_PROJ)/src/inet_stub/base/NotifierConsts.h \
	$(MIXIM_PROJ)/src/inet_stub/linklayer/contract/MACAddress.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/IMobility.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/LinearMobility.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/MobilityBase.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/MovingMobilityBase.h \
	$(MIXIM_PROJ)/src/inet_stub/util/FWMath.h \
	BSApp.h \
	BeaconReply_m.h \
	Beacon_m.h \
	CollectionFrequency.h \
	Constant.h \
	Document.h \
	KeyWords.h \
	Lexicon.h \
	MyApplicationLayer.h \
	QueryReplyMessage.h \
	QueryReply_m.h \
	QueryScore.h \
	Query_m.h \
	json/json.h
$O/BeaconReply_m.o: BeaconReply_m.cc \
	$(MIXIM_PROJ)/src/base/messages/ApplPkt_m.h \
	$(MIXIM_PROJ)/src/base/utils/MiXiMDefs.h \
	$(MIXIM_PROJ)/src/base/utils/SimpleAddress.h \
	$(MIXIM_PROJ)/src/base/utils/miximkerneldefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/Coord.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INETDefs.h \
	$(MIXIM_PROJ)/src/inet_stub/linklayer/contract/MACAddress.h \
	$(MIXIM_PROJ)/src/inet_stub/util/FWMath.h \
	BeaconReply_m.h
$O/Beacon_m.o: Beacon_m.cc \
	$(MIXIM_PROJ)/src/base/messages/ApplPkt_m.h \
	$(MIXIM_PROJ)/src/base/utils/MiXiMDefs.h \
	$(MIXIM_PROJ)/src/base/utils/SimpleAddress.h \
	$(MIXIM_PROJ)/src/base/utils/miximkerneldefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/Coord.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INETDefs.h \
	$(MIXIM_PROJ)/src/inet_stub/linklayer/contract/MACAddress.h \
	$(MIXIM_PROJ)/src/inet_stub/util/FWMath.h \
	Beacon_m.h
$O/MyApplicationLayer.o: MyApplicationLayer.cc \
	$(MIXIM_PROJ)/src/base/messages/ApplPkt_m.h \
	$(MIXIM_PROJ)/src/base/modules/AddressingInterface.h \
	$(MIXIM_PROJ)/src/base/modules/BaseApplLayer.h \
	$(MIXIM_PROJ)/src/base/modules/BaseBattery.h \
	$(MIXIM_PROJ)/src/base/modules/BaseLayer.h \
	$(MIXIM_PROJ)/src/base/modules/BaseModule.h \
	$(MIXIM_PROJ)/src/base/modules/MiximBatteryAccess.h \
	$(MIXIM_PROJ)/src/base/utils/FindModule.h \
	$(MIXIM_PROJ)/src/base/utils/HostState.h \
	$(MIXIM_PROJ)/src/base/utils/MiXiMDefs.h \
	$(MIXIM_PROJ)/src/base/utils/NetwControlInfo.h \
	$(MIXIM_PROJ)/src/base/utils/PassedMessage.h \
	$(MIXIM_PROJ)/src/base/utils/SimpleAddress.h \
	$(MIXIM_PROJ)/src/base/utils/miximkerneldefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/BasicModule.h \
	$(MIXIM_PROJ)/src/inet_stub/base/Coord.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INETDefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INotifiable.h \
	$(MIXIM_PROJ)/src/inet_stub/base/ModuleAccess.h \
	$(MIXIM_PROJ)/src/inet_stub/base/NotificationBoard.h \
	$(MIXIM_PROJ)/src/inet_stub/base/NotifierConsts.h \
	$(MIXIM_PROJ)/src/inet_stub/linklayer/contract/MACAddress.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/IMobility.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/LinearMobility.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/MobilityBase.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/MovingMobilityBase.h \
	$(MIXIM_PROJ)/src/inet_stub/util/FWMath.h \
	BSApp.h \
	BeaconReply_m.h \
	Beacon_m.h \
	CollectionFrequency.h \
	Constant.h \
	Document.h \
	KeyWords.h \
	Lexicon.h \
	MyApplicationLayer.h \
	QueryReplyMessage.h \
	QueryReply_m.h \
	QueryScore.h \
	Query_m.h \
	Util.h \
	json/json.h
$O/QueryReply_m.o: QueryReply_m.cc \
	$(MIXIM_PROJ)/src/base/messages/ApplPkt_m.h \
	$(MIXIM_PROJ)/src/base/utils/MiXiMDefs.h \
	$(MIXIM_PROJ)/src/base/utils/SimpleAddress.h \
	$(MIXIM_PROJ)/src/base/utils/miximkerneldefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/Coord.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INETDefs.h \
	$(MIXIM_PROJ)/src/inet_stub/linklayer/contract/MACAddress.h \
	$(MIXIM_PROJ)/src/inet_stub/util/FWMath.h \
	QueryReplyMessage.h \
	QueryReply_m.h
$O/QueryScore.o: QueryScore.cc \
	$(MIXIM_PROJ)/src/base/messages/ApplPkt_m.h \
	$(MIXIM_PROJ)/src/base/modules/BaseApplLayer.h \
	$(MIXIM_PROJ)/src/base/modules/BaseBattery.h \
	$(MIXIM_PROJ)/src/base/modules/BaseLayer.h \
	$(MIXIM_PROJ)/src/base/modules/BaseModule.h \
	$(MIXIM_PROJ)/src/base/modules/MiximBatteryAccess.h \
	$(MIXIM_PROJ)/src/base/utils/HostState.h \
	$(MIXIM_PROJ)/src/base/utils/MiXiMDefs.h \
	$(MIXIM_PROJ)/src/base/utils/PassedMessage.h \
	$(MIXIM_PROJ)/src/base/utils/SimpleAddress.h \
	$(MIXIM_PROJ)/src/base/utils/miximkerneldefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/BasicModule.h \
	$(MIXIM_PROJ)/src/inet_stub/base/Coord.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INETDefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INotifiable.h \
	$(MIXIM_PROJ)/src/inet_stub/base/ModuleAccess.h \
	$(MIXIM_PROJ)/src/inet_stub/base/NotificationBoard.h \
	$(MIXIM_PROJ)/src/inet_stub/base/NotifierConsts.h \
	$(MIXIM_PROJ)/src/inet_stub/linklayer/contract/MACAddress.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/IMobility.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/LinearMobility.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/MobilityBase.h \
	$(MIXIM_PROJ)/src/inet_stub/mobility/models/MovingMobilityBase.h \
	$(MIXIM_PROJ)/src/inet_stub/util/FWMath.h \
	BeaconReply_m.h \
	Beacon_m.h \
	CollectionFrequency.h \
	Constant.h \
	Document.h \
	KeyWords.h \
	Lexicon.h \
	MyApplicationLayer.h \
	QueryReplyMessage.h \
	QueryReply_m.h \
	QueryScore.h \
	Query_m.h \
	json/json.h
$O/Query_m.o: Query_m.cc \
	$(MIXIM_PROJ)/src/base/messages/ApplPkt_m.h \
	$(MIXIM_PROJ)/src/base/utils/MiXiMDefs.h \
	$(MIXIM_PROJ)/src/base/utils/SimpleAddress.h \
	$(MIXIM_PROJ)/src/base/utils/miximkerneldefs.h \
	$(MIXIM_PROJ)/src/inet_stub/base/Coord.h \
	$(MIXIM_PROJ)/src/inet_stub/base/INETDefs.h \
	$(MIXIM_PROJ)/src/inet_stub/linklayer/contract/MACAddress.h \
	$(MIXIM_PROJ)/src/inet_stub/util/FWMath.h \
	KeyWords.h \
	Query_m.h
$O/Util.o: Util.cc \
	Util.h
$O/jsoncpp.o: jsoncpp.cc \
	json/json.h

