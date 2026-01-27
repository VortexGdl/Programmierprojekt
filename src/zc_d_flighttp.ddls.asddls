@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Consumption View'
@Metadata.allowExtensions: true

define root view entity ZC_D_FlightTP
  as select distinct from ZR_D_FlightTP
{
  key CarrierId,
  key ConnectionID,
  key FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  Price,
  CurrencyCode,
  PlaneTypeId,
  SeatsMax - SeatsOccupied as AvailableSeats,
  AirportFromId,
  AirportToID,
  concat(cast(cast((SeatsOccupied * 100 / SeatsMax) as abap.dec(4,2)) as abap.char(6)), '%') as Auslastung
}
