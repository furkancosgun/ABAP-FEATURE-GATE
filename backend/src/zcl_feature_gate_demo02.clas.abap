class ZCL_FEATURE_GATE_DEMO02 definition
  public
  final
  create public .

public section.

  interfaces ZIF_FG_FEATURE .

  methods GET_TIME
    returning
      value(RV_TIME) type SY-UZEIT .
ENDCLASS.



CLASS ZCL_FEATURE_GATE_DEMO02 IMPLEMENTATION.


  METHOD get_time.
    rv_time = sy-uzeit.
  ENDMETHOD.
ENDCLASS.
