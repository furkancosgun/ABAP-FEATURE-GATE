FUNCTION ZFG_FM_GET_FEATURE.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_FEATID) TYPE  ZFG_DE_FEATID
*"  EXPORTING
*"     VALUE(ES_DATA) TYPE  ZFG_CDS_FEATURE
*"  TABLES
*"      ET_RETURN STRUCTURE  BAPIRET2
*"----------------------------------------------------------------------
  SELECT SINGLE * FROM zi_fg_feature WHERE featureid = @iv_featid INTO @es_data.
  IF sy-subrc <> 0.
    APPEND VALUE #( type       = 'E'
                    id         = 'ZFG_MSG'
                    number     = '001'
                    message_v1 = iv_featid ) TO et_return.
  ENDIF.
ENDFUNCTION.
