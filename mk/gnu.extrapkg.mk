# $Id: gnu.extrapkg.mk,v 1.3 2001/04/19 20:29:27 kaj Exp $

ifeq ($(MAKELEVEL),0)
$(warning ******************************************)
$(warning You are not expected to install this)
$(warning module manually.)
$(warning ******************************************)
endif

sinclude $(PARENT_MPKG_DEPENDS)
