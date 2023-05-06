@AbapCatalog.sqlViewName: 'ZMKR_CDS_CHK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS CHECK JUST'
define view ZMKR_CDS_CHECK as select from /dmo/airport {

  key airport_id as AirportId,
  name as Name,
  city as City,
  country as Country
    
}
