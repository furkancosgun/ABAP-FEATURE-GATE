FUNCTION ZFG_FM_UPDATE_FEATURE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IS_DATA) TYPE  ZFG_CDS_FEATURE
*"  EXPORTING
*"     VALUE(ES_DATA) TYPE  ZFG_CDS_FEATURE
*"  TABLES
*"      ET_RETURN STRUCTURE  BAPIRET2
*"----------------------------------------------------------------------
  DATA ls_data TYPE zfg_t_feature.

  CALL FUNCTION 'ZFG_FM_GET_FEATURE'
    EXPORTING
      iv_featid = is_data-featureid
    TABLES
      et_return = et_return.
  LOOP AT et_return WHERE type CA 'EAX'.
    EXIT.
  ENDLOOP.
  IF sy-subrc = 0.
    RETURN.
  ENDIF.

  ls_data-featid = is_data-featureid.
  ls_data-active = is_data-isactive.
  ls_data-chngat = sy-datum.
  ls_data-chngby = sy-uname.
  MODIFY zfg_t_feature FROM ls_data.
  IF sy-subrc = 0.
    COMMIT WORK.
  ELSE.
    IF sy-subrc <> 0.
      APPEND VALUE #( type       = 'E'
                      id         = 'ZFG_MSG'
                      number     = '003'
                      message_v1 = 'ZFG_T_FEATURE'
                      message_v2 = is_data-featureid ) TO et_return.
      RETURN.
    ENDIF.
  ENDIF.

  CALL FUNCTION 'ZFG_FM_GET_FEATURE'
    EXPORTING
      iv_featid = is_data-featureid
    IMPORTING
      es_data   = es_data
    TABLES
      et_return = et_return.
ENDFUNCTION.
