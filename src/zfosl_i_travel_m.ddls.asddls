@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel view - CDS data model'

@UI.headerInfo.typeNamePlural: 'Connections'

define root view entity ZFOSL_I_TRAVEL_M
  as select from zfosl_travel_m as Travel -- the travel table is the data source for this view
  composition [0..*] of ZFOSL_I_BOOKING_M        as _Booking

  association [0..1] to /DMO/I_Agency            as _Agency        on $projection.agency_id = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer      on $projection.customer_id = _Customer.CustomerID
  association [0..1] to I_Currency               as _Currency      on $projection.currency_code = _Currency.Currency
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.overall_status = _OverallStatus.OverallStatus


{
 @UI: {  lineItem:       [ { position: 10, label: 'Travel ID' } ],
         identification: [ { position: 10 } ],
         selectionField: [ { position: 10 } ] }  
  key travel_id,
 @UI: {  lineItem:       [ { position: 20, label: 'Agency ID' } ],
         identification: [ { position: 20 } ],
         selectionField: [ { position: 20 } ] }  
      agency_id,
 @UI: { lineItem:        [ { position: 30, label: 'Customer ID' } ],
        identification:  [ { position: 30 } ] }
      customer_id,
 @UI: { lineItem:        [ { position: 40, label: 'Start Date' } ] ,
        identification:  [ { position: 40 } ] }
      begin_date,
 @UI: { lineItem:        [ { position: 50, label: 'End Date' } ],
        identification:  [ { position: 50 } ] } 
      end_date,
      @Semantics.amount.currencyCode: 'currency_code'
      booking_fee,
      @Semantics.amount.currencyCode: 'currency_code'
      total_price,
      currency_code,
@UI: { lineItem:         [ { position: 60, label: 'Status' } ],
       identification:   [ { position: 60 } ] }
      overall_status,
      description,
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,

      /* Associations */
      _Booking,
      _Agency,
      _Customer,
      _Currency,
      _OverallStatus
}
