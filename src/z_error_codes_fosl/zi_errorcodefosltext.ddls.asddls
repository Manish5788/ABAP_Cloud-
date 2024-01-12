@EndUserText.label: 'Error Code FOSL Text'
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.dataCategory: #TEXT
define view entity ZI_ErrorCodeFoslText
  as select from ZERRCODET_FOSL
  association [1..1] to ZI_ErrorCodeFosl_S as _ErrorCodeFoslAll on $projection.SingletonID = _ErrorCodeFoslAll.SingletonID
  association to parent ZI_ErrorCodeFosl as _ErrorCodeFosl on $projection.ErrorCode = _ErrorCodeFosl.ErrorCode
  association [0..*] to I_LanguageText as _LanguageText on $projection.Langu = _LanguageText.LanguageCode
{
  @Semantics.language: true
  key LANGU as Langu,
  key ERROR_CODE as ErrorCode,
  @Semantics.text: true
  DESCRIPTION as Description,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  1 as SingletonID,
  _ErrorCodeFoslAll,
  _ErrorCodeFosl,
  _LanguageText
  
}
