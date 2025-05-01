class ZCL_FEATURE_GATE_DEMO01 definition
  public
  final
  create public .

public section.

  interfaces ZIF_FG_FEATURE .

  methods GET_DATE
    returning
      value(RV_DATE) type SY-DATUM .
ENDCLASS.



CLASS ZCL_FEATURE_GATE_DEMO01 IMPLEMENTATION.


  METHOD get_date.
    rv_date = sy-datum.
  ENDMETHOD.
ENDCLASS.
