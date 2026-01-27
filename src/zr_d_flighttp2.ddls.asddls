@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Restricted View'
define view entity ZR_D_FlightTP2 as select from ZI_D_Flight2
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
  Price,
  CurrencyCode,
  PlaneTypeId,
  SeatsMax,
  SeatsOccupied
}
