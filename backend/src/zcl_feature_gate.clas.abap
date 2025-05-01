CLASS zcl_feature_gate DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES:
      BEGIN OF ty_feature_cache,
        feature_id TYPE zfg_de_featid,
        is_active  TYPE zfg_de_active,
      END OF ty_feature_cache,
      tt_feature_cache TYPE HASHED TABLE OF ty_feature_cache WITH UNIQUE KEY feature_id.

    CLASS-METHODS is_active_by_name
      IMPORTING iv_feature_name     TYPE zfg_de_featid
      RETURNING VALUE(rv_is_active) TYPE zfg_de_active.

    CLASS-METHODS is_active_by_ref
      IMPORTING io_feature_reference TYPE REF TO zif_fg_feature
      RETURNING VALUE(rv_is_active)  TYPE zfg_de_active.

  PROTECTED SECTION.
    CLASS-METHODS check_feature_active
      IMPORTING iv_feature_id       TYPE zfg_de_featid
      RETURNING VALUE(rv_is_active) TYPE zfg_de_active.

    CLASS-METHODS fetch_feature_details
      IMPORTING iv_feature_id     TYPE zfg_de_featid
      RETURNING VALUE(rs_feature) TYPE zfg_cds_feature.

    CLASS-DATA mt_feature_cache TYPE tt_feature_cache.

ENDCLASS.


CLASS zcl_feature_gate IMPLEMENTATION.
  METHOD is_active_by_name.
    rv_is_active = check_feature_active( iv_feature_name ).
  ENDMETHOD.

  METHOD is_active_by_ref.
    DATA lv_feature_name TYPE zfg_de_featid.

    TRY.
        lv_feature_name = CAST cl_abap_classdescr(
             cl_abap_classdescr=>describe_by_object_ref( io_feature_reference )
        )->get_relative_name( ).
        rv_is_active = check_feature_active( lv_feature_name ).
      CATCH cx_root.
    ENDTRY.
  ENDMETHOD.

  METHOD check_feature_active.
    ASSIGN mt_feature_cache[ feature_id = iv_feature_id ] TO FIELD-SYMBOL(<fs_cache>).
    IF sy-subrc <> 0.
      DATA(ls_feature) = fetch_feature_details( iv_feature_id ).
      INSERT VALUE #( feature_id = iv_feature_id
                      is_active  = ls_feature-isactive ) INTO TABLE mt_feature_cache ASSIGNING <fs_cache>.
    ENDIF.

    rv_is_active = <fs_cache>-is_active.
  ENDMETHOD.

  METHOD fetch_feature_details.
    DATA lt_messages TYPE STANDARD TABLE OF bapiret2.

    CALL FUNCTION 'ZFG_FM_GET_FEATURE'
      EXPORTING
        iv_featid = iv_feature_id
      IMPORTING
        es_data   = rs_feature
      TABLES
        et_return = lt_messages.
  ENDMETHOD.
ENDCLASS.
