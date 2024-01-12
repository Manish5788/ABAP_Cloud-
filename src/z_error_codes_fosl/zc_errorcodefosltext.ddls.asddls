@EndUserText.label: 'Maintain Error Code FOSL Text'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity ZC_ErrorCodeFoslText
  as projection on ZI_ErrorCodeFoslText
{
  @ObjectModel.text.element: [ 'LanguageName' ]
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Language', 
      element: 'Language'
    }
  } ]
  key Langu,
  key ErrorCode,
  Description,
  @Consumption.hidden: true
  LocalLastChangedAt,
  @Consumption.hidden: true
  SingletonID,
  _LanguageText.LanguageName : localized,
  _ErrorCodeFosl : redirected to parent ZC_ErrorCodeFosl,
  _ErrorCodeFoslAll : redirected to ZC_ErrorCodeFosl_S
  
}
