class ZCL_FEATURE_GATE_DEMO03 definition
  public
  final
  create public .

public section.

  interfaces ZIF_FG_FEATURE .

  methods GET_USER
    returning
      value(RV_USER) type SY-UNAME .
ENDCLASS.



CLASS ZCL_FEATURE_GATE_DEMO03 IMPLEMENTATION.


  METHOD get_user.
    rv_user = sy-uname.
  ENDMETHOD.
ENDCLASS.
