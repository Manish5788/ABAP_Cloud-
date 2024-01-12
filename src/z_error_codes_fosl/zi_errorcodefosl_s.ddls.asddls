@EndUserText.label: 'Error Code FOSL Singleton'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZI_ErrorCodeFosl_S
  as select from I_Language
    left outer join ZERRCODE_FOSL on 0 = 0
  composition [0..*] of ZI_ErrorCodeFosl as _ErrorCodeFosl
{
  key 1 as SingletonID,
  _ErrorCodeFosl,
  max( ZERRCODE_FOSL.LAST_CHANGED_AT ) as LastChangedAtMax,
  cast( '' as SXCO_TRANSPORT) as TransportRequestID,
  cast( 'X' as ABAP_BOOLEAN preserving type) as HideTransport
  
}
where I_Language.Language = $session.system_language
