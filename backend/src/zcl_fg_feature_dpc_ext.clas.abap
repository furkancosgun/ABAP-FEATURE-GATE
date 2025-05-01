CLASS zcl_fg_feature_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_fg_feature_dpc
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS /iwbep/if_mgw_appl_srv_runtime~create_deep_entity  REDEFINITION.
    METHODS /iwbep/if_mgw_appl_srv_runtime~get_expanded_entity REDEFINITION.

  PROTECTED SECTION.
ENDCLASS.


CLASS zcl_fg_feature_dpc_ext IMPLEMENTATION.
  METHOD /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.
    CASE iv_entity_set_name.
      WHEN 'FeatureSet'.
    ENDCASE.
  ENDMETHOD.

  METHOD /iwbep/if_mgw_appl_srv_runtime~get_expanded_entity.
*    DATA lt_return TYPE STANDARD TABLE OF bapiret2.
*
*    DATA(lv_featid) = VALUE zfg_de_featid( it_key_tab[ name = 'Featid' ]-value OPTIONAL ).
*    CASE iv_entity_set_name.
*      WHEN 'FeatureSet'.
*        CALL FUNCTION 'ZFG_FM_GET_FEATURE_WITH_COND'
*          EXPORTING
*            iv_featid = lv_featid
*          IMPORTING
*            es_data   = ls_data
*          TABLES
*            et_return = lt_return.
*        LOOP AT lt_return TRANSPORTING NO FIELDS WHERE type CA 'EAX'.
*        ENDLOOP.
*        IF sy-subrc = 0.
*          mo_context->get_message_container( )->add_messages_from_bapi( it_bapi_messages = lt_return ).
*        ELSE.
*          copy_data_to_ref( EXPORTING is_data = ls_data
*                            CHANGING  cr_data = er_entity ).
*        ENDIF.
*    ENDCASE.
  ENDMETHOD.
ENDCLASS.
