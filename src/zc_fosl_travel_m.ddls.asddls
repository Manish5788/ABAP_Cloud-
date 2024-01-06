@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_FOSL_TRAVEL_M'
@ObjectModel.semanticKey: [ 'TravelID' ]
define root view entity ZC_FOSL_TRAVEL_M
  provider contract transactional_query
  as projection on ZR_FOSL_TRAVEL_M
{
  key TravelID,
  AgencyID,
  CustomerID,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  CurrencyCode,
  Description,
  OverallStatus,
  LastChangedAt,
  LocalLastChanged
  
}
