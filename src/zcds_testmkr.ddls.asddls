@AbapCatalog.sqlViewName: 'ZCDS_YTESTMKR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TESTING CDS'
define view ZCDS_TESTMKR

  with parameters p_carr: abap.char(2)
  as select from /dmo/flight
{

  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied

}
where carrier_id = $parameters.p_carr
