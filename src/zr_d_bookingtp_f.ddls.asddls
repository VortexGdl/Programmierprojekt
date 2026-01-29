@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Booking for Flights'

define view entity ZR_D_BookingTP_F
  as select from ZI_D_Booking

  association        to parent ZR_D_FlightTP2 as _Flight
    on  $projection.CarrierId    = _Flight.CarrierId
    and $projection.ConnectionId = _Flight.ConnectionID
    and $projection.FlightDate   = _Flight.FlightDate

//  association [1..1] to        /dmo/carrier   as _Carrier
//    on $projection.CarrierId = _Carrier.carrier_id

{
  key TravelId,
  key BookingId,

      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      _Carrier.name as CarrierName,
      concat_with_space(concat_with_space(_Customer.title, _Customer.first_name, 1), _Customer.last_name, 1) as CustomerName,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => ZI_D_Booking.FlightPrice,
                          source_currency    => ZI_D_Booking.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date,
                          error_handling     => 'SET_TO_NULL') as FlightPrice,

      cast('EUR' as abap.cuky)                                 as CurrencyCode,

      _Flight,
      _Carrier
}

where FlightDate >= $session.system_date
