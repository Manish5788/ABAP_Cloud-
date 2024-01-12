@EndUserText.label: 'Maintain Error Code FOSL Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'SingletonID' ]
define root view entity ZC_ErrorCodeFosl_S
  provider contract transactional_query
  as projection on ZI_ErrorCodeFosl_S
{
  key SingletonID,
  LastChangedAtMax,
  TransportRequestID,
  HideTransport,
  _ErrorCodeFosl : redirected to composition child ZC_ErrorCodeFosl
  
}
