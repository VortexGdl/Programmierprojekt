@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking Interface'

define view entity ZI_D_Booking
  as select from /dmo/booking
    association [1..1] to        /dmo/carrier   as _Carrier
    on $projection.CarrierId = _Carrier.carrier_id
    association [1..1] to /dmo/customer as _Customer on $projection.CustomerId = _Customer.customer_id

{
  key travel_id     as TravelId,
  key booking_id    as BookingId,

      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'

      flight_price  as FlightPrice,

      currency_code as CurrencyCode,
      
      _Carrier,
      _Customer
}
