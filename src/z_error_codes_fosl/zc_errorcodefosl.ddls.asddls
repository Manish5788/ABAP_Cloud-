@EndUserText.label: 'Maintain Error Code FOSL'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ErrorCodeFosl
  as projection on ZI_ErrorCodeFosl
{
  key ErrorCode,
  LastChangedAt,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _ErrorCodeFoslAll : redirected to parent ZC_ErrorCodeFosl_S,
  _ErrorCodeFoslText : redirected to composition child ZC_ErrorCodeFoslText,
  _ErrorCodeFoslText.Description : localized
  
}
