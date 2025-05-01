@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.sqlViewName: 'ZFG_CDS_FEATURE'

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Feature Gate:Feature View'

@Metadata.ignorePropagatedAnnotations: true

define view ZI_FG_FEATURE
  as select from    vseoimplem    as _Impl

    left outer join seoclasstx    as _ImplText
      on  _ImplText.clsname = _Impl.clsname
      and _ImplText.langu   = $session.system_language

    left outer join zfg_t_feature as _Feat
      on _Feat.featid = _Impl.clsname

{
  key _Impl.clsname      as FeatureId,

      _ImplText.descript as FeatureText,
      _Feat.active       as IsActive,
      _Impl.createdon    as CreatedAt,
      _Impl.author       as CreatedBy,
      _Feat.chngat       as ChangedAt,
      _Feat.chngby       as ChangedBy
}

where _Impl.refclsname = 'ZIF_FG_FEATURE'
  and _Impl.version    = '1'