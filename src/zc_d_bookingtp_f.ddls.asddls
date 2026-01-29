@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking for Flights'

@Metadata.allowExtensions: true

define view entity ZC_D_BookingTP_F
  as projection on ZR_D_BookingTP_F

{
  key TravelId,
  key BookingId,

      BookingDate,

      @Consumption.valueHelpDefinition: [ { entity: { name: 'ZI_D_CustomerVH', element: 'CustomerId' } } ]
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      CarrierName,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      CurrencyCode,
      CustomerName,

      /* Associations */
      _Flight        : redirected to parent ZC_D_FlightTP,
      _Flight._AirportFrom2.name     as AirportFromName,
      _Flight._AirportTo2.name     as AirportToName
//
}
