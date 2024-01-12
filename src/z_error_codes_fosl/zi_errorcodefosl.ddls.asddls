@EndUserText.label: 'Error Code FOSL'
@AccessControl.authorizationCheck: #CHECK
define view entity ZI_ErrorCodeFosl
  as select from ZERRCODE_FOSL
  association to parent ZI_ErrorCodeFosl_S as _ErrorCodeFoslAll on $projection.SingletonID = _ErrorCodeFoslAll.SingletonID
  composition [0..*] of ZI_ErrorCodeFoslText as _ErrorCodeFoslText
{
  key ERROR_CODE as ErrorCode,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _ErrorCodeFoslAll,
  _ErrorCodeFoslText
  
}
