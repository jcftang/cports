define decide_by_compiler
$(1):=nothing
$(1):=$$(strip $$(if $$(findstring gnu, $$(COMPILERS)),$(2),$$($(1))))
$(1):=$$(strip $$(if $$(findstring intel, $$(COMPILERS)),$(3),$$($(1))))
$(1):=$$(strip $$(if $$(findstring open64, $$(COMPILERS)),$(4),$$($(1))))
endef

