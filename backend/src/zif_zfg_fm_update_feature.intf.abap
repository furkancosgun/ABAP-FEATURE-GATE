interface ZIF_ZFG_FM_UPDATE_FEATURE
  public .


  types:
    SEOCLSNAME type C length 000030 .
  types:
    SEODESCR type C length 000060 .
  types:
    ZFG_DE_ACTIVE type C length 000001 .
  types:
    CNAM type C length 000012 .
  types:
    ZFG_DE_CHNGBY type C length 000012 .
  types:
    begin of ZFG_CDS_FEATURE,
      FEATUREID type SEOCLSNAME,
      FEATURETEXT type SEODESCR,
      ISACTIVE type ZFG_DE_ACTIVE,
      CREATEDAT type DATS,
      CREATEDBY type CNAM,
      CHANGEDAT type DATS,
      CHANGEDBY type ZFG_DE_CHNGBY,
    end of ZFG_CDS_FEATURE .
  types:
    BAPI_MTYPE type C length 000001 .
  types:
    SYMSGID type C length 000020 .
  types:
    SYMSGNO type N length 000003 .
  types:
    BAPI_MSG type C length 000220 .
  types:
    BALOGNR type C length 000020 .
  types:
    BALMNR type N length 000006 .
  types:
    SYMSGV type C length 000050 .
  types:
    BAPI_PARAM type C length 000032 .
  types:
    BAPI_FLD type C length 000030 .
  types:
    BAPILOGSYS type C length 000010 .
  types:
    begin of BAPIRET2,
      TYPE type BAPI_MTYPE,
      ID type SYMSGID,
      NUMBER type SYMSGNO,
      MESSAGE type BAPI_MSG,
      LOG_NO type BALOGNR,
      LOG_MSG_NO type BALMNR,
      MESSAGE_V1 type SYMSGV,
      MESSAGE_V2 type SYMSGV,
      MESSAGE_V3 type SYMSGV,
      MESSAGE_V4 type SYMSGV,
      PARAMETER type BAPI_PARAM,
      ROW type INT4,
      FIELD type BAPI_FLD,
      SYSTEM type BAPILOGSYS,
    end of BAPIRET2 .
  types:
    __BAPIRET2                     type standard table of BAPIRET2                       with non-unique default key .
endinterface.
