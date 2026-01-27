@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Interface'
define view entity ZI_D_Flight2 as select from /dmo/flight
{
  key carrier_id as CarrierId,
  key connection_id as ConnectionId,
  key flight_date as FlightDate,
  price as Price,
  currency_code as CurrencyCode,
  plane_type_id as PlaneTypeId,
  seats_max as SeatsMax,
  seats_occupied as SeatsOccupied
}
