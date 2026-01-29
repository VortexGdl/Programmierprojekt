@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Flight Interface'

/*+[hideWarning] { "IDS" : [ "CARDINALITY_CHECK" ]  } */
define view entity ZI_D_Flight2
  as select from /dmo/flight

  association [1..1] to /dmo/connection as _Connections on $projection.ConnectionId = _Connections.connection_id
  
  association [1..1] to /dmo/airport   as _AirportFrom on  $projection.AirPortFromId = _AirportFrom.airport_id
  association [1..1] to /dmo/airport   as _AirportTo   on  $projection.AirportToId = _AirportTo.airport_id
    association [1..1] to        /dmo/carrier   as _Carrier
    on $projection.CarrierId = _Carrier.carrier_id

{
  key carrier_id                   as CarrierId,
  key connection_id                as ConnectionId,
  key flight_date                  as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                        as Price,

      currency_code                as CurrencyCode,
      plane_type_id                as PlaneTypeId,
      seats_max                    as SeatsMax,
      seats_occupied               as SeatsOccupied,
      _Connections.airport_from_id as AirPortFromId,
      _Connections.airport_to_id   as AirportToId,
      
      _Connections,
      _AirportTo,
      _Carrier,
      _AirportFrom
}
