CLASS zcl_feature_gate_demo00 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_feature_gate_demo00 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA(lo_demo01) = NEW zcl_feature_gate_demo01( ).
    IF zcl_feature_gate=>is_active_by_ref( lo_demo01 ).
      lo_demo01->get_date( ).
      out->write( 'zcl_feature_gate_demo01 Active.' ).
    ELSE.
      out->write( 'zcl_feature_gate_demo01 Inactive.' ).
    ENDIF.

    DATA(lo_demo02) = NEW zcl_feature_gate_demo02( ).
    IF zcl_feature_gate=>is_active_by_name( 'zcl_feature_gate_demo02' ).
      lo_demo02->get_time( ).
      out->write( 'zcl_feature_gate_demo02 Active.' ).
    ELSE.
      out->write( 'zcl_feature_gate_demo02 Inactive.' ).
    ENDIF.

    DATA(lo_demo03) = NEW zcl_feature_gate_demo03( ).
    IF zcl_feature_gate=>is_active_by_ref( lo_demo01 ).
      lo_demo03->get_user( ).
      out->write( 'zcl_feature_gate_demo03 Active.' ).
    ELSE.
      out->write( 'zcl_feature_gate_demo03 Inactive.' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
