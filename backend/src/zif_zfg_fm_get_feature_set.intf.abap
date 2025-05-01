interface ZIF_ZFG_FM_GET_FEATURE_SET
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
    __ZFG_CDS_FEATURE              type standard table of ZFG_CDS_FEATURE                with non-unique default key .
endinterface.
