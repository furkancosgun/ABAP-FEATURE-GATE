FUNCTION ZFG_FM_GET_FEATURE_SET.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  TABLES
*"      ET_DATA STRUCTURE  ZFG_CDS_FEATURE
*"----------------------------------------------------------------------
  SELECT * FROM zi_fg_feature INTO TABLE @et_data.
ENDFUNCTION.
